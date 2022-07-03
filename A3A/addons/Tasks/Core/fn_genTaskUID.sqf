#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};

GVAR(TaskUID) = GVAR(TaskUID) + 1;
str GVAR(TaskUID);
