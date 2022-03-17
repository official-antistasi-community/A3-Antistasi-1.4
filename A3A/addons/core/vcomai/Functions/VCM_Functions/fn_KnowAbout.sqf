
/*
	Author: Genesis

	Description:
		This function will edit the knowledge of a unit for a specific side.

	Parameter(s):
		0: ARRAY
		1: OBJECT - Unit that will be revealed to above array
		2: NUMBER - Knowledge value to add
	
	Returns:
		NOTHING
*/

params ["_snda","_unit","_toAdd"];
if (isNil "_toAdd") then {_toAdd = 0.25};

{
	if (local _x) then
	{
		private _kv = _x knowsAbout _unit;
		_x reveal [_unit,(_kv + _toAdd)];
	};
} foreach _snda;