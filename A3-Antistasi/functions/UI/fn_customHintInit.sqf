/*
Function:
    A3A_fnc_customHintInit

Description:
   Adds EH to detect key/mouse presses to hide hints.
   Setting A3A_customHintEnable to false executes will allow it to use the simpler fall-back system.

Scope:
    <LOCAL> Execute on each player ONCE necessary EHs and variables.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if successful; false if already initialised; nil if it has crashed.

Examples:
    [] call A3A_fnc_customHintInit; // Adds dismiss key EH to local player.

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintInit.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.
if !(isNil {A3A_customHintInitComplete}) exitWith {false;};

A3A_customHintQueue = [];
A3A_customHintDismissKeyDown = false;
if (isNil {A3A_customHintEnable}) then {A3A_customHintEnable = true}; // isNil check in case value is set before this initialises.

private _renderLoop = [
	"A3A_fnc_customHintInit/_renderLoop",
	A3A_fnc_customHintRender,
	10,
	"seconds",
	{A3A_customHintEnable},
	{false},
	false
];
["itemAdd", _renderLoop] call BIS_fnc_loop;

private _keyUpCheck = [  // Yes, uber sketch, but BI left us no choice because inputAction "User12" is still above zero when keyUp is invoked!
	"A3A_fnc_customHintInit/_keyUpCheck",
	{
		if (inputAction "User12" isEqualTo 0) then {
			A3A_customHintDismissKeyDown = false;
		};
	},
	5,
	"frames",
	{A3A_customHintDismissKeyDown},
	{false},
	false
];
["itemAdd", _keyUpCheck] call BIS_fnc_loop;
A3A_customHintInitComplete = true;

private _onKeyDown = {
	if (!A3A_customHintDismissKeyDown && {!(inputAction "User12" isEqualTo 0)}) then {
		A3A_customHintDismissKeyDown = true;
		[] call A3A_fnc_customHintDismiss;
	};
	false;
};
waitUntil {!isNull (findDisplay 46)};
private _UIDisplay = findDisplay 46;
_UIDisplay displayAddEventHandler ["KeyDown", _onKeyDown];
_UIDisplay displayAddEventHandler ["MouseButtonDown", _onKeyDown];
true;

// Keyboard Params: params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
// Mouse Params: params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

// https://community.bistudio.com/wiki/User_Interface_Event_Handlers
// user action slot Will be selectable when client-side preferences, Soon™.
