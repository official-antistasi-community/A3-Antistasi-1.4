/*
Maintainer: Caleb Serafin
    Converts navRoadHM to navGridHM.

Arguments:
    <navGrid>

Return Value:
    <navFlatHM>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    private _navFlatHM = [_navGrid] call A3A_fnc_NG_convert_navRoadHM_navGridHM;
*/
params [
    "_navRoadHM"
];

private _fnc_diag_render = { // ["Hi"] call _fnc_diag_render;
    params ["_diag_step_sub"];
    ["Converting navRoadHM to navGridHM",_diag_step_sub,true,400] call A3A_fnc_customHint;
};

private _fnc_reportHaltingError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    private _errorTitle = "navRoadHM to Grid";
    [1,_errorTitle+" | "+_details,"fn_NG_convert_navRoadHM_navGridHM"] call A3A_fnc_log;
    [_errorTitle,"Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
};
private _fnc_reportMinorError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [1,"navRoadHM to Grid | "+_details,"fn_NG_convert_navRoadHM_navGridHM"] call A3A_fnc_log;
};

["Creating hashMaps"] call _fnc_diag_render;
private _nameUnprocessedHM = createHashMapFromArray (keys _navRoadHM apply {[_x,true]});
private _namePosHM = createHashMapFromArray (keys _navRoadHM apply {[_x,getPosATL (_navRoadHM get _x select 0)]});

private _additionalNodeHM = createHashMap;  // Used in between forced connections.

private _fnc_convert_NGStruct_NFStructKV = {
    params ["_NGRoadStruct","_IslandID","_navFlatHM"];
    _NGRoadStruct params ["_road","_connectedRoads","_connectedDistances","_forcedConnections"];

    private _roadPos = _namePosHM get str _road;
    private _connections = [];
    {
        private _roadType = (A3A_NG_const_roadTypeEnum find (getRoadInfo _road #0)) max (A3A_NG_const_roadTypeEnum find (getRoadInfo _x #0));   // Take the best type
        private _roadName = str _x;
        if !(_roadName in _namePosHM) then {
            ["Removed road at "+ str getPosATL _x + " because it's absent from _namePosHM. Warning: This may introduce one-ways!"] call _fnc_reportHaltingError;
            continue;
        };
        private _position = _namePosHM get _roadName;
        private _distance = _connectedDistances#_forEachIndex;
        if (_roadType == -1) then {
            _roadType = 0;
            ["Road at "+str _roadPos + " had type of following line: (If missing then nil)"] call _fnc_reportMinorError;
            ["Road at "+str _roadPos + " had getRoadInfo of "+str (getRoadInfo _road)] call _fnc_reportMinorError;
        };
        if (_x in _forcedConnections) then {    // Insert a midpoint that has no road assigned.
            _position = _roadPos vectorAdd _position vectorMultiply 0.5;
            _distance = _distance/2;

            _navFlatHM set [_position, [_position,_islandID,false,[ [_roadPos, _roadType, _distance],[_namePosHM get str _x, _roadType, _distance] ]]]; // The midpoint will connect to both roads.
        };
        _connections pushBack [_position, _roadType, _distance];
    } forEach _connectedRoads;

    _navFlatHM set [_roadPos, [_roadPos,_islandID,(count _connectedRoads) > 2,_connections]];
};

private _islandID = 0;
private _navFlatHM = createHashMap;

private _diag_totalSegments = count _nameUnprocessedHM;
while {count _nameUnprocessedHM != 0} do {
    private _newName = keys _nameUnprocessedHM #0;
    _nameUnprocessedHM deleteAt _newName;
    private _nextNames = [_newName];// Array<road string>

    while {count _nextNames != 0} do {
        private _diag_sub_counter = count _navFlatHM;
        ("Completion &lt;" + ((100 * _diag_sub_counter /_diag_totalSegments) toFixed 1) + "% &gt; Node &lt;" + (str _diag_sub_counter) + " / " + (str _diag_totalSegments) + "&gt;") call _fnc_diag_render;

        private _currentNames = _nextNames; // Array<struct>
        _nextNames = [];

        {
            private _struct = _navRoadHM get _x;
            [_struct,_IslandID,_navFlatHM] call _fnc_convert_NGStruct_NFStructKV;

            private _connectedNames = (_struct#1) apply {str _x} select {_nameUnprocessedHM get _x};
            { _nameUnprocessedHM deleteAt _x; } forEach _connectedNames;
            _nextNames append _connectedNames;
        } forEach _currentNames;
    };
    _islandID = _islandID +1;
};

_navFlatHM;
