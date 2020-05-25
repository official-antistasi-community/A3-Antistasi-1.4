params["_detainee",["_source",""]];
/*
	[cursorObject] call A3A_fnc_punishment_release; // Forgive all sins
*/
_TPToHQ = {
	_detainee switchMove "";
	_detainee setPos posHQ;
};

_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],scriptNull]];
_sentenceTime = _punishment_vars select 0;	// [timeTotal,offenceTotal,[lastOffenceServerTime,overhead],wardenHandle]
_punishment_warden = _punishment_vars select 3;
_playerStats = format["Player: %1 [%2], _timeTotal: %3", name _detainee, getPlayerUID _detainee, _sentenceTime];

switch (_source) do {
	case "punishment_warden": {
		[_detainee] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
		deleteVehicle _punishmentPlatform;
		call _TPToHQ;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | RELEASE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "Enough then."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		_detainee setVariable ["punishment_vars", [0,0,[serverTime,0],scriptNull], true];
	};
	case "punishment_warden_manual": {
		[_detainee] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
		deleteVehicle _punishmentPlatform;
		if (!scriptDone _punishment_warden) then {
			terminate _punishment_warden;
		};
		call _TPToHQ;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "An admin looks with pity upon your soul.<br/>You have been forgiven."] remoteExec ["A3A_fnc_customHint", _detainee, false];
		_detainee setVariable ["punishment_vars", [0,0,[serverTime,0],scriptNull], true];
	};
	default { };
};

