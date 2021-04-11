#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
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
    Error_1("Variable %1 does not exist.", _varName);
};
_varValue;
