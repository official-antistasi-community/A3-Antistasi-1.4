#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_area", "_roundType", "_caller"];	

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

_group setVariable ["PATCOM_ArtilleryBusy", true, true];

if ([_targetPos, (_area + _artilleryVarience), _side] call A3A_fnc_artilleryDangerClose) then {
	If (PATCOM_DEBUG) then {
		[leader _group, "DANGER CLOSE", 5, "Yellow"] call A3A_fnc_debugText3D;
	};

	if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
		_roundType = "ILLUM";
	} else {
		_roundType = "SMOKE";
	};
};

If (PATCOM_DEBUG) then {
	[leader _group, "FIREMISSION ACCEPTED", 5, "Yellow"] call A3A_fnc_debugText3D;
};

private _artilleryInfo = [_roundType, _selBattery] call A3A_fnc_artilleryGetRounds;
private _availableRounds = (_artilleryInfo # 0);
private _ammoType = (_artilleryInfo # 1);

if !(_ammoType isEqualType "") exitWith {
	If (PATCOM_DEBUG) then {
		ServerDebug_1("Ammo Type is: %1", _ammoType);
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

if !(_targetPos inRangeOfArtillery [[_selBattery], _ammoType]) exitWith {
	If (PATCOM_DEBUG) then {
		[leader _group, "OUT OF RANGE", 5, "Red"] call A3A_fnc_debugText3D;
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

if (_availableRounds == 0) exitWith {
	If (PATCOM_DEBUG) then {
		[leader _group, "OUT OF ROUNDS", 5, "Red"] call A3A_fnc_debugText3D;
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

private _finalTargetPos = [_targetPos, 0, (_area + _artilleryVarience), 0, 1, -1, 0] call A3A_fnc_getSafePos;
_selBattery doArtilleryFire [_finalTargetPos, _ammoType, 1];
If (PATCOM_DEBUG) then {
	[leader _group, "ROUND AWAY", 5, "Green"] call A3A_fnc_debugText3D;
};

[_group] spawn {
	params ["_group"];

	sleep PATCOM_ARTILLERY_DELAY;
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};