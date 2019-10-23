/****************************************************************
File: UPSMON_Inbuilding.sqf
Author: Azroul13

Description:
	 Check if the AI is in a roof.

Parameter(s):
	<--- Unit
Returns:
	boolean
****************************************************************/

private ["_onRoof","_Roof","_pos","_Down"];
_pos = ATLToASL (_this select 0);//recuerda que tiene que ser posicion ATL
//if ((_pos select 2) == 0) then {_pos = ATLtoASL _pos};
_onRoof = true;
_Roof = lineIntersectsWith [_pos, [(_pos select 0), (_pos select 1), (_pos select 2) + 20]];
If (count _Roof > 0) then
{
	_onRoof = !((_Roof select 0) isKindOf "BUILDING");
};

_onRoof