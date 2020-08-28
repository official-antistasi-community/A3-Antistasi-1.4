/*
Function:
	A3A_fnc_punishment_FF_addEH

Description:
	Adds EHs for Punishment FF check.
	This is the default entry point for the Punishment Module.
	Nothing else should be called from Antistasi.

Scope:
	<LOCAL> Execute on object you wish to assign the EH to.

Environment:
	<ANY>

Parameters:
	<OBJECT> The Object that the Event Handlers are being added to.
	<BOOLEAN> Whether it is intended to be added to AI.

Returns:
	<BOOLEAN> true if it hasn't crashed; false if tkPunish is disabled or invalid params; nil if it has crashed.

Examples:
	if (hasInterface) then {
		[player] call A3A_fnc_punishment_FF_addEH; // Recommended to add to "onPlayerRespawn.sqf"
	};
	[cursorObject,true] remoteExec ["A3A_fnc_punishment_FF_addEH",cursorObject,false];

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [ ["_unit",objNull,[objNull]], ["_addToAI",false,[false]] ];
private _fileName = "fn_punishment_FF_addEH.sqf";

if (!tkPunish) exitWith {false};
if (!(_unit isKindOf "Man")) exitWith {
	[1,"No unit given",_fileName] remoteExecCall ["A3A_fnc_log",2,false];
	false;
};

private _isAI = !isPlayer _unit || !hasInterface || {!(_unit isEqualTo player)}; // Avoiding adding fired handlers for Ai. Needs to be local for ace, self punishment, and checkStatus.

if (_isAI && !_addToAI) exitWith {true};

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if ([_instigator] call A3A_fnc_punishment_notPlayer && {[_killer] call A3A_fnc_punishment_notPlayer}) exitWith {}; // A certain company that develops a specific game called ArmaIII hasn't mastered the EH yet. So it's full objNull if a hippo crosses a stream when the day is divisible by the second fortnight of the month during a full moon on a warm summers day while the mosquitoes bit down on Richard Parker as he struggles during the October revolution.
	[[_instigator,_killer], 60, 0.4, _unit] remoteExecCall ["A3A_fnc_punishment_FF",[_killer,_instigator] select (isPlayer _instigator),false];
}];
_unit addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	if ([_instigator] call A3A_fnc_punishment_notPlayer && {[_source] call A3A_fnc_punishment_notPlayer}) exitWith {};
	[[_instigator,_source], 60, 0.4, _unit] remoteExecCall ["A3A_fnc_punishment_FF",[_source,_instigator] select (isPlayer _instigator),false];
}];

if (_isAI) exitWith {true};

if (hasACE) then {
	["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
		if ([_unit] call A3A_fnc_punishment_notPlayer || {!(_unit isEqualTo player)}) exitWith {};
		[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
	}] call CBA_fnc_addEventHandler;
	["ace_explosives_place", {
		params ["_explosive","_dir","_pitch","_unit"];
		if ([_unit] call A3A_fnc_punishment_notPlayer || {!(_unit isEqualTo player)}) exitWith {};
		[_unit,"Put",_explosive] call A3A_fnc_punishment_FF_checkNearHQ;
	}] call CBA_fnc_addEventHandler;
} else {
	_unit addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
		if ([_unit] call A3A_fnc_punishment_notPlayer || {!(_unit isEqualTo player)}) exitWith {};
		[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
	}];
};

[getPlayerUID player] remoteExecCall ["A3A_fnc_punishment_checkStatus",2,false];
[3,format["Punishment Event Handlers Added to: %1",name _unit],_fileName] remoteExecCall ["A3A_fnc_log",2,false];
true;