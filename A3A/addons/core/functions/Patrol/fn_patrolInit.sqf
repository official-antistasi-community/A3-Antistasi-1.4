/*
    Author: [Hazey]
    Description:
		PATCOM Init, starts the Patrol Commander Logic

    Arguments:
    	N/A

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[] call A3A_fnc_patrolInit;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

A3A_Patrol_Controlled_AI = [];

Info("Starting A3A AI Patrol Loop");

[] call A3A_fnc_patrolLoop;