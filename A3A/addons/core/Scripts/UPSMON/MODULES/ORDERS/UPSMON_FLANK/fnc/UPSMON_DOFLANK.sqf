/****************************************************************
File: UPSMON_DOATTACK.sqf
Author: Azroul13

Description:
	The script will assign a combat waypoint to the group

Parameter(s):
	<--- Group
	<--- position of the target
	<--- distance between group and enemy
	<--- Id of the group
	<--- Nofollow parameters.
	<--- Group type (Array: "Air","Tank","car","ship","infantry")
	<--- Terrain around the leader ("meadow","forest","urban")
	<--- Areamarker
	<--- Group side
	<--- Do unit can see the enemy position
Returns:
	nothing
****************************************************************/

private ["_grp","_npc","_attackPos","_dist","_gothit","_closeenough","_dir1","_dir2","_wptype","_wpformation","_result","_targetPos","_speedmode","_Behaviour","_grpid","_nofollow","_targetdist","_areamarker","_centerpos","_centerX","_centerY","_areadir","_areasize","_RangeX","_RangeY"];
	
_grp = _this select 0;
_attackPos = _this select 1;
_dist = _this select 2;
_typeofgrp = _this select 3;
_terrainscan = _this select 4;
_areamarker = _this select 5;
_haslos = _this select 6;
	
_npc = leader _grp;
_currpos = getposATL _npc;
_side = side _grp;
_grpid = _grp getvariable ["UPSMON_Grpid",0];
_water = 0;

_grp setvariable ["UPSMON_searchingpos",true];	
	
_closeenough = UPSMON_closeenough;	
// get position of spotted unit in player group, and watch that spot										
			
// angle from unit to target
_dir =[_attackPos,getposATL _npc] call BIS_fnc_DirTo;

						
//Establish the type of waypoint
//DESTROY has worse behavior with and sometimes do not move
_wptype = "MOVE";
_wpformation = "WEDGE";
_CombatMode = "YELLOW";
_radius = 1;
	
_attackPos = [_attackPos select 0,_attackPos select 1,0];
	
//Set speed and combat mode 
_rnd = random 100;
If (!("ship" in _typeofgrp)) then
{

	_targetPos = [_currpos,_dir,_attackPos,_side,_typeofgrp,_grpid] call UPSMON_SrchFlankPos;

	
	if ( _dist <= _closeenough ) then 
	{	
		//If we are so close we prioritize discretion fire
		if ( _dist <= _closeenough/2 ) then 
		{	
				
			//Close combat modeo	
			_wpformation = "LINE";
			_speedmode = "LIMITED";
			If (("armed" in _typeofgrp) || ("tank" in _typeofgrp)) then {_wpformation = "VEE";};
			
			// _rnd < 80
			if (morale _npc > 0) then 
			{           
				_Behaviour =  "COMBAT";
			} 
			else 
			{
				_Behaviour =  "STEALTH"; // ToDo check impact "STEALTH";
			};	
				
		} 
		else 
		{
			//If the troop has the role of not moving tend to keep the position	 
			_Behaviour =  "COMBAT";
			_speedmode = "NORMAL";
			If (("armed" in _typeofgrp) || ("tank" in _typeofgrp)) then {_wpformation = "WEDGE";_speedmode = "LIMITED";};							
		};								
	} 
	else	
	{	
		if (_dist <= 1000) then 
		{
			If (_haslos) then
			{
				_speedmode = "LIMITED";
				_Behaviour = "COMBAT";
			}
			else
			{
				_speedmode = "NORMAL";
				_Behaviour = "AWARE";
			};			
		} 
		else 
		{		
			//Platoon from the target must move fast and to the point
			_Behaviour =  "SAFE"; 
			_speedmode = "FULL";
			_wpformation = "COLUMN";
		};	
	};
}
else
{
	_water = 2;
	_Behaviour =  "COMBAT";
	_speedmode = "FULL";
		
	_targetPos = [_currpos,_dir,_attackPos,_side,_grpid] call UPSMON_SrchFlankPosforboat;
	If (!surfaceiswater _targetpos) then {_targetpos = _currpos;};			
};
	
_targetPos = [_targetPos select 0,_targetPos select 1,0];			
						
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
		
If ((_terrainscan select 0) == "meadow") then
{
	_speedmode = "FULL";
};

If (UPSMON_Debug > 0) then 
{
	player sidechat format ["%1 DOFLANK",_grp getvariable ["UPSMON_Grpid",0]];
	diag_log format ["%1 DOFLANK",_grp getvariable ["UPSMON_Grpid",0]];
	diag_log format ["targetpos:%1",_targetPos]
};	

_grp setvariable ["UPSMON_targetPos",_targetPos];
_grp setvariable ["UPSMON_Lastattackpos",_attackpos];

[_grp,_targetpos,_wptype,_wpformation,_speedmode,_Behaviour,_CombatMode,_radius] call UPSMON_DocreateWP;		

_timeontarget = time + (1.4 *(_currpos vectordistance _targetpos));
_grp setvariable ["UPSMON_TIMEONTARGET",_timeontarget];

_grp setvariable ["UPSMON_searchingpos",false];	