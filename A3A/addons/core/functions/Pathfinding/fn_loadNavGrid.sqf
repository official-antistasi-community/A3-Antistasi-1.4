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

NavGrid = getArray (missionConfigFile/"A3A"/"Navgrid");
if (NavGrid isEqualTo []) then {NavGrid = getArray (configFile/"A3A"/"Navgrid"/worldName)};
if (NavGrid isEqualTo []) exitWith {
    Error_1("Road database for %1 could not be loaded", worldName);
    Error("Nav Grid with the name format navGrid<WorldName> are no longer compatible! DO NOT LOAD THEM!");
};

{
	private _index = _forEachIndex;
	private _position = _x select 0;
	if (count _position < 3) then { _position set [2, 0] };				// expand to ATL with global effect
	private _mainMarkers = [_position] call A3A_fnc_getMainPositions;
	{
		[_index, _x] call A3A_fnc_setNavData;
	} forEach _mainMarkers;
} forEach navGrid;

roadDataDone = true;

Info("Finished loading nav grid");
