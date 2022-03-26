// Previously fn_loadStat -Hazey

private ["_varName","_varValue"];

_varName = _this select 0;
_varValue = [_varName] call A3A_fnc_returnSavedStat;
if (isNil "_varValue") exitWith {};
[_varName,_varValue] call A3A_fnc_loadStat;