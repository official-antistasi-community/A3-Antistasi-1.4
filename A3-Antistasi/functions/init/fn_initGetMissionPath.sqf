[2,"Compiling mission path",_FILE_] call A3A_fnc_log;
scriptName "fn_initGetMissionPath.sqf";
missionPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
publicVariable "missionPath";
[2,"Mission path is valid",_FILE_] call A3A_fnc_log;
