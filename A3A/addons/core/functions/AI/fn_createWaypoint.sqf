params [
    "_group",
    "_position",
    ["_radius", -1, [0]],
    ["_type", "MOVE", [""]],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_onComplete", "", [""]],
    ["_timeout", [0,0,0], [[]], 3],
    ["_compRadius", 0, [0]]
];

// Sanitize Group
_group = _group call A3A_fnc_getObjectGroup;

// Sanitize Position Call
_position = _position call A3A_fnc_getPosHandler;

// addWaypoint expects ASL when a negative radius is provided for exact placement
// otherwise waypoints will be placed under the ground
if (_radius < 0) then {
    _position = AGLtoASL _position;
};

private _waypoint = _group addWaypoint [_position, _radius];

_waypoint setWaypointType _type;
_waypoint setWaypointBehaviour _behaviour;
_waypoint setWaypointCombatMode _combat;
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointFormation _formation;
_waypoint setWaypointStatements ["true", _onComplete];
_waypoint setWaypointTimeout _timeout;
_waypoint setWaypointCompletionRadius _compRadius;

_waypoint