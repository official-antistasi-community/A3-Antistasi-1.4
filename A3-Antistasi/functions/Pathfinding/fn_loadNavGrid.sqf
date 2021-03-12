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

private _fileName = "fn_loadNavGrid";

if !(isNil "roadDataDone") exitWith
{
    [1, "Nav grid already created, cant load it twice!", _fileName] call A3A_fnc_log;
};

[2, "Started loading nav grid", _fileName] call A3A_fnc_log;

private _path = format ["Navigation\%1NavGrid.sqf", toLower worldName];
private _abort = false;
try
{
	//Load in the nav grid array
	[] call compile preprocessFileLineNumbers _path;
}
catch
{
	[1, format ["Road database at %1 could not be loaded", _path], _fileName] call A3A_fnc_log;
    [1, "Nav Grid with the name format navGrid<WorldName> are no longer compatible! DO NOT LOAD THEM!", _fileName] call A3A_fnc_log;
	_abort = true;
};
if(_abort) exitWith {};

{
	private _index = _forEachIndex;
	private _position = _x select 0;
	private _mainMarkers = [_position] call A3A_fnc_getMainPositions;
	{
		[_index, _x] call A3A_fnc_setNavData;
	} forEach _mainMarkers;
} forEach navGrid;

roadDataDone = true;

[2, "Finished loading nav grid", _fileName] call A3A_fnc_log;
