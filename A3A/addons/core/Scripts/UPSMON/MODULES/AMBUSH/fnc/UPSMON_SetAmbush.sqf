/****************************************************************
File: UPSMON_SetAmbush.sqf
Author: Azroul13

Description:
	Move the group to a position where he can ambushed any units that cross the positiontoambush

Parameter(s):
	<--- Leader of the group
	<--- Direction from the leader to the positiontoambush
	<--- Position choose as an ambush position
	<--- Distance from the positiontoambush, the search begin.
Returns:
	Nothing 
****************************************************************/


private ["_npc","_diramb","_positiontoambush","_ambushdist","_bldpositions","_bldpos"];
	
_npc = _this select 0;
_diramb = _this select 1;
_positiontoambush = _this select 2;
_ambushdist = _this select 3;
_AmbushPosition = [];

_terrainscan = _positiontoambush call UPSMON_sample_terrain;
if (_terrainscan select 0 == "meadow") then {_ambushdist = 300};
if (_terrainscan select 0 == "forest") then {_ambushdist = 100};

if (_terrainscan select 0 == "inhabited" && _terrainscan select 1 > 300) then 
{
	_AmbushPosition = _positiontoambush;
}
else
{
	_AmbushPosition = [_npc,_diramb,_positiontoambush,_ambushdist] call UPSMON_FindAmbushPos;
};		
	
if (UPSMON_Debug>0) then {[_AmbushPosition,"Icon","hd_ambush","Colorred"] spawn UPSMON_createmarker};	
									
if (!alive _npc || !canmove _npc || isplayer _npc ) exitwith {};
	

_bldpositions = [[_AmbushPosition select 0,_AmbushPosition select 1,0],"RANDOMUP",50,"",true] call UPSMON_GetNearestBuildings;	

_units = units _npc;
If (count _bldpositions > 0) then 
{
	_units = [_units,_bldpositions] call UPSMON_SpawninBuildings;
}; 

If (count _units > 0) then 
{
	[_AmbushPosition,_positiontoambush,100,true,_units] call UPSMON_fnc_find_cover;
};