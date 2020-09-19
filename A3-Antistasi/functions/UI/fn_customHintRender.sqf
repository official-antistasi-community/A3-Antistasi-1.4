/*
Function:
    A3A_fnc_customHintRender

Description:
    Renders top item on customHint queue.
    This should not be called outside of the render loop in A3A_fnc_customHintInit.

Scope:
    <LOCAL> Execute on each player to draw from individual hint queue.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
    call A3A_fnc_customHintRender;

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintRender.sqf";

if (!hasInterface || !A3A_customHintEnable) exitWith {false;}; // Disabled for server & HC.

if (count A3A_customHint_Queue isEqualTo 0) then {
    hintSilent "";
    A3A_customHint_CanRender = false;
} else{
    private _autoDismiss = 15; // seconds
    if (serverTime - A3A_customHint_LastDismiss > _autoDismiss) exitWith {
        [] call A3A_fnc_customHintDismiss;
    };
    private _alphaHex = [(((_autoDismiss + A3A_customHint_LastDismiss - serverTime) min (_autoDismiss-5)) / (_autoDismiss-5)) ] call A3A_fnc_shader_ratioToHex;
    private _dismissKey = actionKeysNames ["User12",1];
    _dismissKey = [_dismissKey,"""Use Action 12"""] select (_dismissKey isEqualTo "");
    private _footer = parseText (["<br/><t size='0.8' color='#",_alphaHex,"e5b348' shadow='1' shadowColor='#",_alphaHex,"000000' valign='top' >Press <t color='#",_alphaHex,"f0d498' >",_dismissKey,"</t> to dismiss notification. +",str((count A3A_customHint_Queue) -1),"</t>"] joinString ""); // Needs to be added to string table.

    _structuredText = composeText [A3A_customHint_Queue #0#1, _footer];
    if (A3A_customHint_Queue #0#2) then {
        hintSilent _structuredText;
    } else {
        hint _structuredText;
        A3A_customHint_Queue #0 set [2,true]; // so it does not ping more than once.
    };
};
true;

// Arma 3 Apex #218a36 // BIS Website Differs incorrectly from in-game
// Arma 3 #c48214
// Custom Orange #e5b348
