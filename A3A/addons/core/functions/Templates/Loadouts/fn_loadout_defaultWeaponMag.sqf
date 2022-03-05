/*
 * File: fn_loadout_defaultWeaponMag.sqf
 * Author: Spoffy
 * Description:
 *    Gets the default weapons magazine for a given weapon class
 * Params:
 *    _class - Weapon class
 * Returns:
 *    Magazine class string
 * Example Usage:
 *    ["my_weapon_class"] call A3A_fnc_loadout_defaultWeaponMag
 */

params ["_class"];

private _magazines = getArray (configFile >> "CfgWeapons" >> _class >> "Magazines");
if ("CBA_FakeLauncherMagazine" in _magazines) exitWith {[]};
private _magazineType = "";

if (count _magazines > 0) then {
	_magazineType = _magazines select 0;
};

if !(_magazineType isEqualTo "") exitWith {
	[_magazineType, getNumber (configFile >> "CfgMagazines" >> _magazineType >> "count")]
};

[]
