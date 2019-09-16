/****************************************************************
File: UPSMON_GetRespawnpos.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- UPSMON parameters
Returns:
	Array of position
****************************************************************/
private["_Ucthis","_respawnpos","_npc"];	

_Ucthis = _this select 0;
_npc = _this select 1;

_respawnpos = getposATL _npc;
If ("RESPAWNPOS:" in _Ucthis) then {_respawnpos = ["RESPAWNPOS:",_respawnpos,_UCthis] call UPSMON_getArg};

If (typename (_respawnpos select 0) == "ARRAY") then {_respawnpos = _respawnpos select (floor (random (count _respawnpos)))};

_respawnpos
