/****************************************************************
File: UPSMON_SrchRetreatPos.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- leader of he group
	<--- position of the target
	<--- Direction where to search
	<--- Distance where to search
Returns:
	Position
****************************************************************/

private ["_npc","_dist","_dir2","_exp","_scan","_avoidPos","_bestplaces","_roadcheckpos"];

_npc = _this select 0;
_targetPos = _this select 1;
_direction = _this select 2;
_dist = _this select 3;
_typeofgrp = _this select 4;
	
_currpos = getposATL _npc;
_water = 0;	
If ("ship" in _typeofgrp) then
{
	_water = 1;	
};
_avoidPos = [];
_targetPosTemp = [];
_pool = [];
_distmin = 5;
_i = 0;
_scan = true;
while {_scan} do 
{
	_i = _i + 1;
	_targetPosTemp = [_currpos,[_dist,_dist + 100],_direction,_water,[0,50],_distmin] call UPSMON_pos;
	If ("ship" in _typeofgrp) then
	{
		If (surfaceIsWater _targetPosTemp) then
		{
			_avoidPos = _targetPosTemp;
		};
	}
	else
	{
		If (!(surfaceIsWater _targetPosTemp)) then
		{
			_terrainscan = _targetPosTemp call UPSMON_sample_terrain;
			_los_ok = [_targetPos,[_targetPosTemp select 0,_targetPosTemp select 1,0]] call UPSMON_LOS;
			If (!_los_ok && ((_terrainscan select 0) == "inhabited" || (_terrainscan select 0) == "forest")) then
			{
				_avoidPos = _targetPosTemp;
			};			
		};
	};
	
	If (count _avoidPos > 0 || _i > 30) then {_scan = false};
};
	
if (count _avoidPos == 0) then {_avoidPos = _currpos;};
_avoidPos;
