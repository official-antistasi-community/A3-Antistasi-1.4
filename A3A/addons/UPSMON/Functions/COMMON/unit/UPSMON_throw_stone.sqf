/****************************************************************
File: UPSMON_throw_grenade.sqf
Author: MONSADA

Description:
	Throw a grenade
Parameter(s):

Returns:

****************************************************************/
private["_target","_npc","_time"];	

_npc = _this select 0;
_target = _this select 1;	
	
if (!alive _npc || (vehicle _npc) != _npc || !canmove _npc) exitwith{};	
[_npc,_target] call UPSMON_dowatch;
sleep 0.5;

hint "THROW";
_npc switchmove "AwopPercMstpSgthWnonDnon_end";
_npc addmagazine "HandGrenade_Stone";
_npc selectWeapon "throw";
sleep .1;
_npc forceWeaponFire ["HandGrenade_Stone"];
_time = time + 5;
_npc setvariable ["UPSMON_ThrowStone",_time];
sleep 1;
_npc switchmove "";
_npc dowatch ObjNull;