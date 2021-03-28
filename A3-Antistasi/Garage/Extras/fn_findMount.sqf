/*
    Author: [Håkon]
    [Description]
        Trys to find a static of a kind to accomodate a request/release from client

    Arguments:
    0. <String> Player UID
    1. <String> Class name of static
    2. <Int>    Requesting or releasing
    3. <Int>    ClientID

    Return Value:
    <Bool> Request granted

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [getPlayerUID player, _index, _newIconIndex, clientOwner, player] remoteExecCall ["HR_GRG_fnc_findMount",2];

    License: Håkon Rydland Garage SHARED SOURCE LICENSE
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_UID", "_vehUID", "_newIconIndex", "_owner", "_player"];
Trace_4("Finding available mount | UID: %1 | vehUID: %2 | Reserving: %3 | Client: %4", _UID, _vehUID, _newIconIndex, _owner);
private _failed = { [localize "STR_HR_GRG_Feedback_requestMount_Denied"] remoteExec ["Hint", _owner]; [true] remoteExecCall ["HR_GRG_fnc_toggleConfirmBttn", _owner]; false };
if (!isServer) exitWith {call _failed; false};

private _cat = HR_GRG_vehicles#4;
private _mount = _cat get _vehUID;
private _CheckedUID = ["",_UID] select (_newIconIndex isEqualTo 1);

//block checkout condition
if (
    !((_mount#2) in ["",_UID])                          //locked by someone else
    && !(_player isEqualTo (_player call HR_GRG_cmdClient))       //cmd overwrite
) exitWith {call _failed; false};
if !((_mount#3) in ["", _UID]) exitWith {call _failed; false}; //Checked out by someone else

//check out mount
_mount set [3, _CheckedUID];
[nil, _CheckedUID, 4, _vehUID, _player, false] call HR_GRG_fnc_broadcast;
true;
