/****************************************************************
File: UPSMON_grptype.sqf
Author: Azroul13

Description:
	get the type of the group
Parameter(s):
	<--- leader
Returns:
	----> Group type ("Isman"/"Iscar"/"IsAir"/"Isboat"/"Isdiver")
****************************************************************/
private [];

_npc = _this select 0;
_type = "";

If ("LandVehicle" countType [vehicle _npc]>0) then {_type = "Iscar"};
If ("Ship" countType [vehicle _npc]>0) then {_type = "Isboat"};
If ("Air" countType [vehicle _npc]>0) then {_type = "IsAir"};
If (["diver", (typeOf (leader _npc))] call BIS_fnc_inString) then {_type = "Isdiver"};
If (_type == "") then {_type = "Isman"};

_type