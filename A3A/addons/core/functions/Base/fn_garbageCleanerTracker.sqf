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
#define GC_THRESHOLD_DISABLE 9999999

if(!isServer) exitWith {};
if(A3A_GCThreshold isEqualTo GC_THRESHOLD_DISABLE) exitWith {};

// prevent weirdness
if((isNil "A3A_lastGarbageCleanTime") && (isNil "A3A_lastGarbageCleanTimeNote")) then {
	waitUntil {sleep 15; ((!isNil "A3A_lastGarbageCleanTime") && (!isNil "A3A_lastGarbageCleanTimeNote"))};
};


while {true} do 
{
	// notify players of last gc time
	if ((serverTime-A3A_lastGarbageCleanTimeNote) > A3A_GCThresholdNotification) then 
	{
		private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
		[localize "STR_A3A_GCTracker_tracker_title", format [localize "STR_A3A_GCTracker_tracker_notification", _timeSinceLastGC]] remoteExec ["A3A_fnc_customHint", 0];
		missionNamespace setVariable ["A3A_lastGarbageCleanTimeNote",serverTime,true];
		Info_1("Garbage Cleaner Tracker has notified players of last gc time %1", _timeSinceLastGC);
	};

	// if the gc time goes above the threshold then it's time to gc.
	if ((serverTime-A3A_lastGarbageCleanTime) > A3A_GCThreshold) then 
	{
		[] call A3A_fnc_garbageCleaner;
		[localize "STR_A3A_GCTracker_tracker_title", localize "STR_A3A_GCTracker_tracker_ran_gc"] remoteExec ["A3A_fnc_customHint", 0];
		Info("Garbage Cleaner Tracker has ran gc of as players reached threshold");
	};

	// sleep 5 minutes then check again
	sleep 300;
};