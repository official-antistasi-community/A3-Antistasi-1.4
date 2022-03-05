/****************************************************************
File: UPSMON_GetTransport.sqf
Author: Azroul13

Description:
	Search for a valid patrol position.

Parameter(s):
	<--- group
Returns:
	Transport group
****************************************************************/
private ["_grp","_supplypos","_side","_supplyneeded","_supplyarray","_supplyselected","_supplygrp","_assignedvehicles","_cargonumber"];
	
_grp = _this select 0;

_wppos = waypointPosition [_grp,count(waypoints _grp)-1];

_supplypos = [];

_supplypos;