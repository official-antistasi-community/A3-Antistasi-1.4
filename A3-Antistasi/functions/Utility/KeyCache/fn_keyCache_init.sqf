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
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

#ifdef __keyCache_unitTestMode
    params [["_confirmUnitTest", "", [""]]];
    if (_confirmUnitTest isEqualTo "") exitWith { ServerInfo("Standard Insertion Protocol Aborted due to Unit Test Mode Active."); };
    if (_confirmUnitTest isNotEqualTo "confirmUnitTest") exitWith { ServerError_1("Unknown Code: %1", _confirmUnitTest); };
#endif
FIX_LINE_NUMBERS()

if (!isNil {__keyCache_getVar(A3A_keyCache_init)}) exitWith { ServerError("Invoked Twice"); };
__keyCache_setVar(A3A_keyCache_init, true);

// Main Key DB used for translations
__keyCache_setVar(A3A_keyCache_DB, createHashMap);

// Prevent double additions to GC
__keyCache_setVar(A3A_keyCache_GC_registeredItems, createHashMap);

// Default Time to live.
private _keyCache_defaultTTL = 120;
__keyCache_setVar(A3A_keyCache_defaultTTL, _keyCache_defaultTTL);

private _keyCache_defaultTranslateSetTTL = 1.20 * _keyCache_defaultTTL;
__keyCache_setVar(A3A_keyCache_defaultTranslateSetTTL, _keyCache_defaultTranslateSetTTL);

// Minimum amount of items in a processed span of a chunk
private _keyCache_GC_minSpanSize = 10;
__keyCache_setVar(A3A_keyCache_GC_minSpanSize, _keyCache_GC_minSpanSize);

// Settings for Each garbage collector generation.
//  _x params ["_allBuckets","_newestBucket","_totalPeriod","_bucketsAmount","_promotedGeneration"];  // <ARRAY>, <ARRAY>, <SCALAR>, <SCALAR>, <SCALAR>
private _keyCache_GC_generations = [
    [  // Gen0
        [], [], 2*_keyCache_defaultTTL, 3, 1
    ],
    [  // Gen1
        [], [], 5*_keyCache_defaultTTL, 3, 2
    ],
    [  // Gen2
        [], [], 12.5*_keyCache_defaultTTL, 1, 2
    ]
];
{
    _x params ["_allBuckets","_newestBucket","_totalPeriod","_bucketsAmount","_promotedGeneration"];

    for "_c" from 1 to _bucketsAmount do {
        _allBuckets pushBack [];
    };
    _x set [1, _allBuckets #(_bucketsAmount -1)];
} forEach _keyCache_GC_generations;
__keyCache_setVar(A3A_keyCache_GC_generations, _keyCache_GC_generations);

// Shortcut for registering an object for Garbage Collection checks.
private _keyCache_GC_gen0NewestBucket = _keyCache_GC_generations#0#1;
__keyCache_setVar(A3A_keyCache_GC_gen0NewestBucket, _keyCache_GC_gen0NewestBucket);
