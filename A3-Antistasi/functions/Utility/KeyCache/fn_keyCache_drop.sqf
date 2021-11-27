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
// Garbage Cleaner will take care of the GC_registeredItems entry
private _cacheStruct = __keyCache_getVar(A3A_keyCache_DB) deleteAt _this;

_cachedStruct params ["_translation","","","_fnc_onDispose"];
if (isNil "_fnc_onDispose") exitWith {};
[_this, _translation] spawn _fnc_onDispose;
