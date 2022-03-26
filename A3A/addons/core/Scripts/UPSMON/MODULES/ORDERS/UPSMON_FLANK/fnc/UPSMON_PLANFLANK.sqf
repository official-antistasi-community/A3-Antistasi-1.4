/****************************************************************
File: UPSMON_DOATTACK.sqf
Author: Azroul13

Description:
	The script will assign a combat waypoint to the group

Parameter(s):

Returns:
	nothing
****************************************************************/

private ["_grp","_attackpos","_lastattackpos","_dist","_typeofgrp","_terrainscan","_areamarker","_haslos","_attackdist","_timeorder"];

_grp = _this select 0;
_attackpos = _this select 1;
_lastattackpos = _this select 2;
_dist = _this select 3;
_typeofgrp = _this select 4;
_terrainscan = _this select 5;
_areamarker = _this select 6;
_haslos = _this select 7;
_targetpos = _this select 8;

_attackdist = 1000;
_grp setvariable ["UPSMON_Grpmission","FLANK"];

If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
{
	If (count _lastattackpos > 0) then
	{
		_attackdist = ([_lastattackpos,_attackpos] call UPSMON_distancePosSqr);
	};
	
	If (_attackdist > 50 || count(waypoints _grp) == 0 || Unitready (leader _grp) || moveToCompleted (leader _grp) || (_grp getvariable ["UPSMON_TIMEONTARGET",time] <= time) || _targetdist <= 50) then
	{
		If (_grp getvariable ["UPSMON_TIMEORDER",time] <= time) then
		{
			[_grp,_attackPos,_dist,_typeofgrp,_terrainscan,_areamarker,_haslos] spawn UPSMON_DOFLANK;
			_timeorder = time + 10;
			_grp setvariable ["UPSMON_TIMEORDER",_timeorder];
		};
	};
};