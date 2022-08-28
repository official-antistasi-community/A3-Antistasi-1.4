//////////////////////////
//   Side Information   //
//////////////////////////

["name", "BAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "BAF support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_LR_Transport_GB_D"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_BAF_Coyote_GMG_D", "CUP_B_BAF_Coyote_L2A1_D", "CUP_B_Jackal2_L2A1_GB_D", "CUP_B_LR_Special_M2_GB_D", "CUP_B_LR_MG_GB_D", "CUP_B_Mastiff_HMG_GB_D", "CUP_B_Mastiff_LMG_GB_D", "CUP_B_Ridgback_GMG_GB_D", "CUP_B_Ridgback_HMG_GB_D", "CUP_B_Ridgback_LMG_GB_D", "CUP_B_Wolfhound_GMG_GB_D", "CUP_B_Wolfhound_HMG_GB_D", "CUP_B_Wolfhound_LMG_GB_D"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_B_MTVR_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_MTVR_Ammo_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_B_MTVR_Repair_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_MTVR_Refuel_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_LR_Ambulance_GB_D"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_FV432_Bulldog_GB_D_RWS", "CUP_B_FV432_Bulldog_GB_D", "CUP_B_FV510_GB_D", "CUP_B_FV510_GB_D_SLAT", "CUP_B_MCV80_GB_D", "CUP_B_MCV80_GB_D_SLAT"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_Challenger2_Desert_BAF"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_M6LineBacker_USA_D", "CUP_B_nM1097_AVENGER_USA_DES", "CUP_B_M163_Vulcan_USA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_GR9_DYN_GB"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_GR9_DYN_GB"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C130J_GB"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_AW159_Unarmed_RN_Blackcat", "CUP_B_AW159_Unarmed_GB", "CUP_B_AW159_Unarmed_RN_Grey"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_CH47F_GB", "CUP_B_MH47E_GB", "CUP_B_Merlin_HC3_GB", "CUP_B_Merlin_HC3_Armed_GB", "CUP_B_Merlin_HC3A_GB", "CUP_B_Merlin_HC4_GB", "CUP_B_SA330_Puma_HC1_BAF", "CUP_B_SA330_Puma_HC2_BAF"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH1_DL_BAF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_HE_BAF_DES"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M270_HE_BAF_DES", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_B_nM1025_M2_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_B_nM1025_Unarmed_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_L111A1_BAF_DDPM"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_L16A2_BAF_DDPM"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
"WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_GB_BAF","CUP_D_Male02_GB_BAF","CUP_D_Male03_GB_BAF","CUP_D_Male04_GB_BAF","CUP_D_Male05_GB_BAF"]] call _fnc_saveToTemplate;

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
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["CUP_launch_NLAW"]];
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
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

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
_sfLoadoutData set ["uniforms", ["CUP_U_B_BAF_MTP_UBACSLONG", "CUP_U_B_BAF_MTP_UBACSLONG_Gloves"]];
_sfLoadoutData set ["vests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Scout"]];
_sfLoadoutData set ["mgVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman"]];
_sfLoadoutData set ["medVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Medic"]];
_sfLoadoutData set ["glVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_sfLoadoutData set ["slBackpacks", ["CUP_B_Motherlode_Radio_MTP"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Tan_SF"]];
_sfLoadoutData set ["slHat", ["CUP_H_BAF_PARA_PRROVER_BERET"]];
_sfLoadoutData set ["sniHats", ["CUP_H_USArmy_Boonie_OCP"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];


_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "CUP_muzzle_snds_MP5", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1", "", "", "CUP_optic_CompM2_low", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ACOG2", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L7A2_Flat", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_CompM2_low", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4_MRT_tan", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Mk23", "CUP_muzzle_snds_mk23", "CUP_acc_mk23_lam_f", "", ["CUP_12Rnd_45ACP_mk23"], [], ""],
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_M9A1", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Browning_HP", "CUP_muzzle_snds_M9", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_B_BAF_DDPM_UBACSLONG", "CUP_U_B_BAF_DDPM_UBACSLONG_Gloves", "CUP_U_B_BAF_DDPM_UBACSLONGKNEE", "CUP_U_B_BAF_DDPM_UBACSLONGKNEE_Gloves", "CUP_U_B_BAF_DDPM_UBACSROLLED_Gloves", "CUP_U_B_BAF_DDPM_UBACSROLLEDKNEE", "CUP_U_B_BAF_DDPM_UBACSTSHIRT", "CUP_U_B_BAF_DDPM_UBACSTSHIRT_Gloves", "CUP_U_B_BAF_DDPM_UBACSTSHIRTKNEE"]];
_militaryLoadoutData set ["slUniforms", ["CUP_U_B_BAF_DDPM_UBACSROLLED"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman"]]; 
_militaryLoadoutData set ["mgVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_AutomaticRifleman"]];
_militaryLoadoutData set ["medVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Medic"]];
_militaryLoadoutData set ["slVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Officer"]];
_militaryLoadoutData set ["glVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Grenadier"]];
_militaryLoadoutData set ["engVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Engineer"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["atBackpacks", ["B_FieldPack_cbr"]];
_militaryLoadoutData set ["helmets", ["CUP_H_BAF_DDPM_Mk6_EMPTY", "CUP_H_BAF_DDPM_Mk6_EMPTY_PRR", "CUP_H_BAF_DDPM_Mk6_GLASS_PRR", "CUP_H_BAF_DDPM_Mk6_GOGGLES_PRR", "CUP_H_BAF_DDPM_Mk6_NETTING_PRR"]];
_militaryLoadoutData set ["sniHats", ["H_Booniehat_tan"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ACOG2", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_CompM2_low", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Eotech553_Black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L7A2_Flat", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_CompM2_low", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
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
_militiaLoadoutData set ["uniforms", ["CUP_U_B_BAF_DDPM_UBACSTSHIRT", "CUP_U_B_BAF_DDPM_UBACSROLLEDKNEE", "CUP_U_B_BAF_DDPM_UBACSLONGKNEE_Gloves"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout"]];
_militiaLoadoutData set ["backpacks", ["B_Carryall_cbr"]];
_militiaLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militiaLoadoutData set ["atBackpacks", ["B_FieldPack_cbr"]];
_militiaLoadoutData set ["helmets", ["CUP_H_BAF_DDPM_Mk6_EMPTY"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_tan"]];

_militiaLoadoutData set ["rifles", [[
    "CUP_arifle_L85A2", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1", "", "", "CUP_optic_CompM2_low", ["CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_L129_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_khk"]
]];
_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_B_BAF_DDPM_UBACSROLLEDKNEE"]];
_crewLoadoutData set ["vests", ["CUP_V_B_BAF_DDPM_Osprey_Mk3_Crewman"]];
_crewLoadoutData set ["helmets", ["CUP_H_BAF_DDPM_Mk6_CREW_PRR"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_BAF_DDPM_UBACSROLLED_Gloves"]];
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

