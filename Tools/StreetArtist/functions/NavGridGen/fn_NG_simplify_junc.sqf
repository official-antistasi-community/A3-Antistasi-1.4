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
private _fnc_reportHaltingError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [1,_details,"fn_NG_simplify_junc"] call A3A_fnc_log;
    ["Simplifying Junctions","Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
};
private _fnc_reportMinorError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [1,_details,"fn_NG_simplify_junc"] call A3A_fnc_log;
};

private _fnc_consumeStruct = {
    params ["_myStruct","_otherStruct","_navRoadHM"];

    private _targetNavRoadPeers = [_otherStruct, _navRoadHM] call A3A_fnc_NG_navRoad_getPeers;

    {
        if !(_myStruct isEqualTo _x || [_myStruct, _x] call A3A_fnc_NG_navRoad_isConnected) then {
            [_myStruct,_x,false,"fn_NG_simplify_junc",_navRoadHM] call A3A_fnc_NG_navRoad_connect;
        };
    } forEach _targetNavRoadPeers;

    [_navRoadHM, _otherStruct, "fn_NG_simplify_junc"] call A3A_fnc_NG_navRoadHM_remove;
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

private _diag_totalJobs = count _navRoadHM;
private _diag_currentJob = 0;
{
    _diag_currentJob = _diag_currentJob + 1;
    if (_diag_currentJob mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_diag_currentJob /_diag_totalJobs) toFixed 1) + "% &gt; Node &lt;" + (str _diag_currentJob) + " / " + (str _diag_totalJobs) + "&gt;";;
        call _fnc_diag_render;
    };
    if !(_x in _navRoadHM) then { /*diag_log "I continued";*/ continue; };  // If it is nil, it has been previously deleted.
    if (isNil{_navRoadHM get _x}) then { diag_log "in Failed, but I continued"; continue; };  // If it is nil, it has been previously deleted.

    private _myStruct = _navRoadHM get _x;
    private _myConnections = _myStruct#1;
    if (count _myConnections <= 2) then { continue; };

    private _myRoad = _myStruct#0;
    private _connectedJuncStructs = _myConnections
        select {_myRoad distance _x < _juncMergeDistance}                           // Only within small junction proximity
        select {if (str _x in _navRoadHM) then {true} else { ("Skipped connection at " + str getPosATL _x + " because its missing from _navRoadHM. Warning: This may introduce one-ways!") call _fnc_reportHaltingError; false} }  // Only connections that are in _navRoadHM
        apply {_navRoadHM get str _x}                                               // Get their structs
        select {count (_x#1) > 2}                                                   // Only structs that are junctions
        select {(_x#3) isNotEqualTo A3A_NG_const_emptyArray};                       // Has forced connection. The roads are exempt from simplification and are resolved in the road to navGrid conversion.

    if ((count _connectedJuncStructs) > 0) then {  // At least one other junction to consume
        _connectedJuncStructs pushBack _myStruct;
        private _centreStruct = [_connectedJuncStructs] call _fnc_selectCentreStruct;
        _connectedJuncStructs deleteAt (_connectedJuncStructs find _centreStruct);

        {
            [_centreStruct,_x,_navRoadHM] call _fnc_consumeStruct;
        } forEach _connectedJuncStructs;
    };

} forEach keys _navRoadHM;

_navRoadHM;
