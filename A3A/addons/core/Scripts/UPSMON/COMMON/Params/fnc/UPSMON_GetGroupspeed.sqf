/****************************************************************
File: UPSMON_GetGroupspeed.sqf
Author: Azroul13

Description:
	Get unit speed mode
Parameter(s):
	<--- leader
	<--- UPSMON parameters
Returns:
	---> speed mode
****************************************************************/
private["_npc","_Ucthis","_speed"];	

_npc = _this select 0;
_Ucthis = _this select 1;

_speed = Speedmode _npc;

// set initial speed
_noslow = if ("NOSLOW" in _UCthis) then {"NOSLOW"} else {"SLOW"};
if ("LIMITED" in _UCthis) then {_speed = "LIMITED"};
if ("NORMAL" in _UCthis) then {_speed = "NORMAL"}; 
if ("FULL" in _UCthis || _noslow == "NOSLOW") then {_speed = "FULL"};

_speed	
