params [
    "_civUnit",
    ["_group", grpNull, [grpNull, objNull]],
    ["_position", [], [[], objNull, grpNull, locationNull], [2, 3]],
    ["_radius", 100, [0]],
    ["_count", 3, [0]],
    ["_onComplete", "", [""]],
    ["_timeout", [0,0,0], [[]], 3]
];

// We don't want waypoints being created on every machine
if !(local _group) exitWith {};

// Clear existing waypoints first
[_group] call A3A_fnc_clearCivilianWaypoints;

{
    _x enableAI "PATH";
	_x forceWalk true;
} forEach units _group;


private _positionX = [];
for "_i" from 1 to _count do {
	_positionX = [_position, 10, _radius, 0, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
    [_group, _positionX, "MOVE", _onComplete, _timeout] call A3A_fnc_createCivilianWaypoint;
};

private _civHousePosition = _civUnit getVariable["homePosition", _positionX];
// Close the patrol loop
[_group, _civHousePosition, "CYCLE", _onComplete, _timeout] call A3A_fnc_createCivilianWaypoint;