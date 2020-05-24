params["_detainee",["_source",""]];
/*
	[cursorObject] call A3A_fnc_punishment_release; // Forgive all sins
*/
_TPToHQ = {
	_detainee switchMove "";
	_detainee setPos posHQ;
};
_removeReleaseActions = {
	_actions = actionIDs _detainee;
	{
		if ((_detainee actionParams _x) select 0 isEqualTo "[ADMIN] Forgive Player") then {
			[_detainee,_x] remoteExec ["removeAction",0,false];
		};
	} forEach _actions;
};

_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]]; // [timeTotal,offenceTotal,[lastOffenceServerTime,overhead],[wardenHandle,sentenceHandle]]
_punishment_warden = (_punishment_vars select 3) select 0;
_playerStats = format["Player: %1 [%2], _timeTotal: %3", name _detainee, getPlayerUID _detainee, _punishment_vars select 0];

switch (_source) do {
	case "punishment_warden": {
		call _removeReleaseActions;
		deleteVehicle _punishmentPlatform;
		call _TPToHQ;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | RELEASE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "Enough then."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		_detainee setVariable ["punishment_vars", [0,0,[serverTime,0],[scriptNull,scriptNull]], true];
	};
	case "punishment_warden_manual": {
		call _removeReleaseActions;
		deleteVehicle _punishmentPlatform;
		if (!scriptDone _punishment_warden) then {
			terminate _punishment_warden;
		};
		call _TPToHQ;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "An admin looks with pity upon your soul.<br/>You have been forgiven."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		_detainee setVariable ["punishment_vars", [0,0,[serverTime,0],[scriptNull,scriptNull]], true];
	};
	default { };
};

