scriptName "initFuncs.sqf";
#include "..\..\Includes\LogMacros.inc"
Info("initFuncs started");

[] call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
boxX call jn_fnc_arsenal_init;

Info("initFuncs completed");
