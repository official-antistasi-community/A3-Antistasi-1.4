
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

private _array1 = (allunits select {[_unitSide, (side (group _x))] call BIS_fnc_sideIsEnemy});

_array1