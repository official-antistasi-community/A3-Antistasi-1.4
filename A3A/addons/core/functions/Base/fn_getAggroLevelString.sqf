params ["_level"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if(_level > 0) and (_level < 6) exitWith {
	localize ["STR_A3A_fn_getAggroLevelString_"+ [str _level]]
};

Error_1("Bad level recieved, cannot generate string, was %1", _level);
"None"
