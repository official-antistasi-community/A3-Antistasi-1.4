/****************************************************************
File: UPSMON_artillerysetBattery.sqf
Author: Azroul13

Description:
	All artillery stop and set to battery
Parameter(s):
	<--- Group
	<--- Type of group
	<--- Nowp (true/false)
	<--- Targetpos
Returns:
	nothing
****************************************************************/
private ["_grp","_typeofgrp","_nowp","_npc","_target","_pos","_staticteam","_backpack","_batteryunits"];

_grp = _this select 0;
_typeofgrp = _this select 1;
_nowp = _this select 2;
_target = _this select 3;

_npc = leader _grp;
_currpos = getposATL _npc;

_grp setvariable ["UPSMON_OnBattery",false];

If (count (_grp getvariable ["UPSMON_Battery",[]]) > 0) then
{
	If (!(_grp getvariable ["UPSMON_GrpinAction",false])) then
	{
		If (!("static" in _typeofgrp) || !_nowp) then
		{
			{
				Dostop _x;
			} foreach units _grp;
			
			_pos =  _currpos isFlatEmpty [10,1,0.5,10,20,false];
			
			If (count _pos > 0) then
			{
				_pos = ASLToATL _pos;
			}
			else
			{
				_pos = _currpos;
			};
	
			[_grp,_pos,"HOLD","LINE","LIMITED","COMBAT","YELLOW",1] spawn UPSMON_DocreateWP;
	
			If (typename ((_grp getvariable ["UPSMON_Battery",[]])select 0) == "ARRAY") then
			{
				sleep 2;
				_staticteam = (_grp getvariable ["UPSMON_Battery",[]])select 0;
				_batteryunits = _staticteam;
				{
					If (alive _x && vehicle _x != _x && !((vehicle _x) getvariable ["UPSMON_disembarking",false])) then 
					{
						waituntil {vehicle _x == _x || !alive _x};
					};
					If (!alive _x) exitwith {_batteryunits = [];};
				} foreach _staticteam; 
					
				If (count _batteryunits > 0) then
				{
					_grp call UPSMON_DeleteWP;
					_backpack = backpack (_batteryunits select 0);
					_vehicle = ([_backpack] call UPSMON_checkbackpack) select 0;
					[_staticteam select 0,_staticteam select 1,_pos,_target,_vehicle] call UPSMON_Unpackbag;
					_grp setvariable ["UPSMON_OnBattery",true];
					[_grp,_pos,"HOLD","LINE","LIMITED","COMBAT","YELLOW",1] spawn UPSMON_DocreateWP;
				};		
			}
			else
			{
				sleep 2;
				_grp setvariable ["UPSMON_OnBattery",true];
			};
		}
		else
		{
			_grp setvariable ["UPSMON_OnBattery",true];
		};
	};
};