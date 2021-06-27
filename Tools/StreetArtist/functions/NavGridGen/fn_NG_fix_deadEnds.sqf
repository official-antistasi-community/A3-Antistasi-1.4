/*
Maintainer: Caleb Serafin
    Modifies Reference
    Tries to find roads after a dead-end or on both sides of an isolated road.

Arguments:
    <navRoadHM> Modifies Reference

Return Value:
    <navRoadHM> Same reference to Nav grid with erroneous dead-ends fixed.

Scope: Any, Global Arguments
Environment: Scheduled
Public: No
Dependencies:
    <ARRAY> A3A_NG_const_roadTypeEnum

Example:
    [_navRoadHM] call A3A_fnc_NG_fix_deadEnds;
*/
params [
    "_navRoadHM"
];

private _diag_step_sub = "";

private _fnc_diag_render = { // call _fnc_diag_render;
    ["Missing Road Check","<t align='left'>" +_diag_step_sub+"</t>",true,400] call A3A_fnc_customHint;
};

private _fnc_connectStructAndRoad = {
    params ["_myStruct","_otherRoad"];
    private _myRoad = _myStruct#0;
    private _distance = _myRoad distance _otherRoad;

    private _otherStruct = _navRoadHM get str _otherRoad;

    if (_otherStruct isEqualType 0) exitWith {
        private _crashText = "Could not find index of '"+str _otherRoad+"' " + str (getPosATL _otherRoad) + ".";
        [1,_crashText,"fn_NG_fix_deadEnds"] call A3A_fnc_log;
        ["fn_NG_fix_deadEnds Error","Please check RPT.<br/>"+_crashText,false,600] call A3A_fnc_customHint;
    };

    _myStruct#1 pushBack _otherRoad;    // Original values are modified by reference
    _myStruct#2 pushBack _distance;
    _myStruct#3 pushBackUnique _otherRoad;// Has forced connection. The roads are exempt from simplification and are resolved in the road to navGrid conversion.

    _otherStruct#1 pushBack _myRoad;     // Original values are modified by reference
    _otherStruct#2 pushBack _distance;
    _otherStruct#3 pushBackUnique _myRoad;// Has forced connection. The roads are exempt from simplification and are resolved in the road to navGrid conversion.
};

private _fnc_searchAzimuth = {
    params ["_road","_azimuth"];

    private _finalRoad = objNull;
    private _myPos = getPosATL _road;
    {
        private _testPos = _myPos vectorAdd [_x * sin _azimuth,_x * cos _azimuth,0];
        private _testRoad = roadAt _testPos;
        if !(_testRoad isEqualTo _road || {isNil {_navRoadHM get str _testRoad}}) exitWith {_finalRoad = _testRoad};

        _testRoad = nearestTerrainObjects [_testPos, A3A_NG_const_roadTypeEnum, 7.5, true, false];
        if !(_testRoad isEqualTo _road || {isNil {_navRoadHM get str _testRoad}}) exitWith {_finalRoad = _testRoad};
    } forEach [10,20,30,40];    // Search steps
    _finalRoad;
};

private _structs = keys _navRoadHM apply {_navRoadHM get _x};
private _isolatedStructs = _structs select {count (_x#1) < 2};
private _deadEndStructs = [];
_diag_totalSegments = count _isolatedStructs;
{
    if (_forEachIndex mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing isolated &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
        call _fnc_diag_render;
    };
    if (_x#1 isEqualTo A3A_NG_const_emptyArray) then {
        private _road = _x#0;
        private _roadInfo = getRoadInfo _road;
        private _azimuth = (_roadInfo#6) getDir (_roadInfo#7);

        private _missingRoad = [_road,_azimuth] call _fnc_searchAzimuth;
        if (!isNull _missingRoad) then {
            [_x,_missingRoad] call _fnc_connectStructAndRoad;
        };

        _azimuth = (_azimuth + 180) mod 360;
        _missingRoad = [_road,_azimuth] call _fnc_searchAzimuth;
        if (!isNull _missingRoad) then {
            [_x,_missingRoad] call _fnc_connectStructAndRoad;
        };
    } else {   // Push to dead ends if no-longer isolated
        _deadEndStructs pushBack _x;
    };
} forEach _isolatedStructs;

_diag_totalSegments = count _deadEndStructs;
{
    if (_forEachIndex mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing dead-end &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
        call _fnc_diag_render;
    };
    if (count (_x#1) == 1) then {   // Skip if no-longer a dead end.
        private _road = _x#0;
        private _missingRoad = [_road,(_x#1#0) getDir (_road)] call _fnc_searchAzimuth;  // (_x#1#0) is the first connected road.
        if (!isNull _missingRoad) then {
            [_x,_missingRoad] call _fnc_connectStructAndRoad;
        };
    };
} forEach _deadEndStructs;

_navRoadHM;
