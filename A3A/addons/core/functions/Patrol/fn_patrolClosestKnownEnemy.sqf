params ["_group", "_targetDistance"];

private _NearTargets = (leader _group) neartargets _targetDistance; 
private _unitSide = side _group;

private _knownTargets = [];
{

	if ([_unitSide, (_x # 2)] call A3A_fnc_patrolSideIsEnemy && {!((_x # 1) isKindOf "Air")}) then {
		_knownTargets pushback [(_x # 5),(_x # 4)];
	};
} foreach _NearTargets;


if (count _knownTargets > 0) then {
	_knownTargets sort true;
};

_knownTargets