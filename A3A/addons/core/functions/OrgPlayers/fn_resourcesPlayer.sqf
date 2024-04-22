#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_moneyX",0,[0]]];

if !(_moneyX isEqualType 0) exitWith {Error("The parameter, the added money, must be a number"); "Error: The parameter must be a number"};

_moneyX = _moneyX + (player getVariable "moneyX");
if (_moneyX < 0) then {_moneyX = 0};
player setVariable ["moneyX",_moneyX,true];
[] spawn A3A_fnc_statistics;
true
