/****************************************************************
File: 
Author: 

Description:
	
Parameter(s):

Returns:

****************************************************************/
private["_grp","_typeofgrp","_side"];	

_grp = _this select 0;
_typeofgrp = _this select 1;

_side = side _grp;


switch (_side) do
{
	case "WEST":
	{
		If ("arti" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_ARTILLERY_WEST_UNITS)) then {UPSMON_ARTILLERY_WEST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_ARTILLERY_WEST_UNITS) then {UPSMON_ARTILLERY_WEST_UNITS = UPSMON_ARTILLERY_WEST_UNITS - [_grp];};
		};
		
		If ("plane" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPORT_WEST_UNITS)) then {UPSMON_SUPPORT_WEST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPORT_WEST_UNITS) then {UPSMON_SUPPORT_WEST_UNITS = UPSMON_SUPPORT_WEST_UNITS - [_grp];};
		};
		
		If ("supply" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPLY_WEST_UNITS)) then {UPSMON_SUPPLY_WEST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPLY_WEST_UNITS) then {UPSMON_SUPPLY_WEST_UNITS = UPSMON_SUPPLY_WEST_UNITS - [_grp];};
		};
	};
	
	case "EAST":
	{
		If ("arti" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_ARTILLERY_EAST_UNITS)) then {UPSMON_ARTILLERY_EAST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_ARTILLERY_EAST_UNITS) then {UPSMON_ARTILLERY_EAST_UNITS = UPSMON_ARTILLERY_EAST_UNITS - [_grp];};
		};
		
		If ("plane" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPORT_EAST_UNITS)) then {UPSMON_SUPPORT_EAST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPORT_EAST_UNITS) then {UPSMON_SUPPORT_EAST_UNITS = UPSMON_SUPPORT_EAST_UNITS - [_grp];};
		};	
		
		If ("supply" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPLY_EAST_UNITS)) then {UPSMON_SUPPLY_EAST_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPLY_EAST_UNITS) then {UPSMON_SUPPLY_EAST_UNITS = UPSMON_SUPPLY_EAST_UNITS - [_grp];};
		};
	};
	
	case "RESISTANCE":
	{
		If ("arti" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_ARTILLERY_GUER_UNITS)) then {UPSMON_ARTILLERY_GUER_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_ARTILLERY_GUER_UNITS) then {UPSMON_ARTILLERY_GUER_UNITS = UPSMON_ARTILLERY_GUER_UNITS - [_grp];};
		};
		
		If ("plane" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPORT_GUER_UNITS)) then {UPSMON_SUPPORT_GUER_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPORT_GUER_UNITS) then {UPSMON_SUPPORT_GUER_UNITS = UPSMON_SUPPORT_GUER_UNITS - [_grp];};
		};
		
		If ("supply" in _typeofgrp) then 
		{
			If (!(_grp in UPSMON_SUPPLY_GUER_UNITS)) then {UPSMON_SUPPLY_GUER_UNITS pushback _grp;};
		}
		else
		{
			If (_grp in UPSMON_SUPPLY_GUER_UNITS) then {UPSMON_SUPPLY_GUER_UNITS = UPSMON_SUPPLY_GUER_UNITS - [_grp];};
		};		
	};
};