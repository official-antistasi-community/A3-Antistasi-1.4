params ["_load"];

if (_load) then {
	[getPlayerUID player, player] remoteExecCall ["A3A_fnc_loadPlayer", 2];
} else {
	[getPlayerUID player, player] remoteExecCall ["A3A_fnc_resetPlayer", 2];
};

