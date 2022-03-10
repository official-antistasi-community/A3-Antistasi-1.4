/****************************************************************
File: UPSMON_DOPATROL.sqf
Author: Azroul13

Description:
	The script will assign a patrol waypoint to the group

Parameter(s):
	<--- Group
	<--- Waypoint Formation ("LINE","COLUMN","STAG COLUMN")
	<--- Waypoint Speed Mode ("LIMITED","NORMAL","FULL")
	<--- Area marker 
	<--- Waypoint behaviour ("CARELESS","SAFE","NORMAL","COMBAT","STEALTH")
	<--- Waypoint Combat Mode ("BLUE","WHITE","YELLOW","RED")
	<--- Group type (Array: "Air","Tank","car","ship","infantry")
Returns:
	nothing
****************************************************************/

private ["_grp","_wpformation","_speedmode","_areamarker","_targetpos","_targetdist","_dist","_onroad","_Behaviour"]; 
	
_grp = _this select 0;
_wpformation = _this select 1;
_speedmode = _this select 2;
_areamarker = _this select 3;
_Behaviour = _this select 4;
_combatmode = _this select 5;
_typeofgrp = _this select 6;
	
_grp setvariable ["UPSMON_searchingpos",true];
_npc = leader _grp;

_targetpos = [_npc,_areamarker,_typeofgrp] call UPSMON_SrchPtrlPos;
_timeontarget = time + (1.4*(getposATL _npc vectordistance _targetpos));

If ("arti" in _typeofgrp) then {_timeontarget = _timeontarget + 20};
_grp setvariable ["UPSMON_Timeontarget",_timeontarget];

[_grp,_targetpos,"MOVE",_wpformation,_speedmode,_Behaviour,_CombatMode,1] call UPSMON_DocreateWP;
_grp setvariable ["UPSMON_targetPos",_targetPos];
_grp setvariable ["UPSMON_RSTUCKCONTROL",0];
_grp setvariable ["UPSMON_searchingpos",false];