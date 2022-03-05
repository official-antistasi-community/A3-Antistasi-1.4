/****************************************************************
File: UPSMON_GetGroupformation.sqf
Author: Azroul13

Description:
	Get unit behaviour
Parameter(s):
	<--- leader
	<--- UPSMON parameters
Returns:
	---> formation
****************************************************************/
private["_npc","_Ucthis","_formation"];	

_npc = _this select 0;
_Ucthis = _this select 1;

_formation = Formation _npc;

// set formation modes (or not)
If ("COLUMN" in _UCthis) then {_formation = "COLUMN";};
If ("STAG COLUMN" in _UCthis) then {_formation = "STAG COLUMN";};
If ("WEDGE" in _UCthis) then {_formation = "WEDGE";};
If ("VEE" in _UCthis) then {_formation = "VEE";};
If ("LINE" in _UCthis) then {_formation = "LINE";};	
If ("FILE" in _UCthis) then {_formation = "FILE";};	

_formation	
