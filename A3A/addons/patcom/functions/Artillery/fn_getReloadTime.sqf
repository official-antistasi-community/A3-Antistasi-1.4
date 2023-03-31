/*
	Author: [Hazey]
	Description:
		Get's the reload time of units vehicle turret.

	Arguments:
		<Object> Unit you want to check reload time for.

	Return Value:
		<Number> How long it takes for the weapon to reload.

	Scope: Any
	Environment: Any
	Public: No

	Example: 
		[_unit] call A3A_fnc_getReloadTime;

	License: MIT License

	Notes:
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_unit"];

private _vehicle = vehicle _unit;
private _turretPath = _vehicle unitTurret _unit;
private _state = weaponState [_vehicle, _turretPath, ""];

_state params ["_weapon", "_muzzle", "_fireMode"];

// Get ammo reloading time
private _config = configFile >> "CfgWeapons" >> _weapon;

if (_muzzle != _weapon) then {
    _config = _config >> _muzzle;
};

if (_muzzle != _fireMode) then {
    _config = _config >> _fireMode;
};

getNumber (_config >> "reloadTime")
