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
	
	//If petros ceases to exist, the whole gamemode is fucked. No exaggeration. At all.
	//As a precaution, this is the 'OH FUCK I HOPE PETROS EXISTS' check, that makes sure he always exists.
	if (isNil "petros" ||	{isNull petros}) then {
		[] call A3A_fnc_createPetros;
	};
	sleep 60;
};