/*
Function:
	A3A_fnc_punishment_sentence_client

Description:
	Controls the client side UI for punishment sentences.

Scope:
	<LOCAL> Execute on detainee to use his processing power.

Environment:
	<SCHEDULED>

Parameters:
	<STRING> The UID of the detainee in Ocean Gulag.
	<NUMBER> The time left until detainee is released.

Returns:
	<BOOLEAN> true after 5 seconds if it hasn't crashed; false if the detainee disconnected or died; nil if it has crashed.

Examples:
	[_UID,_timeLeft] remoteExec ["A3A_fnc_punishment_sentence_client",_detainee,false];

Author: Caleb Serafin
Date Updated: 13 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_UID","_timeLeft"];
private _filename = "fn_punishment_sentence_client.sqf";

private _detainee = [_UID] call BIS_fnc_getUnitByUid;
if (_timeLeft < 5) then {_timeLeft = 5;}; // Sometimes something somewhere might go out of sync, so we just troll the player if that happens.

for "_timeLeft" from _timeLeft to _timeLeft-4 step -1 do {
	if (!isPlayer _detainee) exitWith {false};
	["FF Notification", format ["Please do not teamkill. Stare at the turtles for %1 more seconds.",_timeLeft], true] remoteExec ["A3A_fnc_customHint", _detainee, false];
	uiSleep 1;
};
true;