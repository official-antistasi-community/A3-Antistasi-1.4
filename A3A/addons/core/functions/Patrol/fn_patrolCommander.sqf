/*
    Author: [Hazey]
    Description:
		Main Patrol Logic

    Arguments:
    	<Group> Group to handle orders on.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolCommander;

    License: MIT License

	Notes:
		https://community.bistudio.com/wiki/Code_Optimisation

		Reading the above link, its better to use an if switch rather than a switch itself.
		An if switch runs at 0.0032ms and switch itself runs at 0.0047ms. These values will scale as the switch gets bigger.
		This is way faster than doing a standard FSM and I have opted to use the if switch.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

// We exit here if the group is empty. It's a waste of performance to handle empty groups.
if (count units _group <= 0) exitWith {
	ServerDebug_1("PATCOM | Group Eliminated, Exiting PATCOM Group: %1", _group);
};

// Get current orders if set. If not set, we handle first orders below.
private _currentOrders = _group getVariable "PATCOM_Current_Orders";
private _knownEnemies = [_group, PATCOM_VISUAL_RANGE] call A3A_fnc_patrolClosestKnownEnemy;

if (_group getVariable ["PATCOM_Defense_Patrol", false]) then {
	_currentOrders = "Defend";
	_group setVariable ["PATCOM_Current_Orders", _currentOrders];
};

// Handle Patrol Formations, Exits if already set and time not expired.
[leader _group] call A3A_fnc_patrolHandleFormation;

private _enemyArray = [];
// Check if enemy combat is near.
if (count _knownEnemies > 0) then {
	{
		if (_x#0 < PATCOM_VISUAL_RANGE) then {
			_enemyArray pushback (_x#1);
		};
    } foreach _knownEnemies;

	if (count _enemyArray > 0) then {
		if !(_currentOrders == "Attack") then {
			_group setVariable ["PATCOM_Previous_Orders", _currentOrders];

			// Set Current Orders to Attack.
			_currentOrders = "Attack";
			// Set current orders to Attack.
			_group setVariable ["PATCOM_Current_Orders", _currentOrders];
			_group setVariable ["PATCOM_Group_State", "COMBAT"];
		};
	};
};

ServerDebug_3("PATCOM | Group: %1 | Current Orders: %2 | Group State: %3", _group, _currentOrders, _group getVariable "PATCOM_Group_State");

if (_currentOrders == "Attack") exitWith {
	// Give group waypoint to nearest Known Enemy.
	[_group, _enemyArray] call A3A_fnc_patrolAttack;
};

if (_currentOrders == "Hold") exitWith {

};

if (_currentOrders == "Ambush") exitWith {

};

if (_currentOrders == "Chase") exitWith {

};

if (_currentOrders == "Defend") exitWith {
	// Defend will always use center
	private _center = _group getVariable "PATCOM_Patrol_Home";
	[_group, _center] call A3A_fnc_patrolDefend;
};

if (_currentOrders == "Patrol_Area") exitWith {
	[_group, 300] call A3A_fnc_patrolArea;
};

if (_currentOrders == "Patrol_Road") exitWith {

};

if (_currentOrders == "Patrol_Water") exitWith {

};