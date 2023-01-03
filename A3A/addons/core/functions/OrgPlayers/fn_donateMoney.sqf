/*
Maintainer: Caleb Serafin
    Outcome changes depending on the provided argument!
    Transfers the desired funds from the donor to the receiver.
    The donor does not get points for donating. This was disabled due to abuse-ability.
    Function will automatically re-execute on the server if called on a client.
    Provides backwards compatibility for direct execution on client.

Arguments:
    <OBJECT> The player object who loses money.
    <OBJECT | STRING> The receiver who gains money. Either a player object or the string "faction" to donate to faction.
    <SCALAR> Amount of Euros to transfer.

Return Value:
    <BOOL> Returns true if donation successful, false if not. Will always be false if executed on non-server.

Scope: Any, Global Arguments, Global Effect
Environment: Unscheduled
Public: Yes

Example:
    [player, cursorObject, 100] call A3A_fnc_donateMoney;
    [player, "faction", 420] call A3A_fnc_donateMoney;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {
    this remoteExecCall ["A3A_fnc_donateMoney", 2];
    false;
};

params [
    ["_donateFrom", player, [objNull]],
    ["_donateTo", objNull, [objNull,""]],
    ["_donateAmount", 0, [0]]
];
Trace_1("_this: %1",_this);
if (isNull _donateFrom || !isPlayer _donateFrom) exitWith {
    Error("_donateFrom was null or not player.");
    false;  // Return
};

if (_donateAmount < 0) exitWith {
    ["Donate Money", "Donation amount must be positive."] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
    false;
};

if (typeName _donateTo isEqualTo "STRING") exitWith {
    switch (toLower _donateTo) do {
        case ("faction"): {
            if ([-_donateAmount, _donateFrom] call A3A_fnc_resourcesPlayer) exitWith {
                [0, _donateAmount] call A3A_fnc_resourcesFIA;
                //player setVariable ["score", (player getVariable ["score", 0]) + 1, true];  // (disabled due to abuse-ability.) Raise player score for donating.
                ["Donate Money", "You have donated "+str _donateAmount+" € to the faction."] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
                true;
            };
            ["Donate Money", "Insufficient Funds<br/>You're unable to donate "+str _donateAmount+" €."] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
            if (true) exitWith {false};  // Return
        };
    };
    Error("Switch case ("+toLower _donateTo+") does not match any options.");
    false;  // false
};

if (isNull _donateTo || !isPlayer _donateTo) exitWith {
    ["Donate Money", "You must be looking to a player in order to give him money."] call A3A_fnc_customHint;
    false;  // Return
};

if ([-_donateAmount, _donateFrom] call A3A_fnc_resourcesPlayer) exitWith {
    [_donateAmount, _donateTo] call A3A_fnc_resourcesPlayer;
    ["Donate Money", "You have donated "+str _donateAmount+" € to "+name _donateTo] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
    ["Donate Money", "You have received "+str _donateAmount+" € donation from "+name _donateFrom] remoteExecCall ["A3A_fnc_customHint", _donateTo];
    true;  // Return
};
["Donate Money", "Insufficient Funds<br/>You're unable to donate "+str _donateAmount+" €."] remoteExecCall ["A3A_fnc_customHint", _donateFrom];
false;  // Return
