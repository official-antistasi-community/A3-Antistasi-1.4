params ["_unit"];

if (_unit isEqualType []) exitWith {
	private _closestObject = [0,0,0];
	_closestObject;
};

private _unitSide = (side _unit);

private _knownEnemies = [];
{
	private _targetSide = side _x;
	if ([_unitSide, _targetSide] call A3A_fnc_patrolSideIsEnemy && {!(vehicle _X isKindOf "Air")}) then {_a1 pushback _x;};
} forEach allUnits;

private _closestObject = [_knownEnemies, _unit, true] call A3A_fnc_patrolClosestObject;

if (isNil _closestObject) then {
	_closestObject = [0,0,0]
};

_closestObject