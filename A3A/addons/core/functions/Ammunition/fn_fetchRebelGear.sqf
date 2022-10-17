/*
    Ensures A3A_rebelGear and related caches are valid and updated for equipping rebel AIs

Parameters:
    None, returns nothing

Environment:
    Scheduled, executed anywhere
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Send current version of rebelGear from server if we're out of date
if (!isNil "A3A_rebelGear" and { A3A_rebelGear get "Version" == A3A_rebelGearVersion}) exitWith {};

Info("Fetching new version of rebelGear data...");
[clientOwner, "A3A_rebelGear"] remoteExecCall ["publicVariableClient", 2];
waitUntil { sleep 1; !isNil "A3A_rebelGear" and { A3A_rebelGear get "Version" == A3A_rebelGearVersion } };
Info("New version of rebelGear data received");

// Create/clear local accessory-compatibility caches
A3A_rebelOpticsCache = createHashMap;
A3A_rebelFlashlightsCache = createHashMap;
