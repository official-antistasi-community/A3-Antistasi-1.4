/****************************************************************
File: UPSMON_GetGroupbehaviour.sqf
Author: Azroul13

Description:
	Get unit behaviour
Parameter(s):
	<--- leader
	<--- UPSMON parameters
Returns:
	---> behaviour of the group
****************************************************************/
private["_npc","_Ucthis","_behaviour"];	

_npc = _this select 0;
_Ucthis = _this select 1;

_behaviour = Behaviour _npc;

// set behaviour modes (or not)
if ("CARELESS" in _UCthis) then {_behaviour = "CARELESS"}; 
if ("SAFE" in _UCthis) then {_behaviour = "SAFE"};
if ("AWARE" in _UCthis) then {_behaviour = "AWARE"}; 
if ("COMBAT" in _UCthis) then {_behaviour = "COMBAT"}; 
if ("STEALTH" in _UCthis) then {_behaviour = "STEALTH"};

_behaviour


