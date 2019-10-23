/****************************************************************
File: UPSMON_SrchFlankPosforboat.sqf
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

private ["_npcpos","_dir2","_targetPos","_flankdir","_side","_typeofgroup","_scan","_points","_dist","_flankAngle","_flankdist","_pool","_targetPosTemp","_terrainscan","_los_ok","_i","_final","_grp"];

_npcpos = _this select 0;
_dir2 = _this select 1;
_targetPos = _this select 2;
_side = _this select 3;
_grpid = _this select 4;
_dist = [_npcpos,_targetpos] call UPSMON_distancePosSqr; 
	
_flankAngle = 45;
//Establecemos una distancia de flanqueo	
_flankdist = ((random 0.3)+0.5)*(_dist/2);
						
//La distancia de flanqueo no puede ser superior a la distancia del objetivo o nos pordría pillar por la espalda
_flankdist = if ((_flankdist) >= _dist) then {_dist*.65} else {_flankdist};

_pool = [];
_i = 0;
_scan = true;
while {_scan} do 
{
	_i = _i + 1;
	_targetPosTemp = [_npcpos,[_dist,_flankdist],[_dir2 +100,_dir2+200],0,_roadchk,_distmin] call UPSMON_pos;
	If (surfaceIsWater _targetPosTemp) then
	{
		_targetPosTemp = [_targetPosTemp select 0,_targetPosTemp select 1,0];
		_points = 0;
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
		_targetpostemp pushback _points;
		_pool pushback _targetPosTemp;
	};
	If (count _pool > 15 || _i > 60) then {_scan = false};
};

_pool = [_pool, [], {_x select 3}, "DESCEND"] call BIS_fnc_sortBy;

If (count _pool > 0) then {_targetpos = [(_pool select 0) select 0,(_pool select 0) select 1,0];};
	
_targetPos;
