/*
Maintainer: Caleb Serafin
    CUSTOM TRAVELLING NOT IMPLEMENTED YET. internally calls A3A_fnc_fastTravelRadio for actual FT. Arguments & Return will change.
    Immediately starts fast travel.
    Assumes that permission and financials have been approved.
    Returns event that can be subscribed/unsubscribe to.

Arguments:
    <OBJECT> | <GROUP> | <ARRAY<OBJECT>> Thing(s) being fast travelled.
    <POS2D> Destination.
    <CODE> Optional Cancellation event. Currently unobserved. [DEFAULT = nil]

Return Value:
    <CODE> Task completed event.

Scope: Any, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    private _taskCompletedEvent = [player, getPos _petrosWhitePowderHouse] call A3A_fnc_fastTravelAsync;
    _continuation = {
        params ["_isCompletedSuccessfully", "_exceptions"];
        if (!_isCompletedSuccessfully) exitWith {};
        ["Petros", "You took your time."] call A3A_fnc_customHint;
    }
    [_continuation] call _taskCompletedEvent;  // Add continuation

    // Poll event
    private _isComplete = false;
    [{_isComplete = true;}] call _taskCompletedEvent;
    while {!_isComplete} do {
        uiSleep 0.1;
    }
    ["Petros", "You took your time."] call A3A_fnc_customHint;
*/

params [
    ["_targets", objNull, [objNull, grpNull, []]],
    ["_destination", nil, [[]], [2,3]],
    ["_cancellationEvent", {}, [{}]]
];

private _task = [false,false,[],[]];
// _task params ["_isCompleted","_isCompletedSuccessfully","_exceptions","_eventHandlers"];

[_task] spawn {
    _this params ["_task"];

    [] call A3A_fnc_fastTravelRadio;

    isNil {
        _task set [0, true];
        _task set [1, true];
        _task params ["_isCompleted", "_isCompletedSuccessfully", "_exceptions", "_eventHandlers"];
        {[_isCompletedSuccessfully, _exceptions] call _x} foreach _eventHandlers;
    };
};

// Variables captured from context: _task
private _taskCompletedEvent = {
    params [
        ["_eventHandler", {}, [{}]],
        ["_unsubscribe", false, [false]]
    ];
    isNil {
        _task params ["_isCompleted","_isCompletedSuccessfully","_exceptions","_eventHandlers"];
        if (_unsubscribe) exitWith { _eventHandlers deleteAt (_eventHandlers find _eventHandler); };
        if (_eventHandler in _eventHandlers) exitWith {};  // Even if even is complete, event handler will not be double called.
        if (_isCompleted) exitWith {
            [_isCompletedSuccessfully, _exceptions] call _eventHandler;
        };
        _eventHandlers pushBack _eventHandler;
    };
};
_taskCompletedEvent; // Returned