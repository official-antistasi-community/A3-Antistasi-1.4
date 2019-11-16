/****************************************************************
File: UPSMON_GetRespawndelay.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- UPSMON parameters
Returns:
	Number
****************************************************************/
private["_Ucthis","_respawndelay"];	

_Ucthis = _this select 0;

_respawndelay = 0;
If ("RESPAWNDELAY:" in _Ucthis) then {_respawndelay = ["RESPAWNDELAY:",_respawndelay,_UCthis] call UPSMON_getArg};


_respawndelay
