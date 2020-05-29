/*
Function:
	A3A_fnc_punishment_sentence

Description:
	Creates a surfboard in a random pos 100m from the corner.
	Moves the detainee onto the surfboard.

Scope:
	<ANY>

Environment:
	<ANY>

Parameters:
	<OBJECT> The detainee being sent to Ocean Gulag.

Returns:
	<BOOLEAN> True if hasn't crashed; nothing if it has crashed.

Examples:
	[_arguments] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];

Author: Caleb Serafin
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detainee"];
private _punishmentPlatform = createVehicle ["Land_Sun_chair_green_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_punishmentPlatform enableSimulation false;
_detainee setVariable ["punishment_platform",_punishmentPlatform,true];

private _pos2D = [random 100,random 100];

_punishmentPlatform setPos [_pos2D select 0, _pos2D select 1, -0.25];
_detainee setPos [_pos2D select 0, _pos2D select 1, 0.25];
true;