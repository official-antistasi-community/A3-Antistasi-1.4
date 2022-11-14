/****************************************************************
File: UPSMON_Inbuilding.sqf
Author: Azroul13

Description:
	 Check if the AI is in a building.

Parameter(s):
	<--- Unit
Returns:
	boolean
****************************************************************/

private ["_Inbuilding","_Roof","_unit","_Down"];
_unit = _this select 0;

_Inbuilding = false;
_Roof = lineIntersectsWith [getposASL _unit, [((getposASL _unit) select 0), ((getposASL _unit) select 1), ((getposASL _unit) select 2) + 20]];
	
If (count _Roof > 0) then
{
	_Inbuilding = (_Roof select 0) isKindOf "BUILDING";
};

If (!_Inbuilding) then
{
	_Down = lineIntersectsWith [getposASL _unit, [((getposASL _unit) select 0), ((getposASL _unit) select 1), ((getposASL _unit) select 2) - 20]];
	if (count _Down > 0) then
	{
		_Inbuilding = (_Down select 0) isKindOf "BUILDING";
	};
};

_Inbuilding