/*
Maintainer: Caleb Serafin
    Attempts to lookup a translation from the DB. If found it returns that and refreshes the Expiry.

    If the translation is not found, it will generate a new ShortID and add it.
    Then it will return the ShortID.
    This is primary tuned to the use of slick key caching for network use.
    This uses a longer TTL be default, as it is intended for "a server". This is to make sure that the "clients" don't have old translations.
    The "server" will be which ever machine is used to create and distribute the translations.

Arguments:
    <HASHMAPKEY> Translation Key
    <ANY> Translation Value
    <SCALAR> Time to live from each refresh.

Scope: Any, Local Effect
Environment: Unscheduled
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_translate;
    ["HelloWorld", parseText "Lol<br/>XD"] call A3A_fnc_keyCache_translate;
*/

#include "config.hpp"
params [
    ["_keyName", ""],
    ["_translation", ""],
    ["_lifeTime", __keyCache_getVar(A3A_keyCache_defaultTranslateSetTTL), [0]]
];

private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
private _cachedStruct = _keyCache_DB getOrDefault [_this,[_this,0,-1]];
_cachedStruct params ["_translation","_lifeTime","_expiryTime"];

if (_expiryTime > serverTime) exitWith {
    _cachedStruct set [2, serverTime + _lifeTime];
    _translation;
};

// Key not in DB or expired.
private _newTranslation = call A3A_fnc_shortID_create;
private _newLifeTime = __keyCache_getVar(A3A_keyCache_defaultTranslateSetTTL);

_keyCache_DB set [_keyName, [_newTranslation, _newLifeTime, serverTime + _newLifeTime]];
_keyName call A3A_fnc_keyCache_registerForGC;
_newTranslation;
