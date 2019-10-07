shouldRunDebuggingLoop = true;
debug_shouldCleanGroups = true;
debug_cleanGroupDelay = 7200;

_lastGroupCleanTime = 0;

while {shouldRunDebuggingLoop} do {

	//THIS IS A TEMPORARY FIX
	//IT MAY BREAK OTHER SCRIPTS (Due to indiscriminately deleteing empty groups)
	if (debug_shouldCleanGroups && serverTime > (_lastGroupCleanTime + debug_cleanGroupDelay)) then {
		diag_log "[Antistasi] Cleaning groups";
		[teamPlayer] remoteExec ["A3A_fnc_deleteEmptyGroupsOnSide", 0];
		[civilian] remoteExec ["A3A_fnc_deleteEmptyGroupsOnSide", 0];
		[Occupants] remoteExec ["A3A_fnc_deleteEmptyGroupsOnSide", 0];
		[Invaders] remoteExec ["A3A_fnc_deleteEmptyGroupsOnSide", 0];
		_lastGroupCleanTime = serverTime;
	};
	sleep 60;
};