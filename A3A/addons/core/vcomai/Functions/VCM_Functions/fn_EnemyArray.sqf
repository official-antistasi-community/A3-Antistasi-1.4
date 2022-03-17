
/*
	Author: Genesis

	Description:
		Return array containing all enemies of unit.

	Parameter(s):
		0: OBJECT - Units enemy to this unit will be added to return array.

	Returns:
		ARRAY
*/

private _unitSide = side (group _this);
private _targetSide = "";
private _array1 = [];
{
	_targetSide = side _x;
	if ([_unitSide, _targetSide] call BIS_fnc_sideIsEnemy) then {_array1 pushback _x;};

} forEach allUnits;
_array1