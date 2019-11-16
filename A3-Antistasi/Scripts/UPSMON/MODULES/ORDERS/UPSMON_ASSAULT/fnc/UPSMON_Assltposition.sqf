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
_targetpos = _this select 1;
_currpos = _this select 2;

If (!(_grp getvariable ["UPSMON_GrpinAction",false])) then
{
	_teams = [_grp] call UPSMON_composeteam;
	If (count _teams > 0) then
	{
		_grp setvariable ["UPSMON_GrpinAction",true];
		_teamsupport = _teams select 0;
		_teamasslt = _teams select 1;
		
		_dir =[_currpos,_targetpos] call BIS_fnc_DirTo;
		
		If (count _teamasslt > 0) then
		{
			{
				If (alive _x) then
				{
					Dostop _x;
					[_x,_targetpos,2] call UPSMON_DOwatch;
					_pos = [_targetpos,_dir] call UPSMON_overwatch;
					_x domove _pos;
					_x suppressfor 100;
				};
			} foreach _teamsupport;
			
			// angle from unit to target
			_targetpos = [_targetpos,_dir] call UPSMON_overwatch;
			_teamasslt domove _targetpos;
		};
	};
};

_grp setvariable ["UPSMON_GrpinAction",false];