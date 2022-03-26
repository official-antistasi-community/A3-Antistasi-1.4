/*
 * File: fn_itemConfig.sqf
 * Author: Spoffy
 * Description:
 *    Returns the config of an item from its class name
 * Params:
 *    _class - Class of the item to retrieve the mass value of. 
 * Returns:
 *    Config of the item, or configNull if not found.
 * Example Usage:
 *   ("mySpecialMagazine") call A3A_fnc_itemConfig;
 */


params ["_class"];

private _config = configFile >> "CfgMagazines" >> _class;
if (isClass _config) exitWith {
	_config
};

_config = configFile >> "CfgWeapons" >> _class;
if (isClass _config) exitWith {
	_config
};

configNull