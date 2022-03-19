
params [
    ["_group", objNull, [objNull,grpNull]],
    ["_area", "", ["",objNull, locationNull,[]], 5],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_onComplete", "", [""]],
    ["_timeout", [0, 0, 0], [[]], 3]
];

_group = _group call A3A_fnc_getObjectGroup;

if !(local _group) exitWith {}; // Don't create waypoints on each machine

// Collect arguments for use in recursive calls (not using `select` to include default values)
private _args = [_area, _behaviour, _combat, _speed, _formation, _onComplete, _timeout];

// Retrieve cached arguments in case of recursive call
if (isNil {param [1]}) then {
    _args = _group getVariable ["searchNearbyArea", _args];
} else {
    // Clear existing waypoints and cache arguments upon first call
    [_group] call A3A_fnc_clearWaypoints;
    {
        _x enableAI "PATH";
    } forEach units _group;

    _group setVariable ["searchNearbyArea", _args];
};
_args params ["_area", "_behaviour", "_combat", "_speed", "_formation", "_onComplete", "_timeout"];

// Select a random position in the area
private _pos = [_area] call A3A_fnc_randPosArea;

// Exit if any bad input was used (has to run after all the above code)
if ((_pos isEqualTo []) || {_area isEqualTo ""} || {isNull _group}) exitWith {};

// Prepare recursive function call statement
private _statements = ["[this] call A3A_fnc_searchNearbyArea"];

// Prepare building search statement
private _building = nearestBuilding _pos;
if ((_building distanceSqr _pos) < 400) then {
    // Clear waypoint to prevent getting stuck in a search loop
    _statements append [
        "deleteWaypoint [group this, currentWaypoint (group this)]",
        "[group this] call A3A_fnc_searchNearbyBuilding"
    ];
};

// Inject the statement in this order to ensure valid syntax
_statements pushBack _onComplete;
_onComplete = _statements joinString ";";

// Add the waypoint
[
    _group,
    _pos,
    -1,
    "MOVE",
    _behaviour,
    _combat,
    _speed,
    _formation,
    _onComplete,
    _timeout,
    5
] call A3A_fnc_createWaypoint;