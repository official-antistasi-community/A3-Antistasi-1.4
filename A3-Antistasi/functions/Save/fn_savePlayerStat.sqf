private _playerUID = _this select 0;
private _varName = _this select 1;
private _varValue = _this select 2;
private _abort = false;

if (isNil "_playerUID") then {
	_playerUID = "";
	_abort = true;
};
if (isNil "_varName") then {
	_varName = "";
	_abort = true;
};
if (isNil "_varValue") then {
	_varValue = "";
	_abort = true;
};
if (_abort) exitWith {
	diag_log format ["[Antistiasi] Save invalid for %1, saving %3 as %2", _playerUID, _varName, _varValue];
};
private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
[_playerVarName, _varValue] call A3A_fnc_setStatVariable;