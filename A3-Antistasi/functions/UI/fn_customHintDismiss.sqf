/*
Function:
    A3A_fnc_customHintDismiss

Description:
    Dequeues the top hint.
    If _dismissAll then it will empty the entire queue.

Scope:
    <LOCAL> Executed by each player to dequeue an item from their queue.

Environment:
    <UNSCHEDULED> Suspensions may lead to the user pressing the action-key twice before call A3A_fnc_customHintRender. This results in dequeuing two items.

Parameters:
    <BOOLEAN> true to empty whole queue. [DEFAULT=false]

Returns:
    <BOOLEAN> true if hint(s) dequeued; false if A3A_customHintQueue is empty; nil if it has crashed.

Examples:
    call A3A_fnc_customHintDismiss;
    [true] call A3A_fnc_customHintDismiss; // Clear all

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_dismissAll",false]];
private _filename = "fn_customHintDismiss.sqf";

if (!hasInterface || !A3A_customHintEnable) exitWith {false;}; // Disabled for server & HC.
if (_dismissAll) then {
    A3A_customHintQueue = [];
} else {
    if !(count A3A_customHintQueue isEqualTo 0) then {
        A3A_customHintQueue deleteAt 0
    }
};
[] call A3A_fnc_customHintRender;

true;
