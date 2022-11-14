/****************************************************************
File: UPSMON_CheckTransport.sqf
Author: Azroul13

Description:
	Return if the group keep doing transport

Parameter(s):
	<--- Group
Returns:
	Group transported
****************************************************************/

private["_grp","_transportgrp","_grptransport","_vehicles"];				

_grp = _this select 0;
_transportgrp = ObjNull;

If (!IsNull (_grp getvariable ["UPSMON_Transport",ObjNull])) then 
{
	_grptransport = _grp getvariable ["UPSMON_Transport",ObjNull];
	If (_grptransport getvariable ["UPSMON_Grpmission",""] == "TRANSPORT") then
	{
		If (count (_grptransport getvariable ["UPSMON_Assignedvehicle",_assignedvehicles]) > 0) then
		{
			_vehicles = _grptransport getvariable ["UPSMON_Assignedvehicle",_assignedvehicles];
			If ({alive _x && vehicle _x != _x && canmove _x} count _vehicles > 0) then
			{
				_transportgrp = _grptransport;
			};
		};
	};
};

_transportgrp