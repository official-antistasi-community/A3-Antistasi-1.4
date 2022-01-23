/****************************************************************
File: UPSMON_CallRenf.sqf
Author: Azroul13

Description:
	The script will assign a combat waypoint to the group

Parameter(s):
	<--- Group
	<--- lastposition
Returns:
	nothing
****************************************************************/

private ["_grp","_currpos","_targetpos","_radiorange","_Eniescapacity","_renfgroup","_list","",""];

_grp = _this select 0;
_currpos = _this select 1;
_targetpos = _this select 2;
_radiorange = _this select 3;
_Eniescapacity = _this select 4;

_renfgroup = ObjNull;
_list = [];

_grp setvariable ["UPSMON_ONRADIO",true];	

_UPSMON_Renf = (call (compile format ["UPSMON_REINFORCEMENT_%1_UNITS",side _grp])) - [_grp];

if (UPSMON_Debug>0) then {diag_log format["%1 ask reinforcement position %2 KRON_Renf: %3",_npcpos,_fixedtargetpos,_UPSMON_Renf]};
If (count _UPSMON_Renf > 0) then
{
	{
		If (!IsNull _x) then
		{
			If (({alive _x && !(captive _x)} count units _x) > 0) then
			{
				If (!(_x getvariable ["UPSMON_ReinforcementSent",false])) then
				{
					If (_x getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
					{
						If (_x getvariable ["UPSMON_Grpstatus","GREEN"] == "GREEN") then
						{
							If ((_currpos vectordistance (getposATL (leader _x))) <= _radiorange) then
							{
								_points = 0;
								If (surfaceIsWater _targetpos) then
								{
									If ("ship" in (_x getvariable ["UPSMON_typeofgrp",[]])) then
									{
										If ("armed" in (_x getvariable ["UPSMON_typeofgrp",[]])) then
										{
											_points = _points + 100;
										};
									};
									
									If ("air" in (_x getvariable ["UPSMON_typeofgrp",[]])) then
									{	
										If ("at1" in (_x getvariable ["UPSMON_GroupCapacity",[]]) || "at2" in (_x getvariable ["UPSMON_GroupCapacity",[]])) then
										{
											_points = _points + 200;
										};
									};
								}
								else
								{
									If (!("ship" in (_x getvariable ["UPSMON_typeofgrp",[]]))) then
									{
										_points = _points + (_x getvariable ["UPSMON_Grpratio",0]);
									};
									
									If ("aa2" in _Eniescapacity) then
									{
										If ("air" in (_x getvariable ["UPSMON_typeofgrp",[]])) then
										{
											_points = _points - 200;
										};
									};
									
									If ("at3" in _Eniescapacity) then
									{
										If (("at3" in (_x getvariable ["UPSMON_GroupCapacity",[]])) || ("at2" in (_x getvariable ["UPSMON_GroupCapacity",[]]))) then
										{
											_points = _points + 200;
										};
									};
									
									If ("at2" in _Eniescapacity) then
									{
										If ("air" in (_x getvariable ["UPSMON_GroupCapacity",[]]) && "at1" in (_x getvariable ["UPSMON_GroupCapacity",[]])) then
										{
											_points = _points + 100;
										};
									};
								};
								
								_list pushback [_x,_points];
							};
						};
					};
				};
			};
		};
		
		If (count _list > 0) then
		{
			_list = [_list, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy;
			_renfgroup = (_list select 0) select 0;
		};
		
		If (!IsNull _renfgroup) then
		{
			_renfgroup setvariable ["UPSMON_PosToRenf",[_targetpos select 0,_targetpos select 1,0]];
			_renfgroup setvariable ["UPSMON_GrpToRenf",_grp];
			_grp setvariable ["UPSMON_RenfGrps",_renfgroup getvariable ["UPSMON_RenfGrps",[]] + _renfgroup];
		};
	} foreach _UPSMON_Renf;
};
	
_grp setvariable ["UPSMON_ONRADIO",false];