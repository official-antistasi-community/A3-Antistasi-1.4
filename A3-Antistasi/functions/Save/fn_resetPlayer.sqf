#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};
waitUntil {(!isNil "initVar")};		// hmm...

params ["_playerId", "_unit"];

Info_2("Resetting player data for ID %1, unit %2", _playerId, _unit);

// Don't restore more money than this player had previously
private _money = playerStartingMoney;
if ([_playerId] call A3A_fnc_playerHasSave) then {
	_money = _money min ([_playerId, "moneyX"] call A3A_fnc_retrievePlayerStat);
};

_unit setVariable ["moneyX", _money, true];
_unit setVariable ["score", 0, true];
_unit setVariable ["rankX", "PRIVATE", true];
_unit setUnitRank "PRIVATE";

[] remoteExec ["A3A_fnc_statistics", _unit];
_unit setVariable ["canSave", true, true];
