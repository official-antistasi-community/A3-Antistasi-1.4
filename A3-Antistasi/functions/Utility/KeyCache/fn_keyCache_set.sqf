/*
Maintainer: Caleb Serafin
    Sets or adds a translation to the DB.
    This is the manual version of translate

Arguments:
    <HASHMAPKEY> Translation Key
    <ANY> Translation Value
    <SCALAR> Time to live from each refresh.

Scope: Any, Local Effect
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    ["HelloWorld", parseText "Lol<br/>XD"] call A3A_fnc_keyCache_set;
*/
#include "config.hpp"
params [
    ["_keyName", ""],
    ["_translation", ""],
    ["_lifeTime", __keyCache_getVar(A3A_keyCache_defaultTTL), [0]]
];

private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
// This should be thread safe. Do not change the set and GC order, as that will not make it thread safe.
_keyCache_DB set [_keyName, [_translation, _lifeTime, serverTime + _lifeTime]];
_keyName call A3A_fnc_keyCache_registerForGC;
