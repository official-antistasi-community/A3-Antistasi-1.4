/*
Function:
	A3A_fnc_punishment_addActionForgive

Description:
	Adds action to the Admin to forgive the detainee;
	Adds action to the detainee to refresh the Admin's action.

Scope:
	<GLOBAL> Execute on all players.

Environment:
	<ANY>

Parameters:
	<STRING> The UID of the detainee that the actions pertains to.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if the detainee is free; nil if it has crashed.

Examples:
	[_UID] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];

Author: Caleb Serafin
Date Updated: 13 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_UID"];
private _filename = "fn_punishment_addActionForgive.sqf";

private _keyPairs = [["offenceTotal",0],["name","NO NAME"]];
([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_offenceTotal","_name"];
if (_offenceTotal < 1) exitWith {false};

private _detainee = [_UID] call BIS_fnc_getUnitByUid;
if (player == _detainee) then {
	private _addAction_parameters = [
		"Refresh Admin Action",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_arguments] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
			uiSleep 5;
			[_arguments] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];
		},
		_UID,
		7
	];
	_detainee addAction _addAction_parameters;
};

if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
	private _addAction_parameters = [
		format["[Forgive FF] ""%1""",_name],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			if ([] call BIS_fnc_admin == 0 && !isServer) exitWith {
				player removeAction _actionId;
			};
			[_arguments,"forgive"] remoteExec ["A3A_fnc_punishment_release",2,false];
		},
		_UID,
		0.1
	];
	player addAction _addAction_parameters;
};
true;