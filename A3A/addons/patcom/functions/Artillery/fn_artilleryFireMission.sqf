/*
	Author: [Hazey]
	Description:
		

	Arguments:
		<Array> Position where you want the artillery strike to happen.
		<Number> Area in which you want the artillery strike to happen in.
		<String> Type of round, "HE", "Flare", "Smoke".
		<Number> Number of rounds you want fired.
		<Object> Unit who called in the artillery strike. (Mainly for debug purposes).

	Return Value:
		N/A

	Scope: Any
	Environment: Any
	Public: No

	Example: 
		[getPos _instigator, (random 150), "HE", 6, _unit] call A3A_fnc_artilleryFireMission;

	License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_area", "_roundType", "_rounds", "_caller"];	

private _batteryUnits = [] call A3A_fnc_artilleryGetBattery;

if (count _batteryUnits < 1) exitWith {
	If (PATCOM_DEBUG) then {
		[_caller, "NO SUPPORT AVAILABLE", 5, "Red"] call A3A_fnc_debugText3D;
	};
};

private _selBattery = selectRandom _batteryUnits;
private _group = group (gunner _selBattery);
private _side = side _group;
private _artilleryVarience = _group getvariable ["PATCOM_ArtilleryError", 10 + (random 50)];
private _dayState = [] call A3A_fnc_getDayState;
private _reloadTime = [_selBattery] call A3A_fnc_getReloadTime;

_group setVariable ["PATCOM_ArtilleryBusy", true, true];

if ([_targetPos, (_area + _artilleryVarience), _side] call A3A_fnc_artilleryDangerClose) then {
	If (PATCOM_DEBUG) then {
		[leader _group, "DANGER CLOSE", 5, "Yellow"] call A3A_fnc_debugText3D;
	};

	if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
		_roundType = "FLARE";
	} else {
		_roundType = "SMOKE";
	};
};

If (PATCOM_DEBUG) then {
	[leader _group, "FIREMISSION ACCEPTED", 5, "Yellow"] call A3A_fnc_debugText3D;
};

private _batteryClass = (typeOf _selBattery);
private _ammoType = [_roundType, _batteryClass, _side] call A3A_fnc_artilleryGetRounds;

if !(_targetPos inRangeOfArtillery [[_selBattery], _ammoType]) exitWith {
	If (PATCOM_DEBUG) then {
		[leader _group, "OUT OF RANGE", 5, "Red"] call A3A_fnc_debugText3D;
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

[_group, _targetPos, _area, _artilleryVarience, _selBattery, _ammoType, _rounds, _reloadTime] spawn {
	params ["_group", "_targetPos", "_area", "_artilleryVarience", "_selBattery", "_ammoType", "_rounds", "_reloadTime"];

	for "_i" from 1 to _rounds do {
		private _finalTargetPos = [_targetPos, _artilleryVarience, _area, 0, 1, -1, 0] call A3A_fnc_getSafePos;
		_selBattery doArtilleryFire [_finalTargetPos, _ammoType, 1];
		If (PATCOM_DEBUG) then {
			[leader _group, "ROUND AWAY", 1, "Green"] call A3A_fnc_debugText3D;
		};
		sleep (_reloadTime + (2 + (random 4)));
	};

	sleep PATCOM_ARTILLERY_DELAY;
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};