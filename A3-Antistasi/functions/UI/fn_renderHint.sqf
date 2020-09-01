/*
Function:
    A3A_fnc_renderHint

Description:
    Renders top item on customHint queue.
    This should not be called outside of the render loop in A3A_fnc_initHint.

Scope:
    <LOCAL> Execute on each player to draw from individual hint queue.

Environment:
    <ANY>

Parameters:
    <BOOLEAN> Only set to true in init code. This is needed because after 30s hints fade for 5s.

Returns:
    <BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
    call A3A_fnc_renderHint;

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_loopForever",false]];
private _filename = "fn_renderHint.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.
if (_loopForever) then {
    [] spawn {
        scriptName "fn_renderHint_loop";
        uiSleep 10;
        [true] call A3A_fnc_renderHint;
    };
};
if (!enableDismissibleHints) exitWith {false;}; // Stop render in these instances.

if (count A3A_NotifQueue isEqualTo 0) then {
    hintSilent "";
} else{
    private _dismissKey = actionKeysNames ["User12",1];
    _dismissKey = [_dismissKey,"""Use Action 12"""] select (_dismissKey isEqualTo "");
    private _footer = parseText (["<br/><t size='0.8' color='#e5b348' shadow='1' shadowColor='#000000' valign='top' >Press <t color='#f0d498' >",_dismissKey,"</t> to dismiss notification. +",str((count A3A_NotifQueue) -1),"</t>"] joinString ""); // Needs to be added to string table.

    _structuredText = composeText [A3A_NotifQueue #0#1, _footer];
    if (A3A_NotifQueue #0#2) then {
        hintSilent _structuredText;
    } else {
        hint _structuredText;
        A3A_NotifQueue #0 set [2,true]; // so it does not ping more than once.
    };
};
true;


// Arma 3 Apex #218a36 // BIS Website Differs incorrectly from in-game
// Arma 3 #c48214
// Custom Orange #e5b348