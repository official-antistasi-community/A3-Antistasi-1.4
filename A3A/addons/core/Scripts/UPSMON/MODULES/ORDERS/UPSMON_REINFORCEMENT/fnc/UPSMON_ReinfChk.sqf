/****************************************************************
File: UPSMON_GetReinfPos.sqf
Author: Azroul13

Description:
	The script will assign a combat waypoint to the group

Parameter(s):
	<--- Group
	<--- lastposition
Returns:
	nothing
****************************************************************/

private ["_grp","_ratio","_typeofgrp","_result"];
	
_grp = _this select 0;
_ratio = _this select 1;
_typeofgrp = _this select 2;

_result = false;

If (UPSMON_reinforcement) then
{ 
	If (!(_grp getvariable ["UPSMON_ONRADIO",false])) then
	{
		If (_ratio >= 1) then
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] != "AMBUSH") then
			{
				If (_grp getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
				{
					If (!("air" in _typeofgrp)) then
					{
						_result = true;
					};
				};
			}
		};
	};
};

_result