/*
	File: fn_findOverwatch.sqf
	Author: Dean "Rocket" Hall

	Description:
	Function which selects a position that provides overwatch
	onto another position.

	Parameter(s):
	_this select 0: the target position (position)
	_this select 1: maximum distance from target in meters (optional)
	_this select 2: minimum distance from target in meters (optional)
	_this select 3: minimum height in relation to target in meters (optional)
	_this select 4: position to start looking from, if different from target pos (optional)
*/
private ["_unit","_dir","_targetPos","_distance","_pool","_i","_flankAngle","_scan","_points","_targetPosTemp","_terrainscan","_los_ok","_final"];

_unit = _this select 0;
_dir = _this select 1;

_targetPos = getposATL _unit;

_pool = [];
	
_i = 0;
_scan = true;

while {_scan} do 
{
	_i = _i + 1;
	_targetPosTemp = [_targetPos,[0,50],[_dir +70,_dir +220],0,[0,100],5] call UPSMON_pos;
	If (!surfaceIsWater _targetPosTemp) then
	{
		_points = 0;
		_targetPosTemp = [_targetPosTemp select 0,_targetPosTemp select 1,0];
		If (_unit != vehicle _unit) then 
		{
			If (isOnRoad _targetPosTemp) then
			{ 
				_points = _points +20;
			};
			_value = [_targetPosTemp,1,1] call UPSMON_TerraCognita;
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
			_points = _points +_terr + _elev;
		};
		
		_los_ok = [_targetPos,_targetPosTemp] call UPSMON_LOS;
		If (_los_ok) then {_points = _points + 200;};
		_targetpostemp pushback _points;
		_pool pushback _targetPosTemp;
	};
	If (count _pool > 10 || _i > 50) then {_scan = false};
};


_pool = [_pool, [], {_x select 3}, "DESCEND"] call BIS_fnc_sortBy;

If (count _pool > 0) then {_targetpos = [(_pool select 0) select 0,(_pool select 0) select 1,0];};
	
_targetPos;