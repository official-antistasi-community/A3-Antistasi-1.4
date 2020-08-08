/*
Function:
	A3A_fnc_punishment_addActionForgive

Description:
	Adds action to the Admin to forgive the detainee;
	Adds action to the detainee to refresh the Admin's action.

Scope:
	<GLOBAL> Execute on all players.

Environment:
	<SCHEDULED>

Parameters:
	<STRING> The UID of the detainee that the actions pertains to.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if the detainee is free; nil if it has crashed.

Examples:
	[_UID] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_UID"];
private _filename = "fn_punishment_addActionForgive.sqf";

private _keyPairs = [["offenceTotal",0],["name","NO NAME"]];
([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) params ["_offenceTotal","_name"];
if (_offenceTotal < 1) exitWith {false}; // If offence is less than 1, the UID is not a detained player.

private _actionsSelf = actionIDs player;
private _alreadyHasAction = false; // Avoids having the action added again.
if !(isNil "_actionsSelf" || {count _actionsSelf == 0}) then {
	{
		if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] ""%1""",_name]) then {
			_alreadyHasAction = true;
		};
	} forEach _actionsSelf;
};

if ((!_alreadyHasAction) && ([] call BIS_fnc_admin > 0 || isServer && hasInterface)) then {
	private _addAction_parameters = [
		format["[Forgive FF] ""%1""",_name],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
				[_arguments,"forgive"] remoteExec ["A3A_fnc_punishment_release",2,false];
			};
			player removeAction _actionId;
		},
		_UID,
		0.1
	];
	player addAction _addAction_parameters;
};
true;