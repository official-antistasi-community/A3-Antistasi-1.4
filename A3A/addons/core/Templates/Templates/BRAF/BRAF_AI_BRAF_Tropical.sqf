//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "BrAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "BrAF support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\BRAF\flag_brazil.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "flag_BRA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["BRAF_AM11_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["BRAF_LMV_EB", "BRAF_AM21_GLO", "BRAF_AM21_Opened"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["BRAF_LMV_EB_RCWS", "BRAF_AM11_Armed"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["BRAF_AM21_Covered", "BRAF_Worker_Covered"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["BRAF_Worker_Cargo", "BRAF_AM21_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["BRAF_Worker_Ammo", "BRAF_AM21_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["BRAF_Worker_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["BRAF_Worker_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["BRAF_Worker_Health"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_B_M113A3_USA", "CUP_B_M113A3_USA", "CUP_B_M113A1_USA"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["braf_guarani_eb_remax","braf_guarani_eb_remax","braf_guarani_eb_remax"]] call _fnc_saveToTemplate;            // mortar carrier: "CUP_B_M1129_MC_MK19_Woodland"
["vehiclesIFVs", ["BRAF_EE9_Cascavel_EB","BRAF_EE9_Cascavel_EB","BRAF_EE9_Cascavel_EB"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_M60A3_USMC", "CUP_B_M60A3_TTS_USMC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_M163_Vulcan_USA"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["CUP_B_M113A1_USA", "CUP_B_M113A1_USA"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["BRAF_EE9_Cascavel_EB", "braf_guarani_eb_remax"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["braf_voadeira_01", "braf_voadeira_02", "braf_voadeira_07"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_A10_DYN_USA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_AV8B_DYN_USMC"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C130J_USMC", "CUP_B_MV22_USMC_RAMPGUN"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["BRAF_Fennec_Cargo", "BRAF_Fennec_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["BRAF_Pantera_K2_2BAvEx", "BRAF_Pantera_K2_FFV_2BAvEx", "BRAF_Caracal_3", "BRAF_Pantera_K2_3BAvEx", "BRAF_Caracal_3", "BRAF_Pantera_K2_FFV_3BAvEx", "BRAF_Pantera_K2_4BAvEx", "BRAF_Pantera_K2_FFV_4BAvEx", "BRAF_Caracal_3"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["BRAF_Fennec_Armed"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH1_DL_BAF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_HE_USA"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_M270_HE_USA", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["BRAF_AM11_Armed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["BRAF_AM21_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["BRAF_AM11_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["CUP_B_M113A1_USA"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "BRAF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["braf_faces_afro_01_woodland","braf_faces_afro_02_woodland","braf_faces_afro_03_woodland",
"braf_faces_afro_04_woodland","braf_faces_afro_05_woodland","braf_faces_afro_06_woodland","braf_faces_afro_07_woodland",
"caucasian_01_woodland","caucasian_02_woodland","caucasian_03_woodland","caucasian_04_woodland",
"caucasian_05_woodland","caucasian_06_woodland","caucasian_07_woodland","caucasian_08_woodland",
"caucasian_09_woodland","caucasian_10_woodland","braf_faces_indigenous_01_camo","braf_faces_indigenous_02_camo",
"braf_faces_indigenous_03_camo","braf_faces_brasileiro_01","braf_faces_brasileiro_02","braf_faces_brasileiro_03",
"braf_faces_brasileiro_04","braf_faces_brasileiro_05","braf_faces_brasileiro_06","braf_faces_brasileiro_07",
"braf_faces_brasileiro_08","braf_faces_brasileiro_09","braf_faces_brasileiro_10","braf_faces_brasileiro_11","braf_faces_brasileiro_12"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_EN","CUP_D_Male02_EN","CUP_D_Male03_EN","CUP_D_Male04_EN","CUP_D_Male05_EN"]] call _fnc_saveToTemplate;

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

_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["braf_launch_alac"]];
_loadoutData set ["AALaunchers", [
    ["braf_Igla", "", "", "", ["braf_Igla_missile"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["braf_Gustav", "", "", "", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""],
	["braf_m20a1superbazooka", "", "", "", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
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
_loadoutData set ["NVGs", ["braf_nvg_loris"]];
_loadoutData set ["binoculars", ["braf_Steiner_750RC"]];
_loadoutData set ["rangefinders", ["CUP_SOFLAM"]];

_loadoutData set ["traitorUniforms", ["braf_army_acu_rolled_regular_uniform_gloves"]];
_loadoutData set ["traitorVests", ["braf_iba_lizard_squadleader"]];
_loadoutData set ["traitorHats", ["braf_beret_black"]];

_loadoutData set ["officerUniforms", ["braf_army_acu_rolled_regular_uniform_gloves"]];
_loadoutData set ["officerVests", ["braf_iba_lizard_squadleader"]];
_loadoutData set ["officerHats", ["braf_beret_blue"]];

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
_loadoutData set ["longRangeRadios", ["braf_radio_backpack_olive_notvp","braf_radio_backpack_olive"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["braf_beret_olive"]];
_loadoutData set ["sniHats", ["braf_boonie_hat_lizard"]];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = [];

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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["braf_army_jacket_lizard_uniform", "braf_army_jacket_gloves_lizard_uniform"]];
_sfLoadoutData set ["vests", ["braf_iba_lizard_squadleader"]];
_sfLoadoutData set ["mgVests", ["braf_iba_lizard_squadleader"]];
_sfLoadoutData set ["medVests", ["braf_iba_lizard_squadleader"]];
_sfLoadoutData set ["glVests", ["braf_iba_lizard_squadleader"]];
_sfLoadoutData set ["backpacks", ["braf_modular_assault_black"]];
_sfLoadoutData set ["slBackpacks", ["braf_modular_assault_black"]];
_sfLoadoutData set ["atBackpacks", ["braf_modular_assault_black"]];
_sfLoadoutData set ["helmets", ["braf_eb_opscore_black", "braf_eb_opscore_comtac_black"]];
_sfLoadoutData set ["slHat", ["braf_beret_grenat"]];
_sfLoadoutData set ["sniHats", ["braf_bandeirante_cap_lizard"]];
_sfLoadoutData set ["NVGs", ["braf_nvg_loris"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["Braf_IA2", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["Braf_IA2", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["Braf_IA2_Carbine", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip_carbine", "muzzle_snds_m", "braf_an_peq_15", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_GL_carryhandle", "muzzle_snds_m", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "muzzle_snds_m", "", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["braf_MD97LC_GL", "muzzle_snds_m", "", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["braf_Minimi", "muzzle_snds_m", "braf_an_peq_15", "braf_c79", ["200Rnd_556x45_Box_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["Braf_MD1_tactical", "", "braf_an_peq_15", "braf_dot_3x_up", ["braf_20Rnd_762x51"], [], "cup_bipod_vltor_modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["braf_pgm_ultimaratio", "", "", "CUP_optic_LeupoldM3LR", ["10Rnd_762x51_Mag"], [], "bipod_02_f_blk"],
    ["AMF_Perseis_II_02_F", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["7Rnd_Perseis_II_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["braf_imbel_m973", "cup_muzzle_snds_mk23", "cup_acc_cz_m3x", "", ["braf_9Rnd_9mm"], [], ""],
	["braf_PT92", "muzzle_snds_l", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["braf_army_acu_regular_uniform", "braf_army_acu_regular_uniform_gloves"]];
_eliteLoadoutData set ["vests", ["braf_iba_lizard_rifleman", "braf_iba_lizard_rifleman", "braf_iba_lizard"]];
_eliteLoadoutData set ["slVests", ["braf_iba_lizard_squadleader"]];
_eliteLoadoutData set ["mgVests", ["braf_iba_lizard_rifleman"]];
_eliteLoadoutData set ["glVests", ["braf_iba_lizard_rifleman"]];
_eliteLoadoutData set ["backpacks", ["braf_alice_medium_olive", "braf_alice_medium_olive_field"]];
_eliteLoadoutData set ["atBackpacks", ["braf_alice_large_olive", "braf_alice_large_olive_field", "braf_alice_large_olive_rope"]];
_eliteLoadoutData set ["helmets", ["braf_eb_opscore_olive", "braf_eb_opscore_comtac_olive"]];
_eliteLoadoutData set ["slHat", ["braf_beret_jungle"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];


_eliteLoadoutData set ["slRifles", [
    ["Braf_IA2", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["Braf_HK416_long", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["Braf_IA2", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["Braf_HK416_long", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_eliteLoadoutData set ["carbines", [
    ["Braf_IA2_Carbine", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["Braf_HK416_short", "", "braf_an_peq_15", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip_carbine", "", "braf_an_peq_15", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_eliteLoadoutData set ["grenadeLaunchers", [
    ["braf_MD97LC_GL", "", "braf_an_peq_15", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["Braf_MD1_tactical", "", "braf_an_peq_15", "braf_eotech_exps3", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["braf_Minimi", "", "braf_an_peq_15", "braf_c79", ["200Rnd_556x45_Box_F"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
	["Braf_MD1_tactical", "", "braf_an_peq_15", "braf_dot_3x_up", ["braf_20Rnd_762x51"], [], "cup_bipod_vltor_modpod_black"],
	["braf_HK417", "", "braf_an_peq_15", "braf_dot_3x_up", ["20Rnd_762x51_HK417_mag"], [], "cup_bipod_vltor_modpod_black"]
]];
_eliteLoadoutData set ["sniperRifles", [
	["braf_pgm_ultimaratio", "", "", "CUP_optic_LeupoldM3LR", ["10Rnd_762x51_Mag"], [], "bipod_02_f_blk"],
    ["AMF_Perseis_II_02_F", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["7Rnd_Perseis_II_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["braf_imbel_m973", "", "", "", ["braf_9Rnd_9mm"], [], ""],
	["braf_PT92", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["braf_army_combat_shirt_camo_uniform", "braf_army_combat_shirt_camo_uniform_gloves"]];
_militaryLoadoutData set ["slUniforms", ["braf_army_combat_shirt_airborne_uniform_gloves"]];
_militaryLoadoutData set ["vests", ["braf_lbv_olive", "braf_iba_lizard_rifleman", "braf_iba_lizard"]];
_militaryLoadoutData set ["mgVests", ["braf_lbv_olive_rifleman", "braf_iba_lizard"]];
_militaryLoadoutData set ["medVests", ["braf_lbv_olive_rifleman", "braf_iba_lizard"]];
_militaryLoadoutData set ["slVests", ["braf_lbv_olive_squadleader", "braf_iba_lizard_squadleader"]];
_militaryLoadoutData set ["glVests", ["braf_lbv_olive_rifleman", "braf_iba_lizard"]];
_militaryLoadoutData set ["engVests", ["braf_lbv_olive_rifleman", "braf_iba_lizard"]];
_militaryLoadoutData set ["backpacks", ["braf_belt_buttpack", "braf_modular_assault_olive"]];
_militaryLoadoutData set ["slBackpacks", ["braf_modular_assault_olive"]];
_militaryLoadoutData set ["atBackpacks", ["braf_alice_medium_olive", "braf_alice_medium_olive_field", "braf_alice_medium_olive_field_helmet"]];
_militaryLoadoutData set ["helmets", ["braf_eb_ccb", "braf_eb_ccb_cover", "braf_eb_ccb_cover_goggles_down", "braf_eb_ccb_cover_goggles_up", "braf_eb_ccb_nvg"]];
_militaryLoadoutData set ["binoculars", ["braf_Steiner_750RC"]];

_militaryLoadoutData set ["slRifles", [
    ["braf_m16a2_mod", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["braf_m16a4", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["braf_m16a4_mod", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["Braf_IA2", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["braf_MD97LC", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["Braf_m4a1_ris", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
	["Braf_IA2", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["braf_MD97LC", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_IA2_Grip", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["Braf_IA2_Carbine", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_m4a1", "", "", "braf_eotech_exps3", ["braf_30Rnd_556x45"], [], ""],
    ["Braf_IA2_Grip_carbine", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["Braf_m4a1", "", "", "braf_dot", ["braf_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["Braf_md1_Grip", "", "", "", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""],
	["braf_MD97LC_GL", "", "", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["Braf_md1a1_Grip", "", "", "", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""],
	["Braf_MD1_tactical", "", "", "braf_eotech_exps3", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["Braf_MT12", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_Mekanika_URU_v1", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_m16a1_carbine_9mm", "", "", "", ["braf_30Rnd_9x19"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["braf_Minimi", "", "", "braf_c79", ["200Rnd_556x45_Box_F"], [], ""],
    ["braf_mag", "", "", "braf_c79", ["Braf_75Rnd_mag58_mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["Braf_md1_Grip", "", "", "braf_dot_3x_up", ["braf_20Rnd_762x51"], [], ""],
	["Braf_md1a1_Grip", "", "", "braf_dot_3x_up", ["braf_20Rnd_762x51"], [], ""],
	["Braf_MD1_tactical", "", "", "braf_dot_3x_up", ["braf_20Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["Braf_aglc_preto", "", "", "cup_optic_leupoldmk4", ["braf_5Rnd_308"], [], ""],
	["Braf_aglc_marro", "", "", "CUP_optic_LeupoldM3LR", ["braf_5Rnd_308"], [], ""],
	["Braf_aglc_camo", "", "", "cup_optic_leupold_vx3", ["braf_5Rnd_308"], [], ""],
    ["braf_pgm_ultimaratio", "", "", "CUP_optic_LeupoldM3LR", ["10Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["braf_imbel_m973", "", "", "", ["braf_9Rnd_9mm"], [], ""],
	["braf_PT92", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["braf_FAB_regular_uniform", "braf_FAB_regular_uniform_gloves"]];
_policeLoadoutData set ["vests", ["braf_tacvest_black"]];
_policeLoadoutData set ["helmets", ["braf_m1_liner_plastic"]];

_policeLoadoutData set ["shotGuns", [
    ["braf_boito_14_oldstock", "", "", "", ["BRAF_Boito_5Rnd_buck","BRAF_Boito_5Rnd_slug","BRAF_Boito_5Rnd_riot"], [], ""],
	["braf_boito_14_nostock", "", "", "", ["BRAF_Boito_5Rnd_buck","BRAF_Boito_5Rnd_slug","BRAF_Boito_5Rnd_riot"], [], ""],
	["braf_boito_14_newstock", "", "", "", ["BRAF_Boito_5Rnd_buck","BRAF_Boito_5Rnd_slug","BRAF_Boito_5Rnd_riot"], [], ""],
    ["braf_boito_20_oldstock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""],
	["braf_boito_20_nostock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""],
	["braf_boito_20_newstock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""],
    ["braf_boito_24_oldstock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""],
	["braf_boito_24_nostock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""],
	["braf_boito_24_newstock", "", "", "", ["BRAF_Boito_8Rnd_buck","BRAF_Boito_8Rnd_slug","BRAF_Boito_7Rnd_riot"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
	["Braf_MT12", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_Mekanika_URU_v1", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_m16a1_carbine_9mm", "", "", "", ["braf_30Rnd_9x19"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["braf_imbel_m973", "", "", "", ["braf_9Rnd_9mm"], [], ""],
	["braf_PT92", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["braf_army_regular_uniform", "braf_army_regular_uniform_gloves"]];
_militiaLoadoutData set ["vests", ["braf_LC2_duty_rifleman", "braf_LC2_field_rifleman"]];
_militiaLoadoutData set ["sniVests", ["braf_LC2_duty_squadleader", "braf_LC2_field_squadleader"]];
_militiaLoadoutData set ["backpacks", ["braf_belt_buttpack"]];
_militiaLoadoutData set ["slBackpacks", ["braf_belt_buttpack"]];
_militiaLoadoutData set ["atBackpacks", ["braf_modular_assault_olive"]];
_militiaLoadoutData set ["helmets", ["braf_army_PatrolCap", "braf_m1_steel", "braf_m1_cover_late_lz"]];

_militiaLoadoutData set ["rifles", [
    ["Braf_m16a1", "", "", "", ["braf_30Rnd_556x45"], [], ""],
    ["Braf_m16a1e1", "", "", "", ["braf_30Rnd_556x45"], [], ""],
	["braf_MD97LC", "", "", "", ["braf_30Rnd_556x45"], [], ""],
	["Braf_m16a2", "", "", "", ["braf_30Rnd_556x45"], [], ""],
	["braf_hk33", "", "", "", ["braf_30Rnd_556x45_HK"], [], ""],
	["braf_MD97LC", "", "", "", ["braf_30Rnd_556x45"], [], ""],
	["Braf_hk33a3", "", "", "", ["braf_30Rnd_556x45_HK"], [], ""],
	["braf_MD97LC", "", "", "", ["braf_30Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["Braf_m16a1_carbine", "", "", "", ["braf_30Rnd_556x45"], [], ""],
	["braf_sig_551", "", "", "", ["braf_sig_556x45"], [], ""],
	["CUP_Famas_F1", "", "", "", ["CUP_25Rnd_556x45_Famas"], [], ""],
	["CUP_arifle_AKM_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""],
	["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_bakelite_M"], [], ""],
	["Braf_m4a1", "", "", "", ["braf_30Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["Braf_md1", "", "", "", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""],
	["braf_MD97LC_GL", "", "", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["Braf_md1a1", "", "", "", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""],
	["Braf_Mosquefal", "", "", "", ["braf_Clip_5Rnd_762x51","braf_Clip_5Rnd_762x51_Red"], ["braf_FAL_granada_mag"], ""],
	["braf_MD97LC_GL", "", "", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["Braf_Fal", "", "", "", ["braf_20Rnd_762x51"], ["braf_FAL_granada_mag"], ""],
	["braf_MD97LC_GL", "", "", "", ["braf_30Rnd_556x45"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["Braf_MT12", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_Mekanika_URU_v1", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
	["Braf_m16a1_carbine_9mm", "", "", "", ["braf_30Rnd_9x19"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["Braf_lmga4", "", "", "", ["CUP_60Rnd_556x45_SureFire"], [], ""],
    ["braf_mag", "", "", "", ["Braf_50Rnd_mag58_mag"], [], ""],
	["Braf_FAP", "", "", "", ["braf_40Rnd_762x51"], [], ""],
	["CUP_lmg_MG3", "", "", "", ["CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["Braf_Mosquefal", "", "", "", ["braf_Clip_5Rnd_762x51","braf_Clip_5Rnd_762x51_Red"], [], ""],
    ["Braf_Fal", "", "", "braf_fal_oip_scope", ["braf_20Rnd_762x51"], [], ""],
	["Braf_ParaFal", "", "", "", ["braf_20Rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["Braf_aglc_preto", "", "", "cup_optic_leupoldmk4", ["braf_5Rnd_308"], [], ""],
	["Braf_aglc_marro", "", "", "CUP_optic_LeupoldM3LR", ["braf_5Rnd_308"], [], ""],
	["Braf_aglc_camo", "", "", "cup_optic_leupold_vx3", ["braf_5Rnd_308"], [], ""],
	["Braf_Mosquefal", "", "", "", ["braf_Clip_5Rnd_762x51","braf_Clip_5Rnd_762x51_Red"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["braf_imbel_m973", "", "", "", ["braf_9Rnd_9mm"], [], ""],
	["braf_PT92", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["braf_army_regular_CoverallCrew"]];
_crewLoadoutData set ["vests", ["braf_LC2_driver"]];
_crewLoadoutData set ["helmets", ["braf_eb_cbt"]];
_crewLoadoutData set ["carbines", [
    ["Braf_MT12", "", "", "", ["30Rnd_9x21_Mag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["BRAF_1BAvEx_Pilot_Coverall","BRAF_2BAvEx_Pilot_Coverall","BRAF_3BAvEx_Pilot_Coverall","BRAF_4BAvEx_Pilot_Coverall"]];
_pilotLoadoutData set ["vests", ["BRAF_flightvest_02"]];
_pilotLoadoutData set ["helmets", ["BRAF_HGU56P_1BAvEx","BRAF_HGU56P_2BAvEx","BRAF_HGU56P_3BAvEx","BRAF_HGU56P_4BAvEx"]];
_pilotLoadoutData set ["carbines", [
    ["Braf_MT12", "", "", "", ["30Rnd_9x21_Mag"], [], ""]
]];	

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

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    ["primary", 5] call _fnc_addMagazines;

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
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
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
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

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