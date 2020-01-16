private _filename = "fn_makePlayerBossIfEligible";

params ["_player"];

[3, format ["Attempting to make %1 the boss", name _player], _filename] call A3A_fnc_log;

private _textX = "";

if (_player getVariable ["eligible",true] && ({(side (group _player) == teamPlayer)}) && [_player] call A3A_fnc_isMember) exitWith {
	[3, "Player is eligible, making them the boss", _filename] call A3A_fnc_log;
	_textX = format ["%1 is the new leader of our forces. Greet them!", name _player];
	[_player] call A3A_fnc_theBossInit;
	[petros,"hint",_textX] remoteExec ["A3A_fnc_commsMP", 0];
	true;
};

[3, "Player is not eligible, unable to make them the boss", _filename] call A3A_fnc_log;

false;
