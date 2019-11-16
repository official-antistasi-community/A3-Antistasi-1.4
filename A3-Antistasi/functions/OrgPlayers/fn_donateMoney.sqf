private ["_resourcesPlayer","_pointsXJ","_target"];
_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {hint "You have less than 100 € to donate"};

if (count _this == 0) exitWith
	{
	[-100] call A3A_fnc_resourcesPlayer;
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	hint "You have donated 100 € to the cause. This will raise your status among our forces";
	[] spawn A3A_fnc_statistics;
	["moneyX",player getVariable ["moneyX",0]] call fn_SaveStat;
	};
_target = cursortarget;

if (!isPlayer _target) exitWith {hint "You must be looking to a player in order to give him money"};

[-100] call A3A_fnc_resourcesPlayer;
_money = player getVariable "moneyX";
["moneyX",_money] call fn_SaveStat;
_moneyX = _target getVariable "moneyX";
_target setVariable ["moneyX",_moneyX + 100, true];
hint format ["You have donated 100 € to %1", name _target];
[] remoteExec ["A3A_fnc_statistics",_target];
[] spawn A3A_fnc_statistics;