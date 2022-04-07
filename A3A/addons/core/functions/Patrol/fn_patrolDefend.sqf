/*
    Author: [Hazey]
    Description:
		Group Defend Area

    Arguments:
        <Group> Group you want to defend an area.
        <Number> Minimum Radius from Center to Defend.
        <Number> Maximum Radius from Center to Defend.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group, 20, 50] call A3A_fnc_patrolDefend;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group", 
    ["_minimumRadius", 20], 
    ["_maximumRadius", 100]
];

if (_group getVariable "PATCOM_Defense_Patrol_Active" == true) exitWith {};

private _defenseWeapons = [];
private _leader = leader _group;
private _position = getPos _leader;
private _units = (units _group) - [_leader];

[_group, "SAFE", "LIMITED", "COLUMN", "YELLOW", "AUTO"] call A3A_fnc_patrolSetCombatModes;

if (_group getVariable ["PATCOM_Defense_Patrol_Distance", 0] == 0) then {
	_group setVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];
};

_maximumRadius = _group getVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];

// Let the other units patrol until dead or deleted
// I know this seems very different from the way other waypoints are handled. This is to give more ambience.
[_position, _units, _group, _minimumRadius, _maximumRadius] spawn {
    params ["_position", "_units", "_group", "_minimumRadius", "_maximumRadius"];

	// Add the leader back into the group.
	_units = (units _group) + [leader _group];

	// Set this variable so we don't run this spawn again.
    _group setVariable ["PATCOM_Defense_Patrol_Active", true];

	// Only do while units are alive.
    while {({alive _x} count _units > 0)} do {
		{
            if ((random 1 < 0.50) && !((currentCommand _x) in ["ATTACK", "ATTACKFIRE", "FIRE"])) then {
    			private _nextWaypointPos = [_position, _minimumRadius, _maximumRadius, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
                private _unit = _x;
		        _unit domove _nextWaypointPos;
				_unit setSpeedmode "LIMITED";
				_unit setBehaviour "SAFE";
				_unit setCombatMode "YELLOW";
        	};
		} forEach _units;
	    sleep (30 + random 30);
	};
};