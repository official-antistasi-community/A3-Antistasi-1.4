/*
    Author: [Hazey]
    Description:
		Set bulky combat modes.

    Arguments:
    <Group> Group to handle orders on.
		<String> Behaviour to set on group
		<String> Speed Mode to set on group
		<String> Formation to give group
		<String> Combat Mode to set on group
    <String> Set the units stance "AUTO" default.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolSetCombatModes;

    License: MIT License
*/

params ["_group", ["_behaviour", "SAFE"], ["_speedMode", "NORMAL"], ["_formation", "COLUMN"], ["_combatMode", "GREEN"], ["_stance", "AUTO"]];

if ((behaviour leader _group != _behaviour) || (speedMode _group != _speedMode) || (formation _group != _formation) || (combatMode _group != _combatMode)) then {
    _group setVariable ["PATCOM_Combat_Modes_Set", false];
};

// Avoid Changing the units combat modes unless we set the variable to false again to change stance.
if (_group getVariable "PATCOM_Combat_Modes_Set") exitWith {};

_group setBehaviour _behaviour;
_group setSpeedMode _speedMode;
_group setFormation _formation;
_group setCombatMode _combatMode;

// You can't set stance by group, so we have to run through each unit.
if (_stance != "AUTO") then {
    {
        _x setUnitPos _stance;
    } forEach units _group;
};

_group setVariable ["PATCOM_Combat_Modes_Set", true];