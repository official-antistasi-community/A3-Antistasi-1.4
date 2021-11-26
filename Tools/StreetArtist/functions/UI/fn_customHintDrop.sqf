/*
Function:
    A3A_fnc_customHintDrop

Description:
    Drops the hint with a matching ID.

Scope:
    <LOCAL> Executed by each player to drop an item from their queue.

Environment:
    <UNSCHEDULED> Suspensions may lead to the user pressing the action-key twice before call A3A_fnc_customHintRender. This results in dequeuing two items.

Parameters:
    <BOOLEAN> true to empty whole queue. [DEFAULT=false]

Returns:
    <BOOLEAN> true if removed; false if ID not found.

Examples:
    69 call A3A_fnc_customHintDrop;

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [["_notificationID",-1]];

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.

private _index = A3A_customHint_MSGs findIf {_x#0 == _notificationID};
if (_index == -1) exitWith {false};

A3A_customHint_MSGs deleteAt _index;
A3A_customHint_UpdateTime = serverTime;
[] call A3A_fnc_customHintRender;  // Instant update will be preferred when user is dismissing notifications.
true;
