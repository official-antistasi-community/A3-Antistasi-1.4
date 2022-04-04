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

PATCOM_Civilian_Commander = [_group] spawn {
	while {true} do {
		params ["_group"];

		// We exit here if the group is empty. It's a waste of performance to handle empty groups.
		if (count units _group <= 0) exitWith {};

		if ((side leader _group) == civilian) then {
			[_group, 100, 5, 100] call A3A_fnc_patrolArea;
		};
		
		sleep 30;
	};
};