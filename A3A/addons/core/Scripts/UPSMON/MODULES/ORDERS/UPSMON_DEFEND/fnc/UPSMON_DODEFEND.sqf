/****************************************************************
File: UPSMON_DODEFEND.sqf
Author: Azroul13

Description:
	The script will assign a defense waypoint to the group

Parameter(s):
	<--- Group
	<--- distance between group and enemy
	<--- Target
	<--- Id of the group
	<--- position of the target
	<--- Supressed (boolean)

Returns:
	nothing
****************************************************************/

private ["_grp","_dist","_target","_supressed","_terrainscan","_wptype","_wpformation","_speedmode","_Behaviour","_npc","_targetPos","_CombatMode"];
	
_grp = _this select 0;
_dist = _this select 1;
_target = _this select 2;
_supstatus = _this select 3;
_terrainscan = _this select 4;
	
_npc = leader _grp;
_targetPos = getposATL _npc;

_wptype = "HOLD";
_wpformation = "LINE";
_speedmode = "LIMITED";
_Behaviour = "STEALTH";
_CombatMode = "YELLOW";

If (IsNull _target) then {_wpformation = "DIAMOND";};
If (_supstatus != "SUPRESSED") then {_Behaviour = "COMBAT";_speedmode = "NORMAL";};
	
if ((_terrainscan select 0) == "meadow" && (_terrainscan select 1) < 100 && _supstatus != "SUPRESSED") then
{
	_targetPos = [_targetPos,[0,360],100] call UPSMON_SrchGuardPos;
	_nosmoke = [_grp] call UPSMON_NOSMOKE;
	If (!_nosmoke) then {[units _grp,getposATL _target] spawn UPSMON_CreateSmokeCover;};
	[_grp,_targetPos,"MOVE","STAG COLUMN","FULL","COMBAT",_CombatMode,1] call UPSMON_DocreateWP;
	[_grp,_targetPos,_wptype,_wpformation,_speedmode,_Behaviour,_CombatMode,1] call UPSMON_DoaddWP;
}
else
{
	[_grp,_targetpos,_wptype,_wpformation,_speedmode,_Behaviour,_CombatMode,1] call UPSMON_DocreateWP;
};
	
_grp setvariable ["UPSMON_targetPos",_targetPos];