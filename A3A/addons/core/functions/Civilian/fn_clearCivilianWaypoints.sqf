/*
    Author: [Hazey]
    Description:
		Clear Waypoints on Civilian group

    Arguments:
		<Group> Group you want to clear the waypoints for.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group] call A3A_fnc_clearCivilianWaypoints;

    License: MIT License
*/

params ["_group"];

private _waypoints = waypoints _group;
{
    // Waypoint index changes with each deletion, so don't delete _x
    deleteWaypoint [_group, 0];
} forEach _waypoints;

if (units _group isNotEqualTo []) then {
    // Create a self-deleting waypoint at the leader position to halt all planned movement (based on old waypoints)
    private _wp = _group addWaypoint [getPosASL leader _group, -1];
    _wp setWaypointStatements ["true", "deleteWaypoint [group this, currentWaypoint (group this)]"];
};