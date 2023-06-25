/*
    Author: [Håkon]
    [Description]
        Initilizes the LTC system for the individual client

    Arguments:
    0. <Object> Object to add the loot actions to

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call A3A_fnc_initLootToCrate;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_object", objNull, [objNull]]];

//check if action already on object
if ((actionIDs _object) findIf {
    _params = _object actionParams _x;
    (_params#0) isEqualTo "Load loot to crate"
} != -1) exitWith {};


//add load actions
_object addAction [
    "Load loot to crate",
    {
        [_this#3, clientOwner] remoteExecCall ["A3A_fnc_canLoot", 2];
    },
    _object,
    1.5,
    true,
    true,
    "",
    "(
        (attachedTo _originalTarget isEqualTo objNull)
    )",
    3
];

_object addAction [
    "Load loot from crate to vehicle",
    {
        [_this#3, clientOwner] remoteExecCall ["A3A_fnc_canTransfer", 2];
    },
    _object,
    1.5,
    true,
    true,
    "",
    "(
        (attachedTo _originalTarget isEqualTo objNull)
    )",
    3
];

nil;
