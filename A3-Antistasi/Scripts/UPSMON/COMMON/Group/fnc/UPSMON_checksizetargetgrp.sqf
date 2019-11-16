/****************************************************************
File: UPSMON_checksizetargetgrp.sqf
Author: Azroul13

Description:
	Check how many suplementary targets are near the revealed target
	Use for Artillery fire condition: if (count([_attackpos,50,EAST] call UPSMON_checksizetargetgrp) >= 4) then {_artillery=true}
Parameter(s):
	<--- unit
	<--- Searching radius
	<--- Unit Side
Returns:
	Array of units
****************************************************************/

private ["_mennear","_result","_pos","_radius"];

_pos = _this select 0;
_radius = _this select 1;
_side = _this select 2;
	
_mennear = _pos nearentities [["CAManBase"],_radius];
_enemySides = _side call BIS_fnc_enemySides;
_result = false;
_allied = [];
_eny = [];

{
	If ((side _x in _enemySides) && _npc knowsabout _x >= UPSMON_knowsAboutEnemy) then {_eny = _eny + [_x];}
} foreach _mennear;
	

_result = [_eny];
_result