/*
Function:
    A3A_fnc_customHint

Description:
    Adds item to notification queue.
    Pre-parse body text to take control of the space in-between the top A3 icon and footer.
    Note: you don't need pre-parse for custom heading/body XML, just insert where plain text would go.

Scope:
    <LOCAL> Execute on each player to add a global notification.

Environment:
    <UNSCHEDULED> Simultaneous modification may cause trampling of items in A3A_customHint_MSGs.

Parameters:
    <STRING> Heading of your notification.
    <STRING> Body of your notification. | <TEXT> Provide whole notification (except footer).
    <BOOLEAN> Silent Notification, false if you want to annoy players. [DEFAULT=false]
    <STRING> notification ID. Using the Same ID overwrites the previous notification. Notifications are sorted in descending order. Default = -1

Returns:
    <BOOLEAN> true if it hasn't crashed; false if it does not have an interface; nil if it has crashed.

Examples:
    ["FooBar", "Hello World"] call A3A_fnc_customHint;
    ["FooBar", "Hello World"] remoteExec ["A3A_fnc_customHint", 0, false];
    //Save Notify
        ["Restart Notification", "Please make your way to HQ as a restart will occure soon™<br/><br/>Please make sure you save your stats at the Map.", true] remoteExec ["A3A_fnc_customHint", 0, false];
    ["Vaya...", "Parece que sus notificaciones importantes se cifraron.<br/><br/>Nadie espera el cifrado español.", false, ["Pictures\Intel\laptop_error.paa",1]] remoteExec ["A3A_fnc_customHint", 0, false];

    // Pre-parse FooBar
        private _iconXML = parseText "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' shadow='1' shadowColor='#000000' />";
        private _separator  = parseText "<br/><img color='#e6b24a' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />";
        private _header = parseText "<br/><br/><t size='1.2' color='#e5b348' shadow='1' shadowColor='#000000'>FooBar</t>";
        private _body = parseText "<br/><br/><t size='1' color='#ffffff' shadow='1' shadowColor='#000000'>Hello World</t><br/>";
        FooBarParse = composeText [_iconXML, _header, _separator, _body, _separator];
        ["FooBar", FooBarParse] call A3A_fnc_customHint;

Authors: Michael Phillips(original customHint), Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_headerText", "headermissingno", ["",A3A_const_emptyText]],
    ["_bodyText", "bodymissingno", ["",A3A_const_emptyText]],
    ["_isSilent", false, [false]],
    ["_notificationID", -1, [0]]
];

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.

private _fnc_parseIfString = {
    params ["_stringOrText","_XMLAttributes"];
    if (_stringOrText isEqualType A3A_const_emptyText) exitWith {_stringOrText};
    parseText ("<t "+_XMLAttributes+" >"+_stringOrText+"</t>");
};

private _structuredText = composeText [
    [_headerText,"size='"+str(1.1*A3A_NGSA_baseTextSize)+"' color='#e5b348' font='RobotoCondensed' align='center' valign='middle' underline='0' shadow='1' shadowColor='#000000' shadowOffset='0.0625' colorLink='#0099ff'"] call _fnc_parseIfString,
    lineBreak,
    [_bodyText,"size='"+str(A3A_NGSA_baseTextSize)+"' color='#ffffff' font='RobotoCondensed' align='left' valign='middle' underline='0' shadow='1' shadowColor='#000000' shadowOffset='0.0625' colorLink='#0099ff'"] call _fnc_parseIfString
];

private _index = A3A_customHint_MSGs findIf {(_x#0) <= _notificationID};
if (_index isEqualTo -1) then {
    A3A_customHint_MSGs pushBack [_notificationID,_structuredText];
} else {
    if (A3A_customHint_MSGs#_index#0 == _notificationID) then {
        A3A_customHint_MSGs set [_index,[_notificationID,_structuredText]];
    } else {
        A3A_customHint_MSGs insert [_index,[ [_notificationID,_structuredText] ]];
    };
};

A3A_customHint_playPing = A3A_customHint_playPing || !_isSilent;
A3A_customHint_UpdateTime = serverTime;
[] call A3A_fnc_customHintRender;

true;
