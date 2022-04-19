scriptName "initFuncs.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initFuncs started");

boxX call jn_fnc_arsenal_init;

[] spawn VCM_fnc_VcomInit;

Info("initFuncs completed");
