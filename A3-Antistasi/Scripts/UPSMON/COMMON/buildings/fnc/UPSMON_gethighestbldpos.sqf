/****************************************************************
File: UPSMON_gethighestbldpos.sqf
Author: Azroul13

Description:
	Get the highest point of the building

Parameter(s):
	<--- Array of building positions
Returns:
	Number
****************************************************************/

private ["_bldpos","_result","_zbldposs","_lastzbldpos"];
	
_bldpos = _this select 0;
_result = 0;
_zbldposs = [];
_lastzbldpos = 0;
	
	
{
	_zbldposs = _zbldposs + [_x select 2];
} foreach _bldpos;
	
{
	_zblpos = _x;
	If (_zblpos > _lastzbldpos) then {_result = _zblpos;} else {_result = _lastzbldpos;};
	_lastzbldpos = _x;
} foreach _zbldposs;
	
_result;