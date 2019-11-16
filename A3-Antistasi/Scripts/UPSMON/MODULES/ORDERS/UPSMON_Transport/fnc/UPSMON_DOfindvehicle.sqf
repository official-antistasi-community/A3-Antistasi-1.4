/****************************************************************
File: UPSMON_DOfindvehicle.sqf
Author: Azroul13

Description:
	Search vehicles near the leader of the group.

Parameter(s):
	<--- Group 
	<--- Current waypoint position
Returns:
	nothing
****************************************************************/

private ["_grp","_targetpos","_speedmode","_behaviour","_grpid","_npc","_unitsIn","_transportgrp","_targetpos2","_assignedvehicle","_timeout","_vehicle","_driver","_gunnerscrew","_timeontarget","_mission"];
	
_grp = _this select 0;
_targetpos = _this select 1;
_speedmode = _this select 2;
_behaviour = _this select 3;
	
_grp setvariable ["UPSMON_embarking",true];
_grp setvariable ["UPSMON_searchingpos",true];	

if (UPSMON_Debug > 0) then {diag_log format ["Grp%1 search vehicle",_grp getvariable ["UPSMON_grpid",0]];};

If (({alive _x} count units _grp) == 0) exitwith {};

_grpid = _grp getvariable ["UPSMON_Grpid",0];
_npc = leader _grp;
_unitsIn = [_npc,["air","land","sea","transport"],200] call UPSMON_GetIn_NearestVehicles;						
	
if (UPSMON_Debug > 0) then {diag_log format ["Grp%1 unitsin:%2",_grp getvariable ["UPSMON_grpid",0],_unitsIn];};

if (count _unitsIn == 0) then 
{
	_transportgrp = [_grp] call UPSMON_GetTransport;
	if (!IsNull _transportgrp) then
	{
		_grp setvariable ["UPSMON_Grpmission","WAITTransport"];
		_grp setvariable ["UPSMON_Transport",_transportgrp];
		_grp setvariable ["UPSMON_TransportDest",_targetpos];
		_mission = "MOVETODEST";
		
		If ((getposATL (leader _grp)) vectordistance (getposATL (leader _transportgrp)) > 300) then 
		{
			if ("Air" countType [vehicle _npc] == 0) then
			{
				_mission = "MoveToRP";
			}
			else
			{
				_mission = "LANDRP";
			};	
			
			_targetpos = [_npc,getposATL _npc,["car"]] call UPSMON_SrchTrpPos;
			[_transportgrp,_targetpos,"MOVE","COLUMN","FULL","SAFE","BLUE",1] spawn UPSMON_DocreateWP;
			[_grp,_targetpos,"MOVE","COLUMN","FULL","SAFE","BLUE",1] spawn UPSMON_DocreateWP;
		}
		else
		{
			_transportgrp call UPSMON_DeleteWP;
			_assignedvehicle = [];
			{
				if (alive _x) then
				{
					If (vehicle _x != _x) then
					{
						If (!((vehicle _x) in _assignedvehicle)) then
						{
							_assignedvehicle pushback (vehicle _x);
						};
					};
				};
			} foreach units _transportgrp;
			[_grp,_assignedvehicle,_targetpos] spawn UPSMON_getinassignedveh;
		};
		
		_transportgrp setvariable ["UPSMON_Transportmission",[_mission,_targetpos,_grp]];
	};
};	
if (count _unitsIn > 0) then 
{		
	_timeout = time + 120;
							
	_vehicle = objnull;
	_vehicles = [];
		
	{ 
		waitUntil { (vehicle _x != _x) || { time > _timeout } || { moveToFailed _x } || { !canMove _x } || { !canStand _x } || { !alive _x } }; 
								
		if ( vehicle _x != _x && !(_vehicle in _vehicles)) then 
		{
			_vehicles pushback (vehicle _x)
		};								
	} foreach _unitsIn;
	
	{
		if (_x iskindof "AIR") exitwith
		{		
			_driver = driver _x;
			
			If (_driver in (units (group _npc))) then
			{
				If (_driver == _npc) then
				{
					(group _npc) selectLeader ((units _npc) select 1);
				};
				[_driver] join GrpNull;
				_gunnerscrew = [_x] call UPSMON_Fn_Gunnercrew;
				_gunnerscrew join _driver;
			};
			_targetpos = [_npc,_targetpos,["air"]] call UPSMON_SrchTrpPos;
			
			_mission = "MOVETODEST";
			if (_grp getvariable ["UPSMON_LANDDROP",false]) then 
			{
				_h2 = createVehicle ["Land_HelipadEmpty_F", _targetpos, [], 0, "NONE"];
				[(group _driver),_targetpos,"MOVE","COLUMN","FULL","CARELESS","BLUE",1] spawn UPSMON_DocreateWP;
				_mission = "LANDING";
			} 
			else 
			{
				_targetpos2 = [_targetpos,[_targetpos,getposATL _driver] call BIS_fnc_DirTo,400] call UPSMON_GetPos2D;
				[(group _driver), [_targetpos select 0,_targetpos select 1,UPSMON_paraflyinheight],"MOVE","COLUMN","FULL","CARELESS","BLUE",1,UPSMON_paraflyinheight,[_targetpos2,"MOVE","COLUMN","FULL","CARELESS","BLUE",1]] spawn UPSMON_DocreateWP;
			};
			(group _driver) setvariable ["UPSMON_Transportmission",[_mission,_targetpos,_grp]];
			_grp setvariable ["UPSMON_InTransport",true];
			[_driver,(group _npc) getvariable "UPSMON_Marker","TRANSPORT"] spawn UPSMON;
		};
	} foreach _vehicles;
	
	_grptype = [leader _grp] call UPSMON_grptype;
	
	if (_grptype == "Iscar") then
	{
		_targetpos = [leader _grp,_targetpos,["car"]] call UPSMON_SrchTrpPos;
	};
		
	if (_grptype == "Isboat") then
	{
		_targetpos = [leader _grp,_targetpos,["ship"]] call UPSMON_SrchTrpPos;
	};
	
	{_x forcespeed -1} foreach units _grp;
	
	[_grp,_targetpos,"MOVE","COLUMN",_speedmode,_behaviour,"YELLOW",1] call UPSMON_DocreateWP;
	_timeontarget = time + (1.4*((getposATL (leader _grp)) vectordistance _targetpos));
	_grp setvariable ["UPSMON_Timeontarget",_timeontarget];
};

sleep 2;

_grp setvariable ["UPSMON_targetpos",_targetpos];
_grp setvariable ["UPSMON_embarking",false];
_grp setvariable ["UPSMON_searchingpos",false];	