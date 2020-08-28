/*
Function:
	A3A_fnc_punishment_release

Description:
	Releases a detainee from his sentence if he is incarcerated.
	Forgives all punishment stats.

Scope:
	<SERVER> Execute on server.

Environment:
	<UNSCHEDULED>

Parameters:
	<STRING> The detainee's UID.
	<STRING> Who is calling the function. All external calls should only use "forgive".

Returns:
	<BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
	[_UID,"forgive"] remoteExec ["A3A_fnc_punishment_release",2]; // Forgive all sins and release from Ocean Gulag.

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_UID",["_source",""]];
private _filename = "fn_punishment_release.sqf";

if (!isServer) exitWith {
	[1, "NOT SERVER", _filename] call A3A_fnc_log;
	false;
};


private _keyPairs = [ ["_punishmentPlatform",objNull],["name","NO NAME"] ];
private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
_data_instigator params ["_punishmentPlatform","_name"];

private _detainee = [_UID] call BIS_fnc_getUnitByUid;
private _playerStats = format["Player: %1 [%2]", _name, _UID];

private _releaseFromSentence = {
	[_UID] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
	[_UID,"remove"] call A3A_fnc_punishment_oceanGulag;
};
private _forgiveStats = {
	private _keys = ["timeTotal","offenceTotal","overhead","sentenceEndTime"];
	[_UID,_keys] call A3A_fnc_punishment_dataRem;
};

switch (_source) do {
	case "punishment_warden": {
		call _forgiveStats;
		call _releaseFromSentence;
		[2, format ["RELEASE | %1", _playerStats], _filename] call A3A_fnc_log;
		if (isPlayer _detainee) then {
			["FF Notification", "Enough then."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		};
		true;
	};
	case "punishment_warden_manual": {
		call _forgiveStats;
		call _releaseFromSentence;
		[2, format ["FORGIVE | %1", _playerStats], _filename] call A3A_fnc_log;
		if (isPlayer _detainee) then {
			["FF Notification", "An admin looks with pity upon your soul.<br/>You have been forgiven."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		};
		true;
	};
	case "forgive": {
		private _keyPairs = [ ["sentenceEndTime",0] ];
		[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;
		true;
	};
	default {
		[1, format ["INVALID PARAMS | _source=""%1""", _source], _filename] call A3A_fnc_log;
		false;
	};
};