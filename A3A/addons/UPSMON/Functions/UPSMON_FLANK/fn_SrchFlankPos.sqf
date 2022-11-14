/****************************************************************
File: UPSMON_SrchFlankPos.sqf
Author: Azroul13

Description:
	Search Flank position

Parameter(s):
	<--- Leader position
	<--- Direction where to search
	<--- enemy position
	<--- Side of group
	<--- Group type (Array: "Air","Tank","car","ship","infantry")
	<--- Terrain around the leader ("meadow","forest","urban")
	<--- Id of the group
Returns:
	Position
****************************************************************/

private ["_npcpos","_dir2","_targetPos","_side","_typeofgroup","_dist","_flankAngle","_scan","_points","_flankdist","_roadchk","_distmin","_pool","_targetPosTemp","_terrainscan","_los_ok","_i","_final","_grp"];

_npcpos = _this select 0;
_dir2 = _this select 1;
_targetPos = _this select 2;
_side = _this select 3;
_typeofgrp = _this select 4;
_grpid = _this select 5;
_distance = round ([_npcpos,_targetpos] call UPSMON_distancePosSqr);
//_distance = _npcpos vectordistance _targetpos;
	
_flankAngle = 45;
//Establecemos una distanceX de flanqueo	
_flankdist = _distance/2;
_dist = 50;
_distmin = 1;
_roadchk = [0,50];
If ("car" in _typeofgrp || "tank" in _typeofgrp) then 
{
	If ("car" in _typeofgrp) then
	{
		_roadchk = [1,50];
	};
	_distmin = 10;
	_flankdist = ((random 0.2)+1)*(_distance/2);
	_dist = 100;
};
						
//La distanceX de flanqueo no puede ser superior a la distanceX del objectiveX o nos pordría pillar por la espalda
_flankdist = if ((_flankdist) > _distance) then {_dist  + 50} else {_flankdist};
_flankdist = if ((_flankdist) < _dist) then {_dist} else {_flankdist};
_pool = [];
	
_i = 0;
_scan = true;

while {_scan} do 
{
	_i = _i + 1;
	_targetPosTemp = [_npcpos,[_dist,_flankdist],[_dir2 +100,_dir2+200],0,_roadchk,_distmin] call UPSMON_pos;
	If (!surfaceIsWater _targetPosTemp) then
	{
		_targetPosTemp = [_targetPosTemp select 0,_targetPosTemp select 1,0];
		_points = 0;
		If ("car" in _typeofgrp || "tank" in _typeofgrp) then 
		{
			If (isOnRoad _targetPosTemp) then
			{ 
				_points = _points +20;
			};
			_value = [[_targetPosTemp select 0, _targetPosTemp select 1,0],1,1] call UPSMON_TerraCognita;
			_meadow = _value select 3;
			_terr = _meadow * 100;
			_elev = getTerrainHeightASL [_targetPosTemp select 0,_targetPosTemp select 1];
			_points = _points + _terr + _elev;
		}
		else
		{
			_value = [_targetPosTemp,1,1] call UPSMON_TerraCognita;
			_urban = _value select 0;
			_forest = _value select 1;
			_terr = (_urban + _forest) * 100;
			_elev = getTerrainHeightASL [_targetPosTemp select 0,_targetPosTemp select 1];
			_points = _points + _terr + _elev;
		};
		
		_los_ok = [_targetPos,_targetPosTemp] call UPSMON_LOS;
		If (_los_ok) then {_points = _points + 100;};
		
		{
			_grp = _x;
			if (!isnil "_grp") then 
			{
				_posgrp = _grp getvariable ["UPSMON_targetpos",[0,0]];
				if (!isnull(_grp)) then 
				{
					If (side _grp == _side) then
					{
						If (_posgrp select 0 != 0 && _posgrp select 1 != 0) then
						{
							If (_x getvariable ["UPSMON_Grpid",0] != _grpid) then
							{
								_dist1 = [_posgrp,_targetPosTemp] call UPSMON_distancePosSqr;
								_dist2 = [getposATL (leader _grp),_targetPosTemp] call UPSMON_distancePosSqr;
								if (_dist1 > 100) then 
								{					
									_points = _points + 50;
								};
								if (_dist2 > 100) then 
								{					
									_points = _points + 50;
								};
							};
						};
					};
				};
			};
			sleep 0.01; 		
		} foreach UPSMON_NPCs;
		_targetPosTemp pushback _points;
		_pool pushback _targetPosTemp;
	};
	If (count _pool > 15 || _i > 60) then {_scan = false};
};

_pool = [_pool, [], {_x select 3}, "DESCEND"] call BIS_fnc_sortBy;

If (count _pool > 0) then {_targetpos = [(_pool select 0) select 0,(_pool select 0) select 1,0];};
	
_targetPos;