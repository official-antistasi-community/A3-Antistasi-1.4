private _filename = "fn_makePlayerBossIfEligible";

params ["_player"];

[3, format ["Attempting to make %1 the boss", _player], _filename] call A3A_fnc_log;

if (_player getVariable ["eligible",false] && (side (group _player) == teamPlayer) && [_player] call A3A_fnc_isMember) exitWith {
	[3, "Player is eligible, making them the boss", _filename] call A3A_fnc_log;
	[_player] call A3A_fnc_theBossTransfer;
	true;
};

[3, "Player is not eligible, unable to make them the boss", _filename] call A3A_fnc_log;

false;
