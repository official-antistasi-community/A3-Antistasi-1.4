params [["_playerId", ""]];

if (hasInterface) then {
	if (count _playerId == 0) then {
		_playerId = getPlayerUID player;
	};
};

if (isMultiplayer && !isServer) exitwith {
	[_playerId] remoteExec ["A3A_fnc_playerHasSave", 2];
	if (canSuspend) then {
		waitUntil {!isNil "hasSave";};
		hasSave;
	} else {
		nil;
	};
};

private _hasSave =	false;

if (count _playerId == 0) then {
	diag_log "[Antistasi] Save check given no ID.";
} else {
	private _money = [_playerId, "moneyX"] call A3A_fnc_retrievePlayerStat;
	_hasSave = !(isNil "_money");
};

if (isRemoteExecuted) then {
	[_hasSave, {hasSave = _this}] remoteExec ["call", remoteExecutedOwner];
};

_hasSave;