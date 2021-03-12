/*
 * File: fn_itemConfigMass.sqf
 * Author: Spoffy
 * Description:
 *    Returns the mass of an item from its config (CfgWeapons, CfgMagazines)
 * Params:
 *    _config - Config of the item to retrieve the mass value of. 
 * Returns:
 *    Mass of the item, or '0' if no mass found (or mass is genuinely 0)
 * Example Usage:
 *   (configFile >> "CfgMagazines" >> "mySpecialMagazine") call A3A_fnc_itemConfigMass;
 */


params ["_config"];

if !(isClass _config) exitWith { 0 };

private _mass = getNumber (_config >> "WeaponSlotsInfo" >> "mass");

if (_mass == 0) then {
	_mass = getNumber (_config >> "ItemInfo" >> "mass");
};

if (_mass == 0) then {
	_mass = getNumber (_config >> "mass");
};

_mass;