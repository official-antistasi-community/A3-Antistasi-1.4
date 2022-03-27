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