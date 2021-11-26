/*
Maintainer: Caleb Serafin
    Adds key to Garbage Collection.
    This is a function, don't copy internal code, for the case that the internal implementation changes.

Argument: <HASHMAPKEY> Key

Scope: Any, Local Arguments, Local Effect
Environment: Any
Public: No
Dependencies:
    <ARRAY> A3A_keyCache_GC_gen0NewestBucket

Example:
    "HelloWorld" call A3A_fnc_keyCache_registerForGC;
*/
#include "config.hpp"
__keyCache_getVar(A3A_keyCache_GC_gen0NewestBucket) pushBack _this;
