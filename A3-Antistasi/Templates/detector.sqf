/*
Author: Meerkat
  This file handles the detection of mods.
  Best practice is to detect the presence of a CfgPatches entry, but there are alternatives.
  To add a new mod, give it a hadMod variable with the rest, then add an if (isClass) entry like the FFAA one. (You could even copy/paste the FFAA one and replace its calls with the ones you need.)

Scope: All
Environment: Any (Scheduled Inherited from fn_initVarCommon.sqf)
Public: No
*/

//Var initialisation
private _filename = "detector.sqf";
A3A_hasRHS = false;
A3A_hasFFAA = false;
A3A_hasIFA = false;
A3A_has3CB = false;
A3A_hasIvory = false;
A3A_hasTCGM = false;
A3A_hasADV = false;
A3A_hasD3S = false;
A3A_hasRDS = false;

//Actual Detection
//IFA Detection
//Deactivated for now, as IFA is having some IP problems (08.05.2020 european format)
if (isClass (configFile >> "CfgPatches" >> "LIB_Core")) then {
    //A3A_hasIFA = true;
    //[2, "IFA Detected", _fileName] call A3A_fnc_log;
    [1, "IFA detected, but it is no longer supported, please remove this mod", _fileName] call A3A_fnc_log;
    ["modUnautorized",false,1,false,false] call BIS_fnc_endMission;
};

//RHS Detection
if (isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_vdv") && isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") && isClass (configFile >> "CfgFactionClasses" >> "rhsgref_faction_tla")) then {
  A3A_hasRHS = true;
  [2,"RHS Detected.",_fileName] call A3A_fnc_log;
};

//3CB Detection
if (A3A_hasRHS && (
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Weapons") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Vehicles") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Units_Common") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment") &&
  isClass (configfile >> "CfgPatches" >> "UK3CB_BAF_Factions")
) ) then {A3A_has3CB = true; [2,"3CB Detected.",_fileName] call A3A_fnc_log;};

//FFAA Detection
if (isClass (configfile >> "CfgPatches" >> "ffaa_armas")) then {A3A_hasFFAA = true; [2,"FFAA Detected.",_fileName] call A3A_fnc_log;};

//Ivory Car Pack Detection
if (isClass (configfile >> "CfgPatches" >> "Ivory_Data")) then {A3A_hasIvory = true; [2,"Ivory Cars Detected.",_fileName] call A3A_fnc_log;};

//TCGM_BikeBackpack Detection
if (isClass (configfile >> "CfgPatches" >> "TCGM_BikeBackpack")) then {A3A_hasTCGM = true; [2,"TCGM Detected.",_fileName] call A3A_fnc_log;};
//ADV-CPR Pike Edition detection
if (hasACEMedical && isClass (configFile >> "CfgPatches" >> "adv_aceCPR")) then {A3A_hasADV = true; [2,"ADV Detected.",_fileName] call A3A_fnc_log;};

//D3S Car Pack Detection !!!--- Currently using vehicle classname check. Needs config viewer to work to find cfgPatches. ---!!!
if (isClass (configfile >> "CfgVehicles" >> "d3s_baumaschinen")) then {A3A_hasD3S = true; [2,"D3S Detected.",_fileName] call A3A_fnc_log;};

//RDS Car Pack Detection
if (isClass (configfile >> "CfgPatches" >> "rds_A2_Civilians")) then {A3A_hasRDS = true; [2,"RDS Cars Detected.",_fileName] call A3A_fnc_log;};

//No Mods found logging
if (!A3A_hasRHS && !A3A_hasFFAA && !A3A_hasIFA && !A3A_has3CB) then {[2,"No Side Replacement Mods Detected.",_fileName] call A3A_fnc_log;};
if (!A3A_hasIvory && !A3A_hasTCGM && !A3A_hasADV) then {[2,"No Addon Mods Detected.",_fileName] call A3A_fnc_log;};
