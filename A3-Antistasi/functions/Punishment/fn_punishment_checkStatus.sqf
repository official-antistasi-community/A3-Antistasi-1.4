/*
Function:
	A3A_fnc_punishment_checkStatus

Description:
	Checks if the UID is should be in ocean gulag. If guilty, player is punished.

Scope:
	<SERVER> Execute on server.

Environment:
	<ANY>

Parameters:
	<STRING> If adding EH to AI, passing a reference is required: Otherwise vanilla EH will be added to the machine it's local on.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if something is wrong disabled; nil if it has crashed.

Examples:
	[_UID] remoteExec ["A3A_fnc_punishment_checkStatus",2,false];

Author: Caleb Serafin
Date Updated: 07 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_UID","",[""]]];
private _fileName = "fn_punishment_checkStatus.sqf";

if (!tkPunish) exitWith {false;};

if (!isServer) exitWith {
	[1, "NOT SERVER", _filename] call A3A_fnc_log;
	false;
};
if (_UID isEqualTo "") exitWith {
	false;
};

private _keyPairs = [["offenceTotal",0]];
([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_offenceTotal"];

if (_offenceTotal >= 1) then {
	_instigator = [_UID] call BIS_fnc_getUnitByUid;
	if (isNull _instigator) exitWith {};
	private _keys = ["lastOffenceTime"];
	[_UID,_keys] call A3A_fnc_punishment_dataRem;
	[_instigator, 0, 0] remoteExec ["A3A_fnc_punishment",2,false];
};
true;