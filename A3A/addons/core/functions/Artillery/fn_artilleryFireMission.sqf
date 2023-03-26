#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_area", "_roundType"];	

private _batteryUnits = [] call A3A_fnc_artilleryGetBattery;

if (count _batteryUnits < 1) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["No Available Battery's found"];
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
		player globalchat format["Friendlies are Danger Close: %1", _targetPos];
	};

	if (_dayState == "EVENING" || {_dayState == "NIGHT"}) then {
		_roundType = "ILLUM";
	} else {
		_roundType = "SMOKE";
	};
};

If (PATCOM_DEBUG) then {
	player globalchat format["Artillery Firing on Target: %1", _targetPos];
};

private _artilleryInfo = [_roundType, _selBattery] call A3A_fnc_artilleryGetRounds;
private _availableRounds = (_artilleryInfo # 0);
private _ammoType = (_artilleryInfo # 1);

if !(_ammoType isEqualType "") exitWith {
	ServerDebug_1("Ammo Type is: %1", _ammoType);
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

if !(_targetPos inRangeOfArtillery [[_selBattery], _ammoType]) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["Artillery Out of Range!"];
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

if (_availableRounds == 0) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["Artillery Out of Rounds!"];
	};
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};

private _finalTargetPos = [_targetPos, 0, (_area + _artilleryVarience), 0, 1, -1, 0] call A3A_fnc_getSafePos;
_selBattery doArtilleryFire [_finalTargetPos, _ammoType, 1];

[_group] spawn {
	params ["_group"];

	sleep PATCOM_ARTILLERY_DELAY;
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};