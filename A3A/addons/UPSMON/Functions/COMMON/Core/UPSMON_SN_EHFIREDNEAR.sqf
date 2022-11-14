/****************************************************************
File: UPSMON_SN_EHFIREDNEAR.sqf
Author: Rafalsky

Description:

Parameter(s):

Returns:
	
****************************************************************/	
private ["_unit","_shooter","_dist"];

_unit = _this select 0;
_shooter = _this select 1;
_dist = _this select 2;

If (alive _unit) then
{
	If (!(_unit getvariable ["UPSMON_Civfleeing",false])) then
	{
		["FLEE",_unit,_shooter,_dist] spawn UPSMON_Civaction;
	};
};
