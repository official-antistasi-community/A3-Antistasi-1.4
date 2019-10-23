
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

WPCreate = if (worldName == "Tanoa") then {compile preprocessFileLineNumbers "CREATE\WPCreate.sqf"} else {compile preprocessFileLineNumbers "CREATE\WPCreateAltis.sqf"};
/*
 *
 */
CONVOY = compile preprocessFileLineNumbers "Missions\CONVOY.sqf";
RES_Prisioneros = compile preprocessFileLineNumbers "Missions\RES_Prisioneros.sqf";
RES_Refugiados = compile preprocessFileLineNumbers "Missions\RES_Refugiados.sqf";
LOG_Bank = compile preprocessFileLineNumbers "Missions\LOG_Bank.sqf";
LOG_Suministros = compile preprocessFileLineNumbers "Missions\LOG_Suministros.sqf";
LOG_Ammo = compile preprocessFileLineNumbers "Missions\LOG_Ammo.sqf";
DES_Vehicle = compile preprocessFileLineNumbers "Missions\DES_Vehicle.sqf";
DES_Heli = compile preprocessFileLineNumbers "Missions\DES_Heli.sqf";
DES_Antena = compile preprocessFileLineNumbers "Missions\DES_Antena.sqf";
CON_Puestos = compile preprocessFileLineNumbers "Missions\CON_Puestos.sqf";
AS_Oficial = compile preprocessFileLineNumbers "Missions\AS_Oficial.sqf";
AS_Traidor = compile preprocessFileLineNumbers "Missions\AS_Traidor.sqf";

call compile preprocessFileLineNumbers "statSave\saveFuncs.sqf";
call jn_fnc_logistics_init;
caja call jn_fnc_arsenal_init;

diag_log "Functions Init Completed";
