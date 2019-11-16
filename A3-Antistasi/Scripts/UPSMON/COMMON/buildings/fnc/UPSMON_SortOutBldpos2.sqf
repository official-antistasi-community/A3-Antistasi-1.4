/****************************************************************
File: UPSMON_SortOutBldpos.sqf
Author: Azroul13

Description:
	Get All position from a building

Parameter(s):
	<--- building
	<--- Search parameters: get only 1st floor position or upstairs position or both ("RANDOMUP"/"RANDOMDN"/"RANDOMA")
Returns:
	Array of bldpos
****************************************************************/

private ["_bld","_initpos","_height","_bldpos","_checkheight","_downpos","_roofpos","_allpos","_bldpos1","_posz"];

_bld = _this select 0;
_targetpos = _this select 1;
	
_bldpos = [_bld, 70] call BIS_fnc_buildingPositions;

_allpos = [];

{
	If ([_x,_targetpos] call UPSMON_LOS) then {_allpos pushback _x;};			
} foreach _bldpos;

If (count _allpos > 1) then
{
	_allpos = _roofpos call UPSMON_arrayShufflePlus;
};

_allpos;