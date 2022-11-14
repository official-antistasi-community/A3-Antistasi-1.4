/****************************************************************
File: UPSMON_EjectUnits.sqf
Author: Azroul13

Description:
	Make unit leave the vehicle
Parameter(s):
	<--- vehicle
	<--- Units
Returns:
	
****************************************************************/
private["_transport","_units","_chute"];	
			
_transport = _this select 0;
_units = _this select 1;

{
	_x disableCollisionWith _transport;
	unassignVehicle _x;	
	_x action ["EJECT", _transport];
	[_x] allowGetIn false;	
	sleep 0.25;
	_chute = createVehicle ["NonSteerable_Parachute_F", (getPosATL _x), [], 0, "NONE"];
	_chute setPos (getPosATL _x);
	_x moveinDriver _chute;				
	sleep 0.1;
} forEach _units;