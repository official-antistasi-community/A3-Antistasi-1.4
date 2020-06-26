/*
Function:
	A3A_fnc_punishment_sentence_server

Description:
	Organises the sentence and addActions of the detainee.
	Includes timer and release mechanism.
	Will release on remote sentence release time shorting.

Scope:
	<SERVER> Execute on server.

Environment:
	<SCHEDULED> For suspensions.

Parameters:
	<STRING> The UID of the detainee being sent to Ocean Gulag.
	<NUMBER> The time the detainee will be imprisoned.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if invalid params; nil if it has crashed.

Examples:
	[_detaineeUID,_timeTotal] remoteExec ["A3A_fnc_punishment_sentence_server",2,false];

Author: Caleb Serafin
Date Updated: 3 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detaineeUID","_timeTotal"];
private _filename = "fn_punishment_sentence_server.sqf";
scriptName "fn_punishment_sentence_server.sqf";

if (!isServer) exitWith {
	[[1, "NOT SERVER"], _filename] call A3A_fnc_log;
	false;
};

_timeTotal = 5*(floor (_timeTotal/5)); // Rounds up so the loop lines up.
private _sentenceEndTime = (floor serverTime) + _timeTotal;
private _keyPairs = [["_sentenceEndTime",_sentenceEndTime],["timeTotal",_timeTotal],["offenceTotal",1]];
[_detaineeUID,_keyPairs] call A3A_fnc_punishment_dataSet;

private _disconnectedCleanUp = {
	params [["_name","Unknown at this time.",[ "" ]]];
	_playerStats = format["Player: %1 [%2], _timeTotal: %3", _name, _detaineeUID,str timeTotal];
	[2, format ["DISCONNECTED WHILE PUNISHED | %2", _playerStats], _filename] call A3A_fnc_log;
	systemChat format["FF: %1[%2] disconnected while being punished.",_name,_detaineeUID];
	[_UID,"remove"] call A3A_fnc_punishment_oceanGulag;
	_disconnected=true;
	true;
};

private _detainee = _detaineeUID call BIS_fnc_getUnitByUid;
if (isNull _detainee) exitWith {call _disconnectedCleanUp};
[_detainee] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];
[_detainee] remoteExec ["A3A_fnc_punishment_notifyAdmin",0,false];
private _name = name _detainee;

private _sentenceEndTime_old = _sentenceEndTime;
private _countX = 0;
private _disconnected = false;

while {(ceil serverTime) < _sentenceEndTime-1} do { // ceil and -1 if something doesn't sync up
	_detainee = _detaineeUID call BIS_fnc_getUnitByUid;
	if (isNull _detainee) exitWith {[_name] call _disconnectedCleanUp};
	[_detaineeUID,"add"] remoteExecCall ["A3A_fnc_punishment_oceanGulag",2,false]; // Run in another thread so that time don't get too desynced.
	_countX = _sentenceEndTime - (floor serverTime);
	[_detainee,_countX] remoteExec ["A3A_fnc_punishment_sentence_client",_detainee,false];
	uiSleep 5;
	_keyPairs = [ ["_sentenceEndTime",_sentenceEndTime] ];
	_sentenceEndTime = ([_detaineeUID,_keyPairs] call A3A_fnc_punishment_dataGet) select 0; // Polls for updates
};
if (_disconnected) exitWith {};
if (_sentenceEndTime_old == _sentenceEndTime) then {
	[_detainee,"punishment_warden"] call A3A_fnc_punishment_release;
} else {
	[_detainee,"punishment_warden_manual"] call A3A_fnc_punishment_release;
};
true;