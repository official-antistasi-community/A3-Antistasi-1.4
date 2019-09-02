//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params ["_clientID"];

waitUntil { sleep 1; if (!isNil "hcArray") exitWith {true}; false };
hcArray pushBackUnique _clientID;

diag_log format ["%1: [Antistasi] | INFO | Headless Client Connected: %2.", servertime, hcArray];
