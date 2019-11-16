/****************************************************************
File: UPSMON_SetClones.sqf
Author: Azroul

Description:

Parameter(s):
	<--- Parameters of UPSMON
Returns:
	nothing
****************************************************************/
private ["_Ucthis","_mincopies","_maxcopies","_membertypes"];

_Ucthis = _this select 0;
_membertypes = _this select 1;

_mincopies = ["MIN:",0,_UCthis] call UPSMON_getArg;
_maxcopies = ["MAX:",0,_UCthis] call UPSMON_getArg;
if (_mincopies>_maxcopies) then {_maxcopies=_mincopies};
if (_maxcopies>140) exitWith {hint "Cannot create more than 140 groups!"};
	
if (_maxcopies>0) then 
{
	_Ucthis = ["MIN:",0,_UCthis] call UPSMON_setArg;
	_Ucthis = ["MAX:",0,_Ucthis] call UPSMON_setArg;
	[_Ucthis,_mincopies,_maxcopies,_membertypes] call UPSMON_Clones;
};