/*
Function:
    A3A_fnc_punishment_notPlayer

Description:
    Checks if the variable passed is not a player object.
    Pass anything you want.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters 1:
    <ANY> The variable to verify if not  player.

Parameters 2:
    <ANY> List of variables, returns true if one is player.

Returns:
    <BOOLEAN> true if it is not a player; false if it is a player object; nil if it has crashed.

Examples:
    private _instigator = 1; 	// Really, any object will do just fine according to what BI thinks EHs should return.
    if ( [_instigator] call A3A_fnc_punishment_notPlayer ) exitWith {};

Author: Caleb Serafin
Date Updated: July 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params["_unknown"];
private _fileName = "fn_notPlayer.sqf";

if !(_unknown isEqualType objNull) exitWith {true};
if !(isPlayer _unknown) exitWith {true};
false;