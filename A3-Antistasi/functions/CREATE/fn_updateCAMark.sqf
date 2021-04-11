#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

params ["_target", "_operation"];

if (_target isEqualType "") then {
    Debug_2("%1 CA mark for marker %2", _operation, _target);

	if (_operation == "add") then { smallCAmrk pushBackUnique _target }
	else { smallCAmrk = smallCAmrk - [_target] };
} else {
    Debug_2("%1 CA mark for position %2", _operation, _target);

	if (_operation == "add") then { smallCApos pushBack _target }
	else { smallCApos = smallCApos select { _x distance2d _target > 100 } };
};
