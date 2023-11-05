#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_orgp_tBSteal_titel";

_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 100) exitWith {[_titleStr, format [localize "STR_A3A_fn_orgp_tBSteal_grab_no",FactionGet(reb,"name")]] call A3A_fnc_customHint;};
server setvariable ["resourcesFIA",_resourcesFIA - 100, true];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
[100] call A3A_fnc_resourcesPlayer;

[_titleStr, format [localize "STR_A3A_fn_orgp_tBSteal_grab_yes",FactionGet(reb,"name")]] call A3A_fnc_customHint;
