diag_log format ["%1: [Antistasi] | INFO | InitFuncs Started.", servertime];

[] call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
[] call compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
[] call jn_fnc_logistics_init;
boxX call jn_fnc_arsenal_init;

diag_log format ["%1: [Antistasi] | INFO | InitFuncs Completed.", servertime];
