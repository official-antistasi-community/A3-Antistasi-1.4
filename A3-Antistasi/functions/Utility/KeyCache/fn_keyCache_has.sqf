/*
Maintainer: Caleb Serafin
    Checks if the translation DB has a given translation whom has not expired.

Argument:  <HASHMAPKEY> Translation Key

Return Value:
    <BOOL> Whether the key is in the Translation DB

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> A3A_keyCache_DB

Example:
    "HelloWorld" call A3A_fnc_keyCache_has;  // false
*/
#include "config.hpp"
(
    __keyCache_getVar(A3A_keyCache_DB) getOrDefault [
        _this,
        [nil,nil,-1,nil]
    ]
)#2 > serverTime;
