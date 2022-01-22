/****************************************************************
File: UPSMON_GetRespawntime.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- UPSMON parameters
Returns:
	Number
****************************************************************/
private["_Ucthis","_respawn","_respawntime"];	

_Ucthis = _this select 0;

_respawntime = 0;
if ("RESPAWN" in _UCthis) then {_respawntime = 1;};
If ("RESPAWN:" in _UCthis) then {_respawntime = ["RESPAWN:",_respawntime,_UCthis] call UPSMON_getArg};
	

_respawntime
