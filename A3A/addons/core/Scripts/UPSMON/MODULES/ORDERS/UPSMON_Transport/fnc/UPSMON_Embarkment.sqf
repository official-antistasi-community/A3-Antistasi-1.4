
private ["_grp","_typeofgrp","_targetpos","_dist","_traveldist","_assignedvehicle","_gothit","_units","_unitsout"];

_grp = _this select 0;
_typeofgrp = _this select 1;
_targetpos = _this select 2;
_dist = _this select 3;
_traveldist = _this select 4;
_assignedvehicle = _this select 5;
_gothit = _this select 6;
_speedmode = _this select 7;
_behaviour = _this select 8;

_units = units _grp;
_unitsout = [];
{
	If (alive _x) then 
	{
		If (canmove _x) then
		{
			If (vehicle _x == _x) then
			{
				_unitsout pushback _x;
			};
		};
	};
} foreach _units;

If (UPSMON_Debug > 0) then {diag_log format ["Embark!!! outcargo:%1 Dist:%2 Gothit:%3 targetDist:%4",count _unitsout,_dist > 800,_gothit,_traveldist >= UPSMON_searchVehicledist]};
If (count _unitsout > 0) then
{
	If ("car" in _typeofgrp || "tank" in _typeofgrp) then
	{
		{
			If (alive _x) then
			{
				If (Speed _x > 5) then
				{
					_x forcespeed 5.5;
				};
			};
		} foreach _assignedvehicle;
	};
	
	If (_dist > 800 && _gothit == "") then 
	{
		If (_targetpos select 0 != 0 && _targetpos select 1 != 0) then
		{
			If (_traveldist >= UPSMON_searchVehicledist) then
			{
				if (count _assignedvehicle == 0 && count (_grp getvariable ["UPSMON_Lastassignedvehicle",[]]) == 0) then
				{
					if (_grp getvariable ["UPSMON_NOVEH",0] == 0) then 
					{
						if (!("tank" in _typeofgrp) && !("armed" in _typeofgrp) && !("apc" in _typeofgrp) && !("air" in _typeofgrp)) then
						{
							[_grp,_targetpos,_speedmode,_behaviour] spawn UPSMON_DOfindvehicle;
						};
					};
				}
				else
				{
					If ("infantry" in _typeofgrp) then
					{
						If (count _assignedvehicle == 0) then
						{
							//_assignedvehicle = _grp getvariable ["UPSMON_Lastassignedvehicle",[]];
						};
						If (count _assignedvehicle > 0) then
						{
							[_grp,_assignedvehicle,_targetpos] spawn UPSMON_getinassignedveh;
						};
					};
				};
			};
		};
	}
	else
	{
		If (_grp getvariable ["UPSMON_NOVEH",0] < 2) then
		{
			[_grp] spawn UPSMON_DOfindCombatvehicle;
		};
	};
};