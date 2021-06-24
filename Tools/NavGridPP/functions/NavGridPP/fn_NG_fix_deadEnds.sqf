/*
Maintainer: Caleb Serafin
    Tries to find roads after a dead-end or on both sides of an isolated road.

Arguments:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>

Return Value:
    <ARRAY> Nav islands with fake dead-ends fixed.

Scope: Any, Global Arguments
Environment: Scheduled
Public: No

Example:
    _navGrid = [_navGrid] call A3A_fnc_NG_fix_deadEnds;
*/
params [
    ["_navGrid",[],[ [] ]]  // ARRAY<segmentStruct>
];

private _diag_step_sub = "";

private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++",
        "<t align='left'>" +
        "Appling Fixes<br/>"+
        "Missing Road Check<br/>"+
        _diag_step_sub+"<br/>"+
        "</t>"
    ] remoteExec ["A3A_fnc_customHint",0];
};

private _navGridNS = [localNamespace,"NavGridPP","MissingRoadCheck_roadIndex", nil, nil] call Col_fnc_nestLoc_set;
{
    _navGridNS setVariable [str (_x#0),_x];
} forEach _navGrid; // _x is road struct <road,ARRAY<connections>,ARRAY<distances>>

private _fnc_connectStructAndRoad = {
    params ["_myStruct","_otherRoad"];
    private _myRoad = _myStruct#0;
    private _distance = _myRoad distance2D _otherRoad;

    private _otherStruct = _navGridNS getVariable [str _otherRoad,0];

    if (_otherStruct isEqualType 0) exitWith {
        [1,"Could not find index of '"+str _otherRoad+"' " + str (getPos _otherRoad) + ".","fn_NG_fix_deadEnds"] call A3A_fnc_log;
        ["fn_NG_fix_deadEnds Error","Please check RPT."] call A3A_fnc_customHint;
    };

    _myStruct#1 pushBack _otherRoad;    // Original values are modified by reference
    _myStruct#2 pushBack _distance;

    _otherStruct#1 pushBack _myRoad;     // Original values are modified by reference
    _otherStruct#2 pushBack _distance;
};

private _const_searchSteps = [10,20,30,40];
private _fnc_searchAzimuth = {
    params ["_road","_azimuth"];

    private _testRoad = objNull;
    private _finalRoad = objNull;
    private _mytPos = getPos _road;
    {
        _testRoad = roadAt (_mytPos getPos [_x,_azimuth]);
        if !(_testRoad isEqualTo _road || {isNil {_navGridNS getVariable [str _testRoad,nil]}}) exitWith {_finalRoad = _testRoad};
    } forEach _const_searchSteps;
    _finalRoad;
};

private _const_emptyArray = [];
private _isolatedStructs = _navGrid select {count (_x#1) < 2};
private _deadEndStructs = [];
_diag_totalSegments = count _isolatedStructs;
{
    if (_forEachIndex mod 100 == 0) then {
        _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing isolated &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";;
        call _fnc_diag_render;
    };
    if (_x#1 isEqualTo _const_emptyArray) then {
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
        private _missingRoad = [_road,(_x#1#0) getDir (_road)] call _fnc_searchAzimuth;
        if (!isNull _missingRoad) then {
            [_x,_missingRoad] call _fnc_connectStructAndRoad;
        };
    };
} forEach _deadEndStructs;

private _navGridFixed = allVariables _navGridNS apply {_navGridNS getVariable [_x,nil]};
[_navGridNS] call Col_fnc_nestLoc_rem;
_navGridFixed;
