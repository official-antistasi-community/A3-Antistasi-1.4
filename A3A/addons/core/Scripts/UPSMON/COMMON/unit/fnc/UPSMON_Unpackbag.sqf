/****************************************************************
File: UPSMON_Unpackbag.sqf
Author: Azroul13

Description:
	Units mounts static weapon
Parameter(s):
	<--- Gunner
	<--- Assistant
	<--- Position where teams mount static
	<--- Position where teams points the static
Returns:
	Nothing
****************************************************************/

private["_gunner","_assistant","_position","_targetPos","_weapontype","_group","_weapon","_dirTo"];

_gunner = 		_this select 0;
_assistant = 	_this select 1;
_position =		_this select 2;
_targetPos = 	_this select 3;
_weapontype =	_this select 4;
_group = 		group _gunner;
_group setvariable ["UPSMON_GrpinAction",true];

{
	Dostop _x;
	sleep 0.1;
	_x doMove _position;
	_x forcespeed 100;
	_x commandmove _position;
	_x setDestination [_position, "LEADER DIRECT",false];
	_x disableAI "AUTOTARGET";
	_x disableAI "TARGET";
} forEach [_gunner,_assistant];


waitUntil {unitReady _gunner || !alive _gunner || !canmove _gunner};
If (!alive _gunner || !canmove _gunner) exitwith {};
waitUntil {unitReady _assistant || !alive _assistant || !canmove _assistant};
If (!alive _assistant || !canmove _assistant) exitwith {};

	
if (alive _gunner && alive _assistant) then
{
	{
		_x disableAI "MOVE";
		_x playActionNow "PutDown";
		RemoveBackpack _x;
	} forEach [_gunner,_assistant];
	
	//_weapon = "_weapontype" createVehicle [_weapontype,_position, [], 0, "NONE"];
	_weapon = _weapontype createVehicle _position;
	sleep 0.05;
	_dirTo = [getposATL _weapon,_targetPos] call BIS_fnc_dirTo;
	_weapon setDir _dirTo;
	sleep 2;
	_gunner assignAsGunner _weapon;
	_gunner moveInGunner _weapon;
	
	{
		_x enableAI "AUTOTARGET";
		_x enableAI "TARGET";
		_x forcespeed -1;
	} forEach [_gunner,_assistant];
	sleep 3;
	_gunner commandWatch _targetPos;
};
	
_group setvariable ["UPSMON_GrpinAction",false];