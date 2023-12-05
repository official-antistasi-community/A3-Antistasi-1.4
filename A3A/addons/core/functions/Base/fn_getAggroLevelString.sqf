params ["_level"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if(_level == 1) exitWith {localize "STR_A3A_fn_getAggroLevelString_1"};
if(_level == 2) exitWith {localize "STR_A3A_fn_getAggroLevelString_2"};
if(_level == 3) exitWith {localize "STR_A3A_fn_getAggroLevelString_3"};
if(_level == 4) exitWith {localize "STR_A3A_fn_getAggroLevelString_4"};
if(_level == 5) exitWith {localize "STR_A3A_fn_getAggroLevelString_5"};
Error_1("Bad level recieved, cannot generate string, was %1", _level);
"None"
