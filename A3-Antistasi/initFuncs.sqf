diag_log format ["%1: [Antistasi]: InitFuncs Started.",servertime];
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

WPCreate = if (worldName == "Tanoa") then {compile preprocessFileLineNumbers "CREATE\WPCreate.sqf"} else {compile preprocessFileLineNumbers "CREATE\WPCreateAltis.sqf"};
/*
 *
 */
CONVOY = compile preprocessFileLineNumbers "Missions\CONVOY.sqf";
RES_Prisoners = compile preprocessFileLineNumbers "Missions\RES_Prisoners.sqf";
RES_Refugees = compile preprocessFileLineNumbers "Missions\RES_Refugees.sqf";
LOG_Bank = compile preprocessFileLineNumbers "Missions\LOG_Bank.sqf";
LOG_Supplies = compile preprocessFileLineNumbers "Missions\LOG_Supplies.sqf";
LOG_Ammo = compile preprocessFileLineNumbers "Missions\LOG_Ammo.sqf";
DES_Vehicle = compile preprocessFileLineNumbers "Missions\DES_Vehicle.sqf";
DES_Heli = compile preprocessFileLineNumbers "Missions\DES_Heli.sqf";
DES_Antenna = compile preprocessFileLineNumbers "Missions\DES_Antenna.sqf";
CON_Outpost = compile preprocessFileLineNumbers "Missions\CON_Outpost.sqf";
AS_Official = compile preprocessFileLineNumbers "Missions\AS_Official.sqf";
AS_Traitor = compile preprocessFileLineNumbers "Missions\AS_Traitor.sqf";

call compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
call jn_fnc_logistics_init;
boxX call jn_fnc_arsenal_init;

diag_log format ["%1: [Antistasi]: InitFuncs Completed.",servertime];
