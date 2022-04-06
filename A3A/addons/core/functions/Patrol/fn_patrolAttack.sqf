/*
    Author: [Hazey]
    Description:
		Group Patrol Attack

    Arguments:
        <Group> Group you want to run a Patrol Area.
        <Bool> Should group search buildings?
        <Number> Max Distance the unit should venture before returning home.
        <Number> Minimum Radius from Center to Patrol.
        <Number> Maximum Radius from Center to Patrol.
        <Number> Distance from nearest object to create waypoint.
        <Number> 0 - No Water, 1 - land & water, 2 - water only
        <Number> Max Gradient to create waypoint on. Used to avoid super hilly maps.
        <Number> Should be on the shore or not.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group] call A3A_fnc_patrolArea;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group", 
    "_knownEnemies",
    ["_minimumRadius", 50], 
    ["_maximumRadius", 150], 
    ["_objectDistance", 10], 
    ["_waterMode", 0], 
    ["_maxGradient", -1], 
    ["_shoreMode", 0]
];

if (count _knownEnemies <= 1) exitWith {
    ServerDebug_1("PATCOM | patrolAttack | Previous orders on Group: %1", _group);
	private _previousOrders = _group getVariable "PATCOM_Previous_Orders";
	_group setVariable ["PATCOM_Current_Orders", _previousOrders];
};

[_group, "AWARE", "FULL", "COLUMN", "RED", "AUTO"] call A3A_fnc_patrolSetCombatModes;

// First group in array will always be closest.
private _closestEnemy = (_knownEnemies # 0);
// We get the closest enemy group.
private _enemyGroup = (_closestEnemy # 1);
// We get how accurate their position is.
private _positionAccuracy = (_closestEnemy # 0);
// We get an perceived position.
private _perceivedPosition = (_closestEnemy # 2);
// Set Waypoint Name
private _waypointName = "PATCOM_PATROL_ATTACK";

if ((waypointType [_group, currentWaypoint _group] != "MOVE") || ((waypointName [_group, 0]) != _waypointName)) then {
    // Instead of taking the Perceived Position and creating a waypoint from there. We opt to get our own waypoint so we can add some variation.
    // Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode
    private _nextWaypointPos = [_perceivedPosition, _minimumRadius, _maximumRadius, _objectDistance, _waterMode, _maxGradient, _shoreMode] call A3A_fnc_getSafeSpawnPos;
    
    [_group, "MOVE", _waypointName, _perceivedPosition, -1, 50] call A3A_fnc_patrolCreateWaypoint;
};