#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_moneyToTake", 0]];

_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < _moneyToTake) exitWith {["Money Grab", "FIA has not enough resources to grab."] call A3A_fnc_customHint;};
server setvariable ["resourcesFIA",_resourcesFIA - _moneyToTake, true];

// Round this up if floats as a score breaks stuff
[- (_moneyTotake / 50),theBoss] call A3A_fnc_playerScoreAdd;
[_moneyToTake] call A3A_fnc_resourcesPlayer;

["Money Grab", format ["You grabbed %1 € from the %2 Money Pool.<br/><br/>This will affect your prestige and status among %2 forces.", _moneyTotake ,FactionGet(reb,"name")]] call A3A_fnc_customHint;
