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
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group"];

PATCOM_Commander = [_group] spawn {
	while {true} do {
		params ["_group"];

		// We exit here if the group is empty. It's a waste of performance to handle empty groups.
		if (count units _group <= 0) exitWith {
			ServerDebug_1("PATCOM | Group Eliminated, Exiting PATCOM Group: %1", _group);
		};

		// Get current orders if set. If not set, we handle first orders below.
		private _currentOrders = _group getVariable "PATCOM_Current_Orders";
		private _patrolType = "";

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

		ServerDebug_4("PATCOM | Group: %1 | Current Orders: %2 | Known Enemies: %3 | Percentage: %4", _group, _currentOrders, (count _knownEnemies), ((_knownEnemies # 0)# 0));

		if (_currentOrders == "Attack") then {
			// Give group waypoint to nearest Known Enemy.
			[_group, _knownEnemies] call A3A_fnc_patrolAttack;
		};

		if (_currentOrders == "Hold") then {

		};

		if (_currentOrders == "Ambush") then {

		};

		if (_currentOrders == "Chase") then {

		};

		if (_currentOrders == "Defend") then {

		};

		if ((_currentOrders == "Patrol") || (_currentOrders == "")) then {
			_patrolType = _group getVariable ["PATCOM_Patrol_Type", ""];

			// Default to Patrol. We should only hit this once, but its here if we need to fall back.
			if (_currentOrders == "") then {
				_currentOrders = "Patrol";
				_group setVariable ["PATCOM_Current_Orders", _currentOrders];
			};

			if (_patrolType == "Area") then {
				[_group, 500] call A3A_fnc_patrolArea;
			};

			if (_patrolType == "Road") then {

			};

			if (_patrolType == "Water") then {

			};

			// Default to Patrol Type. We should only hit this once, but its here if we need to fall back.
			if (_patrolType == "") then {
				_patrolType = "Area";
				[_group, 500] call A3A_fnc_patrolArea;
			};
		};

		sleep 10;
	};
};