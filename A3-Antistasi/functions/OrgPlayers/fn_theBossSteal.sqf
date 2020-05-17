_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 100) exitWith {["Money Grab", "FIA has not enough resources to grab"] call A3A_fnc_customHint;};
[100] call A3A_fnc_resourcesPlayer;
server setvariable ["resourcesFIA",_resourcesFIA - 100, true];
[] remoteExec ["A3A_fnc_statistics",theBoss];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
["scorePlayer", player getVariable "score"] call A3A_fnc_setStatVariable;

["Money Grab", format ["You grabbed 100 € from the %1 Money Pool.<br/><br/>This will affect your prestige and status among %1 forces",nameTeamPlayer]] call A3A_fnc_customHint;