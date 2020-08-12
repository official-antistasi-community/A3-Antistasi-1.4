/*
Function:
    A3A_fnc_customHint

Description:
    Adds item to hint queue.
    Set enableDismissibleHints=false to use original custom hint.

Scope:
    <LOCAL> Execute on each player to add a global notification.

Environment:
    <UNSCHEDULED> Simultaneous modification may cause trampling of items in customHintQueue.

Parameters:
    <STRING> Heading of your message.
    <STRING> Body of your message.
    <BOOLEAN> Silent Notification, false if you want to annoy players. [DEFAULT=false]
    <XML IMG> Icon [DEFAULT=A3A Blood Logo,size 2]

Returns:
    <BOOLEAN> true if it hasn't crashed; false if it does not have an interface; nil if it has crashed.

Examples:
    ["Vaya...", "Parece que sus notificaciones importantes se cifraron.<br/><br/>Nadie espera el cifrado español.", false, "<img color='#ffffff' image='Pictures\Intel\laptop_error.paa' align='center' size='6' />"] remoteExec ["A3A_fnc_customHint", 0, false];

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_headerText", "", [""]], ["_bodyText", "", [""]], ["_isSilent", false, [false]], ["_iconXML", "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' />", [""]]];
private _filename = "fn_customHint.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.

if (enableDismissibleHints) then {
    private _index = customHintQueue findIf {(_x # 0) isEqualTo _headerText}; // Temporary solution until an interface is added for counters and timers.
    if (_index isEqualTo -1) then {
        customHintQueue pushBack [_headerText,_bodyText,_isSilent,_iconXML];
    } else {
        customHintQueue set [_index,[_headerText,_bodyText,_isSilent,_iconXML]];
    };
    [] call A3A_fnc_renderHint; // Allows immediate display of new hint without waiting for loop.
} else {
    // Thanks to Michael Phillips for original customHint design.
    private _logo = "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' />";
    private _separator = "<br/>";
    private _header = format["<t size='1.2' color='#e5b348' shadow='1' shadowColor='#000000'>%1</t><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _headerText];
    private _body = format["<t size='1' color='#ffffff' shadow='1' shadowColor='#000000'>%1</t><br/><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _bodyText];

    if (_isSilent) then {
        hintSilent parseText format ["%1%2%3%4%5%6%7", _logo, _separator, _separator, _header, _separator,_separator, _body];
    } else {
        hint parseText format ["%1%2%3%4%5%6%7", _logo, _separator, _separator, _header, _separator,_separator, _body];
    };
};
true;