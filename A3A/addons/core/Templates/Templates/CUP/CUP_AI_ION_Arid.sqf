//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ION"] call _fnc_saveToTemplate;
["spawnMarkerName", "ION support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_ION_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_ion_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Flag_EnochLooters"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["CUP_I_4WD_unarmed_ION"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_LSV_02_unarmed_ION", "CUP_I_nM1025_Unarmed_ION", "CUP_I_MATV_ION"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["CUP_B_nM1025_SOV_Mk19_ION", "CUP_B_nM1025_SOV_M2_ION", "CUP_I_SUV_Armored_ION", "CUP_I_4WD_LMG_ION"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_I_Van_Transport_ION"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CUP_I_Van_Cargo_ION"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_I_nM1038_Ammo_ION"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_I_nM1038_Repair_ION"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_MTVR_Refuel_USA"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_I_nM1035_amb_ION"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_I_BTR80A_ION", "CUP_I_BTR80_ION"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_Challenger2_NATO"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Hilux_zu23_TK"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_I_RG31E_M2_ION"]] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", ["CUP_I_FENNEK_GMG_ION", "CUP_I_MATV_HMG_ION", "CUP_I_FENNEK_HMG_ION", "CUP_I_MATV_GMG_ION"]] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["CUP_B_Zodiac_USMC"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_USMC", "CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["CUP_I_FENNEK_HMG_ION", "CUP_I_FENNEK_GMG_ION"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_AV8B_DYN_USMC"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_F35B_BAF"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C130J_USMC"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_I_MH6M_ION", "CUP_I_412_Mil_Utility_PMC"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_I_Merlin_HC3_PMC_Lux_black", "CUP_I_Merlin_HC3_PMC_Transport_black"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_I_Mi24_Mk3_ION"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_DPICM_BAF_DES"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M270_DPICM_BAF_DES", ["CUP_12Rnd_MLRS_DPICM"]]]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["CUP_I_nM1025_M240_ION", "CUP_I_4WD_AT_ION", "CUP_I_4WD_LMG_ION"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_I_Van_Transport_ION"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_I_4WD_unarmed_ION", "CUP_I_SUV_ION"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CUP_I_SUV_ION"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "CUP_8Rnd_82mm_Mo_shells_veh"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "CUP_8Rnd_82mm_Mo_Smoke_white_veh"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", ["CUP_M72A6_M"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_smaw_scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], [], ""],
	["CUP_launch_Mk153Mod0_blk", "", "", "", ["CUP_SMAW_HEAA_M", "CUP_SMAW_NE_M"], [], ""]
	]];
	

_loadoutData set ["missileATLaunchers", ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]];
_loadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger", "", "", "", ["CUP_Stinger_M"], [], ""]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

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
_loadoutData set ["rangefinders", ["CUP_Vector21Nite"]];

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
_loadoutData set ["slHat", ["H_Cap_blk_ION"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk_hs"]];

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
_sfLoadoutData set ["uniforms", ["CUP_I_B_PMC_Unit_11", "CUP_I_B_PMC_Unit_24", "CUP_I_B_PMC_Unit_42"]];
_sfLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_Black_TL", "CUP_V_PMC_CIRAS_Black_Patrol"]];
_sfLoadoutData set ["mgVests", ["CUP_V_B_Armatus_BB_Black"]];
_sfLoadoutData set ["medVests", ["CUP_V_B_Armatus_Black"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_Black_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_blk"]];
_sfLoadoutData set ["slBackpacks", ["CUP_B_AssaultPack_Black"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_USPack_Black"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Black_NoHS"]];
_sfLoadoutData set ["slHat", ["CUP_H_OpsCore_Black_SF"]];
_sfLoadoutData set ["sniHats", ["CUP_H_PMC_Cap_Back_PRR_Grey"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", []];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_HK417_12", "CUP_muzzle_snds_socom762rc", "", "CUP_optic_aimm_microt1_blk", ["CUP_20Rnd_762x51_HK417"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_m16", "", "CUP_optic_g33_hws_blk", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_m16", "", "CUP_optic_aimm_microt1_blk", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_AK19_bicolor", "CUP_muzzle_snds_m16", "", "CUP_optic_aimm_m68_blk", ["CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_m16", "", "CUP_optic_compm4", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_m16", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_m16", "", "CUP_optic_compm4", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_m16", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_AK19_bicolor", "CUP_muzzle_snds_m16", "", "CUP_optic_compm2_low", ["CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""]
]];

_sfLoadoutData set ["carbines", [
	["CUP_arifle_mk18_black", "CUP_muzzle_snds_m16", "", "CUP_optic_g33_hws_blk", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_mk18_black", "CUP_muzzle_snds_m16", "", "CUP_optic_aimm_microt1_blk", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
	["CUP_arifle_AK102_railed", "CUP_muzzle_snds_m16", "", "CUP_optic_ac11704_black", ["CUP_30Rnd_556x45_AK"], [], ""],
	["CUP_arifle_AK102_railed", "CUP_muzzle_snds_m16", "", "CUP_optic_microt1", ["CUP_30Rnd_556x45_AK"], [], ""]
]];

_sfLoadoutData set ["grenadeLaunchers", [
	["CUP_arifle_AK101_GL_railed", "CUP_muzzle_snds_m16", "", "CUP_optic_microt1", ["CUP_30Rnd_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK101_GL_railed", "CUP_muzzle_snds_m16", "", "CUP_optic_microt1", ["CUP_30Rnd_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
	["CUP_arifle_mk18_m203_black", "CUP_muzzle_snds_m16", "", "CUP_optic_aimm_microt1_blk", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
	["CUP_smg_p90_black", "muzzle_snds_570", "", "CUP_optic_microt1", ["CUP_50Rnd_570x28_Red_Tracer_P90_M"], [], ""],
    ["CUP_smg_p90_black", "muzzle_snds_570", "", "CUP_optic_ac11704_black", ["CUP_50Rnd_570x28_Red_Tracer_P90_M"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
	["CUP_lmg_Mk48", "muzzle_snds_h_mg_blk_f", "", "CUP_optic_compm2_black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
	["CUP_lmg_Mk48", "muzzle_snds_h_mg_blk_f", "", "CUP_optic_hensoldtzo_low_rds", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
	["CUP_srifle_RSASS_Black", "CUP_muzzle_snds_socom762rc", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldm3lr", ["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110" ], [], ""],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldm3lr", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], ""]

]];

_sfLoadoutData set ["sniperRifles", [
	["CUP_srifle_M2010_blk", "muzzle_snds_b", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldmk4_25x50_lrt", ["CUP_5Rnd_762x67_M2010_M"], [], ""],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_awm", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldmk4_25x50_lrt", ["CUP_5Rnd_86x70_L115A1"], [], ""]
]];

_sfLoadoutData set ["lightATLaunchers",[
    ["CUP_launch_M136", "", "", "", ["CUP_M136_M"], [], ""]
]];

_sfLoadoutData set ["ATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
	["CUP_hgun_Deagle", "", "", "", ["CUP_7Rnd_50AE_Deagle"], [], ""]
]];
_sfLoadoutData set ["glSidearms", []];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_I_B_PMC_Unit_9", "CUP_I_B_PMC_Unit_40", "CUP_I_B_PMC_Unit_43"]];
_militaryLoadoutData set ["slUniforms", ["CUP_I_B_PMC_Unit_21"]];
_militaryLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_coy", "CUP_V_CPC_lightbelt_coy"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_CPC_weaponsbelt_coy"]];
_militaryLoadoutData set ["medVests", ["CUP_V_CPC_medicalbelt_coy"]];
_militaryLoadoutData set ["slVests", ["CUP_V_CPC_tlbelt_coy"]];
_militaryLoadoutData set ["glVests", ["CUP_V_CPC_weapons_coy"]];
_militaryLoadoutData set ["engVests", ["CUP_V_CPC_Fast_coy"]];
_militaryLoadoutData set ["backpacks", ["CUP_B_AssaultPack_Coyote"]];
_militaryLoadoutData set ["slBackpacks", ["CUP_B_USPack_Coyote"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_USPack_Coyote"]];
_militaryLoadoutData set ["helmets", ["CUP_H_OpsCore_Tan_SF"]];
_militaryLoadoutData set ["sniHats", ["CUP_H_PMC_Cap_PRR_Grey"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_g33_hws_blk", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_elcan_pip", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_g33_hws_blk", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_elcan_pip", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_AK101_top_rail", "", "", "CUP_optic_g33_hws_blk", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""],
    ["CUP_arifle_AK101_top_rail", "", "", "CUP_optic_elcan_pip", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""]
]];

_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_standard_black", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A3_black", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_AK101_top_rail", "", "", "", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""],
    ["CUP_arifle_AK101_top_rail", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""]
]];

_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_AK102_top_rail", "", "", "", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""],
    ["CUP_arifle_AK102_top_rail", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], [], ""]
]];

_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_AK101_GL_top_rail", "", "", "", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M", "CUP_IlumFlareRed_GP25_M"], ""],
    ["CUP_arifle_AK101_GL_top_rail", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Green_Tracer_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M", "CUP_IlumFlareRed_GP25_M"], ""]
]];

_militaryLoadoutData set ["SMGs", [
    ["CUP_arifle_X95", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_X95", "CUP_30Rnd_556x45_X95_Tracer_Red"], [], ""],
    ["CUP_arifle_X95", "", "", "", ["CUP_30Rnd_556x45_X95", "CUP_30Rnd_556x45_X95_Tracer_Red"], [], ""],
    ["CUP_smg_MP7", "", "", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_MP7", "", "", "CUP_optic_holoblack", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_EVO", "", "", "", ["CUP_30Rnd_9x19_EVO"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimi_railed", "", "", "CUP_optic_elcanm145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_minimi_railed", "", "", "CUP_optic_elcan_specterdr_black_pip", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_arifle_MG36", "", "", "CUP_optic_elcanm145", ["CUP_100Rnd_556x45_BetaCMag", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag"], [], ""],
    ["CUP_arifle_MG36", "", "", "CUP_optic_elcan_specterdr_black_pip", ["CUP_100Rnd_556x45_BetaCMag", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_leupoldm3lr", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], "CUP_bipod_harris_1a2_l_blk"],
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_leupoldmk4_pip", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR"], [], "CUP_bipod_harris_1a2_l_blk"],
    ["CUP_arifle_Mk20_black", "", "", "CUP_optic_leupoldm3lr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_harris_1a2_l_blk"],
    ["CUP_arifle_Mk20_black", "", "", "CUP_optic_leupoldmk4_pip", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_harris_1a2_l_blk"]
]];

_militaryLoadoutData set ["sniperRifles", [
	["CUP_srifle_M2010_blk", "", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldm3lr", ["CUP_5Rnd_762x67_M2010_M"], [], ""]
]];

_militaryLoadoutData set ["sidearms", [
	["CUP_hgun_Duty", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_Beret_gen_F", "H_MilCap_gen_F"]];
_policeLoadoutData set ["shotGuns", [
["CUP_sgun_AA12", "", "", "", ["CUP_20Rnd_B_AA12_Buck_00", "CUP_20Rnd_B_AA12_Slug"], [], ""],
["CUP_sgun_SPAS12", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""]
]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_bizon", "", "", "", ["CUP_64Rnd_9x19_Bizon_M", "CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M"], [], ""],
["CUP_smg_BallisticShield_MP7", "", "", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
	["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_I_B_PMC_Unit_40", "CUP_I_B_PMC_Unit_39", "CUP_I_B_PMC_Unit_38", "CUP_I_B_PMC_Unit_1"]];
_militiaLoadoutData set ["vests", ["CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_3", "CUP_V_B_JPC_Tan_Light"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_B_GER_Carrier_Rig_3_Brown"]];
_militiaLoadoutData set ["backpacks", ["CUP_B_AssaultPack_Coyote", "B_AssaultPack_cbr"]];
_militiaLoadoutData set ["slBackpacks", ["CUP_B_USPack_Coyote", "B_Carryall_cbr"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_USPack_Coyote", "B_Carryall_cbr"]];
_militiaLoadoutData set ["helmets", ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Grey", "CUP_H_OpsCore_Tan_NoHS"]];
_militiaLoadoutData set ["sniHats", ["H_Shemag_olive_hs"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_black", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M16A4_Base", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M16A4_Base", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""]
]];

_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""]
]];

_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_holoblack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "", "", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];

_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_ac11704_black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""]
]];

_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_HK_M27_VFG", "", "", "CUP_optic_eotech553_black", ["CUP_60Rnd_556x45_SureFire", "CUP_60Rnd_556x45_SureFire_Tracer_Green"], [], ""],
    ["CUP_arifle_HK_M27_VFG", "", "", "", ["CUP_60Rnd_556x45_SureFire", "CUP_60Rnd_556x45_SureFire_Tracer_Green"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_leupoldmk4", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_srifle_Mk12SPR", "", "", "CUP_optic_hensoldtzo_low", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];

_militiaLoadoutData set ["sniperRifles", [
	["CUP_srifle_G22_blk", "", "CUP_bipod_harris_1a2_l_blk", "CUP_optic_leupoldmk4", ["CUP_5Rnd_762x67_G22"], [], ""]
]];

_militiaLoadoutData set ["lightATLaunchers", []];
_militiaLoadoutData set ["ATLaunchers", []];
_militiaLoadoutData set ["sidearms", ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CUP_I_B_PMC_Unit_19"]];
_crewLoadoutData set ["vests", ["CUP_V_B_GER_Carrier_Rig_3_Brown"]];
_crewLoadoutData set ["helmets", ["H_HeadSet_black_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USMC_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_GER_Carrier_Rig_3_Brown"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetFighter_B"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
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


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
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
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
