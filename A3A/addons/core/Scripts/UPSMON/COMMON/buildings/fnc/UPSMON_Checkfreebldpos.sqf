/****************************************************************
File: UPSMON_Checkfreebldpos.sqf
Author: Azroul13

Description:
	Filter the building position and check if there're no unit near the position.

Parameter(s):
	<--- Building positions 
Returns:
	Building position
****************************************************************/

private ["_bldpos","_altura","_unitnear","_id"];

_bldpos = _this select 0;
_unitnear = [];
_altura = [];
_id = -1;
{
	_id = _id + 1;
	If (_x isEqualType []) then
	{
		If (count _x > 0) then
		{
			_unitnear = _x nearEntities [["CAManBase","STATICWEAPON"],0.5];
			If (count _unitnear == 0) exitwith 
			{
				_altura = [_x,_id]
			};
		};
	};
} foreach _bldpos;

_altura;