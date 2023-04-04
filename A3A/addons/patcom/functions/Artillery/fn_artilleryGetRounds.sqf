/*
	Author: [Hazey]
	Description:
		Returns the Ammo Class for the requested vehicle.

	Arguments:
		<String> Which type of shell do you need to return. "HE", "SMOKE", "FLARE".
		<String> Classname of Artillery unit that you need to find the ammo class for.
		<Side> Side/Faction in which you need to find the ammo class for.

	Return Value:
		<String> Ammo class for current vehicle.

	Scope: Any
	Environment: Any
	Public: No

	Example: 
		private _ammoType = [_roundType, _batteryClass, _side] call A3A_fnc_artilleryGetRounds

	License: MIT License
	TODO: Add in additional artillery units and round types.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_roundType", "_artilleryType", "_side"];

private _faction = Faction(_side);
private _shellType = "";

if (_artilleryType in (_faction get "vehiclesArtillery")) exitWith {
	_shellArray = _faction get "magazines" get _artilleryType;
	_shellType = (_shellArray # 0);
	_shellType
};

if (_artilleryType in (_faction get "staticMortars")) exitWith {
	switch (_roundType) do {
		case "HE": {
			_shellType = _faction get "mortarMagazineHE";
		};

		case "SMOKE": {
			_shellType = _faction get "mortarMagazineSmoke";
		};
		
		case "FLARE": {
			_shellType = _faction get "mortarMagazineFlare";
		};

		default {
			_shellType = _faction get "mortarMagazineHE";
		};
	};
	_shellType
};
_shellType