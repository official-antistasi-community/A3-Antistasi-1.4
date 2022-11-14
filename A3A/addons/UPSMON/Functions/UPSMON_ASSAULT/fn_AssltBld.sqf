/****************************************************************
File: UPSMON_Assltbld.sqf
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

private ["_grp","_target","_attackpos","_currpos","_assignedvehicles","_capacityofgrp","_bld","_teams","_teamsupport","_teamasslt","_time"]; 
	
_grp = _this select 0;
_target = _this select 1;
_currpos = _this select 2;

_assignedvehicles = _grp getvariable ["UPSMON_Assignedvehicle",[]];
_capacityofgrp = _grp getvariable ["UPSMON_GroupCapacity",[]];
_attackpos = getposATL _target;

_bld = [_attackpos,"RANDOMA",20,"",false] call UPSMON_GetNearestBuilding;
if (count _bld > 0) then
{
	_bldpos = (_bld select 1) select 0;

	[_grp,_attackpos,_currpos] spawn UPSMON_SetSatchel;
	sleep 1;
	If (!(_grp getvariable ["UPSMON_GrpinAction",false])) then
	{
		If ("at3" in _capacityofgrp) then
		{
			[_grp,_assignedvehicles,_bld select 0] call UPSMON_FireGun;
		};
	};

	If (!(_grp getvariable ["UPSMON_GrpinAction",false])) then
	{
		_teams = [_grp] call UPSMON_composeteam;
		If (count _teams > 0) then
		{
			_grp setvariable ["UPSMON_GrpinAction",true];
			_teamsupport = _teams select 0;
			_teamasslt = _teams select 1;
			if (count _teamasslt > 0) then
			{
				{
					If (alive _x) then
					{
						Dostop _x;
						_x suppressfor 100;
					};
				} foreach _teamsupport;
	
				_time = ((_attackpos vectordistance _currpos)*1.4);
				[_teamasslt,_bldpos,_grp,_time] call UPSMON_patrolbuilding;
				
				if (({alive _x} count (units _grp)) > 0) then
				{
					{
						If (alive _x) then
						{
							If (_x != (leader _grp)) then
							{
								_x domove (getposATL (leader _grp));
								_x dofollow (leader _grp);
								_x suppressfor 10;
							};
						};
					} foreach units _grp;
				};
			};
		};
	};
};

_grp setvariable ["UPSMON_GrpinAction",false];