/*
    Author: [Hazey]

    Description:
		Unit will call for group when killed.

    Arguments:


    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		

    License: MIT License

	TODO: Write the damn thing

	Instead of doing it this way. I should add the units into the groups already known enemys array. 
	Then rewrite the commander to handle the known enemys array which will trigger the attack
	Additionally, I need to rewrite attack so that the known enemies param isn't hard coded.
*/

params ["_unit","_killer"];

// This event handler should never be attached to player.
if (isPlayer _unit) exitWith {};

private _group = (group _unit);

if (_group getVariable ["PATCOM_Radio_Help", false]) exitWith {};

// Set group radio for help flag to true so we don't keep asking other groups for help.
_group setVariable ["PATCOM_Radio_Help", true];

// After five minutes we reset the group to allow them to make another radio call
[_group] spawn {
	param ["_group"];
	sleep 300;
	_group setVariable ["PATCOM_Radio_Help", false];
};

private _enemyPosition = (getpos _killer);
private _checkStatus = assignedItems _unit;

// Check to make sure enemy unit has a radio and items is populated.
if (isNil "_checkStatus" || {!("ItemRadio" in _checkStatus)}) exitWith {};

{
	if (_x == _group) exitWith {};
	private _squadLeader = leader _x;
	private _squadLeaderPos = (getPos _squadLeader);

	if (_squadLeaderPos distance (getPos _unit) < 600) then {
		_x reveal [_killer, 1.5]
	};
} forEach A3A_Patrol_Controlled_AI;