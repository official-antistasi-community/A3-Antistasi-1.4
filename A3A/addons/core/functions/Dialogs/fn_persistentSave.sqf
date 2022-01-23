// worker function for persistent save button

if (player == theBoss) then {
	[] remoteExecCall ["A3A_fnc_saveLoop", 2];
} else {
	[getPlayerUID player, player] remoteExecCall ["A3A_fnc_savePlayer", 2];
	hintC "Personal Stats Saved";
};
