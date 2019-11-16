/****************************************************************
File: UPSMON_checkallied.sqf
Author: Azroul13

Description:
	Are they any allied near the group
	Use for Surrending condition
Parameter(s):
	<--- leader
	<--- Searching radius
	<--- Unit Side
Returns:
	Array [[Eni units],[Allied Units]]
****************************************************************/

private ["_npc","_mennear","_result","_radius"];

_npc = _this select 0;
_radius = _this select 1;
_side = side _npc;
	
_mennear = _npc nearTargets 180;
_result = false;
_allied = [];
_eny = [];
_enemySides = _npc call BIS_fnc_enemySides;
	
{
	_unit = _x select 4;
	_unitside = _x select 2;
	If ((alive _unit) && (_unitside == _side) && !(_unit in (units _npc)) && !(captive _unit)) then {_allied = _allied + [_x];};
	If ((alive _unit) && (_unitside in _enemySides) && _npc knowsabout _unit >= UPSMON_knowsAboutEnemy) then {_eny = _eny + [_x];}
} foreach _mennear;
	

_result = [_allied,_eny];
_result