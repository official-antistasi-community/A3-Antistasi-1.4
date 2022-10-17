/*
Author: Wurzel0701
Maintainer: Jaj22, Bob-Murphy, MeltedPixel
    Loads all data for the navGrid

Arguments:
    <NULL>

Return Value:
    <NULL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NULL>

Example:
    [] call A3A_fnc_loadNavGrid;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isNil "roadDataDone") exitWith
{
    Error("Nav grid already created, cant load it twice!");
};

Info("Started loading nav grid");

private _path = if (isText (missionConfigFile/"A3A"/"Navgrid"/worldName)) then {
    getText (missionConfigFile/"A3A"/"Navgrid"/worldName);
} else {
    getText (configFile/"A3A"/"Navgrid"/worldName);
};

if (!fileExists _path) exitWith { Error_1("Invalid path to navgird: %1", _path); };
private _navGridDB_formatted = preprocessFileLineNumbers _path;
if ("navGrid" in _navGridDB_formatted) then {   // Try to remove assignment code
    private _startIndex = (_navGridDB_formatted find "=") + 1;
    _navGridDB_formatted = _navGridDB_formatted select [_startIndex,count _navGridDB_formatted - _startIndex];

    private _endCount = (_navGridDB_formatted find ";");
    _navGridDB_formatted = _navGridDB_formatted select [0,_endCount];
};

NavGrid = parseSimpleArray _navGridDB_formatted;
if (NavGrid isEqualTo []) exitWith {
    Error_1("Road database for %1 could not be loaded", worldName);
    Error("Nav Grid with the name format navGrid<WorldName> are no longer compatible! DO NOT LOAD THEM!");
};

A3A_navCellHM = createHashMap;

{
	private _index = _forEachIndex;
	private _position = _x select 0;
	if (count _position < 3) then { _position set [2, 0] };
/*
        // Only need this if we have waypoints on bridges, which I'm not sure we do
        private _road = roadAt _position;
        if (isNull _road or {!(getRoadInfo _road # 8)}) exitWith { _position set [2, 0] };

        // do we need to use lineIntersectsSurfaces? Sadly yes.
        private _highpos = getPosASL _road vectorAdd [0,0,100];
        _li = lineIntersectsSurfaces [_highpos, _highpos [0,0,-200], objNull, objNull, true, 1, "ROADWAY", "VIEW"];
        if (_li isNotEqualTo []) then { _position = (_li#0#0) };
    };
*/
    _index call A3A_fnc_addToNavCells;
} forEach navGrid;

roadDataDone = true;

Info("Finished loading nav grid");

// ok, seriously consider marking every connected road instead?
// solves the nearest-node problem in the general case
// well, kinda...
// helps a lot if there's a second hashmap for second connected point
// but junction coalescing means that doesn't really work
// method: fat-ass hashmap of road->navIndex
