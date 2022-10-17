/****************************************************************
File: UPSMON_FN_unitsInCargo.sqf
Author: Rafalsky

Description:
	Return all units in cargo
Parameter(s):
	<--- vehicle
Returns:
	array of units in cargo of the vehicle (in vehicle and assigned as cargo)
****************************************************************/
private ["_vehicle","_x","_unitsInCargo"]; 
		
_vehicle = _this select 0;
_unitsInCargo = [];
{
	if( (assignedVehicleRole _x) select 0 == "Cargo") then
	{
		_unitsInCargo pushback _x;			
	};			
} forEach crew _vehicle;	
	
_unitsInCargo