#include "..\..\common_includes.hpp"
#include "..\..\..\script_component.hpp"

//Parameters
VCM_PublicScript = compileFinal "[] call (_this select 0);";
VCM_ServerAsk = compileFinal "(_this select 1) publicVariableClient (_this select 0);";

// Just run this everywhere for the moment
[] call compile preprocessFileLineNumbers QPATHTOFOLDER(vcomai\Functions\VCOMAI_DefaultSettings.sqf);
[] call Vcm_Settings;

[] call compile preprocessFileLineNumbers QPATHTOFOLDER(vcomai\Functions\VCM_Functions\fn_CBASettings.sqf);

//Mod checks
//ACE CHECK
if (!(isNil "ACE_Medical_enableFor") && {ACE_Medical_enableFor isEqualTo 1}) then {VCM_MEDICALACTIVE = true;} else {VCM_MEDICALACTIVE = false;};
//CBA CHECK
if (isClass(configFile >> "CfgPatches" >> "cba_main")) then {CBAACT = true;} else {CBAACT = false;};

//Global actions compiles
Vcm_PMN = compileFinal "(_this select 0) playMoveNow (_this select 1);";
Vcm_SM = compileFinal "(_this select 0) switchMove (_this select 1);";
Vcm_PAN = compileFinal "(_this select 0) playActionNow (_this select 1);";

VCM_CoverQueue = [];

[] call VCM_fnc_AfterInit;