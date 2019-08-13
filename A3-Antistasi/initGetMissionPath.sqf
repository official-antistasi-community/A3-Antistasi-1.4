diag_log format ["%1: [Antistasi]: initGetMissionPath Started.",servertime];
missionPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
publicVariable missionPath;
diag_log format ["%1: [Antistasi]: initGetMissionPath Completed.",servertime];