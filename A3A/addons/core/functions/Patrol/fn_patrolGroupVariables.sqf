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

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group <= 0) exitWith {
    diag_log text format["Hazey Debug--- Group is Empty - Group: ", _group];
};

// Skip if Group is already being controlled by the PATCOM or is Civilian Controlled.
if (_group getVariable "PATCOM_Controlled") exitWith {
    diag_log text format["Hazey Debug--- Group is already controlled - Group: ", _group];
};

ServerDebug_1("Setting up PATCOM Variables on group: %1", _group);

if ((side leader _group) == civilian) then {
    // Setup Variable for use later.
    _group setVariable ["PATCOM_Current_Orders", "Patrol"];
    _group setVariable ["PATCOM_Patrol_Type", "Area"];
    _group setVariable ["PATCOM_Patrol_Radius", 100 + random 100];
    _group setVariable ["PATCOM_Patrol_Home_Position", getPos (leader _group)];

    {
        _x forceWalk true;
        _x disableAI "AUTOCOMBAT";
    } forEach units _group;
    _group setVariable ["PATCOM_ForceWalk", true];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];
    diag_log text format["Hazey Debug--- Finished Setting up Civilian Group - Group: ", _group];
} else {
    // Setup Variable for use later.
    _group setVariable ["PATCOM_Known_Enemy_Positions", []];
    _group setVariable ["PATCOM_Current_Orders", ""];
    _group setVariable ["PATCOM_Patrol_Type", ""];
    _group setVariable ["PATCOM_Patrol_Radius", 0];
    _group setVariable ["PATCOM_Patrol_Home_Position", getPos (leader _group)];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];
    diag_log text format["Hazey Debug--- Finished Setting up Combatant Group - Group: ", _group];
};

// Start PATCOM for unit.
[_group] call A3A_fnc_patrolCommander;