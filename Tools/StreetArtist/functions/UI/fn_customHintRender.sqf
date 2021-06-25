/*
Function:
    A3A_fnc_customHintRender

Description:
    Renders top item on customHint queue.
    Adds the Icon and footer around the message.
    This should not be called outside of the render loop in A3A_fnc_customHintInit.

Scope:
    <LOCAL> Execute on each player to draw from individual hint queue.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if hint pushed (change or refresh); false if no hint pushed; nil if it has crashed.

Examples:
    call A3A_fnc_customHintRender;

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintRender.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.

private _fnc_hint = {
    if (A3A_customHint_playPing) then {
        hint A3A_customHint_cachedStructuredText;
        A3A_customHint_playPing = false; // so it does not ping more than once.
    } else {
        hintSilent A3A_customHint_cachedStructuredText;
    };
};

if (A3A_customHint_MSGs isEqualTo A3A_customHint_previousMSGs) exitWith {
    call _fnc_hint;
};
A3A_customHint_previousMSGs = +A3A_customHint_MSGs;

private _structuredText = composeText flatten [A3A_customHint_const_logo, A3A_customHint_MSGs apply {[A3A_customHint_const_divider, _x#1]} ];
A3A_customHint_cachedStructuredText = _structuredText;
call _fnc_hint;
true;

// Arma 3 Apex #218a36 // BIS Website Differs incorrectly from in-game
// Arma 3 #c48214
// Custom Orange #e5b348
// Custom Peach #f0d498
