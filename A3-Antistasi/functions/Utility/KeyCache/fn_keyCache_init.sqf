/*
Maintainer: Caleb Serafin
    Initialises variables and settings used keyCache.
    Recommended to run pre-JIP.

Scope: All Machines, Local Effect
Environment: Any
Public: No

Example:
    call A3A_fnc_keyCache_init;
*/
#include "config.hpp"
__fixLineNumbers

#ifdef __keyCache_unitTestMode
    params [["_confirmUnitTest", "", [""]]];
    if (_confirmUnitTest isEqualTo "" || _confirmUnitTest isEqualTo "preInit") exitWith { __log_info("Standard Insertion Protocol Aborted due to Unit Test Mode Active."); };
    if (_confirmUnitTest isNotEqualTo "confirmUnitTest") exitWith { __log_error("Unknown Code: "+str _confirmUnitTest) };
#endif
__fixLineNumbers

if (!isNil {__keyCache_getVar(A3A_keyCache_init)}) exitWith { __log_error("Invoked Twice"); };
__keyCache_setVar(A3A_keyCache_init, true);

// Main translation DB
/*
    Key: Key <HASHMAPKEY>
    Value:
    0. Translation <ANY>
    1. LifeTime <SCALAR> (seconds)
    2. Expiry <SCALAR> (serverTime)
    3. OnGC <CODE> (nil or Code) (Code is scheduled with params ["_key","_translation"])
*/
__keyCache_setVar(A3A_keyCache_DB, createHashMap);

// A set of all registered items prevent duplicate registrations for GC
__keyCache_setVar(A3A_keyCache_GC_registeredItems, createHashMap);

// Settings for Each garbage collector generation.
//  _x params ["_allBuckets","_newestBucket","_totalPeriod","_bucketsAmount","_promotedGeneration"];  // <ARRAY>, <ARRAY>, <SCALAR>, <SCALAR>, <SCALAR>
private _keyCache_GC_generations = [
    [  // Gen0
        [], [], 2*__keyCache_defaultTTL, 3, 1
    ],
    [  // Gen1
        [], [], 5*__keyCache_defaultTTL, 3, 2
    ],
    [  // Gen2
        [], [], 12.5*__keyCache_defaultTTL, 1, 2
    ]
];
{
    _x params ["_allBuckets","_newestBucket","_totalPeriod","_bucketsAmount","_promotedGeneration"];

    for "_counter" from 1 to _bucketsAmount do {
        _allBuckets pushBack [];
    };
    _x set [1, _allBuckets #(_bucketsAmount -1)];
} forEach _keyCache_GC_generations;
__keyCache_setVar(A3A_keyCache_GC_generations, _keyCache_GC_generations);

// Shortcut for registering an object for Garbage Collection checks.
private _keyCache_GC_gen0NewestBucket = _keyCache_GC_generations#0#1;
__keyCache_setVar(A3A_keyCache_GC_gen0NewestBucket, _keyCache_GC_gen0NewestBucket);
