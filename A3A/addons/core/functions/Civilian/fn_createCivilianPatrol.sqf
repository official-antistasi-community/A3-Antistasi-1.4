/*
    Author: [Hazey]
    Description:
		Add Patrol waypoints to Civilians

    Arguments:
    	<Object> Civilian Unit to get home point from.
        <Group> Civilian Group to add waypoints to.
        <Array> Center position to find safe spot for marker creation.
        <Number> How far you want to search for a safe spawn location.
        <Number> How many waypoints you want created.
        <Code> Code you want executed at the end of a waypoint.
        <Array> How long you want the unit to stay at a given waypoint before proceeding.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_unit, _group, _pos, 100, 4, "", [10, 20, 30]] call A3A_fnc_createCivilianPatrol;

    License: MIT License
*/

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