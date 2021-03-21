/*
Function:
	A3A_fnc_punishment_oceanGulag

Description:
	Creates a surfboard in a random pos 100m from the corner.
	Moves the detainee onto the surfboard.

Scope:
	<SERVER> Execute on server.

Environment:
	<UNSCHEDULED>

Parameters:
	<STRING> The UID of the detainee being sent to Ocean Gulag.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
	[_UID,"add"] call ["A3A_fnc_punishment_oceanGulag",2,false];
	[_UID,"remove"] call ["A3A_fnc_punishment_oceanGulag",2,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_UID",["_operation","add",[""]]];
private _filename = "fn_punishment_oceanGulag";

if (!isServer) exitWith {
	[1, "NOT SERVER", _filename] call A3A_fnc_log;
	false;
};

private _varspace = [missionNamespace,"A3A_FFPun",_UID,locationNull] call A3A_fnc_getNestedObject;
private _platform = _varspace getVariable ["platform",objNull];
private _initialPosASL = _varspace getVariable ["initialPosASL",[0,0,0]];
private _detainee = _varspace getVariable ["player",objNull];

private _playerPos = [0,0,0];

if (!isPlayer _detainee) then { // Prevents punishing AI
	[2, format ["DETAINEE MIA | UID:%1 matches no in-game player. Cleaning up.", _UID], _filename] call A3A_fnc_log;
	_operation = "remove";
} else {
	_playerPos = getPosASL _detainee;
};
if (isNil "A3A_FFPun_Jailed") then {A3A_FFPun_Jailed = [];};

switch (toLower _operation) do {
	case ("add"): {
		if (_playerPos inArea [ [50,50], 50, 50 ,0, true, -1]) exitWith {};
		if !(A3A_FFPun_Jailed pushBackUnique _UID isEqualTo -1) then {
			publicVariable "A3A_FFPun_Jailed";  // This is only modified on the server within an UNSCHEDULED function, so there should not be a race condition.
		};
		if (_initialPosASL isEqualTo [0,0,0]) then {
			[missionNamespace,"A3A_FFPun",_UID,"initialPosASL",_playerPos] call A3A_fnc_setNestedObject;
		};
		if (!isNull _platform) then {
			deleteVehicle _platform;
		};

		private _pos2D = [random 100,random 100];

		_platform = createVehicle ["Land_Sun_chair_green_F", [_pos2D #0, _pos2D #1, -0.25], [], 0, "CAN_COLLIDE"];
		_platform enableSimulation false;
		_platform allowDamage false;

		[missionNamespace,"A3A_FFPun",_UID,"platform",_platform] call A3A_fnc_setNestedObject;

		_platform setPos [_pos2D #0, _pos2D #1, -0.25];

		if (isPlayer _detainee) then {
			if !(isNull objectParent _detainee) then { moveOut _detainee };
			_detainee switchMove "";
			_detainee attachTo [_platform,[0, 0, 0.5]];
		};
		true;
	};
	case ("remove"): {
		if (isPlayer _detainee && {_playerPos inArea [ [50,50], 100, 100 ,0, true, -1]}) then { // Slightly bigger, player can't swim 50m in 5 sec.
			private _initialPosASL = [missionNamespace,"A3A_FFPun",_UID,"initialPosASL",[0,0,0]] call A3A_fnc_getNestedObject;
			if !(isNull objectParent _detainee) then { moveOut _detainee };
			detach _detainee;
			_detainee switchMove "";
			private _emptyPos = ([_initialPosASL,posHQ] select (_initialPosASL isEqualTo [0,0,0]) findEmptyPosition [1,50,typeOf _detainee]); // *empty*
			_detainee setVehiclePosition [_emptyPos, [], 0, "NONE"];
			_detainee setVelocity [0, 0, 1];
		};
		if (!isNull _platform) then {
			deleteVehicle _platform;
		};
		if !(isNil {A3A_FFPun_Jailed deleteAt (A3A_FFPun_Jailed find _UID)}) then {
			publicVariable "A3A_FFPun_Jailed";  // This is only modified on the server within an UNSCHEDULED function, so there should not be a race condition.
		};
		private _varspace = [missionNamespace,"A3A_FFPun",_UID,"platform",nil] call A3A_fnc_setNestedObject;
		_varspace setVariable ["initialPosASL",nil];
		true;
	};
	default {
		[1, format ["INVALID PARAMS | _operation=""%1""", _operation], _filename] call A3A_fnc_log;
		false;
	};
};
