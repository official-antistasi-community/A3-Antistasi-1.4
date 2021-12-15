/*
Maintainer: Caleb Serafin
    Starts a garbage collector for each generation.

Scope: All
Environment: Any
Public: No

Example:
    [] call A3A_fnc_keyCache_startGarbageCollectors;
*/
#include "config.hpp"
__fixLineNumbers

#ifdef __keyCache_unitTestMode
params [["_confirmUnitTest", "", [""]]];
if (_confirmUnitTest isEqualTo "") exitWith { __log_info("Standard Insertion Protocol Aborted due to Unit Test Mode Active."); };
if (_confirmUnitTest isNotEqualTo "confirmUnitTest" || _confirmUnitTest isEqualTo "preInit") exitWith { __log_error("Unknown Code: "+str _confirmUnitTest) };
#endif
__fixLineNumbers

if (!isNil {__keyCache_getVar(A3A_keyCache_garbageCollection)}) exitWith { __log_error("Invoked Twice"); };
__keyCache_setVar(A3A_keyCache_garbageCollection, true);

// Start a GC for each of the ones listed in init.
private _keyCache_GC_generations = __keyCache_getVar(A3A_keyCache_GC_generations);
private _keyCache_garbageCollectorHandles = [];
for "_i" from 0 to count _keyCache_GC_generations-1 do {
    _keyCache_garbageCollectorHandles pushBack ([_i] spawn A3A_fnc_keyCache_garbageCollector);
};
__keyCache_setVar(A3A_keyCache_garbageCollectorHandles, _keyCache_garbageCollectorHandles);
