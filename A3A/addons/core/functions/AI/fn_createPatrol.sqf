params [
    ["_group", grpNull, [grpNull, objNull]],
    ["_position", [], [[], objNull, grpNull, locationNull], [2, 3]],
    ["_radius", 100, [0]],
    ["_count", 3, [0]],
    ["_type", "MOVE", [""]],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_onComplete", "", [""]],
    ["_timeout", [0,0,0], [[]], 3],
    ["_compRadius", 25, [0]],
    ["_blackList", "", [""]],
    ["_onRoad", false, [false]]
];

_group = _group call A3A_fnc_getObjectGroup;

// We don't want waypoints being created on every machine
if !(local _group) exitWith {};

_position = [_position, _group] select (_position isEqualTo []);
_position = _position call A3A_fnc_getPosHandler;

// Clear existing waypoints first
[_group] call A3A_fnc_clearWaypoints;
{
    _x enableAI "PATH";
} forEach units _group;

private _possibleWaypointLocations = [];

for "_i" from 1 to _count + 5 do {
    private _randomPosMapNoWater = [];
    if (_onRoad) then {
        _randomPosMapNoWater = [[[_position, _radius]], [_blackList], { isOnRoad _this }] call BIS_fnc_randomPos;
    } else { 
        _randomPosMapNoWater = [[[_position, _radius]], [_blackList], {}] call BIS_fnc_randomPos;
    };
   
    if ((count _randomPosMapNoWater) == 3) then {
        _possibleWaypointLocations pushBack _randomPosMapNoWater;
    };
};

if ((count _possibleWaypointLocations) < _count) exitWith {
    diag_log text format["Hazey Debug--- Not enough waypoints to generate correctly"];
};

for "_i" from 1 to _count do {
    private _randomPosMapNoWater = selectRandom _possibleWaypointLocations;
    [_group, _randomPosMapNoWater, -1, _type, _behaviour, _combat, _speed, _formation, _onComplete, _timeout, _compRadius] call A3A_fnc_createWaypoint;
};

// Close the patrol loop
[_group, _position, -1, "CYCLE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout, _compRadius] call A3A_fnc_createWaypoint;