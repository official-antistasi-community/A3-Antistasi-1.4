scriptName "initFuncs.sqf";
[2,"initFuncs started",_FILE_] call A3A_fnc_log;

[] call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
[] call compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
[] call jn_fnc_logistics_init;
boxX call jn_fnc_arsenal_init;

[2,"initFuncs completed",_FILE_] call A3A_fnc_log;
