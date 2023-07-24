#include "..\..\script_component.hpp"
/*
Author: [Killerswin2]
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

#define GC_THRESHOLD_MINIMUM 480

#define GC_NOTIFY_CHECK_INTERVAL 30



if(!isServer) exitWith {};
if(A3A_GCThreshold isEqualTo GC_THRESHOLD_DISABLE) exitWith {};

private _singleRemindValue = 1 max (ceil ((A3A_GCThreshold / GC_NOTIFY_CHECK_INTERVAL) / 4));

private _remindIntervalValues = [(_singleRemindValue*1),
                                (_singleRemindValue*2),
                                (_singleRemindValue*3)];


private _autoGCValue = _singleRemindValue*4;
private _finalWarningValue = _autoGCValue -1;


private _intervalCount = 0;


private _lastGCTime = A3A_lastGarbageCleanTime;

private _fnc_conditionalSleep_while = {
    private _returnValue = false;
    private _targetEndTime = serverTime + GC_NOTIFY_CHECK_INTERVAL;

    while {serverTime < _targetEndTime} do {

        if not (_lastGCTime isEqualTo A3A_lastGarbageCleanTime) then {
            _returnValue = true;
            break;
        };

        uiSleep 1;
    };


    _returnValue;
};



while {true} do {


    _intervalCount=_intervalCount + 1;

    if  (call _fnc_conditionalSleep_while) then {
        _intervalCount = 0;
        _lastGCTime = A3A_lastGarbageCleanTime;
        Debug("gc was detected by Garbage Cleaner Tracker");
        continue;
    };


    if (_intervalCount == _finalWarningValue) then {

        private _timeUntilForcedGC = [[(_autoGCValue - _intervalCount)*GC_NOTIFY_CHECK_INTERVAL] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
        ["Final Warning", format ["Automatic Garbage Clean incoming in %1", _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
        Debug("Garbage Cleaner Tracker has notified players of finalWarning for auto GC");
        continue;
    };


    if (_intervalCount in _remindIntervalValues) then {
        private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
        private _timeUntilForcedGC = [[(_autoGCValue - _intervalCount)*GC_NOTIFY_CHECK_INTERVAL] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
        [localize "STR_A3A_GCTracker_tracker_title", format [localize "STR_A3A_GCTracker_tracker_notification", _timeSinceLastGC, _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
        Debug_2("Garbage Cleaner Tracker has notified players of last gc time %1 and time until forced gc %2", _timeSinceLastGC, _timeUntilForcedGC);
        continue;
    };



    if (_intervalCount >= _autoGCValue) then {
        private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
        private _actualGCThresholdTime = [[A3A_GCThreshold] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;

        [] call A3A_fnc_garbageCleaner;
        [localize "STR_A3A_GCTracker_tracker_title", localize "STR_A3A_GCTracker_tracker_ran_gc"] remoteExec ["A3A_fnc_customHint", 0];

        Debug_2("Garbage Cleaner Tracker has ran a gc as players reached threshold, time since last gc: %1, actual gc threshold time: %2", _timeSinceLastGC, _actualGCThresholdTime);
        continue;
    };

};