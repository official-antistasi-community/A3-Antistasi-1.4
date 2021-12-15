/*
Maintainer: Caleb Serafin
    Checks if a key is in the translation DB.
    If it is contained, it updates the expiry and returns the translation.
    If it is not contained, it returns the input key.

Argument:  <HASHMAPKEY> Translation Key

Return Value:
    <ANY> The translation if the key is in the DB. Otherwise, it returns the input key.

Scope: Any, Local Effect
Environment: Unscheduled
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_lookup;  // "HelloWorld"
*/
#include "config.hpp"
__fixLineNumbers

private _cachedStruct = __keyCache_getVar(A3A_keyCache_DB) getOrDefault [_this,[_this,0,-1]];
_cachedStruct params ["_translation","_lifeTime","_expiryTime","_fnc_onDispose"];

if (_expiryTime <= serverTime) exitWith {_this};
_cachedStruct set [2, serverTime + _lifeTime];
_translation;
