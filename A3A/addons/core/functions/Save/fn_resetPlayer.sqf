#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};

params ["_playerId", "_unit"];

Info_2("Resetting player data for ID %1, unit %2", _playerId, _unit);

// Don't restore more money than this player had previously
private _money = initialPlayerMoney;
if (_playerId in A3A_playerSaveData) then {
    private _oldMoney = A3A_playerSaveData get _playerId get "moneyX";
    if !(isNil "_oldMoney") then { _money = _money min _oldMoney };
};

_unit setVariable ["moneyX", _money, true];
_unit setVariable ["score", 0, true];
_unit setVariable ["rankX", "PRIVATE", true];
_unit setUnitRank "PRIVATE";

[] remoteExec ["A3A_fnc_statistics", _unit];
_unit setVariable ["canSave", true, true];
