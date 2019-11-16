/****************************************************************
File: UPSMON_LOS.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- position to check
	<--- Target position
Returns:
	Boolean 
****************************************************************/

private ["_poso","_posd","_los_ok"];
	
_poso = _this select 0;
_posd = _this select 1;
	
_poso = [_poso select 0, _poso select 1, (getTerrainHeightASL [_poso select 0, _poso select 1]) +1];
_posd = [_posd select 0, _posd select 1, (getTerrainHeightASL [_posd select 0, _posd select 1]) +1];
	
_los_ok = false;
If (!terrainIntersectASL [_poso,_posd]) then
{
	//lineIntersects [_poso, _posd]
	If (count (lineintersectsobjs [_poso,_posd,objnull,objnull,false]) == 0) then
	{
		_los_ok = true;
	};
};
		
_los_ok;