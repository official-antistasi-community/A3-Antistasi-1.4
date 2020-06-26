/*
Function:
	A3A_fnc_punishment_oceanGulag

Description:
	Creates a surfboard in a random pos 100m from the corner.
	Moves the detainee onto the surfboard.

Scope:
	<SERVER> Execute on server.

Environment:
	<ANY>

Parameters:
	<STRING> The UID of the detainee being sent to Ocean Gulag.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
	[_detainee,"add"] call ["A3A_fnc_punishment_oceanGulag",2,false];
	[_detainee,"remove"] call ["A3A_fnc_punishment_oceanGulag",2,false];

Author: Caleb Serafin
Date Updated: 3 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detaineeUID",["_operation","add",[""]]];
private _filename = "fn_punishment_oceanGulag.sqf";

if (!isServer) exitWith {
	[[1, "NOT SERVER"], _filename] call A3A_fnc_log;
	false;
};

private _keyPairs = [ ["punishment_platform",objNull] ];
([_detaineeUID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_punishment_platform"];
private _detainee = _detaineeUID call BIS_fnc_getUnitByUid;
private _playerPos = [0,0,0];

if (isNull _detainee) then {
	[2, format ["DETAINEE MIA | UID:%1 matches no unit. Running without player.", _detaineeUID], _filename] call A3A_fnc_log;
} else {
	_playerPos = getPos _detainee;
};

switch (toLower _operation) do {
	case ("add"): {
		if (_playerPos inArea [ [50,50], 50, 50 ,0, true, -1]) exitWith {};
		if (!isNull _punishment_platform) then {
			deleteVehicle _punishment_platform;
		};

		private _pos2D = [random 100,random 100];

		_punishment_platform = createVehicle ["Land_Sun_chair_green_F", [_pos2D #0, _pos2D #1, -0.25], [], 0, "CAN_COLLIDE"];
		_punishment_platform enableSimulation false;
		_punishment_platform allowDamage false;

		_keyPairs = [ ["punishment_platform",_punishment_platform] ];
		[_detaineeUID,_keyPairs] call A3A_fnc_punishment_dataSet;

		_punishment_platform setPos [_pos2D #0, _pos2D #1, -0.25];

		if (!isNull _detainee) then {
			_detainee setPos [_pos2D #0, _pos2D #1, 0.25];
		};
		true;
	};
	case ("remove"): {
		if (!isNull _detainee && {_playerPos inArea [ [50,50], 100, 100 ,0, true, -1]}) then { // Slightly bigger, player can't swim 50m in 5 sec.
			_detainee switchMove "";
			if !(leader _detainee in [objNull, _detainee]) then {
				_detainee setPos getPos leader _detainee;
			} else {
				_detainee setPos posHQ;
			};
		};
		if (!isNull _punishment_platform) then {
			deleteVehicle _punishment_platform;
		};
		[_detaineeUID,["punishment_platform","initialPosASL"]] call A3A_fnc_punishment_dataRem;
	};
	default {
		[1, format ["INVALID PARAMS | _operation=""%1""", _operation], _filename] call A3A_fnc_log;
		false;
	};
};