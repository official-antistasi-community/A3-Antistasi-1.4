if !(isServer) exitWith {};
private _filename = "fn_assignBossIfNone";

// Don't run if a Boss exists and is still eligible
if (!isNil "theBoss" && {!isNull theBoss && (theBoss getVariable ["eligible", false])}) exitWith {
	[3, format ["Not attempting to assign new boss - player %1 is the boss", theBoss],_filename] call A3A_fnc_log;
};

private _members = (call A3A_fnc_playableUnits) select { [_x] call A3A_fnc_isMember };
[3, format ["Attempting to assign new boss, checking %1 members for next Boss.", count _members],_filename] call A3A_fnc_log;

private _nextBoss = objNull;
private _bossRank = 0;
{
	if ((_x getVariable ["eligible", false]) && (side group _x == teamPlayer)) then {
		[3, format ["Player %1 is eligible", _x],_filename] call A3A_fnc_log;
		private _dataX = [_x] call A3A_fnc_numericRank;
		private _playerRank = _dataX select 0;
		[3, format ["Current boss rank: %1, player rank: %2", _bossRank, _playerRank],_filename] call A3A_fnc_log;
		if (_playerRank > _BossRank) then
		{
			_nextBoss = _x;
			_BossRank = _playerRank;
		};
	}
	else {
		[3, format ["Player %1 is not eligible", _x],_filename] call A3A_fnc_log;
	};
} forEach _members;

if (!isNull _nextBoss) then
{
	[2, format ["Player chosen for Boss: %1", _nextBoss],_filename] call A3A_fnc_log;
	[_nextBoss] call A3A_fnc_theBossTransfer;
}
else
{
	[2, "Couldn't select a new boss - no eligible candidates.",_filename] call A3A_fnc_log;
	// Remove current boss if any, as they're ineligible
	if (!isNil "theBoss" && {!isNull theBoss}) then { [] call A3A_fnc_theBossTransfer };
};

