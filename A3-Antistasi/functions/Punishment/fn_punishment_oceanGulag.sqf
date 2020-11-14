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
private _filename = "fn_punishment_oceanGulag.sqf";

if (!isServer) exitWith {
	[1, "NOT SERVER", _filename] call A3A_fnc_log;
	false;
};

private _keyPairs = [ ["punishment_platform",objNull], ["initialPosASL",[0,0,0]]];
([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_punishment_platform","_initialPosASL"];
private _detainee = _UID call BIS_fnc_getUnitByUid;
private _playerPos = [0,0,0];

if (!isPlayer _detainee) then { // Prevents punishing AI
	[2, format ["DETAINEE MIA | UID:%1 matches no in-game player. Cleaning up.", _UID], _filename] call A3A_fnc_log;
	_operation = "remove";
} else {
	_playerPos = getPosASL _detainee;
};

switch (toLower _operation) do {
	case ("add"): {
		if (_playerPos inArea [ [50,50], 50, 50 ,0, true, -1]) exitWith {};
		if (_initialPosASL isEqualTo [0,0,0]) then {
			_keyPairs = [ ["initialPosASL",_playerPos] ];
			[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;
		};
		if (!isNull _punishment_platform) then {
			deleteVehicle _punishment_platform;
		};

		private _pos2D = [random 100,random 100];

		_punishment_platform = createVehicle ["Land_Sun_chair_green_F", [_pos2D #0, _pos2D #1, -0.25], [], 0, "CAN_COLLIDE"];
		_punishment_platform enableSimulation false;
		_punishment_platform allowDamage false;

		_keyPairs = [ ["punishment_platform",_punishment_platform] ];
		[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;

		_punishment_platform setPos [_pos2D #0, _pos2D #1, -0.25];

		if (isPlayer _detainee) then {
			if !(isNull objectParent _detainee) then { moveOut _detainee };
			_detainee switchMove "";
			_detainee attachTo [_punishment_platform,[0, 0, 0.5]];
		};
		true;
	};
	case ("remove"): {
		if (isPlayer _detainee && {_playerPos inArea [ [50,50], 100, 100 ,0, true, -1]}) then { // Slightly bigger, player can't swim 50m in 5 sec.
			private _keyPairs = [ ["initialPosASL",[0,0,0]] ];
			([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_initialPosASL"];
			if !(isNull objectParent _detainee) then { moveOut _detainee };
			detach _detainee;
			_detainee switchMove "";
			private _emptyPos = ([_initialPosASL,posHQ] select (_initialPosASL isEqualTo [0,0,0]) findEmptyPosition [1,50,typeOf _detainee]); // *empty*
			_detainee setVehiclePosition [_emptyPos, [], 0, "NONE"];
			_detainee setVelocity [0, 0, 1];
		};
		if (!isNull _punishment_platform) then {
			deleteVehicle _punishment_platform;
		};
		[_UID,["punishment_platform","initialPosASL"]] call A3A_fnc_punishment_dataRem;
		true
	};
	default {
		[1, format ["INVALID PARAMS | _operation=""%1""", _operation], _filename] call A3A_fnc_log;
		false;
	};
};
