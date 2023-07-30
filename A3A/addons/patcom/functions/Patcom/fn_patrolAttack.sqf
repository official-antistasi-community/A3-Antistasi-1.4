/*
    Author: [Hazey]
    Description:
        Group Patrol Attack

    Arguments:
        <Group> Group you want to run an attack.
        <Array> List of KnownEnemies.
        <Number> Minimum Radius from Center to Patrol.
        <Number> Maximum Radius from Center to Patrol.
        <Number> Distance from nearest object to create waypoint.
        <Number> 0 - No Water, 1 - land & water, 2 - water only
        <Number> Max Gradient to create waypoint on. Used to avoid super hilly maps.
        <Number> Should be on the shore or not.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_group, _knownEnemies] call A3A_fnc_patrolArea;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
    "_group", 
    "_knownEnemies",
    ["_minimumRadius", 25], 
    ["_maximumRadius", 50], 
    ["_objectDistance", 2], 
    ["_waterMode", 0], 
    ["_maxGradient", -1], 
    ["_shoreMode", 0]
];

if (count _knownEnemies < 1) exitWith {
    ServerDebug_1("PATCOM | patrolAttack | Previous orders on Group: %1", _group);
    private _previousOrders = _group getVariable "PATCOM_Previous_Orders";
    _group setVariable ["PATCOM_Current_Orders", _previousOrders];
    _group setVariable ["PATCOM_Group_State", "CALM"];
};

[_group, "COMBAT", "FULL", "COLUMN", "RED", "AUTO"] call A3A_fnc_patrolSetCombatModes;

private _attackType = selectRandomWeighted ["Direct", 0.2, "FlankQuick", 0.4, "FlankLong", 0.6];
private _attackWaypointNames = ["PATROL_ATTACK_DIRECT", "PATROL_ATTACK_FLANKQUICK", "PATROL_ATTACK_FLANKLONG"];

// If Enabled unit in combat, activly check for statics near their positions to man.
if (PATCOM_AI_STATICS) then {
    [_group] call A3A_fnc_patrolArmStatics;
};

if (_attackType == "Direct") then {
    // Set Waypoint Name
    private _waypointName = "PATROL_ATTACK_DIRECT";

    if (!((waypointName [_group, currentWaypoint _group]) in _attackWaypointNames)) then {
        if (PATCOM_DEBUG) then {
            [leader _group, format["ATTACK-%1", _attackType], 30, "White"] call A3A_fnc_debugText3D;
        };

        // Select random group in the array to attack.
        private _targetGroup = selectRandom _knownEnemies;

        // Instead of taking the Perceived Position and creating a waypoint from there. We opt to get our own waypoint so we can add some variation.
        // Center Position | Min Radius | Max Radius | Min Object Distance | Water Mode | Max Gradient | ShoreMode
        private _nextWaypointPos = [getPosATL (leader _targetGroup), 0, 25, _objectDistance, _waterMode, _maxGradient, _shoreMode] call A3A_fnc_getSafePos;
        
        [_group, _nextWaypointPos, "SAD", _waypointName, -1, 50] call A3A_fnc_patrolCreateWaypoint;
    };
};

if (_attackType == "FlankQuick") then {
    // Set Waypoint Name
    private _waypointName = "PATROL_ATTACK_FLANKQUICK";

    if (!((waypointName [_group, currentWaypoint _group]) in _attackWaypointNames)) then {
        if (PATCOM_DEBUG) then {
            [leader _group, format["ATTACK-%1", _attackType], 30, "White"] call A3A_fnc_debugText3D;
        };

        // Select random group in the array to attack.
        private _targetGroup = selectRandom _knownEnemies;

        // Define final enemy position to attack.
        private _enemyPosition = getPosATL (leader _targetGroup);

        private _flankPosition = [_enemyPosition, 250] call A3A_fnc_patrolFlankPos;

        private _flankWaypoint = _group addwaypoint [_flankPosition, 0];
        _flankWaypoint setWaypointName _waypointName;	

        [_group, (_flankWaypoint select 1)] setWaypointCompletionRadius 50;

        _group setCurrentWaypoint [_group, (_flankWaypoint select 1)];

        private _finalWaypoint = _group addwaypoint [_enemyPosition, 0];
        _finalWaypoint setWaypointName _waypointName;

        [_group, (_finalWaypoint select 1)] setWaypointCompletionRadius 50;
    };
};

if (_attackType == "FlankLong") then {
    // Set Waypoint Name
    private _waypointName = "PATROL_ATTACK_FLANKLONG";

    if (!((waypointName [_group, currentWaypoint _group]) in _attackWaypointNames)) then {
        if (PATCOM_DEBUG) then {
            [leader _group, format["ATTACK-%1", _attackType], 30, "White"] call A3A_fnc_debugText3D;
        };

        // Select random group in the array to attack.
        private _targetGroup = selectRandom _knownEnemies;

        // Define final enemy position to attack.
        private _enemyPosition = getPosATL (leader _targetGroup);

        private _flankPositionNear = [getPosATL (leader _group), 250] call A3A_fnc_patrolFlankPos;

        private _flankPositionFar = [_enemyPosition, 250] call A3A_fnc_patrolFlankPos;

        private _flankWaypointNear = _group addwaypoint [_flankPositionNear, 0];
        _flankWaypointNear setWaypointName _waypointName;	

        [_group, (_flankWaypointNear select 1)] setWaypointCompletionRadius 50;

        _group setCurrentWaypoint [_group, (_flankWaypointNear select 1)];

        private _flankWaypointFar = _group addwaypoint [_flankPositionFar, 0];
        _flankWaypointFar setWaypointName _waypointName;	

        [_group, (_flankWaypointFar select 1)] setWaypointCompletionRadius 50;

        private _finalWaypoint = _group addwaypoint [_enemyPosition, 0];
        _finalWaypoint setWaypointName _waypointName;

        [_group, (_finalWaypoint select 1)] setWaypointCompletionRadius 50;
    };
};