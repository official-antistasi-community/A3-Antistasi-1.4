/****************************************************************
File: UPSMON_Isroof.sqf
Author: Azroul13

Description:
	 Check if the AI is under a roof.

Parameter(s):
	<--- Unit
Returns:
	boolean
****************************************************************/

private ["_Inbuilding","_Roof","_unit"];

_unit = _this select 0;

_Inbuilding = false;
_Roof = lineIntersectsWith [getposASL _unit, [((getposASL _unit) select 0), ((getposASL _unit) select 1), ((getposASL _unit) select 2) + 20]];
	
If (count _Roof > 0) then
{
	_Inbuilding = (_Roof select 0) isKindOf "BUILDING";
};

_Inbuilding