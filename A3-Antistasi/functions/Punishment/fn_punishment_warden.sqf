params["_detainee","_sentenceTime"];

_detainee setVariable ["punishment_coolDown", serverTime + _sentenceTime, true];
_punishment_warden_handle = [_detainee,_sentenceTime] spawn {
	params["_detainee","_sentenceTime"];

	_countX = floor _sentenceTime;
	while {_countX > 0} do {
		["FF Notification", format ["Please do not teamkill. Play with the turtles for %1 more seconds.",_countX], true] remoteExec ["A3A_fnc_customHint", _detainee, false];
		uiSleep 1;
		_countX = _countX - 1;
	};
	[_detainee,"punishment_warden"] call A3A_fnc_punishment_release;
};

///////////////////////// TODO: PLAYER TEAM FORGIVE SCRIPT
[_detainee] call A3A_fnc_punishment_sentence;
[_detainee] call A3A_fnc_punishment_addActionForgive;
[_detainee] call A3A_fnc_punishment_notifyAllAdmins;

_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];	// [timeTotal,offenceTotal,[lastOffenceServerTime,overhead],[wardenHandle,sentenceHandle]]
_punishment_vars set [3,[_punishment_warden_handle,scriptNull]];
_detainee setVariable ["punishment_vars", _punishment_vars, true];