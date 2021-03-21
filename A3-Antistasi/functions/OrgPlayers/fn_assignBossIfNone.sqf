if !(isServer) exitWith {};
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

// Don't run if a Boss exists and is still eligible
if (!isNil "theBoss" && {!isNull theBoss && (theBoss getVariable ["eligible", false])}) exitWith {
    Debug_1("Not attempting to assign new boss - player %1 is the boss", theBoss);
};

private _members = (call A3A_fnc_playableUnits) select { [_x] call A3A_fnc_isMember };
Debug_1("Attempting to assign new boss, checking %1 members for next Boss.", count _members);

private _nextBoss = objNull;
private _bossRank = 0;
{
	if ((_x getVariable ["eligible", false]) && (side group _x == teamPlayer)) then {
        Debug_1("Player %1 is eligible", _x);
		private _dataX = [_x] call A3A_fnc_numericRank;
		private _playerRank = _dataX select 0;
        Debug_2("Current boss rank: %1, player rank: %2", _bossRank, _playerRank);
		if (_playerRank > _BossRank) then
		{
			_nextBoss = _x;
			_BossRank = _playerRank;
		};
	}
	else {
        Debug_1("Player %1 is not eligible", _x);
	};
} forEach _members;

if (!isNull _nextBoss) then
{
    Info_1("Player chosen for Boss: %1", _nextBoss);
	[_nextBoss] call A3A_fnc_theBossTransfer;
}
else
{
    Info("Couldn't select a new boss - no eligible candidates.");
	// Remove current boss if any, as they're ineligible
	if (!isNil "theBoss" && {!isNull theBoss}) then { [] call A3A_fnc_theBossTransfer };
};
