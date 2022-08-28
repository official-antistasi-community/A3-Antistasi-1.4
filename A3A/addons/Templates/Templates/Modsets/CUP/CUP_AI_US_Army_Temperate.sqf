//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_M1152_WDL_USA", "CUP_B_M1151_WDL_USA", "CUP_B_nM1038_4s_USA_WDL", "CUP_B_nM1038_4s_DF_USA_WDL", "CUP_B_nM1038_DF_USA_WDL", "CUP_B_nM1038_USA_WDL", "CUP_B_nM1025_Unarmed_DF_USA_WDL", "CUP_B_nM1025_Unarmed_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_RG31_M2_OD_GC_USA", "CUP_B_RG31_M2_OD_USA", "CUP_B_RG31E_M2_OD_USA", "CUP_B_RG31_Mk19_OD_USA", "CUP_B_M1167_WDL_USA", "CUP_B_M1165_GMV_WDL_USA", "CUP_B_M1151_Mk19_WDL_USA", "CUP_B_M1151_Deploy_WDL_USA", "CUP_B_M1151_M2_WDL_USA", "CUP_B_nM1036_TOW_DF_USA_WDL", "CUP_B_nM1036_TOW_USA_WDL", "CUP_B_nM1025_SOV_Mk19_USA_WDL", "CUP_B_nM1025_SOV_M2_USA_WDL", "CUP_B_nM1025_Mk19_DF_USA_WDL", "CUP_B_nM1025_Mk19_USA_WDL", "CUP_B_nM1025_M240_DF_USA_WDL", "CUP_B_nM1025_M240_USA_WDL", "CUP_B_nM1025_M2_DF_USA_WDL", "CUP_B_nM1025_M2_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_MTVR_Ammo_USA", "CUP_B_nM1038_Ammo_USA_WDL", "CUP_B_nM1038_Ammo_DF_USA_WDL"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_B_nM1038_Repair_DF_USA_WDL", "CUP_B_nM1038_Repair_USA_WDL", "CUP_B_MTVR_Repair_USA"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_MTVR_Refuel_USA"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_nM997_DF_USA_WDL", "CUP_B_nM997_USA_WDL", "CUP_B_M1133_MEV_Woodland"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_M6LineBacker_USA_W", "CUP_B_M7Bradley_USA_W", "CUP_B_M2A3Bradley_USA_W", "CUP_B_M2Bradley_USA_W", "CUP_B_M1126_ICV_M2_Woodland", "CUP_B_M1126_ICV_MK19_Woodland", "CUP_B_M1128_MGS_Woodland", "CUP_B_M1130_CV_M2_Woodland", "CUP_B_M1135_ATGMV_Woodland", "CUP_B_M1129_MC_MK19_Woodland"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_M1A2C_TUSK_Woodland_US_Army", "CUP_B_M1A2C_TUSK_II_Woodland_US_Army", "CUP_B_M1A2C_Woodland_US_Army", "CUP_B_M1A2SEP_TUSK_Woodland_US_Army", "CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army", "CUP_B_M1A2SEP_Woodland_US_Army", "CUP_B_M1A1SA_TUSK_Woodland_US_Army", "CUP_B_M1A1SA_Woodland_US_Army"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_M6LineBacker_USA_W", "CUP_B_nM1097_AVENGER_USA_WDL", "CUP_B_M163_Vulcan_USA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_A10_DYN_USA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_AV8B_DYN_USMC"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C130J_USMC", "CUP_B_MV22_USMC_RAMPGUN"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_MH6M_USA", "CUP_B_MH6J_USA"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_UH60M_US", "CUP_B_UH60M_FFV_US", "CUP_B_UH60M_Unarmed_US", "CUP_B_UH60M_Unarmed_FFV_US", "CUP_B_MV22_USMC_RAMPGUN"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH6M_USA", "CUP_B_AH6J_USA", "CUP_B_AH64D_DL_USA"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_HE_USA"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M270_HE_USA", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_B_nM1025_M2_USMC_WDL"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_B_MTVR_USMC"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_B_nM1025_Unarmed_USMC_WDL"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Barklem","GreekHead_A3_05","GreekHead_A3_06",
"GreekHead_A3_09","Sturrock","WhiteHead_02","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_09","WhiteHead_10",
"WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["faces", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

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
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
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

_loadoutData set ["uniforms", []];
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
_loadoutData set ["slHat", ["H_Beret_02"]];
_loadoutData set ["sniHats", ["CUP_H_USArmy_Boonie_hs_OEFCP"]];

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
_sfLoadoutData set ["goggles", ["CUP_G_ESS_BLK_Facewrap_Black", "CUP_G_ESS_RGR_Facewrap_Ranger", "CUP_G_ESS_KHK_Facewrap_White", "CUP_G_ESS_BLK_Scarf_Face_Blk", "CUP_G_ESS_KHK_Scarf_Tan_GPS_Beard", "CUP_G_ESS_BLK_Scarf_White_GPS_Beard", "CUP_G_ESS_BLK_Scarf_White_GPS_Beard_Blonde", "CUP_G_Tan_Scarf_GPS_Beard_Blonde","CUP_G_ESS_KHK_Scarf_Tan_Beard"]];
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["CUP_U_CRYE_G3C_MC_US", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_V1_Full"]];
_sfLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_mc"]];
_sfLoadoutData set ["mgVests", ["CUP_V_CPC_weapons_mc"]];
_sfLoadoutData set ["medVests", ["CUP_V_JPC_medicalbelt_mc"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_Khaki_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr", "B_Carryall_cbr"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_US_IIID_OEFCP"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Spray_SF", "CUP_H_OpsCore_Covered_MTP_SF", "CUP_H_OpsCore_Covered_MTP"]];
_sfLoadoutData set ["slHat", ["CUP_H_USA_Cap_Mcam_DEF"]];
_sfLoadoutData set ["sniHats", ["CUP_H_USArmy_Boonie_hs_OCP"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "CUP_muzzle_snds_M16", "", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_mk18_m203_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_mk18_m203_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
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
    ["CUP_arifle_Mk20_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldM3LR", ["CUP_30Rnd_TE1_Red_Tracer_762x51_2_SCAR", "CUP_30Rnd_TE1_White_Tracer_762x51_2_SCAR"], [], "bipod_01_F_blk"],
    ["CUP_arifle_Mk20_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15", "CUP_optic_LeupoldMk4", ["CUP_30Rnd_TE1_Red_Tracer_762x51_2_SCAR", "CUP_30Rnd_TE1_White_Tracer_762x51_2_SCAR"], [], "bipod_01_F_blk"],
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
_militaryLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP", "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP"]];
_militaryLoadoutData set ["slUniforms", ["CUP_U_B_USArmy_ACU_Rolled_Gloves_OEFCP"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_IOTV_OEFCP_Rifleman_USArmy"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_B_IOTV_OEFCP_MG_USArmy"]];
_militaryLoadoutData set ["medVests", ["CUP_V_B_IOTV_OEFCP_Medic_USArmy"]];
_militaryLoadoutData set ["slVests", ["CUP_V_B_IOTV_OEFCP_TL_USArmy"]];
_militaryLoadoutData set ["glVests", ["CUP_V_B_IOTV_OEFCP_Grenadier_USArmy"]];
_militaryLoadoutData set ["engVests", ["CUP_V_B_IOTV_OEFCP_Rifleman_Deltoid_USArmy"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr", "CUP_B_AssaultPack_Coyote", "B_AssaultPack_cbr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_US_Assault_OEFCP"]];
_militaryLoadoutData set ["helmets", ["CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OEFCP", "CUP_H_USArmy_HelmetACH_ESS_Headset_OEFCP", "CUP_H_USArmy_HelmetACH_OEFCP"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_STD_black", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_STD_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_STD_black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC_FG", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_Mk17_CQC_Black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
    ["CUP_arifle_Mk17_CQC_Black", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk17_STD_EGLM_black", "", "", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk17_STD_EGLM_black", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
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
    ["CUP_arifle_Mk20", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
    ["CUP_arifle_Mk20", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
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
_militiaLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_OEFCP"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_IOTV_OEFCP_Rifleman_USArmy"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_B_IOTV_OEFCP_TL_USArmy"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_cbr", "B_FieldPack_cbr"]];
_militiaLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_US_Assault_OEFCP"]];
_militiaLoadoutData set ["helmets", ["CUP_H_USArmy_HelmetACH_OEFCP"]];

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
_crewLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_OEFCP"]];
_crewLoadoutData set ["vests", ["CUP_V_B_IOTV_OEFCP_TL_USArmy"]];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_USArmy_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];


