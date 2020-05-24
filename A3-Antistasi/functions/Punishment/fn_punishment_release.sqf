params["_detainee"];

_TPToHQ = {
	_detainee switchMove "";
	_detainee setPos posHQ;
};

_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]]; // [timeTotal,offenceTotal,[lastOffenceServerTime,overhead],[wardenHandle,sentenceHandle]]
_punishment_warden = (_punishment_vars select 3) select 0;
_punishment_sentence = (_punishment_vars select 3) select 1;

deleteVehicle _punishmentPlatform;
if !(scriptDone _punishment_warden || isNull _punishment_warden) then {
	terminate _punishment_warden;
	call _TPToHQ;
};
if !(scriptDone _punishment_sentence || isNull _punishment_sentence) then {
	terminate _punishment_sentence;
	call _TPToHQ;
};

_playerStats = format["Player: %1 [%2]", name player, getPlayerUID player];
[format ["%1: [Antistasi] | INFO | PUNISHMENT | FORGIVE | %2", servertime, _playerStats]] remoteExec ["diag_log", 2];
["FF Notification", "An admin looks with pity upon your soul.<br/>You have been forgiven."] remoteExec ["A3A_fnc_customHint", _detainee, false];

_detainee setVariable ["punishment_vars", [0,0,[serverTime,0],[scriptNull,scriptNull]], true];