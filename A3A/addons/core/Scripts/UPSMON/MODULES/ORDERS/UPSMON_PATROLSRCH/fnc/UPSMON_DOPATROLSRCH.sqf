/****************************************************************
File: UPSMON_DORESEARCH.sqf
Author: Azroul13

Description:
	The script will assign a combat waypoint to the group

Parameter(s):
	<--- Group
	<--- position of the target
	<--- Group type (Array: "Air","Tank","car","ship","infantry")
	<--- Areamarker
Returns:
	nothing
****************************************************************/

private ["_grp","_suspectPos","_grpid","_typeofgrp","_areamarker","_side","_speedmode","_Behaviour","_radius","_npc","_currpos","_dist","_dir1","_targetPos","_wptype"];

_grp = _this select 0;
_suspectPos = _this select 1;
_typeofgrp = _this select 2;
_areamarker = _this select 3;
_side = side _grp;
_grpid = _grp getvariable ["UPSMON_Grpid",0];
	
_speedmode = "NORMAL";	
_Behaviour = "AWARE";
_radius = 1;
_water = 0;

_npc = leader _grp;
_currpos = getposATL _npc;
_dist = [_suspectPos,_currpos] call UPSMON_distancePosSqr; 
	
_targetPos = _suspectPos;
_wptype = "MOVE";
_grp setvariable ["UPSMON_searchingpos",true];										
			
// angle from unit to target
_dir1 =[_currpos,_suspectPos] call BIS_fnc_DirTo;
_dir2 = [_suspectPos,_currpos] call BIS_fnc_DirTo;;
	
_suspectPos = [_suspectPos select 0,_suspectPos select 1,0];
If (("ship" in _typeofgrp) || ("air" in _typeofgrp)) then
{
	if ("ship" in _typeofgrp) then
	{
		_water = 2;
		_targetPos = [_suspectPos,[50,100],[0,360],2,[0,100],1] call UPSMON_pos;
		If (!surfaceiswater _targetpos) then {_targetpos = _currpos;};
		_targetPos = [_targetPos select 0,_targetPos select 1,0];
		_speedmode = "NORMAL";
	}
	else
	{
		_water = 1;
		//_targetPos = [_attackpos,[200,1000],[0,360],1,[0,100],0] call UPSMON_pos;
		_targetPos = _suspectPos;
		_wptype = "LOITER";
		_radius = 200;
		_targetPos = [_targetPos select 0,_targetPos select 1,50];
	};
}
else
{
	If (_dist <= 200) then
	{
		_speedmode = "LIMITED";
		_Behaviour = "STEALTH";
		_targetPos = [_suspectPos,[10,50],[_dir2 + 70,_dir2 + 280],0,[0,100],0] call UPSMON_pos;
	}
	else
	{
		_targetPos = [_currpos,_dir1,_suspectPos,_side,_typeofgrp,_grpid] call UPSMON_SrchPtrlFlankPos;
	};
};
	
	
if (_grp getvariable ["UPSMON_NOFOLLOW",false]) then 
{
	If !([_targetPos,_areamarker] call UPSMON_pos_fnc_isBlacklisted) then 
	{
		_wptype = "HOLD";
		_speedmode = "FULL";
		_Behaviour =  "AWARE"; 
		_targetPos = _currpos;
	};
};


_grp setvariable ["UPSMON_targetPos",_targetPos];
_timeontarget = time + (1.4 *(_currpos vectordistance _targetpos)) + (random 10 + 30);
_grp setvariable ["UPSMON_TIMEONTARGET",_timeontarget];
_bldpositions = [_targetPos,"RANDOMA"] call UPSMON_GetNearestBuilding;
If (count _bldpositions > 0) then
{
	_bldpos = (_bldpositions select 1) select 0;
	_grp setvariable ["UPSMON_Grpmission","PATROLINBLD"];
	_grp setvariable ["UPSMON_bldposToCheck",_bldpos];
};
[_grp,_targetpos,_wptype,"COLUMN",_speedmode,_Behaviour,"YELLOW",_radius] call UPSMON_DocreateWP;
_grp setvariable ["UPSMON_searchingpos",false];	