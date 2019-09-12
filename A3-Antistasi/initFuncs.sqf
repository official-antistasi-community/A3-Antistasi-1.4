diag_log format ["%1: [Antistasi] | INFO | InitFuncs Started.", servertime];

[] spawn compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
[] spawn compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
[] spawn jn_fnc_logistics_init;
boxX call jn_fnc_arsenal_init;

diag_log format ["%1: [Antistasi] | INFO | InitFuncs Completed.", servertime];
