/*
    Author: [Håkon]
    [Description]
        Handles vehicle selection change requests from clients

    Arguments:
    0. <String> Player UID
    1. <Int>    Category index
    2. <Int>    Index

    Return Value:
    <Bool> Success

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [HR_GRG_PlayerUID, _newCat, _newIndex] remoteExecCall ["HR_GRG_fnc_requestSelectionChange",2];

    License: MIT License
*/
#include "defines.inc"
params ["_UID", "_catIndex", "_vehUID", "_player", "_client"];
Trace_3("Vehicle change requested | UID: %1 | Cat: %2 | vehUID: %3", _UID, _cat, _vehUID);
private _exit = { [true] remoteExecCall ["HR_GRG_fnc_toggleConfirmBttn", _client] };
if (!isServer) exitWith {call _exit; false};
if (_UID isEqualTo "") exitWith {call _exit; false};
if (-1 in [_catIndex, _vehUID]) exitWith {call _exit; false};

private _cat = HR_GRG_Vehicles#_catIndex;
private _index = _cat findIf { (_x#4) isEqualTo _vehUID };
private _vehicle = _cat#_index;

if !( ((_vehicle#2) in ["", _UID]) || (_player isEqualTo call HR_GRG_cmdClient) ) exitWith {call _exit; false};
if !((_vehicle#3) in ["", _UID] ) exitWith {call _exit; false};

[_UID] call HR_GRG_fnc_releaseAllVehicles;
_vehicle set [3, _UID];

Trace_4("Vehicle at | Cat: %1 | vehUID: %2 | At Index: %3 | checked out by UID: %4", _catIndex, _vehUID, _index, _UID);
[nil,_UID, _catIndex, _vehUID, _player, true] call HR_GRG_fnc_broadcast;
true
