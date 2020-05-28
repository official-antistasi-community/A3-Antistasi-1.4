params ["_detainee",["_source",""]];
/*
	[cursorObject] call A3A_fnc_punishment_release; // Forgive all sins
*/

private _keyPairs = [ ["_punishmentPlatform",objNull] ];
private _UID = getPlayerUID _detainee;
private _data_instigator = [_UID,_keyPairs] call A3A_fnc_punishment_dataGet;
_data_instigator params ["_punishmentPlatform"];
private _playerStats = format["Player: %1 [%2]", name _detainee, _UID];

private _releaseFromSentence = {
	deleteVehicle _punishmentPlatform;
	_detainee switchMove "";
	_detainee setPos posHQ;
	[_detainee] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
};
private _forgiveStats = {
	private _keyPairs = [["timeTotal",0],["offenceTotal",0],["overhead",0],["_sentenceEndTime",serverTime]];
	[_UID,_keyPairs] call A3A_fnc_punishment_dataSet;
};

switch (_source) do {
	case "punishment_warden": {
		call _forgiveStats;
		call _releaseFromSentence;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | RELEASE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "Enough then."] remoteExec ["A3A_fnc_customHint", _detainee, false];
	};
	case "punishment_warden_manual": {
		call _forgiveStats;
		call _releaseFromSentence;
		[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
		["FF Notification", "An admin looks with pity upon your soul.<br/>You have been forgiven."] remoteExec ["A3A_fnc_customHint", _detainee, false];
	};
	case "forgive": {
		call _forgiveStats;
	};
	default {
		[format ["%1: [Antistasi] | ERROR | PUNISHMENT RELEASE | INVALID PARAMS | _source=""%2""", servertime, _source]] remoteExec ["diag_log", 2];
	};
};

