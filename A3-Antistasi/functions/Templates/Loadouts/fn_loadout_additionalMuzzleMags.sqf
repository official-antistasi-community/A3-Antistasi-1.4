/*
 * File: fn_loadout_additionalMuzzleMags.sqf
 * Author: Spoffy
 * Description:
 *    Retrieves all of the magazines available for other muzzles of the given weapon type.
 * Params:
 *    _class - Weapon class
 * Returns:
 *    [[["mag1", 1]]] Array with a sub-array for each muzzle, containing arrays - each array has the mag class and mag size.
 * Example Usage:
 *    ["weapon_class"] call A3A_fnc_loadout_additionalMuzzleMags
 */

params ["_class"];

private _weaponConfig = (configFile >> "CfgWeapons" >> _class);
private _muzzles = getArray (_weaponConfig >> "muzzles");
_muzzles = _muzzles select [1, count _muzzles];
private _muzzleConfigs = _muzzles apply {_weaponConfig >> _x} select {isClass _x};
private _magazinesPerMuzzle = _muzzleConfigs apply {getArray (_x >> "magazines")};

private _cfgMagazines = configFile >> "CfgMagazines";

_magazinesPerMuzzle apply {
	_x apply {
		[_x, getNumber (_cfgMagazines >> _x >> "count")]
	}
}