
#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

{ terminate _x; } forEach __keyCache_getVar(A3A_keyCache_garbageCollectorHandles);
__keyCache_setVar(A3A_keyCache_garbageCollection, nil);
