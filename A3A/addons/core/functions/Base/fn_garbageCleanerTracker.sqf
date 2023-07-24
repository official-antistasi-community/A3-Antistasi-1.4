#include "..\..\script_component.hpp"
/*
Author: Killerswin2, Giddi
    Automatic/backup garbage cleaner with fix time slices
Arguments:
    NONE

Return Value:
    <nil>

Scope: Server
Environment: scheduled
Public: yes
Dependencies:
    None
Example:
*/

#define GC_THRESHOLD_DISABLE 0

#define GC_NOTIFY_CHECK_INTERVAL 10

#define GC_FINAL_WARNING_SECONDS 120

if(!isServer) exitWith {};
if(A3A_GCThreshold isEqualTo GC_THRESHOLD_DISABLE) exitWith {};




private _storedLastGCTime = A3A_lastGarbageCleanTime;

private _fnc_conditionalSleep = {
    private _returnValue = false;
    private _targetEndTime = serverTime + GC_NOTIFY_CHECK_INTERVAL;

    while {serverTime < _targetEndTime} do {

        if not (_storedLastGCTime isEqualTo A3A_lastGarbageCleanTime) then {
            _returnValue = true;
            break;
        };

        sleep 1;
    };


    _returnValue;
};



private _onRemind = {
    private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    private _timeUntilForcedGC = [[(A3A_lastGarbageCleanTime + A3A_GCThreshold)-serverTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    [localize "STR_A3A_GCTracker_tracker_title", format [localize "STR_A3A_GCTracker_tracker_notification", _timeSinceLastGC, _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
    Debug_2("Garbage Cleaner Tracker has notified players of last gc time %1 and time until forced gc %2", _timeSinceLastGC, _timeUntilForcedGC);
};


private _onFinalWarning = {

    private _timeUntilForcedGC = [[(A3A_lastGarbageCleanTime + A3A_GCThreshold)-serverTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    ["Final Warning", format ["Automatic Garbage Clean incoming in %1", _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
    Debug("Garbage Cleaner Tracker has notified players of finalWarning for auto GC");

};



private _onAutoGC = {
    private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    private _actualGCThresholdTime = [[A3A_GCThreshold] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;

    [] call A3A_fnc_garbageCleaner;
    [localize "STR_A3A_GCTracker_tracker_title", localize "STR_A3A_GCTracker_tracker_ran_gc"] remoteExec ["A3A_fnc_customHint", 0];

    Debug_2("Garbage Cleaner Tracker has ran a gc as players reached threshold, time since last gc: %1, actual gc threshold time: %2", _timeSinceLastGC, _actualGCThresholdTime);
};



private _contextQueue = [];

private _currentContext = [];



private _getNewContextQueue = {

    private _singleStepTime = (A3A_GCThreshold/4);

    private _out = [
        [A3A_lastGarbageCleanTime + (_singleStepTime*1), _onRemind],
        [A3A_lastGarbageCleanTime + (_singleStepTime*2), _onRemind],
        [A3A_lastGarbageCleanTime + (_singleStepTime*3), _onRemind],
        [(A3A_lastGarbageCleanTime + A3A_GCThreshold)-GC_FINAL_WARNING_SECONDS, _onFinalWarning],
        [A3A_lastGarbageCleanTime+A3A_GCThreshold, _onAutoGC],
        [999999, nil]
    ];


    _out;
};

private _resetTracker = {



    _storedLastGCTime = A3A_lastGarbageCleanTime;

    _contextQueue = call _getNewContextQueue;
    _currentContext = _contextQueue select 0;

    Debug("Reseted GC Tracker");
};


call _resetTracker;

while {true} do {


    if  (call _fnc_conditionalSleep) then {
        call _resetTracker;
    };

    if (isNil {_currentContext select 1}) then {continue;};

    if (serverTime >= (_currentContext select 0)) then {
        call (_currentContext select 1);
        _contextQueue deleteAt 0;
        _currentContext = _contextQueue select 0;

    };


};