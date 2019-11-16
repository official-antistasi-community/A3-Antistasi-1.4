/****************************************************************
File: UPSMON_DOASSAULT.sqf
Author: Azroul13

Description:
	The script will assign a patrol waypoint to the group

Parameter(s):
	<--- Group
	<--- attack position
	<--- Type of group
Returns:
	nothing
****************************************************************/

private ["_grp","_attackpos","_typeofgrp","_radius","_speed","_dist","_combatmode"]; 
	
_grp = _this select 0;
_attackpos = _this select 1;
_typeofgrp = _this select 2;
_dist = _this select 3;
	
_grp setvariable ["UPSMON_searchingpos",true];

_radius = 20;
_speed = "LIMITED";
_combatmode = "YELLOW";

If ("air" in _typeofgrp) then
{
	_radius = 400;
	_speed = "FULL";
	_combatmode = "RED";
}
else
{
	If (_dist <= 100) then
	{
		_combatmode = "RED";
	};
};

[_grp,_attackpos,"SAD","LINE",_speed,"COMBAT",_combatmode,_radius] call UPSMON_DocreateWP;
_grp setvariable ["UPSMON_targetPos",_attackpos];
_grp setvariable ["UPSMON_Lastattackpos",_attackpos];
_grp setvariable ["UPSMON_searchingpos",false];