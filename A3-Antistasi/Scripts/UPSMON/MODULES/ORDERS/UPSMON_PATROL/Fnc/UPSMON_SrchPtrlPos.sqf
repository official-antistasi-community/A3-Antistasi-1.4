/****************************************************************
File: UPSMON_SrchPtrlPos.sqf
Author: Azroul13

Description:
	Search for a valid patrol position.

Parameter(s):
	<--- leader of the group
	<--- Area marker
	<--- Group type (Array: "Air","Tank","car","ship","infantry")
Returns:
	Position
****************************************************************/
	private ["_npc","_jumpers","_areamarker","_targetPos","_incar","_scan","_inheli","_inboat","_isdiver","_dist","_currPos","_water","_mindist","_i"];
	
_npc = _this select 0;
_areamarker = _this select 1;
_typeofgrp = _this select 2;
	
_currPos = getposATL _npc;
_targetPos = [];
_isMan = false;
_dist = 1;
_mindist = 10;
_water = 0;
_centerpos = getMarkerPos _areamarker;
_areasize = getMarkerSize _areamarker;
_rangeX = _areasize select 0;
	
if (!("ship" in _typeofgrp) && !("air" in _typeofgrp)&& !("car" in _typeofgrp) && !("tank" in _typeofgrp)) then {_isMan = true;};
	
// find a new target that's not too close to the current position

if (!_isMan) then
{
	If (("car" in _typeofgrp) || ("tank" in _typeofgrp) || ("air" in _typeofgrp && (group _npc) getvariable ["UPSMON_MOVELANDING",false])) then		
	{
		_dist = 10;
		_mindist = 50;
	}
	else // boat or plane
	{
		If ("air" in _typeofgrp) then
		{
			_water = 1;
			_dist = 0;
			_mindist = 80;
		}
		else // boat
		{
			_water = 2;
			_dist = 0;
			_mindist = 30;
		};
	};
};
	
If ((group _npc) getvariable ["UPSMON_Patrolinbld",false]) then
{
	_bldpositions = [_currpos,"RANDOMA",30,_areamarker,true] call UPSMON_GetNearestBuildings;
		
	If (count _bldpositions > 0) then
	{
		_bldpos = (_bldpositions select 0) select 1;
		_nbbldpos = count _bldpos;
	};
	
};

_i = 0;
_scan = true;
while {_scan} do 
{
	_i = _i + 1;
	_targetPosTemp = [_areamarker,_water,[],_dist] call UPSMON_pos;
	if ((group _npc) getvariable ["UPSMON_ONROAD",false] || ("car" in _typeofgrp)) then
	{
		If (!("ship" in _typeofgrp)) then
		{
			if (!("air" in _typeofgrp)) then
			{
				_nearRoads = _centerpos nearRoads _rangeX;
				If (count _nearRoads > 0) then 
				{
					_nearRoads = _nearRoads call UPSMON_arrayShufflePlus;
					{
						If ([getposATL _x,_areamarker] call UPSMON_pos_fnc_isBlacklisted) then 
						{
							if ((([_currpos,getposATL _x] call UPSMON_distancePosSqr) > _mindist)) exitwith
							{
								_targetPos = getposATL _x;
							};
						};
					} foreach _nearRoads;
				};
			};
		};
	};
	
	If (count _targetPos == 0) then 
	{
		If (("car" in _typeofgrp) || ("tank" in _typeofgrp) || ((group _npc) getvariable ["UPSMON_movetolanding",false])) then
		{
			if (!(surfaceIsWater _targetPosTemp)) then
			{
				_terrainscan = _targetPosTemp call UPSMON_sample_terrain;
				If ((_terrainscan select 0) == "meadow" || (_terrainscan select 0) == "forest") then
				{
					If ((_terrainscan select 1) < 90) then
					{
						If (count (_targetPosTemp isflatempty [50,1,10,10,0,false,player]) > 0) then
						{
							If ((([_currpos,_targetPosTemp] call UPSMON_distancePosSqr) >= _mindist)) then {_targetpos = _targetPosTemp;};
						};
					};
				};
			};
		}
		else
		{
			If ("ship" in _typeofgrp && (surfaceIsWater _targetPosTemp)) then
			{
				If ((([_currpos,_targetPosTemp] call UPSMON_distancePosSqr) >= _mindist)) then {_targetpos = _targetPosTemp;};
			} 
			else
			{
				if (!(surfaceIsWater _targetPosTemp) || ("air" in _typeofgrp)) then
				{
					If ((([_currpos,_targetPosTemp] call UPSMON_distancePosSqr) >= _mindist)) then {_targetpos = _targetPosTemp;};
				};
			};
		};
	};
	If (count _targetPos > 0 || _i > 70) then {_scan = false};
};
	
If (count _targetPos == 0) then {_targetPos = _currPos;};
_targetPos;

