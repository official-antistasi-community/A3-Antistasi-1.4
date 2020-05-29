/*
Function:
	A3A_fnc_punishment_warden

Description:
	Organises the sentence and addActions of the detainee.
	Includes timer and release mechanism.
	Will release on remote sentence release time shorting.

Scope:
	<ANY> However, <LOCAL> on the detainee is recommended to save server processing time.

Environment:
	<ANY>

Parameters:
	<OBJECT> The detainee being sent to Ocean Gulag.
	<NUMBER> The serverTime when the detainee will be released.

Returns:
	<BOOLEAN> True if hasn't crashed; nothing if it has crashed.

Examples:
	[_instigator,_sentenceEndTime] remoteExec ["A3A_fnc_punishment_warden",_instigator,false];

Author: Caleb Serafin
Date Updated: 29 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_detainee","_sentenceEndTime"];

[_detainee,_sentenceEndTime] spawn {
	params ["_detainee","_sentenceEndTime"];

	[_detainee] call A3A_fnc_punishment_sentence;
	[_detainee] remoteExec ["A3A_fnc_punishment_addActionForgive",0,false];
	[_detainee] remoteExec ["A3A_fnc_punishment_notifyAdmin",0,false];

	private _UID = getPlayerUID _detainee;
	private _sentenceEndTime_old = _sentenceEndTime;
	private _countX = floor (_sentenceEndTime - serverTime);
	private _keyPairs = [ ["_sentenceEndTime",_sentenceEndTime] ];

	while {serverTime <= _sentenceEndTime} do {
		["FF Notification", format ["Please do not teamkill. Play with the turtles for %1 more seconds.<br><br>Use Refresh Admin Action is the admin just logged in.",_countX], true] remoteExec ["A3A_fnc_customHint", _detainee, false];
		uiSleep 1;
		_countX = _countX - 1;
		if (_countX mod 5 == 0) then { // Polls for updates
			_sentenceEndTime = ([_UID,_keyPairs] call A3A_fnc_punishment_dataGet) select 0;
			_countX = floor (_sentenceEndTime - serverTime);
		};
	};
	if (_sentenceEndTime_old == _sentenceEndTime) then {
		[_detainee,"punishment_warden"] call A3A_fnc_punishment_release;
	} else {
		[_detainee,"punishment_warden_manual"] call A3A_fnc_punishment_release;
	};
};
true;