private _filename = "fn_updateCAMark";
if (!isServer) exitWith {
	[1, "Server-only function miscalled", _filename] call A3A_fnc_log;
};

params ["_target", "_operation"];

if (_target isEqualType "") then {
	[3, format ["%1 CA mark for marker %2", _operation, _target], _filename] call A3A_fnc_log;

	if (_operation == "add") then { smallCAmrk pushBackUnique _target }
	else { smallCAmrk = smallCAmrk - [_target] };
} else { 
	[3, format ["%1 CA mark for position %2", _operation, _target], _filename] call A3A_fnc_log;

	if (_operation == "add") then { smallCApos pushBack _target }
	else { smallCApos = smallCApos select { _x distance2d _target > 100 } };
};

