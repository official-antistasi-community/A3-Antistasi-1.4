/*
Function:
	A3A_fnc_punishment_FF_addEH

Description:
	Adds EHs for Punishment FF check.
	This is the default entry point for the Punishment Module.
	Nothing else should be called from Antistasi.

Scope:
	<LOCAL> Execute on player you wish to assign EH to.

Environment:
	<ANY>

Parameters:
	<OBJECT> If adding EH to AI, passing a reference is required: Otherwise vanilla EH will be added to the machine it's local on.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if tkPunish is disabled; nil if it has crashed.

Examples:
	call A3A_fnc_punishment_FF_addEH; // Recommended to add to "onPlayerRespawn.sqf","initPlayerLocal.sqf"
	[cursorObject] remoteExec ["A3A_fnc_punishment_FF_addEH",cursorObject,false];

Author: Caleb Serafin
Date Updated: 3 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_unit",objNull,[objNull]]];
private _fileName = "fn_punishment_FF_addEH.sqf";

if (!tkPunish) exitWith {false};
if (isNull _unit) then {_unit = player};

if (hasACE) then {
	["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
		[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
	}] call CBA_fnc_addEventHandler;
	["ace_explosives_place", {
		params ["_explosive","_dir","_pitch","_unit"];
		[_unit,"Put",_explosive] call A3A_fnc_punishment_FF_checkNearHQ;
	}] call CBA_fnc_addEventHandler;
} else {
	_unit addEventHandler ["Fired", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
	}];
};

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[[_instigator,_killer], 20, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",[_instigator,_killer] select (isNull _instigator),false];
}];
_unit addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	[[_instigator,_source], 20, 0.4, _unit] remoteExec ["A3A_fnc_punishment_FF",[_instigator,_source] select (isNull _instigator),false];
}];
[getPlayerUID player] remoteExec ["A3A_fnc_punishment_checkStatus",2,false];
[2,"Punishment Event Handlers Added",_fileName] call A3A_fnc_log;
true;