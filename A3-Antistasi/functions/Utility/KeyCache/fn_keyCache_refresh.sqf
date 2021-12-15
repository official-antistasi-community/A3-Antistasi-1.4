/*
Maintainer: Caleb Serafin
    Refreshes the expiry of a translation in the DB.
    Will not refresh if the translation does not exist, or if it has already expired but waiting for GC.

Argument: <HASHMAPKEY> Translation Key

Scope: Any, Local Effect
Environment: Unscheduled
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_refresh;
*/
#include "config.hpp"

private _cachedStruct = __keyCache_getVar(A3A_keyCache_DB) getOrDefault [_this,[nil,nil,-1,nil]];
if (_cachedStruct#2 <= serverTime) exitWith {};
_cachedStruct set [2, serverTime + _cachedStruct#1];
