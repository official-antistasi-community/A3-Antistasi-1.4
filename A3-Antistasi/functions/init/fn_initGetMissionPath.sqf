[2,"Compiling mission path","initGetMissionPath.sqf"] call A3A_fnc_log;
missionPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
publicVariable "missionPath";
[2,"Mission path is valid","initGetMissionPath.sqf"] call A3A_fnc_log;
