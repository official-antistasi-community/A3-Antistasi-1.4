scriptName "initFuncs.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initFuncs started");

[] spawn VCM_fnc_VcomInit;

boxX call jn_fnc_arsenal_init;

Info("initFuncs completed");
