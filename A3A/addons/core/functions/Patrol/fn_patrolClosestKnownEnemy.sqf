/*
    Author: [Hazey]
    Description:
		Closest Known Enemies to the Group

    Arguments:
        <Group> Group to check known enemies for.
		    <Number> Distance to check for Known Enemies

    Return Value:
    	<Array> List of known targets.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_group, 300] call A3A_fnc_patrolClosestKnownEnemy;

    License: MIT License
*/

params ["_group", "_targetDistance"];

private _leader = leader _group;

private _NearTargets = _leader nearEntities ["Man", _targetDistance] select {[side _leader, side _x] call A3A_fnc_patrolSideIsEnemy} apply {[_x distance2D _leader, _x]};

_NearTargets sort true;

_NearTargets;