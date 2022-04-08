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

if (_group getVariable "PATCOM_Defense_Patrol") then {
	_currentOrders = "Defend";
	_group setVariable ["PATCOM_Current_Orders", _currentOrders];
} else {
	// Check if enemy combat is near.
	private _knownEnemies = [_group, 400] call A3A_fnc_patrolClosestKnownEnemy;

	if ((count _knownEnemies >= 1) && (((_knownEnemies # 0)# 0) >= 4)) then {
		if !(_currentOrders == "Attack") then {
			_group setVariable ["PATCOM_Previous_Orders", _currentOrders];
		};
		// Set Current Orders to Attack.
		_currentOrders = "Attack";
		// Set current orders to Attack.
		_group setVariable ["PATCOM_Current_Orders", _currentOrders];
	};
};

ServerDebug_2("PATCOM | Group: %1 | Current Orders: %2", _group, _currentOrders);

if (_currentOrders == "Attack") exitWith {
	// Give group waypoint to nearest Known Enemy.
	[_group, _knownEnemies] call A3A_fnc_patrolAttack;
};

if (_currentOrders == "Hold") exitWith {

};

if (_currentOrders == "Ambush") exitWith {

};

if (_currentOrders == "Chase") exitWith {

};

if (_currentOrders == "Defend") exitWith {
	[_group] call A3A_fnc_patrolDefend;
};

if (_currentOrders == "Patrol_Area") exitWith {
	[_group, 500] call A3A_fnc_patrolArea;
};

if (_currentOrders == "Patrol_Road") exitWith {

};

if (_currentOrders == "Patrol_Water") exitWith {

};