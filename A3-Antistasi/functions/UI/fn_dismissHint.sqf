/*
Function:
    A3A_fnc_dismissHint

Description:
    Dequeues the top hint.
    If _dismissAll then it will empty the entire queue.

Scope:
    <LOCAL> Executed by each player to dequeue an item from their queue.

Environment:
    <UNSCHEDULED> Suspensions may lead to the user pressing the action-key twice before call A3A_fnc_renderHint. This results in dequeuing two items.

Parameters:
    <BOOLEAN> true to empty whole queue. [DEFAULT=false]

Returns:
    <BOOLEAN> true if hint(s) dequeued; false if A3A_NotifQueue is empty; nil if it has crashed.

Examples:
    call A3A_fnc_dismissHint;
    [true] call A3A_fnc_dismissHint; // Clear all

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_dismissAll",false]];
private _filename = "fn_dismissHint.sqf";

if (!hasInterface || !enableDismissibleHints) exitWith {false;}; // Disabled for server & HC.
if (_dismissAll) then {
    A3A_NotifQueue = [];
} else {
    if !(count A3A_NotifQueue isEqualTo 0) then {
        A3A_NotifQueue deleteAt 0
    }
};
[] call A3A_fnc_renderHint;

true;
