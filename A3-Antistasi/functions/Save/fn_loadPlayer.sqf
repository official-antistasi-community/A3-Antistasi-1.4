#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Miscalled server-only function");
};
waitUntil {(!isNil "initVar")};		// hmm...

params ["_playerId", "_unit"];

if !([_playerId] call A3A_fnc_playerHasSave) exitWith {
    Info_1("No save found for player ID %1", _playerId);
	[_playerId, _unit] call A3A_fnc_resetPlayer;
};

Info_2("Loading player data for ID %1 into unit %2", _playerId, _unit);

private _loadout = [_playerId, "loadoutPlayer"] call A3A_fnc_retrievePlayerStat;
if (!isNil "_loadout") then { _unit setUnitLoadout _loadout };

private _score = 0;
private _rank = "PRIVATE";

if ([_unit] call A3A_fnc_isMember) then
{
	private _saveScore = [_playerId, "scorePlayer"] call A3A_fnc_retrievePlayerStat;
	if (!isNil "_saveScore" && { _saveScore isEqualType 0 }) then {_score = _saveScore};

	private _saveRank = [_playerId, "rankPlayer"] call A3A_fnc_retrievePlayerStat;
	if (!isNil "_saveRank" && { _saveRank isEqualType "" }) then {_rank = _saveRank};
};

private _money = [_playerId, "moneyX"] call A3A_fnc_retrievePlayerStat;
if (isNil "_money" || {!(_money isEqualType 0)}) then {_money = playerStartingMoney};

private _garage = [_playerId, "personalGarage"] call A3A_fnc_retrievePlayerStat;
if (isNil "_garage" || {!(_garage isEqualType [])}) then {_garage = []};

_unit setVariable ["score", _score, true];
_unit setUnitRank _rank;
_unit setVariable ["rankX", _rank, true];
_unit setVariable ["moneyX", _money, true];
[_unit, _garage] call A3A_fnc_setPersonalGarage;

[] remoteExec ["A3A_fnc_statistics", _unit];
_unit setVariable ["canSave", true, true];

Info_5("Player %1: Score %2, rank %3, money %4, garage count %5", _playerId, _score, _rank, _money, count _garage);
