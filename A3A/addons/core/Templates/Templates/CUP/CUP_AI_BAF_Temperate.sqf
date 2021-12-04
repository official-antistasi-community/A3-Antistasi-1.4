//////////////////////////
//   Side Information   //
//////////////////////////

["name", "BAF"] call _fnc_saveToTemplate;                         //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", "BAF support corridor"] call _fnc_saveToTemplate;             //this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;                         //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;                 //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;             //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic",["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed",["CUP_B_LR_Transport_GB_W"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["CUP_B_BAF_Coyote_GMG_W","CUP_B_BAF_Coyote_L2A1_W","CUP_B_Jackal2_GMG_GB_W","CUP_B_Jackal2_L2A1_GB_W","CUP_B_LR_Special_GMG_GB_W","CUP_B_LR_Special_M2_GB_W","CUP_B_LR_MG_GB_W","CUP_B_Mastiff_GMG_GB_W","CUP_B_Mastiff_HMG_GB_W","CUP_B_Mastiff_LMG_GB_W","CUP_B_Ridgback_GMG_GB_W","CUP_B_Ridgback_HMG_GB_W","CUP_B_Ridgback_LMG_GB_W","CUP_B_Wolfhound_GMG_GB_W","CUP_B_Wolfhound_HMG_GB_W","CUP_B_Wolfhound_LMG_GB_W"]] call _fnc_saveToTemplate;

["vehiclesTrucks",["CUP_B_MTVR_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks",["B_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;

["vehiclesAmmoTrucks",["CUP_B_MTVR_Ammo_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks",["CUP_B_MTVR_Repair_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks",["CUP_B_MTVR_Refuel_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesMedical",["CUP_B_LR_Ambulance_GB_W"]] call _fnc_saveToTemplate;

["vehiclesAPCs",["CUP_B_FV432_Bulldog_GB_W_RWS","CUP_B_FV432_Bulldog_GB_W","CUP_B_FV510_GB_W_SLAT","CUP_B_FV510_GB_W","CUP_B_MCV80_GB_W_SLAT","CUP_B_MCV80_GB_W"]] call _fnc_saveToTemplate;
["vehiclesTanks",["CUP_B_Challenger2_Woodland_BAF"]] call _fnc_saveToTemplate;
["vehiclesAA",["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs",[]] call _fnc_saveToTemplate;
["vehiclesIFVs",[]] call _fnc_saveToTemplate;

["vehiclesTransportBoats",["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats",["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious",[]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS",["CUP_B_F35B_BAF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA",["CUP_B_GR9_DYN_GB"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport",["CUP_B_C130J_GB"]] call _fnc_saveToTemplate;

["vehiclesHelisLight",["CUP_B_AW159_Unarmed_RN_Blackcat","CUP_B_AW159_Unarmed_GB","CUP_B_AW159_Unarmed_RN_Grey"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport",["CUP_B_CH47F_GB","CUP_B_MH47E_GB","CUP_B_Merlin_HC3_GB","CUP_B_Merlin_HC3_Armed_GB","CUP_B_Merlin_HC3A_GB","CUP_B_Merlin_HC4_GB","CUP_B_SA330_Puma_HC1_BAF","CUP_B_SA330_Puma_HC2_BAF"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack",["CUP_B_AH1_DL_BAF"]] call _fnc_saveToTemplate;

["vehiclesArtillery",["CUP_B_M270_HE_BAF_WOOD"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M270_HE_BAF_WOOD",["CUP_R_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack",[]] call _fnc_saveToTemplate;
["uavsPortable",[]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed",["CUP_B_nM1025_M2_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks",["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars",["CUP_B_nM1025_Unarmed_DF_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesPolice",["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs",["CUP_B_L111A1_BAF_DDPM"]] call _fnc_saveToTemplate;
["staticAT",["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA",["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars",["CUP_B_L16A2_BAF_DDPM"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;             //this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;





//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["CUP_launch_NLAW"]];
_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M", "CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger_Loaded","","","",["CUP_Stinger_M"],[],""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", ["ACE_microDAGR", "ACE_DAGR", "Laserbatteries", "Laserbatteries", "Laserbatteries"]];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector", "ACE_Clacker", "ACE_DefusalKit"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData set ["items_sniper_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["CUP_U_B_BAF_MTP_UBACSLONG","CUP_U_B_BAF_MTP_UBACSLONG_Gloves","CUP_U_B_BAF_MTP_UBACSLONGKNEE","CUP_U_B_BAF_MTP_UBACSLONGKNEE_Gloves","CUP_U_B_BAF_MTP_UBACSROLLED_Gloves"]];
_sfLoadoutData set ["vests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Scout","CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr","B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Black","CUP_H_OpsCore_Green","CUP_H_OpsCore_Grey","CUP_H_OpsCore_Tan","CUP_H_OpsCore_Black_SF","CUP_H_OpsCore_Tan_SF"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_Eotech553_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2","CUP_muzzle_snds_L85","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2","CUP_muzzle_snds_L85","","CUP_optic_Eotech553_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
    ["CUP_arifle_L85A2","CUP_muzzle_snds_L85","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL","","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""],
    ["CUP_arifle_L85A2_GL","","","CUP_optic_Eotech553_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""],
    ["CUP_arifle_L85A2_GL","","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5","CUP_muzzle_snds_MP5","","CUP_optic_CompM2_OD",["CUP_30Rnd_9x19_MP5"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1","","","CUP_optic_CompM2_OD",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_ACOG2",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_Elcan_SpecterDR_od",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_ElcanM145",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L7A2_Flat","","","",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_ElcanM145",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_Elcan_SpecterDR_od",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_Eotech553_OD",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_CompM2_OD",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1","muzzle_snds_B","","CUP_optic_LeupoldMk4",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_blk"],
    ["CUP_srifle_L129A1","muzzle_snds_B","","CUP_optic_LeupoldMk4_MRT_tan",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_blk"],
    ["CUP_srifle_L129A1","muzzle_snds_B","","CUP_optic_LeupoldM3LR",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_blk"],
    ["CUP_srifle_L129A1","muzzle_snds_B","","CUP_optic_LeupoldMk4_20x40_LRT",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","","CUP_optic_LeupoldMk4_20x40_LRT",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","","CUP_optic_LeupoldMk4",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","","CUP_optic_LeupoldMk4_25x50_LRT",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","","CUP_optic_Leupold_VX3",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Mk23","CUP_muzzle_snds_mk23","CUP_acc_mk23_lam_f","",["CUP_12Rnd_45ACP_mk23"],[],""],
    ["CUP_hgun_M9","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9"],[],""],
    ["CUP_hgun_M9A1","CUP_muzzle_snds_M9","","",["CUP_15Rnd_9x19_M9"],[],""],
    ["CUP_hgun_Browning_HP","CUP_muzzle_snds_M9","","",["CUP_13Rnd_9x19_Browning_HP"],[],""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE","CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves","CUP_U_B_BAF_DPM_UBACSROLLED","CUP_U_B_BAF_DPM_UBACSROLLED_Gloves","CUP_U_B_BAF_DPM_UBACSROLLEDKNEE"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_AutomaticRifleman","CUP_V_B_BAF_DDPM_Osprey_Mk3_Engineer","CUP_V_B_BAF_DDPM_Osprey_Mk3_Grenadier","CUP_V_B_BAF_DDPM_Osprey_Mk3_Medic","CUP_V_B_BAF_DDPM_Osprey_Mk3_Officer","CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman","CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout","CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman","CUP_V_B_BAF_MTP_Osprey_Mk4_Engineer","CUP_V_B_BAF_MTP_Osprey_Mk4_Grenadier","CUP_V_B_BAF_MTP_Osprey_Mk4_Medic","CUP_V_B_BAF_MTP_Osprey_Mk4_Officer","CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman","CUP_V_B_BAF_MTP_Osprey_Mk4_Scout"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr","B_FieldPack_cbr","B_Kitbag_cbr","CUP_B_Bergen_BAF","CUP_B_Motherlode_MTP","CUP_B_Motherlode_Radio_MTP","CUP_B_Predator_MTP","CUP_B_Predator_Radio_MTP"]];
_militaryLoadoutData set ["helmets", ["CUP_H_BAF_DPM_Mk6_NETTING_PRR","CUP_H_BAF_DPM_Mk6_GOGGLES_PRR","CUP_H_BAF_DDPM_Mk6_GLASS_PRR","CUP_H_BAF_DPM_Mk6_GLASS_PRR","CUP_H_BAF_DPM_Mk6_CREW_PRR"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_NG","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_G","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2","","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_NG","","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_G","","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2","","","CUP_optic_ACOG_TA01NSN_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_NG","","","CUP_optic_ACOG_TA01NSN_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""],
    ["CUP_arifle_L85A2_G","","","CUP_optic_ACOG_TA01NSN_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2","","","CUP_optic_Eotech553_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL","","","CUP_optic_Eotech553_OD",["CUP_30Rnd_556x45_Stanag_L85"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""],
    ["CUP_arifle_L85A2_GL","","","CUP_optic_Elcan_SpecterDR_od",["CUP_30Rnd_556x45_Stanag_L85"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""],
    ["CUP_arifle_L85A2_GL","","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Stanag_L85"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""],
    ["CUP_arifle_L85A2_GL","","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Stanag_L85"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5","","","CUP_optic_CompM2_OD",["CUP_30Rnd_9x19_MP5"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1","","","CUP_optic_ACOG2",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_CompM2_OD",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_Eotech553_OD",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L110A1","","","CUP_optic_Elcan_SpecterDR_od",["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"],[],""],
    ["CUP_lmg_L7A2_Flat","","","",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_Elcan_SpecterDR_od",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
    ["CUP_lmg_L7A2","","","CUP_optic_CompM2_OD",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1","","","CUP_optic_LeupoldMk4",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_khk"],
    ["CUP_srifle_L129A1","","","CUP_optic_LeupoldMk4_MRT_tan",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_khk"],
    ["CUP_srifle_L129A1","","","CUP_optic_LeupoldM3LR",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_khk"],
    ["CUP_srifle_L129A1","","","CUP_optic_Leupold_VX3",["CUP_20Rnd_762x51_L129_M"],[],"bipod_01_F_khk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk","","","CUP_optic_Leupold_VX3",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_khk"],
    ["CUP_srifle_AWM_blk","","","CUP_optic_LeupoldMk4_25x50_LRT",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk","","","CUP_optic_LeupoldMk4_20x40_LRT",["CUP_5Rnd_86x70_L115A1"],[],"bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP","","","",["CUP_13Rnd_9x19_Browning_HP"],[],""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk","","","",["CUP_30Rnd_45ACP_M3A1_BLK_M"],[],""],
    ["CUP_smg_MP5A5","","","CUP_optic_CompM2_low",["CUP_30Rnd_Red_Tracer_9x19_MP5"],[],""],
    ["CUP_smg_MP5A5","","","CUP_optic_Eotech553_Coyote",["CUP_30Rnd_Red_Tracer_9x19_MP5"],[],""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911"],[],""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSROLLED_Gloves","CUP_U_B_BAF_DPM_UBACSLONGKNEE","CUP_U_B_BAF_DPM_UBACSROLLED"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_cbr","B_Carryall_cbr","B_FieldPack_cbr"]];
_militiaLoadoutData set ["helmets", ["CUP_H_BAF_DDPM_Mk6_EMPTY"]];

_militiaLoadoutData set ["rifles", [[
    "CUP_arifle_L85A2","","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2_NG","","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Stanag_L85"],[],""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL","","","CUP_optic_CompM2_OD",["CUP_30Rnd_556x45_Stanag_L85"],["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"],""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5","","","CUP_optic_CompM2_OD",["CUP_30Rnd_9x19_MP5"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1","","","CUP_optic_CompM2_OD",["CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1","","","CUP_optic_Leupold_VX3",["CUP_20Rnd_762x51_L129_M"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP","","","",["CUP_13Rnd_9x19_Browning_HP"],[],""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE"]];
_crewLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Crewman"]];
_crewLoadoutData set ["helmets", ["CUP_H_BAF_DDPM_Mk6_CREW_PRR"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Crewman"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
  [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;