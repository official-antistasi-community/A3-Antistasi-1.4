/****************************************************************
File: UPSMON_checkleaveVehicle.sqf
Author: MONSADA

Description:
	If every on is outside, make sure driver can move
Parameter(s):
	<--- leader
	<--- vehicle
	<--- driver 
Returns:
	Nothing
****************************************************************/
private["_npc","_vehicle","_driver","_in"];	
_npc = _this select 0;
_vehicle = _this select 1;
_driver = _this select 2;
_in = false;
	
//Take time to go all units
sleep 5;
{
	if (_x != vehicle _x) then {_in = true};
}foreach units _npc;
	
	
// if no one is inside
if (!_in) then {
	_driver enableAI "MOVE"; 
	sleep 1;
	_driver stop false;
	sleep 1;
	_driver leaveVehicle _vehicle; 
	sleep 1;
 };
