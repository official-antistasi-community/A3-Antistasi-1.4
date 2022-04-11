/*
    Author: [Hazey]
    Description:
		Group Defend Area

    Arguments:
        <Group> Group you want to defend an area.
        <Array> Position Center.
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
    "_center", 
    ["_minimumRadius", 20], 
    ["_maximumRadius", 100]
];

private _availableUnits = [];
private _leader = leader _group;

[_group, "SAFE", "LIMITED", "COLUMN", "YELLOW", "AUTO"] call A3A_fnc_patrolSetCombatModes;

if (_group getVariable ["PATCOM_Defense_Patrol_Distance", 0] == 0) then {
	_group setVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];
} else {
    _maximumRadius = _group getVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];
};

private _waypointName = "PATCOM_PATROL_DEFEND";

if ((waypointType [_group, currentWaypoint _group] != "MOVE") || ((waypointName [_group, currentWaypoint _group]) != _waypointName)) then {
    private _nextWaypointPos = [_center, _minimumRadius, _maximumRadius, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
    
    [_group, _nextWaypointPos, "MOVE", _waypointName, -1, 50] call A3A_fnc_patrolCreateWaypoint;
};