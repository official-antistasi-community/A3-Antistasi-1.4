
/*
	Author: Genesis

	Description:
		Returns an array containing all of units friendlies.

	Parameter(s):
		0: OBJECT - object whose side to check for friendlies

	Returns:
		ARRAY
*/

private _UnitSide = side (group _this);

private _Array1 = [];
{
	private _TargetSide = side _x;
	if (!([_UnitSide, _TargetSide] call BIS_fnc_sideIsEnemy) && {!(_x in (units (group _this)))} && {alive _x}) then {_Array1 pushback _x;};
} forEach allUnits;
_Array1