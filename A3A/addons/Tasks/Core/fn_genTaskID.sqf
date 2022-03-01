#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};

GVAR(TaskID) = GVAR(TaskID) + 1;
str GVAR(TaskID);
