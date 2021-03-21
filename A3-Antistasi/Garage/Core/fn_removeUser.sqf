/*
    Author: [Håkon]
    [Description]
        Removes client from recipient list of garage pool updates

    Arguments:
    0. <Int> ClientID of user to remove from list

    Return Value:
    <Bool> succeded

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [clientOwner] remoteExecCall ["HR_GRG_fnc_removeUser",2];

    License: MIT License
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_client"];
if !(isServer) exitWith {false};
if (isNil "_client") exitWith {false};
if !(_client isEqualType 0) exitWith {false};
if (isNil "HR_GRG_Users") exitWith {false};
Trace_1("Removing user: %1", _client);
HR_GRG_Users deleteAt (HR_GRG_Users find _client);
true
