/****************************************************************
File: UPSMON_assignasrole.sqf
Author: MONSADA

Description:
	Move unit to the position of a vehicle
Parameter(s):
	<--- unit
	<--- vehicle
	<--- time before moving
Returns:
	Nothing
****************************************************************/
private["_vehicle","_unit","_role","_wait","_spawninveh","_turretpath"];	
_unit = _this  select 0;
_role = _this  select 1;
_vehicle = _this select 2;		
_wait = _this select 3;
_turretpath = 0;
if (count _this > 4) then {_turretpath = _this select 4;};
_spawninveh = true;
if (count _this > 5) then {_spawninveh = _this select 5;};
Dostop _unit;
sleep _wait;
	
unassignVehicle _unit;
switch (_role) do 
{
	case "DRIVER": {_unit assignasdriver _vehicle;};
	case "COMMANDER": {_unit assignascommander _vehicle;};
	case "GUNNER": 
	{
		if (_spawninveh) then 
		{
			_unit moveInTurret [_vehicle,_turretpath];
		} 
		else 
		{
			_unit assignAsTurret [_vehicle,_turretpath];
		};
	};
	case "CARGO": {_unit assignascargo _vehicle;};
};
[_unit] orderGetIn true;
_unit forcespeed 40;

//if ( UPSMON_Debug>0) then {player sidechat format["%1: assigning to driver of %2 ",_driver,  typeof _vehicle]}; 
