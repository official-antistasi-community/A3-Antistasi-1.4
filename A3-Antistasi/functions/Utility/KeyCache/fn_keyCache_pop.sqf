/*
Maintainer: Caleb Serafin
    Removes an entry from the DB and returns the translation.
    If the entry does not exist, it returns nil.

Argument:  <HASHMAPKEY> Translation Key

Return Value:
    <ANY> The translation if the key is in the DB. Otherwise, it returns nil.

Scope: Any, Local Effect
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_pop;  // nil
*/
#include "config.hpp"

private _cachedStruct = __keyCache_getVar(A3A_keyCache_DB) deleteAt _this;
// Garbage Cleaner will take care of the GC_registeredItems entry

if (isNil "_cachedStruct") exitWith {nil};
if (_cachedStruct#2 <= serverTime) exitWith {nil};
_cachedStruct#0;
