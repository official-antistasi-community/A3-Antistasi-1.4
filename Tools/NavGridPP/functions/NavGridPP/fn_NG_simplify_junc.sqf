/*
Maintainer: Caleb Serafin
    All nearby junctions will be merged into the most centred one.

Arguments:
    <ARRAY<             navGrid:
        <OBJECT>            Road
        <ARRAY<OBJECT>>         Connected roads.
        <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
    >>
    <SCALAR> Junctions are only merged if within this distance. (Default = 15)

Return Value:
    <ARRAY> Simplified navGrid

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    _navGrid = [_navGrid,35] call A3A_fnc_NG_simplify_junc;
*/
params [
    ["_navGrid",[],[ [] ]], //ARRAY<  Road, ARRAY<connectedRoad>>, ARRAY<distance>  >
    ["_juncMergeDistance",15,[ 0 ]] // Junctions are only merged if within this distance.
];
private _navGridSimple = +_navGrid;

private _roadIndexNS = [localNamespace,"NavGridPP","simplify_junc_roadIndex", nil, nil] call Col_fnc_nestLoc_set;
{
    _roadIndexNS setVariable [str (_x#0),_forEachIndex];
} forEach _navGridSimple; // _x is road struct <road,ARRAY<connections>,ARRAY<indices>>

private _diag_step_sub = "";

private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++",
        "<t align='left'>" +
        "Simplifying navGrid<br/>"+
        "Simplifying Junctions<br/>"+
        _diag_step_sub+"<br/>"+
        "</t>"
    ] remoteExec ["A3A_fnc_customHint",0];
};

private _fnc_disconnectStructs = {
    params ["_myStruct","_otherStruct"];

    private _myConnections = _myStruct#1;
    private _otherConnections = _otherStruct#1;

    while {(_myStruct#0) in _otherConnections || (_otherStruct#0) in _myConnections} do {  // sometimes due to simplification or map roads, nodes may be connected multiple times.
        private _otherInMy = _myConnections find (_otherStruct#0);
        _myConnections deleteAt _otherInMy;
        (_myStruct#2) deleteAt _otherInMy;

        private _myInOther = _otherConnections find (_myStruct#0);
        _otherConnections deleteAt _myInOther;
        (_otherStruct#2) deleteAt _myInOther;
    };
    if ((_myStruct#0) in _otherConnections || (_otherStruct#0) in _myConnections) then {
        throw ["CouldNotDisconnectStructs","CouldNotDisconnectStructs."];
        [1,"CouldNotDisconnectStructs " + str (getPos (_myStruct#0)) + ", " + str (getPos (_otherStruct#0)) + ".","fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Please check RPT."] call A3A_fnc_customHint;
    };
};
private _fnc_connectStructs = {
    params ["_myStruct","_otherStruct"];

    private _myRoad = _myStruct#0;
    private _otherRoad = _otherStruct#0;
    private _distance = _myRoad distance2D _otherRoad;

    (_myStruct#1) pushBack _otherRoad;
    (_myStruct#2) pushBack _distance;

    (_otherStruct#1) pushBack _myRoad;
    (_otherStruct#2) pushBack _distance;
};

call _fnc_diag_render;

private _orphanedIndices = [];

private _const_emptyArray = [];
private _fnc_consumeStruct = {
    params ["_myStruct","_otherStruct"]; // _otherStruct is consumed & added to _orphanedIndices

    private _myRoad = _myStruct#0;
    private _myConnections = _myStruct#1;

    private _otherRoad = _otherStruct#0;
    private _otherName = str _otherRoad;
    private _otherConnections = _otherStruct#1;
    private _otherConnectedStructs = _otherConnections apply {_navGridSimple #(_roadIndexNS getVariable [str _x,-1])};

    private _oldOtherConnections = +_otherConnections;

    {
        [_otherStruct,_x] call _fnc_disconnectStructs;
    } forEach _otherConnectedStructs;
    if !((_navGridSimple #(_roadIndexNS getVariable [str _otherRoad,-1]) #1) isEqualTo _const_emptyArray) then {
        [1,"Tried to schedule deletion of non-orphan '"+_otherName+"' " + str (getPos _otherRoad) + ".","fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Please check RPT."] call A3A_fnc_customHint;
    };
    //if (_oldOtherConnections findIf (_otherRoad in (_navGridSimple #(_roadIndexNS getVariable [str _x,-1]) #1)) != -1) then {
    //    [1,"Tried to schedule deletion of non-orphan that is connected from other roads'"+_otherName+"' " + str (getPos _otherRoad) + ".","fn_NG_simplify_junc"] call A3A_fnc_log;
    //    ["fn_NG_simplify_junc Error","Please check RPT."] call A3A_fnc_customHint;
    //};
    _orphanedIndices pushBack (_roadIndexNS getVariable [_otherName,-1]);

    {
        private _otherConnectedStruct = _x;
        private _otherConnectedRoad = _otherConnectedStruct#0;

        if !(_otherConnectedRoad in _myConnections) then {
            if (_roadIndexNS getVariable [str _otherConnectedRoad,-1] in _orphanedIndices) then {
                [1,"Tried to connect to orphan '"+str _otherConnectedRoad+"' " + str (getPos _otherConnectedRoad) + ".","fn_NG_simplify_junc"] call A3A_fnc_log;
                ["fn_NG_simplify_junc Error","Please check RPT."] call A3A_fnc_customHint;
            };

            [_myStruct,_otherConnectedStruct] call _fnc_connectStructs;
        };
    } forEach _otherConnectedStructs;

};


private _fnc_selectCentreStruct = {
    params ["_structs"]; // _otherStruct is consumed & added to _orphanedIndices

    private _midPoint = [0,0];
    {
        _midPoint = _midPoint vectorAdd getPos (_x#0);
    } forEach _structs;
    _midPoint = _midPoint vectorMultiply (1 / count _structs);

    private _centreStruct = _structs#0;
    private _closestDistance = 9999999;
    {
        private _distance = getPos (_x#0) distance2D _midPoint;
        if (_distance < _closestDistance) then {
            _centreStruct = _x;
            _closestDistance = _distance;
        };
    } forEach _structs;
    _centreStruct;
};

private _diag_totalSegments = count _navGridSimple;
{
    if (_forEachIndex mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
        call _fnc_diag_render;
    };

    private _myStruct = _x;
    private _myRoad = _myStruct#0;
    private _myConnections = _myStruct#1;
    private _connectedJuncStructs = [];
    if ((count _myConnections) > 2) then {
        _connectedJuncStructs = _myConnections
            select {_myRoad distance2D _x < _juncMergeDistance}                       // Only within small junction proximity
            apply {_navGridSimple #(_roadIndexNS getVariable [str _x,-1])}     // Get their structs
            select {count (_x#1) > 2};                                          // Only structs that are junctions
    };

    if ((count _connectedJuncStructs) != 0) then {  // At least one other junction to consume
        _connectedJuncStructs pushBack _myStruct;
        private _centreStruct = [_connectedJuncStructs] call _fnc_selectCentreStruct;
        _connectedJuncStructs deleteAt (_connectedJuncStructs find _centreStruct);

        {
            [_centreStruct,_x] call _fnc_disconnectStructs;
            [_centreStruct,_x] call _fnc_consumeStruct;
        } forEach _connectedJuncStructs;
    };
} forEach _navGridSimple;
[_roadIndexNS] call Col_fnc_nestLoc_rem;

_diag_step_sub = "Cleaning orphans...";
call _fnc_diag_render;
//*
{
    if (_x == -1 || _x > count _navGridSimple) exitWith {
        [1,"Tried to delete non-index -1.","fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Tried to delete non-index -1. Please check RPT."] call A3A_fnc_customHint;
        [];
    };
    if (count (_navGridSimple#_x#1) > 0) then {
        [1,"Tried to delete non-orphan '"+str (_navGridSimple#_x#0)+"' " + str (getPos (_navGridSimple#_x#0)) + ".","fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Please check RPT."] call A3A_fnc_customHint;
    };
} forEach _orphanedIndices;//*/
_orphanedIndices sort false; // The order of orphaned indices will be random.
[_navGridSimple,_orphanedIndices] call Col_fnc_array_remIndices;

_navGridSimple;
