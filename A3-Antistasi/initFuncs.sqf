[2,"initFuncs started","initFuncs.sqf"] call A3A_fnc_log;

[] call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
[] call compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
[] call jn_fnc_logistics_init;
boxX call jn_fnc_arsenal_init;

[2,"initFuncs complete","initFuncs.sqf"] call A3A_fnc_log;
