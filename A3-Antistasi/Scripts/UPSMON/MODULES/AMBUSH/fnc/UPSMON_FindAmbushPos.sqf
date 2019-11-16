/****************************************************************
File: UPSMON_getAmbushpos.sqf
Author: Azroul13

Description:
	Search an ambush position near the leader of the group.
	It will search in priority a road position near the leader if it doesn't find any roads it will take the position of the leader as the ambush position.

Parameter(s):
	<--- Leader of the group
	<--- Direction from the leader to the positiontoambush
	<--- Position choose as an ambush position
	<--- Distance from the positiontoambush, the search begin.
Returns:

****************************************************************/

private ["_npc","_diramb","_ambushdir","_positiontoambush","_ambushdist","_AmbushPosition","_AmbushPositions","_i","_max","_min","_ang","_dir","_distancetemp","_orgX","_orgY","_posX","_posY","_obspos1","_los_ok","_objects"];

_npc = _this select 0;
_diramb = _this select 1;
_positiontoambush = _this select 2;
_ambushdist = _this select 3;

_AmbushPosition = [_positiontoambush,_diramb, _ambushdist] call UPSMON_GetPos2D;
_AmbushPositions = [];
_i = 0;
	
for "_i" from 1 to 50 do
{
	// Many thanks Shuko ...
	_min = _diramb + 290;
	_max = _diramb + 70;		
		
	_ang = _max - _min;
	// Min bigger than max, can happen with directions around north
	if (_ang < 0) then { _ang = _ang + 360 };
	_dir = (_min + random _ang);
	_distancetemp = (random _ambushdist) + 50;
	If (_distancetemp > _ambushdist) then {_distancetemp = _ambushdist;};
		
	_orgX = _positiontoambush select 0;
	_orgY = _positiontoambush select 1;
	_posX = _orgX - ((_distancetemp) * sin _dir);
	_posY = _orgY - ((_distancetemp) * cos _dir);
		
	_obspos1 = [_posX,_posY,0];
	If (!surfaceIsWater _obspos1) then
	{
		If (count (_obspos1 nearRoads 50) == 0) then 
		{
			If ([_obspos1,_positiontoambush] call UPSMON_LOS) then
			{
				_AmbushPositions pushback _obspos1;
			};
		};
	};
};

{
	_obspos = _x;
	_value = [_obspos,1,1] call UPSMON_TerraCognita;
	_urban = _value select 0;
	_forest = _value select 1;
	_terr = (_urban + _forest) * 100;
	_elev = getTerrainHeightASL [_obspos select 0,_obspos select 1];
	_obspos set [(count _obspos),_terr + _elev];
} foreach _AmbushPositions;

if (count _AmbushPositions > 0) then 
{
	_AmbushPositions = [_AmbushPositions] call UPSMON_ValueOrd;
	_AmbushPosition = _AmbushPositions select 0;
	_AmbushPosition = [_AmbushPosition select 0,_AmbushPosition select 1,0];
};

_AmbushPosition