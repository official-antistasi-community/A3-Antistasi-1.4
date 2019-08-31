_rebelMoney = server getVariable "rebelMoney";
if (_rebelMoney < 100) exitWith {hint "The Rebels don't have enough money to take!"};
[100] call A3A_fnc_resourcesPlayer;
server setvariable ["rebelMoney",_rebelMoney - 100, true];
[] remoteExec ["A3A_fnc_statistics",theBoss];
[-2,theBoss] call A3A_fnc_playerScoreAdd;
["scorePlayer", player getVariable "score"] call fn_SaveStat;

hint format ["You grabbed 100 € from the %1 Money Pool.\n\nThis will affect your prestige and status among %1 forces",rebelFactionName];