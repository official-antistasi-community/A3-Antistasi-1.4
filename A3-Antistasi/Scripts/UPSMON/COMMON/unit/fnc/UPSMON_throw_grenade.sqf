/****************************************************************
File: UPSMON_throw_grenade.sqf
Author: MONSADA

Description:
	Throw a grenade
Parameter(s):

Returns:

****************************************************************/
private["_target","_npc","_dir","_time"];	

_npc = _this select 0;
_target = _this select 1;	
	
sleep random 1.5;
if (!alive _npc || (vehicle _npc) != _npc || !canmove _npc) exitwith{};	

_npc forcespeed 0;
_npc disableAI "MOVE";	
_npc disableAI "TARGET";
_npc disableAI "AUTOTARGET";

[_npc,_target] call UPSMON_dowatch;
sleep 0.7;

_dir = [getposATL _npc,_target] call BIS_fnc_DirTo;
_npc setDir _dir;

_npc selectWeapon "throw";
sleep .1;
_npc forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
_time = time + 20;
(group _npc) setvariable ["UPSMON_SmokeTime",_time];
sleep 1;
_npc forcespeed -1;
_npc enableAI "MOVE";	
_npc enableAI "TARGET";
_npc enableAI "AUTOTARGET";
_npc dowatch ObjNull;