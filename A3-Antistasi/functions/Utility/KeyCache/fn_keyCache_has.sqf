/*
Maintainer: Caleb Serafin
    Checks if the translation DB has a given translation.

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
_this in __keyCache_getVar(A3A_keyCache_DB);
