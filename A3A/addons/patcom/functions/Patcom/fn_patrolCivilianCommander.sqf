/*
    Author: [Hazey]

    Description:
		Civilian Patrol Subsystem

    Arguments:
    	<Group> Group to handle orders on.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolCivilianCommander;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

private _patrolParams = _group getVariable "PATCOM_Patrol_Params";

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group <= 0) exitWith {};

if ((side leader _group) == civilian) then {
	[_group, _patrolParams#1, _patrolParams#2, _patrolParams#3] call A3A_fnc_patrolArea;
};