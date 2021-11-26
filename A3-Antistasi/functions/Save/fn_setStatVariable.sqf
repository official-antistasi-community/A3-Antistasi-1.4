// Previously fn_saveStat -Hazey

_varName = _this select 0;
_varValue = _this select 1;

if (!isNil "_varValue") then {
	_varSaveName = [_varName] call A3A_fnc_varNameToSaveName;
	profileNameSpace setVariable [_varSaveName, _varValue];
};