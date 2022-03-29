/*
    Author: [Hazey]
    Description:
		

    Arguments:
    	

    Return Value:
    	

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		

    License: MIT License
*/

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