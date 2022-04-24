#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_area", "_roundCount", "_roundType"];	

private _batteryUnits = [] call A3A_fnc_artilleryGetBattery;

if (count _batteryUnits < 1) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["No Available Battery's found"];
	};
};

private _selBattery = selectRandom _batteryUnits;
private _group = group (gunner _selBattery);
private _side = side _group;
private _maxFireRate = _group getvariable ["PATCOM_ArtilleryMaxFR", 6];	
private _minFireRate = _group getvariable ["PATCOM_ArtilleryMinFR", 3];
private _artilleryVarience = _group getvariable ["PATCOM_ArtilleryError", 10 + (random 50)];

_group setVariable ["PATCOM_ArtilleryBusy", true, true];

if ([_targetPos, (_area + _artilleryVarience), _side] call A3A_fnc_artilleryDangerClose) then {
	If (PATCOM_DEBUG) then {
		player globalchat format["Friendlies are Danger Close: %1", _targetPos];
	};
	_roundType = "SMOKE";
};

If (PATCOM_DEBUG) then {
	player globalchat format["Artillery Firing on Target: %1", _targetPos];
};

private _artilleryInfo = [_roundType, _selBattery] call A3A_fnc_artilleryGetRounds;
private _availableRounds = (_artilleryInfo # 0);
private _ammoType = (_artilleryInfo # 1);

if !(_targetPos inRangeOfArtillery [[_selBattery], _ammoType]) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["Artillery Out of Range!"];
	};
};

if (_availableRounds == 0) exitWith {
	If (PATCOM_DEBUG) then {
		player globalchat format["Artillery Out of Rounds!"];
	};
};

if (_availableRounds < _roundCount) then {
	// Not enough rounds for firemission request. Fire off the rest of what we have.
	_roundCount = _availableRounds;
};

private _roundsSent = 0;
private _sleep = random _maxFireRate;

while {((_roundsSent < _roundCount) && (alive (gunner _selBattery)))} do {
	_roundsSent = _roundsSent + 1;

	private _finalTargetPos = [_targetPos, 0, (_area + _artilleryVarience), 0, 1, -1, 0] call A3A_fnc_getSafeSpawnPos;
	_selBattery doArtilleryFire [_finalTargetPos, _ammoType, 1];
				
	if (_sleep < _minFireRate) then {
		_sleep = _minFireRate;
	};
	sleep _sleep;
};

//TODO: Pack up mortar backup. Not sure if we'll need this.

[_group] spawn {
	params ["_group"];

	sleep PATCOM_ARTILLERY_DELAY;
	_group setVariable ["PATCOM_ArtilleryBusy", false, true];
};