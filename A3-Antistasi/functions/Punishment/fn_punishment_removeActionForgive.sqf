/*
Function:
	A3A_fnc_punishment_removeActionForgive

Description:
	Removes action from the Admin to forgive the detainee;
	Removes action from the detainee to refresh the Admin's action.

Scope:
	<GLOBAL> Execute on all players.

Environment:
	<ANY>

Parameters:
	<OBJECT> The detainee that the actions pertains to.

Returns:
	<BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
	[_arguments] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];

Author: Caleb Serafin
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detainee"];
private _actionsDetainee = actionIDs _detainee;
if !(isNil "_actionsDetainee" || {count _actionsDetainee == 0}) then {
	{
		if (((_detainee actionParams _x) select 0) isEqualTo "Refresh Admin Action") then {
			_detainee removeAction _x;
		};
	} forEach _actionsDetainee;
};

private _actionsSelf = actionIDs player;
if !(isNil "_actionsSelf" || {count _actionsSelf == 0}) then {
	{
		if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] ""%1""",name _detainee]) then {
			player removeAction _x;
		};
	} forEach _actionsSelf;
};
true;