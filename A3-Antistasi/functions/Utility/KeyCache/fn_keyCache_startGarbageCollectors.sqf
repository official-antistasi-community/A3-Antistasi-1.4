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
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

#ifdef __keyCache_unitTestMode
params [["_confirmUnitTest", "", [""]]];
if (_confirmUnitTest isEqualTo "") exitWith { ServerInfo("Standard Insertion Protocol Aborted due to Unit Test Mode Active."); };
if (_confirmUnitTest isNotEqualTo "confirmUnitTest") exitWith { ServerError_1("Unknown Code: %1", _confirmUnitTest); };
#endif
FIX_LINE_NUMBERS()

if (!isNil {__keyCache_getVar(A3A_keyCache_garbageCollection)}) exitWith { ServerError("Invoked Twice"); };
__keyCache_setVar(A3A_keyCache_garbageCollection, true);

// Start a GC for each of the ones listed in init.
private _keyCache_GC_generations = __keyCache_getVar(A3A_keyCache_GC_generations);
private _keyCache_garbageCollectorHandles = [];
for "_i" from 0 to count _keyCache_GC_generations-1 do {
    _keyCache_garbageCollectorHandles pushBack ([_i] spawn A3A_fnc_keyCache_garbageCollector);
};
__keyCache_setVar(A3A_keyCache_garbageCollectorHandles, _keyCache_garbageCollectorHandles);
