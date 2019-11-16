/****************************************************************
File: UPSMON_UnitsGetout.sqf
Author: Azroul13

Description:
	Make unit leave the vehicle
Parameter(s):
	<--- vehicle
	<--- Units
Returns:
	
****************************************************************/
private["_transport","_units"];	
			
_transport = _this select 0;
_units = _this select 1;

{
	unassignVehicle _x;	
	_x action ["GETOUT", _transport];
	doGetOut _x;
	[_x] allowGetIn false;
	_x leaveVehicle _transport;
	_Pos = [getposATL _x,[5,20],[0,360]] call UPSMON_pos;
	_x domove _Pos;
	sleep 0.1;
} forEach _units;