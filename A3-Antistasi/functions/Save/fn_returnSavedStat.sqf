private _varName = _this select 0;

_loadVariable = {
	private ["_varName","_varValue"];
	_varName = _this select 0;
	_varSaveName = [_varName] call A3A_fnc_varNameToSaveName;
	//Return the value of this statement
	profileNameSpace getVariable (_varSaveName);
};

private _varValue = [_varName] call _loadVariable;
if (isNil "_varValue") then {
	_spanishVarName = [_varName] call A3A_fnc_translateVariable;
	_varValue = [_spanishVarName] call _loadVariable;
};
if (isNil "_varValue") exitWith {
	diag_log format ["%1: [Antistasi] | ERROR | A3A_fnc_returnSavedStat | Variable %2 does not exist.",servertime, _varName];
};
_varValue;