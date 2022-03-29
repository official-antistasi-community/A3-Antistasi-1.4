/*
    Author: [Hazey]
    Description:
		

    Arguments:
    	

    Return Value:
    	

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		

    License: MIT License
*/
params ["_group", ["_minimumRadius", 50], ["_patrolRadius", 0]];

// Get home position of the unit.
private _groupHomePosition = _group getVariable "PATCOM_Patrol_Home_Position";

// Add a default patrol radius if we don't have one already specified.
if (_group getVariable ["PATCOM_Patrol_Radius", 0] == 0) then {
	_group setVariable ["PATCOM_Patrol_Radius", 100 + random 150];
};

// If no patrol radius is specified in the param, use default patrol radius for the unit.
if (_patrolRadius == 0) then {
	_patrolRadius = _group getVariable "PATCOM_Patrol_Radius";
};

// Check for current waypoints and make sure they are type MOVE for patrol
if (currentWaypoint _group == count waypoints _group || waypointType [_group, currentWaypoint _group] != "MOVE") then {
	private _nextWaypointPos = [_groupHomePosition, _minimumRadius, _patrolRadius, 0, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
	[_group, "MOVE", "PATCOM_PATROL_AREA", _nextWaypointPos, -1, 50] call A3A_fnc_patrolCreateWaypoint;
};