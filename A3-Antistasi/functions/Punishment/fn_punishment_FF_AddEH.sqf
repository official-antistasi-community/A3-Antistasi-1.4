/*
Function:
	A3A_fnc_punishment_FF_AddEH

Description:
	Adds EH to fire if the player creates grenades or explosives near Petros.

Scope:
	<LOCAL> Execute on player you wish to assign EH to.

Environment:
	<ANY>

Parameters:
	nil

Returns:
	<BOOLEAN> True if hasn't crashed; False if tkPunish is disabled; nothing if it has crashed.

Examples:
	call A3A_fnc_punishment_FF_AddEH;
	// Recommended to add to "onPlayerRespawn.sqf","initPlayerLocal.sqf"

Author: Caleb Serafin
Date Updated: 28 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _fileName = "fn_punishment_FF_AddEH.sqf";

if (!tkPunish) exitWith {false};

if (side player == teamPlayer && tkPunish) then {
	if (hasACE) then {
		private _EH_ace_firedPlayer = {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
			[2,"_EH_fired",_fileName] call A3A_fnc_log;//////////////////////////////////////////////////////////
			[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
		};
		private _EH_ace_explosives_place = {
			params ["_explosive","_dir","_pitch","_unit"];
			[2,"_EH_ace_explosives_place",_fileName] call A3A_fnc_log;/////////////////////////////////////////////////////////
			[_unit,"Put",_explosive] call A3A_fnc_punishment_FF_checkNearHQ;
		};
		["ace_firedPlayer", _EH_ace_firedPlayer] call CBA_fnc_addEventHandler;
		["ace_explosives_place", _EH_ace_explosives_place] call CBA_fnc_addEventHandler;
	} else {
		private _EH_fired = {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
			[2,"_EH_fired",_fileName] call A3A_fnc_log;/////////////////////////////////////////////////////////////
			[_unit,_weapon,_projectile] call A3A_fnc_punishment_FF_checkNearHQ;
		};
		player addEventHandler ["Fired", _EH_fired];
	};

	player addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		[[_instigator,_killer], 20, 0.34, _unit] remoteExec ["A3A_fnc_punishment_FF",_instigator,false];
	}];
	[2,"_EH_Added",_fileName] call A3A_fnc_log;//////////////////////////////////////////////////////////
};
true;