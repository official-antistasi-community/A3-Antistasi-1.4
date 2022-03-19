params [
    ["_group", grpNull, [grpNull, objNull]],
    ["_position", [], [[], objNull, grpNull, locationNull], [2, 3]],
    ["_radius", 100, [0]],
    ["_count", 3, [0]]
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

// Can pass parameters straight through to createWaypoint
_this =+ _this;
_this set [2,-1];
if (count _this > 3) then {
    _this deleteAt 3;
};

// Using angles create better patrol patterns
// Also fixes weird editor bug where all WP are on same position
private _step = 360 / _count;
private _offset = random _step;
for "_i" from 1 to _count do {
    // Gaussian distribution avoids all waypoints ending up in the center
    private _rad = _radius * random [0.1, 0.75, 1];

    // Alternate sides of circle & modulate offset
    private _theta = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i;

    _this set [1, _position getPos [_rad, _theta]];
    _this call A3A_fnc_createWaypoint;
};

// Close the patrol loop
_this set [1, _position];
_this set [2, _radius];
_this set [3, "CYCLE"];
_this call A3A_fnc_createWaypoint;