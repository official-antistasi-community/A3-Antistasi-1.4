/****************************************************************
File: UPSMON_moveNearestBuildings.sqf
Author: Monsada

Description:
	 move all units of squad to the nearest building 

Parameter(s):
	<--- leader
	<--- distance to search buildings (optional, 25 by default)
	<--- must patrol or not
Returns:
	Buildings array
****************************************************************/

private ["_distance","_wait","_npc","_units","_blds"];
	
_distance = 30;	
_wait=60;
	
_npc = _this select 0;
_units = _this select 1;
_distance = _this select 2;
if ((count _this) > 3) then {_wait = _this select 3;};

_blds = [];
	
_units = [_units] call UPSMON_getunits;
	
if (UPSMON_Debug>0) then {diag_log format["UPSMON_moveNearestBuildings _units=%1 _blds=%2",_units,_blds];};
if (count _units == 0) exitwith {_units};		
	
//Obtenemos los buildingsX closeX al lider
_blds = [getposATL _npc,"RANDOMA",_distance,"",false] call UPSMON_GetNearestBuildings;		
	
if (count _blds==0) exitwith {_units};
	
//Movemos a la unitsX a los buildingsX closeX.
_units = [_units,_blds,_wait] call UPSMON_moveBuildings;
	
_units