/*
 * File: fn_loadout_setWeapon.sqf
 * Author: Spoffy
 * Description:
 *    Adds a weapon to a unit loadout
 * Params:
 *    _loadout - Loadout to add backpack to
 *    _slot - "PRIMARY", "LAUNCHER" or "HANDGUN"
 *    _weapon - Weapon to add. Either a class "arifle_MXC_F" or an array ["arifle_MXC_F", "muzzle", "pointer", "optic", "bipod"]
 * Returns:
 *    Modified loadout array
 * Example Usage:
 *    [_loadout, "PRIMARY", "arifle_MXC_F"] call A3A_fnc_addWeapon
 *    [_loadout, "PRIMARY", ["arifle_MXC_F", "", "", ""], "30Rnd_65x39_caseless_mag"] call A3A_fnc_addWeapon
 */

params ["_loadout", "_slot", "_weapon"];

private _weaponArray = [];

if (_weapon isEqualType []) then {
	_weapon params ["_weaponClass", ["_muzzle", ""], ["_pointer", ""], ["_optic", ""], ["_priMag", []], ["_secMag", []], ["_bipod", ""]];
	_weaponArray = [_weaponClass, _muzzle, _pointer, _optic, _priMag, _secMag, _bipod];
} else {
	_weaponArray = [_weapon, "", "", "", [], [], ""];
};

//Find out which magazine we should add to the gun.
if (_weaponArray select 4 isEqualTo []) then {
	private _mag = [_weaponArray select 0] call A3A_fnc_loadout_defaultWeaponMag;
	_weaponArray set [ 4, _mag ];
};

if (_slot == "PRIMARY") then {
	_loadout set [ 0, _weaponArray ];
};

if (_slot == "LAUNCHER") then {
	_loadout set [ 1, _weaponArray ];
};

if (_slot == "HANDGUN") then {
	_loadout set [ 2, _weaponArray ];
};

_loadout