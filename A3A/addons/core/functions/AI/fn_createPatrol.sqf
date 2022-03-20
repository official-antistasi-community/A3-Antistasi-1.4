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
_this set [2, -1];
if (count _this > 3) then {
    _this deleteAt 3;
};

for "_i" from 1 to _count do {
    _randomPosMapNoWater = [[[_position, _radius]], ["water"], { isOnRoad _this }] call BIS_fnc_randomPos;

    _this set [1, _randomPosMapNoWater];
    _this call A3A_fnc_createWaypoint;
};

// Close the patrol loop
_this set [1, _position];
_this set [2, _radius];
_this set [3, "CYCLE"];
_this call A3A_fnc_createWaypoint;