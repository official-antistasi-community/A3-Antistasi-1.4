/****************************************************************
File: UPSMON_SetEventhandlers.sqf
Author: Azroul13

Description:
	Convert argument list to uppercase
Parameter(s):
	<--- Members of the group
	<--- Parameters
Returns:
	Nothing
****************************************************************/

private["_members","_UCthis","_grpid","_deletedead"];

_members = _this select 0;
_UCthis = _this select 1;
_grpid = _this select 2;

_deletedead = ["DELETE:",0,_UCthis] call UPSMON_getArg;
{
	_x setVariable ["UPSMON_grpid", _grpid, false];
	If (_x != vehicle _x && (vehicle _x) getVariable ["UPSMON_grpid",0] != _grpid) then {(vehicle _x) setVariable ["UPSMON_grpid", _grpid, false];};
	sleep 0.05;
			
	if (side _x != civilian) then 
	{//soldiers 
		_x AddEventHandler ["hit", {nul = _this spawn UPSMON_SN_EHHIT}];
		sleep 0.05;	
		_x AddEventHandler ["killed", {nul = _this spawn UPSMON_SN_EHKILLED}];
		//_x AddEventHandler ["fired", {nul = _this spawn UPSMON_SN_EHFIRED}];
	}
	else
	{//civ
		if (!isnil "_x") then 
		{
			sleep 0.05;
			_x AddEventHandler ["firedNear", {nul = _this spawn UPSMON_SN_EHFIREDNEAR}];
			sleep 0.05;
			_x AddEventHandler ["killed", {nul = _this spawn UPSMON_SN_EHKILLEDCIV}];
			sleep 0.05;
		};
	};
	
	if (_deletedead>0) then 
	{
		_x addEventHandler['killed',format["[_this select 0,%1] spawn UPSMON_deleteDead",_deletedead]];
		sleep 0.01;
	};
} foreach _members;

