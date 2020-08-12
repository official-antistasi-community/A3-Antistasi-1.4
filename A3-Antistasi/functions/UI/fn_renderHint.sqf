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

Authors: Michael Phillips(original customHint), Caleb Serafin
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

if (count customHintQueue isEqualTo 0) then {
    hintSilent "";
} else{
    // Thanks to Michael Phillips for original customHint design.
    (customHintQueue # 0) params [["_headerText", "", [""]], ["_bodyText", "", [""]], ["_isSilent", false, [false]], ["_iconXML", "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' />", [""]]];
    private _dismissKey = actionKeysNames ["User12",1];
    _dismissKey = [_dismissKey,"""Use Action 12"""] select (_dismissKey isEqualTo "");

    private _separator = "<br/>";
    private _header = format["<t size='1.2' color='#e5b348' shadow='1' shadowColor='#000000'>%1</t><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _headerText];
    private _body = format["<t size='1' color='#ffffff' shadow='1' shadowColor='#000000'>%1</t><br/><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _bodyText];
    private _footer = format["<t size='0.8' color='#e5b348' shadow='1' shadowColor='#000000'>Press <t color='#218a36'>%1</t> to dismiss notification. +%2</t>",_dismissKey, str((count customHintQueue) -1)]; // Needs to be added to string table.
    private _structuredText = parseText ([_iconXML, _separator, _separator, _header, _separator,_separator, _body, _separator, _footer] joinString "");
// Arma 3 Apex #218a36 // BIS Website Differs incorrectly from in-game
// Arma 3 #c48214
// Custom Orange #e5b348
    if (_isSilent) then {
        hintSilent _structuredText;
    } else {
        hint _structuredText;
        (customHintQueue select 0) set [2,true];
    };
};


true;