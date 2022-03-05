/****************************************************************
File: UPSMON_SrchGuardPos.sqf
Author: Azroul13

Description:
	Search a covered position to defend

Parameter(s):
	<--- leader of the group
	<--- enemy position
	<--- Direction to search
	<--- Distance where to begin the search

Returns:
	Position
****************************************************************/

private ["_currpos","_direction","_dist","_targetPosTemp","_pool","_distmin","_i","_targetPosTemp"];

_currpos = _this select 0;
_direction = _this select 1;
_dist = _this select 2;
	
_guardPos = [];
_targetPosTemp = [];
_pool = [];
_distmin = 5;
_i = 0;
	
while {count _guardPos == 0 && _i < 30} do 
{
	_i = _i + 1;
	_targetPosTemp = [_currpos,[_dist,_dist + 100],_direction,0,[0,50],_distmin] call UPSMON_pos;
	if (!(surfaceIsWater _targetPosTemp)) then
	{
		_terrainscan = _targetPosTemp call UPSMON_sample_terrain;
		If ((_terrainscan select 0) == "inhabited" || (_terrainscan select 0) == "forest") then
		{
			_guardPos = _targetPosTemp;
		};
	};
};
	
if (count _guardPos == 0) then {_guardPos = _currpos;};
_guardPos;