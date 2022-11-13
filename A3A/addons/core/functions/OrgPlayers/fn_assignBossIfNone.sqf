#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server") };
params [["_memberForced", false]];

if (!isNil "A3A_electionInProgress") exitWith {};
A3A_electionInProgress = true;


// Don't run if a Boss exists and is still eligible & active
private _electionReason = call {
    if (isNull theBoss) exitWith { "there is no boss" };
    if (_memberForced && !([theBoss] call A3A_fnc_isMember)) exitWith { "the boss is a guest" };
    if !(theBoss getVariable ["eligible", true]) exitWith { "the boss is not eligible" };
    if (theBoss getVariable ["isAFK", false]) exitWith { "the boss is AFK" };
};
if (isNil "_electionReason") exitWith {
    Debug_1("Not attempting to assign new boss - player %1 is the boss", name theBoss);
    A3A_electionInProgress = nil;
};
Info_2("Election triggered because %1. Previous boss was %2", _electionReason, name theBoss);


// Note: allPlayers doesn't work for a while after server startup, so this function isn't used for picking the initial commander
// But we can't use playableUnits because it excludes dead players
private _nextBoss = objNull;
private _bossRank = 0;
{
    private _rp = _x getVariable ["owner", _x];                 // real/original player for remote control
    private _isMember = [_rp] call A3A_fnc_isMember;
    if (_x getVariable ["isAFK", false]) then { Debug_1("Player %1 is AFK", name _rp); continue };
    if !(_rp getVariable ["eligible", true]) then { Debug_1("Player %1 is ineligible", name _rp); continue };
    if (!A3A_guestCommander and !_isMember) then { Debug_1("Player %1 is a guest", name _rp); continue };

    private _rank = ([_rp] call A3A_fnc_numericRank) # 0;
    if (_isMember) then { _rank = _rank + 1000 };
    Debug_2("Player %1 priority %2", name _rp, _rank);
    if (_rank > _bossRank) then {
        _nextBoss = _rp;
        _bossRank = _rank;
    };
} forEach (allPlayers - entities "HeadlessClient_F");

if (!isNull _nextBoss) then
{
    Info_1("Player chosen for Boss: %1", name _nextBoss);
    if (theBoss != _nextBoss) then { [_nextBoss] call A3A_fnc_theBossTransfer };
}
else
{
    Info("Couldn't select a new boss - no eligible candidates.");
    // Remove current boss if any, as they're ineligible
    if (!isNull theBoss) then { [] call A3A_fnc_theBossTransfer };
};

A3A_electionInProgress = nil;
