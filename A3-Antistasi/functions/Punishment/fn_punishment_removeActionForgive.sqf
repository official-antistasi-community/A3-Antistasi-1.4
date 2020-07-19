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
	<STRING> The UID of the detainee that the actions pertains to.
	<BOOLEAN> [OPTIONAL=false] Adds actions back after being removed.

Returns:
	<BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
	[_UID] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
	"_UID",
	["_reAdd",false]
];

private _detainee = [_UID] call BIS_fnc_getUnitByUid;
if (isPlayer _detainee) then {
    private _actionsDetainee = actionIDs _detainee;
    if !(isNil "_actionsDetainee" || {count _actionsDetainee isEqualTo 0}) then {
        {
            if (((_detainee actionParams _x) select 0) isEqualTo "Refresh Admin Action") then {
                _detainee removeAction _x;
            };
        } forEach _actionsDetainee;
    };
};

private _actionsSelf = actionIDs player;
if !(isNil "_actionsSelf" || {count _actionsSelf == 0}) then {
	private _keyPairs = [ ["name","NO NAME"] ];
	private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
	_data_instigator params ["_name"];

	{
		if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] ""%1""",_name]) then {
			player removeAction _x;
		};
	} forEach _actionsSelf;
};

if (_reAdd) then {
	[_UID] call A3A_fnc_punishment_addActionForgive;
};
true;