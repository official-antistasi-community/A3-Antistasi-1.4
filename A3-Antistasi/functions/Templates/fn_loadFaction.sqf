/*
 * File: fn_loadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file
 * Params:
 *    _filepaths - Single or array of faction definition filepath
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */

#include "..\..\Includes\common.inc"
params [
	["_filepaths",[],["",[]]]
];

if (_filepaths isEqualType "") then {_filepaths = [_filepaths]};
if (count _filepaths == 0) then {Error("No filepaths provided.")};

//Create a global namespace to store faction data in.
private _dataStore = true call A3A_fnc_createNamespace;

private _fnc_saveToTemplate = {
	params ["_name", "_data"];

	_dataStore setVariable [_name, _data, true];
};

private _fnc_getFromTemplate = {
	params ["_name"];

	_dataStore getVariable _name;
};

//Keep track of loadout namespaces so we can delete them when we're done.
private _loadoutNamespaces = [];
private _fnc_createLoadoutData = {
	private _namespace = false call A3A_fnc_createNamespace;
	_loadoutNamespaces pushBack _namespace;
	_namespace
};

private _fnc_copyLoadoutData = {
	params ["_sourceNamespace"];
	private _newNamespace = call _fnc_createLoadoutData;
	{
		_newNamespace setVariable [_x, _sourceNamespace getVariable _x];
	} forEach allVariables _sourceNamespace;
	_newNamespace
};

private _allLoadouts = true call A3A_fnc_createNamespace;
_dataStore setVariable ["loadouts", _allLoadouts];

private _fnc_saveUnitToTemplate = {
	params ["_typeName", "_loadouts", ["_traits", []]];
	private _unitDefinition = [_loadouts, _traits];
	_allLoadouts setVariable [_typeName, _unitDefinition];
};

private _fnc_generateAndSaveUnitToTemplate = {
	params ["_name", "_template", "_loadoutData", ["_traits", []]];
	private _loadouts = [];
	for "_i" from 1 to 5 do {
		_loadouts pushBack ([_template, _loadoutData] call A3A_fnc_loadout_builder);
	};
	[_name, _loadouts, _traits] call _fnc_saveUnitToTemplate;
};

private _fnc_generateAndSaveUnitsToTemplate = {
	params ["_prefix", "_unitTemplates", "_loadoutData"];
	{
		_x params ["_name", "_template", ["_traits", []]];
		private _finalName = format ["%1_%2", _prefix, _name];
		[_finalName, _template, _loadoutData, _traits] call _fnc_generateAndSaveUnitToTemplate;
	} forEach _unitTemplates;
};

{
	call compile preprocessFileLineNumbers _x;
} forEach _filepaths;

//Clear up used loadout namespaces.
{
	[_x] call A3A_fnc_deleteNamespace;
} forEach _loadoutNamespaces;

_dataStore