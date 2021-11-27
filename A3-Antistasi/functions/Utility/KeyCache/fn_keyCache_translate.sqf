/*
Maintainer: Caleb Serafin
    Attempts to lookup a translation from the DB. If found it returns that and refreshes the Expiry.

    If the translation is not found, it will call the _fnc_newTranslation code.
    By default, this generates a new ShortID.
    Then it will return the translation.
    This is primary tuned to the use of slick key caching for network use.
    This uses a longer TTL be default, as it is intended for "a server". This is to make sure that the "clients" don't have old translations.
    The "server" will be which ever machine is used to create and distribute the translations.

Arguments:
    <HASHMAPKEY> Translation Key
    <CODE> Code that returns a translation value. It is called if the translation does not exist in the DB.
    <SCALAR> Time to live from each refresh.

Scope: Any, Local Effect
Environment: Unscheduled
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_translate;

    ["HelloWorld", {"CS"}] call A3A_fnc_keyCache_translate;

    private _translation = "CS";
    ["HelloWorld", {_translation}] call A3A_fnc_keyCache_translate;  // The _translation variable will still be in scope. Make sure that your chosen variable does not collide.
*/

#include "config.hpp"
params [
    ["_keyName", ""],
    ["_fnc_newTranslation", A3A_fnc_shortID_create, [{}]],
    ["_newLifeTime", __keyCache_getVar(A3A_keyCache_defaultTranslateSetTTL), [0]]
];

private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
private _cachedStruct = _keyCache_DB getOrDefault [_this,[_this,0,-1]];
_cachedStruct params ["_cachedTranslation","_lifeTime","_expiryTime"];

if (_expiryTime > serverTime) exitWith {
    // Key in DB and still fresh.
    _cachedStruct set [2, serverTime + _lifeTime];
    _cachedTranslation;
};

// Key not in DB or expired.
private _newTranslation = call _fnc_newTranslation;
_keyCache_DB set [_keyName, [_newTranslation, _newLifeTime, serverTime + _newLifeTime]];
_keyName call A3A_fnc_keyCache_registerForGC;
_newTranslation;
