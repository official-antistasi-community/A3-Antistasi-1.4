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

if(!isServer) exitWith {};

// prevent weirdness
if(isNil "A3A_lastGarbageCleanTime") then {
	waitUntil {sleep 15; !isNil "A3A_lastGarbageCleanTime"};
};

while {true} do 
{
	if ((serverTime-A3A_lastGarbageCleanTime) > A3A_GCThreshold) then 
	{
		[] call A3A_fnc_garbageCleaner;
	};

	// sleep 5 minutes then check again
	sleep 300;
};