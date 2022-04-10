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

private _nearTargets = (leader _group) neartargets _targetDistance; 
private _unitSide = side _group;

private _knownTargets = [];
{
	if ([_unitSide, (_x # 2)] call A3A_fnc_patrolSideIsEnemy && {!((_x # 1) isKindOf "Air")}) then {
		_knownTargets pushback [(_x # 5), (_x # 4), (_x # 0)];
	};
} foreach _nearTargets;


if (count _knownTargets > 0) then {
	_knownTargets sort false;
};

_knownTargets