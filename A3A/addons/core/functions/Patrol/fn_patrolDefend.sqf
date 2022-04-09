/*
    Author: [Hazey]
    Description:
		Group Defend Area

    Arguments:
        <Group> Group you want to defend an area.
        <Number> Minimum Radius from Center to Defend.
        <Number> Maximum Radius from Center to Defend.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group, 20, 50] call A3A_fnc_patrolDefend;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group", 
    ["_minimumRadius", 20], 
    ["_maximumRadius", 100]
];

private _availableUnits = [];
private _leader = leader _group;
private _position = getPos _leader;

[_group, "SAFE", "LIMITED", "COLUMN", "YELLOW", "AUTO"] call A3A_fnc_patrolSetCombatModes;

if (_group getVariable ["PATCOM_Defense_Patrol_Distance", 0] == 0) then {
	_group setVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];
} else {
    _maximumRadius = _group getVariable ["PATCOM_Defense_Patrol_Distance", _maximumRadius];
};

{
    if !((currentCommand _x) in ["ATTACK", "ATTACKFIRE", "FIRE"]) then {
        private _unit = _x;

        if (15 > random 100) then {
            private _nextWaypointPos = [_position, _minimumRadius, _maximumRadius, 10, 0, -1, 0] call A3A_fnc_getSafeSpawnPos;
            _unit doMove _nextWaypointPos;
            _unit setSpeedmode "LIMITED";
            _unit setBehaviour "SAFE";
            _unit setCombatMode "YELLOW";
        } else {
            [_unit, 10] call A3A_fnc_patrolAnimation;
        }
    };
} forEach units _group;