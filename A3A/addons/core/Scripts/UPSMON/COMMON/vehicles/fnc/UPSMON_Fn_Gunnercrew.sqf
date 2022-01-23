/****************************************************************
File: UPSMON_Fn_Gunnercrew.sqf
Author: Rafalsky

Description:
	Return all units in turret
Parameter(s):
	<--- vehicle
Returns:
	array of units in turret of the vehicle (in vehicle and assigned as turret)
****************************************************************/
private ["_vehicle","_x","_unitsInturret"]; 
		
_vehicle = _this select 0;
_unitsInturret = [];
{
	if( (assignedVehicleRole _x) select 0 == "TURRET") then
	{
		_unitsInturret pushback _x;			
	};			
} forEach crew _vehicle;	
	
_unitsInturret