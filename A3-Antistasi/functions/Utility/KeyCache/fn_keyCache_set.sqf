/*
Maintainer: Caleb Serafin
    Sets or adds a translation to the DB.
    This is the manual version of translate

Arguments:
    <HASHMAPKEY> Translation Key
    <ANY> Translation Value
    <SCALAR> | <NotANumber> Time to live from each refresh. (Infinity is inserted by 1e39)
    <CODE> Event run if garbage cleaned. Scheduled environment. params ["_keyName","_translation"]. (Default = nil)

Scope: Any, Local Effect
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    ["HelloWorld", parseText "Lol<br/>XD"] call A3A_fnc_keyCache_set;
*/
#include "config.hpp"
__fixLineNumbers
params [
    ["_keyName", ""],
    "_translation",
    ["_lifeTime", __keyCache_defaultTTL, [0,1e39]],
    ["_fnc_onGC", nil, [nil, {}]]
];

// This is thread safe. Do not change the DB set and GC order, as that will make it thread unsafe.
__keyCache_getVar(A3A_keyCache_DB) set [_keyName, [_translation, _lifeTime, serverTime + _lifeTime, _fnc_onGC]];
if (finite _lifeTime) then {
    _keyName call A3A_fnc_keyCache_registerForGC;
};
