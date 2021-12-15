/*
Maintainer: Caleb Serafin
    Removes a translation from the Translation DB.

Argument:  <HASHMAPKEY> Translation Key

Scope: Any, Local Effect
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_drop;
*/
#include "config.hpp"
__fixLineNumbers
// Garbage Cleaner will take care of the GC_registeredItems entry
private _cacheStruct = __keyCache_getVar(A3A_keyCache_DB) deleteAt _this;

// Try spawn on GC event if expired
_cacheStruct params ["_translation","_lifeTime",["_expiryTime",1e39],["_fnc_onGC",nil]];
if (_expiryTime > serverTime || isNil "_fnc_onGC") exitWith {};
[_this, _translation] spawn _fnc_onGC;
