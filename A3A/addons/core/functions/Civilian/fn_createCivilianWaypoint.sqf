/*
    Author: [Hazey]
    Description:
		Add Waypoint to Civilian Group

    Arguments:
        <Group> Civilian Group to add waypoints to.
        <Array> Position where waypoint will be created
        <String> What type of waypoint do you want created? "MOVE" "SENTRY" "CYCLE"
        <Code> Code you want executed at the end of a waypoint.
        <Array> How long you want the unit to stay at a given waypoint before proceeding.

    Return Value:
    	<Array> Waypoint [Group, Index]

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group, _pos, "MOVE", "", [0,2,4]] call A3A_fnc_createCivilianWaypoint;

    License: MIT License
*/

params [
    "_group",
    "_position",
	"_type",
    ["_onComplete", "", [""]],
    ["_timeout", [0,0,0], [[]], 3]
];

// Sanitize Group
private _waypoint = _group addWaypoint [_position, 0];

_waypoint setWaypointType _type;
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointStatements ["true", _onComplete];
_waypoint setWaypointTimeout _timeout;
_waypoint setWaypointCompletionRadius 25;

_waypoint