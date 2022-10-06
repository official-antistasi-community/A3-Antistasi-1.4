scriptName "initFuncs.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initFuncs started");

[] call compile preprocessFileLineNumbers QPATHTOFOLDER(Scripts\Init_UPSMON.sqf);
boxX call jn_fnc_arsenal_init;
if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };

Info("initFuncs completed");
