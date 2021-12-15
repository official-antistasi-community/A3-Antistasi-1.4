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
__keyCache_getVar(A3A_keyCache_DB) deleteAt _this;
