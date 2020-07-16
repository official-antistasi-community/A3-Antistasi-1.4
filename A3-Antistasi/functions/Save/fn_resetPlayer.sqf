private _filename = "fn_resetPlayer";
if (!isServer) exitWith {
	[1, "Miscalled server-only function", _filename] call A3A_fnc_log;
};
waitUntil {(!isNil "initVar")};		// hmm...

params ["_playerId", "_unit"];

[2, format ["Resetting player data for ID %1, unit %2", _playerId, _unit], _filename] call A3A_fnc_log;

// Don't restore more money than this player had previously
private _money = playerStartingMoney;
if ([_playerId] call A3A_fnc_playerHasSave) then {
	_money = _money min ([_playerId, "moneyX"] call A3A_fnc_retrievePlayerStat);
};

_unit setVariable ["moneyX", _money, true];
_unit setVariable ["score", 0, true];
_unit setVariable ["rankX", "PRIVATE", true];
_unit setUnitRank "PRIVATE";
[_unit, []] call A3A_fnc_setPersonalGarage;

[] remoteExec ["A3A_fnc_statistics", _unit];
_unit setVariable ["canSave", true, true];

