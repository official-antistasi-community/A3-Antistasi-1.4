/****************************************************************
File: UPSMON_movetoBuilding.sqf
Author: Monsada

Description:
	move a unit to a position in a building

Parameter(s):
	<--- soldier
	<--- building
	<--- building position
	<--- time to wait in position
Returns:
	nothing
****************************************************************/

private ["_wait","_retry","_npc","_bld","_altura","_blds","_inbuilding","_result"];

_wait = 60; // 60
_retry = false;	
		
_npc = _this select 0;
_bld = _this select 1;
_altura = _this select 2;
_blds = [];
_retrytime = 0;
	
if ((count _this) > 3) then {_wait = _this select 3;};
if ((count _this) > 4) then {_blds = _this select 4;};
if ((count _this) > 5) then {_retrytime = _this select 5;};

//Si está en un vehiculo ignoramos la orden
if (vehicle _npc != _npc || !alive _npc || !canmove _npc) exitwith{};
	
//Si ya está en un edificio ignoramos la orden
_inbuilding = _npc getvariable ["UPSMON_inbuilding",false];	
if (_inbuilding || _retrytime >= 3)  exitwith{};
	
dostop _npc;
_npc domove _altura;
_npc commandMove _altura;
_npc setDestination [_altura, "LEADER PLANNED", true];
_npc forcespeed 100;
_npc setVariable ["UPSMON_inbuilding", _inbuilding, false];		
_npc setvariable ["UPSMON_buildingpos", nil, false];
	
_timeout = time + ((_altura vectordistance (getposATL _npc))*1.4);
//if (UPSMON_Debug>0) then {diag_log format["%4|_bld=%1 | %2 | %3",typeof _bld, _npc, typeof _npc ,_altura];};	

waituntil {!alive _npc || !canmove _npc || ((getposATL _npc) vectordistance _altura <= 1) || _timeout <= time || (_npc getvariable ["UPSMON_SUPSTATUS",""] != "")};

	
If (!alive _npc || !canmove _npc || (_npc getvariable ["UPSMON_SUPSTATUS",""] != "")) exitwith {};

if ((getposATL _npc) distance _altura <= 1) then 
{	
	If (alive _npc) then
	{
		If (canmove _npc) then
		{
			_npc forcespeed -1;
			_npc setvariable ["UPSMON_buildingpos",[_bld,_altura], false];
			_npc setVariable ["UPSMON_inbuilding", true, false];
			Dostop _npc;
			If (_wait >= 8999) then {_npc disableAI "TARGET"};
			sleep 1;
			[_npc,getdir _npc,_bld] spawn UPSMON_UnitWatchDir;
			if (!isNil "tpwcas_running") then {_npc setvariable ["tpwcas_cover", 2];};		
		};
	};
};

//_npc distance _altura > 1
if ((getposATL _npc) vectordistance _altura > 1) then {_retry = true};
		
_npc setVariable ["UPSMON_inbuilding", false, false];			
	
//hint format ["Unit has moved to %1 %2 %3 Retry: %4",_altura,_npc distance _altura <= 0.5,_timeout < time,_retry];
//Down one position.
if (_retry) then 
{	
	{
		If (count _x > 0) then
		{
			_result = [_x] call UPSMON_Checkfreebldpos;
			If (count _result > 0) exitwith
			{
				_altura = _result select 0;
				_retrytime = _retrytime + 1;
				[_npc,_bld,_altura,_wait,_blds,_retrytime] spawn UPSMON_movetoBuilding;	
			};			
		};
	} foreach (_blds select 1);
};
