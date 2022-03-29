/*
    Author: [Hazey]
    Description:
		Setup Variable on Group

    Arguments:
    	<Group> Group to setup variable on.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolGroupVariables;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

// Skip if Group is already being controlled by the PATCOM
if (_group getVariable ["PATCOM_Controlled", true]) exitWith {};

ServerDebug_1("Setting up PATCOM Variables on group: %1", _group);

// Setup Variable for use later.
_group setVariable ["PATCOM_Known_Enemy_Positions", []];
_group setVariable ["PATCOM_Current_Orders", ""];
_group setVariable ["PATCOM_Patrol_Type", ""];
_group setVariable ["PATCOM_Patrol_Radius", 0];
_group setVariable ["PATCOM_Patrol_Home_Position", getPos (leader _group)];

// We want AI to be able to have enough energy to run from Point to Point.
// We can adjust this later.
{
	_X enableFatigue false;
} forEach units _group;

// Set Group to being controlled by PATCOM so we don't init variables again.
_group setVariable ["PATCOM_Controlled", true];

// Start PATCOM for unit.
[_group] call A3A_fnc_patrolCommander;