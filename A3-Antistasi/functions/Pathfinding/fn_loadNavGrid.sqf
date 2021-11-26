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
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

if !(isNil "roadDataDone") exitWith
{
    Error("Nav grid already created, cant load it twice!");
};

Info("Started loading nav grid");

private _path = format ["Navigation\%1NavGrid.sqf", toLower worldName];
private _abort = false;
try
{
	//Load in the nav grid array
	[] call compile preprocessFileLineNumbers _path;
}
catch
{
    Error_1("Road database at %1 could not be loaded", _path);
    Error("Nav Grid with the name format navGrid<WorldName> are no longer compatible! DO NOT LOAD THEM!");
	_abort = true;
};
if(_abort) exitWith {};

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
