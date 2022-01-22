/****************************************************************
File: UPSMON_SN_EHHIT.sqf
Author: Rafalsky

Description:

Parameter(s):

Returns:
	
****************************************************************/	
private ["_unit","_shooter","_grpId"];
_unit = _this select 0;
_shooter = _this select 1;
_grp = group _unit;
		 
if (!(_unit in UPSMON_GOTHIT_ARRAY)) then
{
	if (side _unit != side _shooter) then
	{
		UPSMON_GOTHIT_ARRAY pushback _unit; 
		if (UPSMON_Debug > 0) then {player globalchat format["UNIT: %1, SHOOTER :%2 %3",_unit,_shooter,side _shooter]};
	};
};	