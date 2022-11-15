#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_playerUID", "_varName"];

if (isNil "_playerUID" || isNil "_varName") exitWith {Error_2("Load invalid for player %1 var %2", _playerUID, _varName)};
private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
[_playerVarName] call A3A_fnc_returnSavedStat;
