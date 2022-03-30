/*
    Author: [Hazey]
    Description:
		Patrol Loop, Add's units to Array to be controlled.

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolLoop;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

A3A_Patrol_Loop = [] spawn {
	while {true} do {
		{
			private _patcomControlled = _x getVariable ["PATCOM_Controlled", false];
			if (!_patcomControlled) then {
				[_x] call A3A_fnc_patrolGroupVariables;
			};
		} forEach A3A_Patrol_Controlled_AI;
        
		sleep 5;
	};
};