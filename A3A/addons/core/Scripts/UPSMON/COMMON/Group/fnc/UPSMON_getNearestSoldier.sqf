/****************************************************************
File: UPSMON_getNearestSoldier.sqf
Author: Monsada

Description:

Parameter(s):

Returns:

****************************************************************/

private["_units","_position","_near"];
		
_position = _this select 0;
_units = _this select 1;
	
_near = [_units, [], {_position distance _x}, "ASCEND"] call BIS_fnc_sortBy;;
_near = _near select 0;	


_near