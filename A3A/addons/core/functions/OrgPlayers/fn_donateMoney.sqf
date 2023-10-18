private _titleStr = localize "STR_A3A_fn_orgp_donMon_titel";
private ["_resourcesPlayer","_pointsXJ","_target"];

_resourcesPlayer = player getVariable "moneyX";
if (_resourcesPlayer < 100) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_donMon_no_less"] call A3A_fnc_customHint;};

if (count _this == 0) exitWith
	{
	[0,100] remoteExec ["A3A_fnc_resourcesFIA",2];
	_pointsXJ = (player getVariable "score") + 1;
	player setVariable ["score",_pointsXJ,true];
	[-100] call A3A_fnc_resourcesPlayer;
	[_titleStr, localize "STR_A3A_fn_orgp_donMon_donated_faction"] call A3A_fnc_customHint;
	};
_target = cursortarget;

if (!isPlayer _target) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_donMon_no_looking"] call A3A_fnc_customHint;};

[-100] call A3A_fnc_resourcesPlayer;
[100] remoteExec ["A3A_fnc_resourcesPlayer", _target];
[_titleStr, format [localize "STR_A3A_fn_orgp_donMon_donated_player", name _target]] call A3A_fnc_customHint;
