// Dont' run if a Boss exists.
private _filename = "fn_assignBossIfNone";

if (!isNil "theBoss" && {!isNull theBoss}) exitWith {
	[3, format ["Not attempting to assign new boss - player %1 is the boss", theBoss],_filename] call A3A_fnc_log;
};

private _members = [];
private _nextBoss = objNull;

[3, format ["Attempting to assign new boss, checking % members for next Boss.", count membersX],_filename] call A3A_fnc_log;
// Are there any members online.

private _BossRank = 0;
{
	private _isMember = [_x] call A3A_fnc_isMember;
	if (_isMember) then {
		_members pushBack _x;
	};
	
	if ((_x getVariable ["eligible",true]) && ({(side (group _x) == teamPlayer)}) && _isMember) then
	{
		[3, format ["Player %1 is eligible", name _x],_filename] call A3A_fnc_log;
		[3, format ["Current Boss Rank: %1.", _BossRank],_filename] call A3A_fnc_log;
		private _dataX = [_x] call A3A_fnc_numericRank;
		private _playerRank = _dataX select 0;
		[3, format ["Players rank is: %1", _playerRank],_filename] call A3A_fnc_log;
		if (_playerRank > _BossRank) then
		{
			_nextBoss = _x;
			_BossRank = _playerRank;
		};
	}
	else {
		[3, format ["Player is not eligible: %1", _x],_filename] call A3A_fnc_log;
	};
} forEach (call A3A_fnc_playableUnits);

if (!isNull _nextBoss) then
{
	[2, format ["Player chosen for Boss: %1", name _nextBoss],_filename] call A3A_fnc_log;
	_textX = format ["%1 is the new leader of our forces. Greet them!", name _nextBoss];
	[_nextBoss] call A3A_fnc_theBossInit;
	sleep 5;
	[petros,"hint",_textX] remoteExec ["A3A_fnc_commsMP", 0];
}
else
{
	[2, "Couldn't select a new boss - no eligible candidates.",_filename] call A3A_fnc_log;
};

