/****************************************************************
File: UPSMON_filterbuilding.sqf
Author: Azroul13

Description:
	Filter the building, avoid bridge building or building with no position.

Parameter(s):
	<--- Building
Returns:
	boolean
****************************************************************/

private ["_bld","_marker","_return","_in","_UPSMON_Bld_remove"];

_bld = _this select 0;
_marker = _this select 1;
_return = false;
_in = true;

if (!((typeof _bld) in UPSMON_Bld_remove)) then
{
	If (_marker != "") then
	{
		_in = [getposATL _bld,_marker] call UPSMON_pos_fnc_isBlacklisted;
	};
	if (_in) then
	{
		if ([_bld,1] call BIS_fnc_isBuildingEnterable) then
		{
			_return = true;
		};
	};
};

_return;