private _fileName = "fn_initGetMissionPath.sqf";
scriptName "fn_initGetMissionPath.sqf";
[2,"Compiling mission path",_fileName] call A3A_fnc_log;
missionPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
publicVariable "missionPath";
[2,"Mission path is valid",_fileName] call A3A_fnc_log;
