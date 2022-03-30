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

A3A_PATCOM_Commander = [_group] spawn {
	while {true} do {
		params ["_group"];

		// We exit here if the group is empty. It's a waste of performance to handle empty groups.
		if (count units _group <= 0) exitWith {};

		// Get current orders if set. If not set, we handle first orders below.
		private _currentOrders = _group getVariable ["PATCOM_Current_Orders", ""];
		private _patrolType = _group getVariable ["PATCOM_Patrol_Type", ""];

		if (_currentOrders == "") then {
			_currentOrders = "Patrol";
			_group setVariable ["PATCOM_Current_Orders", _currentOrders];
			
			if (_currentOrders == "Patrol") then {
				_patrolType = "Area";
				_group setVariable ["PATCOM_Patrol_Type", _patrolType];
			};
		};

		ServerDebug_2("PATCOM | Group: %1 | Current Orders: %2", _group, _currentOrders);

		if (_currentOrders == "Attack") then {

		};

		if (_currentOrders == "Hold") then {

		};

		if (_currentOrders == "Ambush") then {

		};

		if (_currentOrders == "Chase") then {

		};

		if (_currentOrders == "Defend") then {

		};

		if (_currentOrders == "Patrol") then {
			if ((_currentOrders == "Patrol") && (_patrolType == "Area")) then {
				if ((side leader _group) == civilian) then {
					[_group, 100, 5, 100] call A3A_fnc_patrolArea;
				} else {
					[_group, 500] call A3A_fnc_patrolArea;
				};
			};

			if ((_currentOrders == "Patrol") && (_patrolType == "Road")) then {

			};

			if ((_currentOrders == "Patrol") && (_patrolType == "Water")) then {

			};
		};

		sleep 30;
	};
};