/****************************************************************
File: UPSMON_throw_grenade.sqf
Author: MONSADA

Description:
	Throw a grenade
Parameter(s):

Returns:

****************************************************************/
private["_npc","_time"];	

_npc = _this select 0;	
	
_npc fire "SmokeLauncher";
_time = time + 20;
(group _npc) setvariable ["UPSMON_SmokeTime",_time];
