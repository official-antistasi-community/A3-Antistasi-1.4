/*
    Author: [Hazey]
    Description:
		Setup Variable on Group

    Arguments:
    	<Group> Group to setup variable on.

    Return Value:
    	<Bool> Script Completed True/False

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

private _scriptComplete = false;

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group <= 0) exitWith {
    ServerDebug_1("PATCOM | Group: %1 is Empty", _group);
};

// Skip if Group is already being controlled by the PATCOM or is Civilian Controlled.
if (_group getVariable "PATCOM_Controlled") exitWith {
    ServerDebug_1("PATCOM | Group: %1 is already controlled", _group);
};

ServerDebug_2("PATCOM | Setting up Variables on group: %1 - side: %2", _group, side (leader _group));

if ((side leader _group) == civilian) then {
    // Setup Variable for use later.
    if (_group getVariable ["PATCOM_Current_Orders", ""] == "") then {
        _group setVariable ["PATCOM_Current_Orders", "Patrol_Area"];
    };

    _group setVariable ["PATCOM_Patrol_Radius", 50 + random 50];
    _group setVariable ["PATCOM_Patrol_Home", getPos (leader _group)];

    {
        _x forceWalk true;
        _x disableAI "AUTOCOMBAT";
    } forEach units _group;
    
    _group setVariable ["PATCOM_ForceWalk", true];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];

    _scriptComplete = true;
} else {

    // Setup Variable for use later.
    _group setVariable ["PATCOM_Known_Enemy", []];
    if (_group getVariable ["PATCOM_Current_Orders", ""] == "") then {
        _group setVariable ["PATCOM_Current_Orders", "Patrol_Area"];
    };

    _group setVariable ["PATCOM_Previous_Orders", ""];
    _group setVariable ["PATCOM_Patrol_Radius", 0];
    _group setVariable ["PATCOM_Patrol_Home", getPos (leader _group)];
    _group setVariable ["PATCOM_Group_State", "CALM"];

    // Set Group to being controlled by PATCOM so we don't init variables again.
    _group setVariable ["PATCOM_Controlled", true];

    {
        private _hitEH = _x addEventHandler ["Hit", {_this call A3A_fnc_patrolUnitHitEH;}];
        private _suppressionEH = _x addEventHandler ["Suppressed", {_this call A3A_fnc_patrolSuppressionEH;}];
        private _KilledEH = _x addEventHandler ["Killed",{_this spawn A3A_fnc_patrolCallForHelp;}];

    } forEach units _group;

    _scriptComplete = true;
};

_scriptComplete