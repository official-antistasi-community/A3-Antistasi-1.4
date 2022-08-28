//////////////////////////
//   Side Information   //
//////////////////////////

["name", "RACS"] call _fnc_saveToTemplate;
["spawnMarkerName", "RACS Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_racs_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_CUP_RACS"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_nM1025_Unarmed_DF_USA_WDL", "CUP_B_nM1025_Unarmed_USA_WDL", "CUP_B_nM1038_DF_USA_WDL", "CUP_B_nM1038_USA_WDL", "CUP_B_nM1038_4s_DF_USA_WDL", "CUP_B_nM1038_4s_USA_WDL", "CUP_B_M1151_WDL_USA"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_nM1025_M2_USA_WDL", "CUP_B_nM1025_M2_DF_USA_WDL", "CUP_B_nM1025_M240_USA_WDL", "CUP_B_nM1025_M240_DF_USA_WDL", "CUP_B_nM1025_Mk19_USA_WDL", "CUP_B_nM1025_Mk19_DF_USA_WDL", "CUP_B_nM1025_SOV_M2_USA_WDL", "CUP_B_nM1025_SOV_Mk19_USA_WDL", "CUP_B_nM1036_TOW_USA_WDL", "CUP_B_nM1036_TOW_DF_USA_WDL", "CUP_B_M1151_M2_WDL_USA", "CUP_B_M1151_Deploy_WDL_USA", "CUP_B_M1151_Mk19_WDL_USA", "CUP_B_M1165_GMV_WDL_USA", "CUP_B_M1167_WDL_USA", "CUP_B_RG31_Mk19_OD_USA", "CUP_B_RG31E_M2_OD_USA", "CUP_B_RG31_M2_OD_USA", "CUP_B_RG31_M2_OD_GC_USA"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_I_MTVR_RACS"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_I_MTVR_Ammo_RACS", "CUP_I_M113A3_Reammo_RACS"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_I_MTVR_Repair_RACS", "CUP_I_M113A3_Repair_RACS"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_I_MTVR_Refuel_RACS"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_I_LR_Ambulance_RACS", "CUP_I_M113A1_Med_RACS"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_M2Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W", "CUP_B_M7Bradley_USA_W", "CUP_B_M6LineBacker_USA_W", "CUP_B_M1126_ICV_M2_Woodland", "CUP_B_M1126_ICV_MK19_Woodland", "CUP_B_M1135_ATGMV_Woodland", "CUP_I_LAV25_RACS", "CUP_I_M113A1_RACS", "CUP_I_M113A1_RACS_URB"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_M1A2C_OD_US_Army", "CUP_B_M1A2SEP_TUSK_II_OD_US_Army", "CUP_B_M1A1SA_TUSK_OD_US_Army", "CUP_I_M60A3_RACS", "CUP_I_M60A3_TTS_RACS", "CUP_B_M1A2SEP_RACS", "CUP_B_M1A2SEP_TUSK_RACS", "CUP_I_T72_RACS"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_M163_Vulcan_RACS", "CUP_I_LR_AA_RACS"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["CUP_I_LAV25_RACS", "CUP_I_LAV25M240_RACS", "CUP_I_AAV_RACS"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_A10_DYN_USA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_I_JAS39_RACS"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_MV22_USMC_RAMPGUN"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_I_MH6J_RACS", "CUP_I_UH1H_RACS"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_I_SA330_Puma_HC1_RACS", "CUP_I_SA330_Puma_HC2_RACS", "CUP_I_CH47F_RACS", "CUP_I_UH60L_RACS", "CUP_I_UH60L_FFV_RACS", "CUP_I_UH60L_Unarmed_RACS", "CUP_I_UH60L_Unarmed_FFV_Racs"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH6M_USA", "CUP_B_AH6J_USA", "CUP_B_AH64D_DL_USA", "CUP_I_UH1H_gunship_RACS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_I_M270_HE_RACS"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_I_M270_HE_RACS", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_I_LR_MG_RACS"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_I_LR_Transport_RACS"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_I_M2StaticMG_RACS"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_M252_RACS"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""],
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""],
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""]
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
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", ["CUP_U_I_RACS_mech_1", "CUP_U_I_RACS_mech_2"]];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CUP_H_RACS_Beret_Blue"]];
_loadoutData set ["sniHats", ["H_Booniehat_tan"]];

_loadoutData set ["glasses", ["CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drk", "CUP_G_Oakleys_Embr", "CUP_G_TK_RoundGlasses_gold", "CUP_G_TK_RoundGlasses", "CUP_G_PMC_RadioHeadset_Glasses", "CUP_G_PMC_RadioHeadset_Glasses_Ember"]];
_loadoutData set ["goggles", ["CUP_G_ESS_BLK_Dark", "CUP_G_ESS_BLK_Ember", "CUP_G_ESS_CBR", "CUP_G_ESS_KHK_Dark"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["CUP_optic_AN_PVS_10_black"];

if (A3A_hasACE) then {
	_slItems append ["ACE_microDAGR", "ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_rngr"]];
_sfLoadoutData set ["mgVests", ["CUP_V_CPC_weapons_rngr"]];
_sfLoadoutData set ["medVests", ["CUP_V_JPC_medicalbelt_rngr"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_OD_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_Carryall_green_F"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Spray_SF", "CUP_H_OpsCore_Green_SF", "CUP_H_OpsCore_Tan_SF"]];
_sfLoadoutData set ["slHat", ["CUP_H_PMC_Cap_EP_Grey"]];
_sfLoadoutData set ["sniHats", ["CUP_H_USA_Boonie_wdl"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36KA3_grip", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36KA3_grip", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36K_KSK_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36K_KSK_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36KA3_grip", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36KA3_grip", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_G36K_KSK_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36K_KSK_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_G36C_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36C_VFG", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_CompM2_low", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Mk48", "", "CUP_acc_ANPEQ_15", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_Mk48", "", "CUP_acc_ANPEQ_15", "CUP_optic_G33_HWS_BLK", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_G33_HWS_BLK", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_Eotech553_Black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_G33_HWS_BLK", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_DSA_SA58_DMR", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M", "CUP_30Rnd_762x51_FNFAL_M"], [], "bipod_01_F_blk"],
    ["CUP_arifle_DSA_SA58_DMR", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M", "CUP_30Rnd_762x51_FNFAL_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""],
    ["CUP_launch_M136", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["vests", ["CUP_V_B_Ciras_Olive2"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_B_Ciras_Olive"]];
_militaryLoadoutData set ["medVests", ["CUP_V_PMC_CIRAS_OD_Patrol"]];
_militaryLoadoutData set ["slVests", ["CUP_V_PMC_CIRAS_OD_TL"]];
_militaryLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_OD_Grenadier"]];
_militaryLoadoutData set ["engVests", ["CUP_V_B_Ciras_Olive4"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_green_F","B_AssaultPack_rgr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_militaryLoadoutData set ["atBackpacks", ["B_AssaultPack_rgr"]];
_militaryLoadoutData set ["helmets", ["CUP_H_LWHv2_tigerstripe", "CUP_H_LWHv2_tigerstripe_comms", "CUP_H_LWHv2_tigerstripe_ess_comms"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36A3", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36A3", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_VFG", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_VFG", "", "", "CUP_optic_ACOG", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36A3", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_VFG", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36A3", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW_VFG", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_G36CA3_grip", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_G36CA3_grip", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_DSA_SA58_OSW", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_G36K_RIS_AG36", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_G36K_RIS_AG36", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_DSA_SA58_OSW_M203", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_CompM2_low", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_m249_pip1", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M240_B", "", "CUP_acc_ANPEQ_15", "CUP_optic_ACOG_TA648_308_Black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_DSA_SA58_DMR", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_DSA_SA58_DMR", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], ""],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_ACOG_TA648_308_Black", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_m110_kac_black", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_SB_11_4x20_PM", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_LeupoldMk4", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_LeupoldM3LR", ["30Rnd_556x45_Stanag_Tracer_Red"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["vests", ["CUP_V_I_RACS_Carrier_Vest_wdl_3"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_I_RACS_Carrier_Rig_wdl_3"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_FieldPack_khk"]];
_militiaLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_militiaLoadoutData set ["atBackpacks", ["B_FieldPack_khk"]];
_militiaLoadoutData set ["helmets", ["CUP_H_LWHv2_tigerstripe"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_black", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_MOE_short_black", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M60", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_M4A1_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["CUP_arifle_M4A1_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_I_RACS_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_USArmy_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];


