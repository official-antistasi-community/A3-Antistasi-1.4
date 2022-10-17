/*
Author: Meerkat
  This file handles the detection of mods.
  Best practice is to detect the presence of a CfgPatches entry, but there are alternatives.
  To add a new mod, give it a hadMod variable with the rest, then add an if (isClass) entry like the FFAA one. (You could even copy/paste the FFAA one and replace its calls with the ones you need.)

Scope: All
Environment: Any (Scheduled Inherited from fn_initVarCommon.sqf)
Public: No
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
//Var initialisation
A3A_hasRHS = false;
A3A_hasFFAA = false;
A3A_hasIFA = false;
A3A_has3CBFactions = false;
A3A_has3CBBAF = false;
A3A_hasVN = false;
A3A_hasIvory = false;
A3A_hasTCGM = false;
A3A_hasADV = false;
A3A_hasD3S = false;
A3A_hasRDS = false;
A3A_hasKAT = false;
A3A_hasCUP = false;
A3A_hasGM = false;
A3A_hasUNS = false;

//Actual Detection
//IFA Detection
//Deactivated for now, as IFA is having some IP problems (08.05.2020 european format)
if (isClass (configFile >> "CfgPatches" >> "LIB_Core")) then {
    //A3A_hasIFA = true;
    //Info("IFA Detected");
    Error("IFA detected, but it is no longer supported, please remove this mod");
    ["modUnautorized",false,1,false,false] call BIS_fnc_endMission;
};

//Unsung Detection
if (isClass (configfile >> "CfgFactionClasses" >> "UNSUNG_W")) then {A3A_hasUNS = true; Info("Unsung Detected.") };

//RHS Detection
if (isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_vdv") && isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") && isClass (configFile >> "CfgFactionClasses" >> "rhsgref_faction_tla")) then {
  A3A_hasRHS = true;
  Info("RHS Detected.");
};

//3CB BAF Detection
if (A3A_hasRHS && (
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Weapons") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Vehicles") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Units_Common") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment")
) ) then {A3A_has3CBBAF = true; Info("3CB BAF Detected.") };

//3CB Factions Detection
if (isClass (configfile >> "CfgPatches" >> "UK3CB_Factions_Vehicles_SUV")) then {A3A_has3CBFactions = true; Info("3CB Factions Detected.") };
//VN Detection
if (allowDLCVN && isClass (configFile >> "CfgPatches" >> "vn_weapons")) then {A3A_hasVN = true; Info("VN Detected.") };

//FFAA Detection
if (isClass (configfile >> "CfgPatches" >> "ffaa_armas")) then {A3A_hasFFAA = true; Info("FFAA Detected.") };

// CUP Detection
if (
  isClass (configFile >> "cfgPatches" >> "CUP_Creatures_People_Civil_Russia") && // cup units
  isClass (configFile >> "cfgPatches" >> "CUP_BaseConfigs") &&                   // cup weapons
  isClass (configFile >> "cfgPatches" >> "CUP_AirVehicles_Core")                 // cup vehicles
) then {A3A_hasCUP = true; Info("CUP Detected.") };

// GM Detection
if (allowDLCGlobMob && isClass (configFile >> "CfgPatches" >> "gm_weapons_items") && A3A_hasCUP ) then {A3A_hasGM = true; Info("GM Detected");};

//ADDONS BELOW 

//Ivory Car Pack Detection
if (isClass (configfile >> "CfgPatches" >> "Ivory_Data")) then {A3A_hasIvory = true; Info("Ivory Cars Detected.") };

//TCGM_BikeBackpack Detection
if (isClass (configfile >> "CfgPatches" >> "TCGM_BikeBackpack")) then {A3A_hasTCGM = true; Info("TCGM Detected.") };

//ADV-CPR Pike Edition detection
if (A3A_hasACEMedical && isClass (configFile >> "CfgPatches" >> "adv_aceCPR")) then {A3A_hasADV = true; Info("ADV Detected.") };

//KAT medical detection
if(A3A_hasACEMedical && isClass (configFile >> "CfgVehicles" >> "kat_PainkillerItem")) then {A3A_hasKAT = true; Info("KAT MED Detected.") };

//D3S Car Pack Detection !!!--- Currently using vehicle classname check. Needs config viewer to work to find cfgPatches. ---!!!
if (isClass (configfile >> "CfgVehicles" >> "d3s_baumaschinen")) then {A3A_hasD3S = true; Info("D3S Detected.") };

//RDS Car Pack Detection
if (isClass (configfile >> "CfgPatches" >> "rds_A2_Civilians")) then {A3A_hasRDS = true; Info("RDS Cars Detected.") };

//No Mods found logging
if (!A3A_hasRHS && !A3A_hasFFAA && !A3A_hasIFA && !A3A_has3CBBAF && !A3A_hasUNS && !A3A_hasGM) then { Info("No Side Replacement Mods Detected.") };
if (!A3A_hasIvory && !A3A_hasTCGM && !A3A_hasADV && !A3A_hasKAT) then { Info("No Addon Mods Detected.") };
