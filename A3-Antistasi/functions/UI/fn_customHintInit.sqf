/*
Function:
    A3A_fnc_customHintInit

Description:
   Adds EH to detect key/mouse presses to hide hints.
   Defines many important variables for customHintXXX and shader_ratioToHex.
   Starts loops for key detection/hint rendering.
   Setting A3A_customHintEnable to false executes will allow it to use the simpler fall-back system.

Scope:
    <LOCAL> Execute on each player ONCE to add necessary EHs and variables.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if successful; false if already initialised/server/HC; nil if it has crashed.

Examples:
    [] call A3A_fnc_customHintInit;

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintInit.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.
if !(isNil {A3A_customHint_InitComplete}) exitWith {false;};
// These var names don't need to be limited to 16chars for performance as they are not public.
A3A_customHint_MSGs = [];  // Operates as a upside-down stack (new messages pushed-Back are displayed.)
A3A_customHint_DismissKeyDown = false;
A3A_customHint_LastMSG = 0;
A3A_customHint_RenderFrameCount = 1;
if (isNil {A3A_customHintEnable}) then {A3A_customHintEnable = true}; // isNil check in case value was set before this initialises.

A3A_customHint_hexChars = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

addMissionEventHandler ["EachFrame", {
    if ((inputAction "User12" isEqualTo 0) isEqualTo A3A_customHint_DismissKeyDown) then {  // This is probably the fastest edge/Xor & key-down detector you can get. ~0.0034ms total execution time on non-edges (`inputAction "User12"` alone uses ~0.0017ms)(The case most of the time when key-state is not changing.).
        A3A_customHint_DismissKeyDown = !A3A_customHint_DismissKeyDown;                     // user action slot Will be selectable when client-side preferences, Soon™.
        if (A3A_customHint_DismissKeyDown) then { [] call A3A_fnc_customHintDismiss; };
    };
    if (A3A_customHint_RenderFrameCount >= 15) then {  // Render loop does not need to run every frame.
        A3A_customHint_RenderFrameCount = 1;
        [] call A3A_fnc_customHintRender;
    } else {
        A3A_customHint_RenderFrameCount = A3A_customHint_RenderFrameCount + 1;
    };
}];

A3A_customHint_InitComplete = true;
true;
