/*
Function:
	A3A_fnc_punishment_notifyAdmin

Description:
	Sends a one-time notification to any admin that someone has being found guilty of FF.

Scope:
	<GLOBAL> Execute on all players.

Environment:
	<ANY>

Parameters:
	<OBJECT> The detainee that that is mentioned in the message.

Returns:
	<BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
	[_detainee] remoteExec ["A3A_fnc_punishment_notifyAdmin",0,false];

Author: Caleb Serafin
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detainee"];
if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
	["FF Notification", format ["%1 has been found guilty of FF.<br/><br/>If you believe this is a mistake, you can forgive him with a scroll-menu action on his body.<br/><br/>He is at the bottom left corner of the map.",name _detainee]] call A3A_fnc_customHint;
};
true;