/*
Maintainer: Caleb Serafin
    _navRoadHM  is modified by reference!
    All nearby junctions will be merged into the most centred one.

Arguments:
    <navRoadHM> _navRoadHM is modified by reference
    <SCALAR> Junctions are only merged if within this distance. (Default = 15)

Return Value:
    <navRoadHM> Same Simplified _navRoadHM reference

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    [_navRoadHM,35] call A3A_fnc_NG_simplify_junc;
*/
params [
    "_navRoadHM",
    ["_juncMergeDistance",15,[ 0 ]] // Junctions are only merged if within this distance.
];

private _diag_step_sub = "";

private _fnc_diag_render = {
    ["Simplifying Junctions",_diag_step_sub,true,400] call A3A_fnc_customHint;
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
        private _crashText = "CouldNotDisconnectStructs " + str (getPosATL (_myStruct#0)) + ", " + str (getPosATL (_otherStruct#0)) + ".";
        [1,_crashText,"fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Please check RPT.<br/>"+_crashText,false,600] call A3A_fnc_customHint;
    };
};
private _fnc_connectStructs = {
    params ["_myStruct","_otherStruct"];

    private _myRoad = _myStruct#0;
    private _otherRoad = _otherStruct#0;
    private _distance = _myRoad distance _otherRoad;

    (_myStruct#1) pushBack _otherRoad;
    (_myStruct#2) pushBack _distance;

    (_otherStruct#1) pushBack _myRoad;
    (_otherStruct#2) pushBack _distance;
};

private _fnc_consumeStruct = {
    params ["_myStruct","_otherStruct","_navRoadHM"];

    private _myRoad = _myStruct#0;
    private _myConnections = _myStruct#1;

    private _otherRoad = _otherStruct#0;
    private _otherName = str _otherRoad;
    private _otherConnections = _otherStruct#1;
    private _otherConnectedStructs = _otherConnections apply {_navRoadHM get str _x};

    private _oldOtherConnections = +_otherConnections;

    {
        [_otherStruct,_x] call _fnc_disconnectStructs;
    } forEach _otherConnectedStructs;
    if ((_navRoadHM get str _otherRoad) #1 isNotEqualTo A3A_NG_const_emptyArray) then {
        private _crashText = "Tried to schedule deletion of non-orphan '"+_otherName+"' " + str (getPosATL _otherRoad) + ".";
        [1,_crashText,"fn_NG_simplify_junc"] call A3A_fnc_log;
        ["fn_NG_simplify_junc Error","Please check RPT.<br/>"+_crashText,false,600] call A3A_fnc_customHint;
    };
    _navRoadHM deleteAt _otherName;

    {
        private _otherConnectedStruct = _x;
        private _otherConnectedRoad = _otherConnectedStruct#0;

        if !(_otherConnectedRoad in _myConnections) then {
            if !(str _otherConnectedRoad in _navRoadHM) then {
                private _crashText = "Tried to connect to orphan '"+str _otherConnectedRoad+"' " + str (getPosATL _otherConnectedRoad) + ".";
                [1,_crashText,"fn_NG_simplify_junc"] call A3A_fnc_log;
                ["fn_NG_simplify_junc Error","Please check RPT.<br/>"+_crashText,false,600] call A3A_fnc_customHint;
            };

            [_myStruct,_otherConnectedStruct] call _fnc_connectStructs;
        };
    } forEach _otherConnectedStructs;

};

private _fnc_selectCentreStruct = {
    params ["_structs"];

    private _midPoint = [0,0];
    {
        _midPoint = _midPoint vectorAdd getPosATL (_x#0);
    } forEach _structs;
    _midPoint = _midPoint vectorMultiply (1 / count _structs);

    private _centreStruct = _structs#0;
    private _closestDistance = 9999999;
    {
        private _distance = getPosATL (_x#0) distance _midPoint;
        if (_distance < _closestDistance) then {
            _centreStruct = _x;
            _closestDistance = _distance;
        };
    } forEach _structs;
    _centreStruct;
};

private _diag_totalSegments = count _navRoadHM;
{
    //if (_forEachIndex mod 100 == 0) then {
    //    _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
    //    call _fnc_diag_render;
    //};

    private _myStruct = _navRoadHM get _x;
    if !(isNil {_myStruct}) then {  // If it is nil, it has been previously deleted.
        private _myRoad = _myStruct#0;
        private _myConnections = _myStruct#1;
        private _connectedJuncStructs = [];
        if ((count _myConnections) > 2) then {
            _connectedJuncStructs = _myConnections
                select {_myRoad distance _x < _juncMergeDistance}                         // Only within small junction proximity
                apply {_navRoadHM get str _x}                                               // Get their structs
                select {count (_x#1) > 2}                                                   // Only structs that are junctions
                select {_x#3 isEqualTo A3A_NG_const_emptyArray};                            // Has forced connection. The roads are exempt from simplification and are resolved in the road to navGrid conversion.
        };

        if ((count _connectedJuncStructs) != 0) then {  // At least one other junction to consume
            _connectedJuncStructs pushBack _myStruct;
            private _centreStruct = [_connectedJuncStructs] call _fnc_selectCentreStruct;
            _connectedJuncStructs deleteAt (_connectedJuncStructs find _centreStruct);

            {
                [_centreStruct,_x] call _fnc_disconnectStructs;
                [_centreStruct,_x,_navRoadHM] call _fnc_consumeStruct;
            } forEach _connectedJuncStructs;
        };
    };
} forEach keys _navRoadHM;

_navRoadHM;
