private ["_resourcesPlayer","_pointsXJ","_target"];
_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {["Donate Money", "You have less than 100 € to donate"] call A3A_fnc_customHint;};

if (count _this == 0) exitWith
	{
	[-100] call A3A_fnc_resourcesPlayer;
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	["Donate Money", "You have donated 100 € to the cause. This will raise your status among our forces"] call A3A_fnc_customHint;
	[] spawn A3A_fnc_statistics;
	["moneyX",player getVariable ["moneyX",0]] call A3A_fnc_setStatVariable;
	};
_target = cursortarget;

if (!isPlayer _target) exitWith {["Donate Money", "You must be looking to a player in order to give him money"] call A3A_fnc_customHint;};

[-100] call A3A_fnc_resourcesPlayer;
_money = player getVariable "moneyX";
["moneyX",_money] call A3A_fnc_setStatVariable;
_moneyX = _target getVariable "moneyX";
_target setVariable ["moneyX",_moneyX + 100, true];
["Donate Money", format ["You have donated 100 € to %1", name _target]] call A3A_fnc_customHint;
[] remoteExec ["A3A_fnc_statistics",_target];
[] spawn A3A_fnc_statistics;