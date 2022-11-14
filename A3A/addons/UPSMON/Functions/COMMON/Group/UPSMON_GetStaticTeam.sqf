/****************************************************************
File: UPSMON_GetStaticTeam.sqf
Author: Azroul13

Description:
	Check if group has weapon in bag (gun barrel and tripod)
Parameter(s):
	<--- group
Returns:
	---> Static Team [Gunner,Assistant]
	---> Class of the static
****************************************************************/

private ["_grp","_position","_targetpos","_result","_staticTeam","_vehicle","_tripods","_unit","_backpack","_lots"];

_grp = _this select 0;
	
_result = [];
_staticTeam = [];
_vehicle = [];
_tripods = [];
	
{
	if (alive _x) then
	{
		_unit = _x;
		_backpack = backpack _Unit;
		If (_backpack != "") then 
		{
			_lots = [_backpack] call UPSMON_checkbackpack;
			if (count _lots > 0) exitwith {_vehicle = _lots select 0; _tripods = _lots select 1; _staticTeam pushback _x;};
		};
	};
} foreach units _grp;
	
if (count _staticTeam > 0) then
{
		
	{
		if (alive _x) then
		{
			_unit = _x;
			_backpack = backpack _Unit;
			If (_backpack != "") then 
			{
				if (_backpack in _tripods) exitwith {_staticTeam pushback _x;};
			};
		};
			
	} foreach units _grp;
};

_result = [_staticTeam,_vehicle];
_result