/*
Function:
    A3A_fnc_customHint

Description:
    Adds item to notification queue.
    Pre-parse body text to take control of the whole notification (except footer).
    Note: you don't need pre-parse for custom heading/body XML, just insert where plain text would go.
    Set A3A_customHintEnable=false to use original custom hint.

Scope:
    <LOCAL> Execute on each player to add a global notification.

Environment:
    <UNSCHEDULED> Simultaneous modification may cause trampling of items in A3A_customHint_MSGs.

Parameters:
    <STRING> Heading of your notification.
    <STRING> Body of your notification. | <TEXT> Provide whole notification (except footer).
    <BOOLEAN> Silent Notification, false if you want to annoy players. [DEFAULT=false]
    [<STRING>,<SCALER>] Icon Path & Aspect Ratio. [DEFAULT=["functions\UI\images\logo.paa",4] (512/128=4)]

Returns:
    <BOOLEAN> true if it hasn't crashed; false if it does not have an interface; nil if it has crashed.

Examples:
    ["FooBar", "Hello World"] call A3A_fnc_customHint;
    ["FooBar", "Hello World"] remoteExec ["A3A_fnc_customHint", 0, false];
    //Save Notify
        ["Restart Notification", "Please make your way to HQ as a restart will occure soon™<br/><br/>Please make sure you save your stats at the Map.", true] remoteExec ["A3A_fnc_customHint", 0, false];
    ["Vaya...", "Parece que sus notificaciones importantes se cifraron.<br/><br/>Nadie espera el cifrado español.", false, ["Pictures\Intel\laptop_error.paa",1]] remoteExec ["A3A_fnc_customHint", 0, false];

    // Pre-parse FooBar(Hello World) NoMacro
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
    ["_headerText", "headermissingno", [""]],
    ["_bodyText", "bodymissingno", ["",parseText""]],
    ["_isSilent", false, [false]],
    ["_iconData", ["functions\UI\images\logo.paa",4], [ [] ], 2]
];
private _filename = "fn_customHint.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.
if (isNil {A3A_customHint_InitComplete}) then { [] call A3A_fnc_customHintInit; };

private _structuredText = parseText"";
if (_bodyText isEqualType parseText"") then {
    _structuredText = _bodyText;
} else {
    _structuredText = parseText ([
        "<t size='1' color='#ffffff' font='RobotoCondensed' align='center' valign='middle' underline='0' shadow='1' shadowColor='#000000' shadowOffset='0.0625' colorLink='#0099ff' >",
        "<img size='",8/_iconData#1,"' shadowOffset='",0.015625*_iconData#1,"' image='",_iconData#0,"' /><br/><br/>",
        "<t size='1.2' color='#e5b348' >",
        _headerText,
        "</t><br/><img size='0.60' color='#e6b24a' image='functions\UI\images\img_line_ca.paa' /><br/><br/><t >",
        _bodyText,
        "</t><br/><br/><img size='0.60' color='#e6b24a' image='functions\UI\images\img_line_ca.paa' /></t>"
    ] joinString "");
}; //

if (A3A_customHintEnable) then {
    private _index = A3A_customHint_MSGs findIf {(_x #0) isEqualTo _headerText}; // Temporary solution until an programming-interface is added for counters and timers.
    if (_index isEqualTo -1) then {
        A3A_customHint_MSGs pushBack [_headerText,_structuredText,_isSilent];
    } else {
        A3A_customHint_MSGs set [_index,[_headerText,_structuredText,_isSilent]];
    };
    private _lastMSGIndex = count A3A_customHint_MSGs - 1;
    if (A3A_customHint_MSGs #(_lastMSGIndex)#0 isEqualTo _headerText) then {
        A3A_customHint_LastMSG = serverTime;
    };
} else {
    if (_isSilent) then {
        hintSilent _structuredText;
    } else {
        hint _structuredText;
    };
};
true;

// TODO: remove all `hintSilent ""` used in boot processes.
