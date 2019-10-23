/****************************************************************
File: UPSMON_GetIn_NearestVehicles.sqf
Author: Azroul13

Description:
	Función que busca vehiculos cercanos y hace entrar a las unidades del lider
Parameter(s):
	<--- Leader
	<--- Types of vehicle the group must search
	<--- Radius of research
	<--- Do the unit needs to be spawn in the vehicle
	<--- Is there a area the unit must search in
Returns:
	Array of units moving to vehicle
****************************************************************/
private["_npc","_types","_area","_spawn","_marker","_vehicles","_unitsmoveIn","_unitsIn","_vehicletypearray"];

_npc = _this select 0;
_types = _this select 1;
_area = _this select 2;
_spawn = false;
_marker = "";
If (count _this > 3) then {_spawn = _this select 3};
If (count _this > 4) then {_marker = _this select 4};				
	
_grpid = (group _npc) getvariable ["UPSMON_grpid",0];
	

_validunits = [units _npc] call UPSMON_Getunits;
_unitsIn = _validunits;
if ( (count _validunits) > 0) then 
{
	_vehicles = [];
	if ("static" in _types) then 
	{
		_vehicles = [_npc,_area,_marker] call UPSMON_GetNeareststatics;
		If (_npc in _validunits) then
		{
			_validunits = _validunits - [_npc];
			_validunits pushback _npc;
		};
	};
	If !("static" in _types) then {_vehicles = [_npc,_types,_area,_marker] call UPSMON_GetNearestvehicles;};
	
	_unitsIn = [_validunits,_vehicles,_spawn] call UPSMON_selectvehicles;
};
sleep 0.01;

_unitsIn;