//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "IAF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Italian Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_Blue_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\Pedagne\flag_italy_co.paa)] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_Italy"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ASZ_LR90_EI", "ASZ_LR110_CCpara"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["ASZ_LR110_CCpara_MG3", "ASZ_LR90_M2", "ASZ_LR90_MK19", "ASZ_LR90_TOW", "ASZ_PUMA4x4CC_MG3", "ASZ_PUMA4x4_M2", "ASZ_PUMA4x4_TOW", "ASZ_PUMA6x6_AT", "ASZ_PUMA6x6CC_MG3", "ASZ_PUMA6x6_hitrole", "ASZ_PUMA6x6_M2"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["ASZ_ACTL4x4_EI"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["ASZ_ACTL6x6_logistic"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_MTVR_Ammo_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["ASZ_ACTL6x6_repair", "ASZ_VCC2_rep", "ASZ_VM90_El_rep"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["ASZ_ACTL6x6_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["ASZ_VM90_EI_amb", "ASZ_VCC2_EI_amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["ASZ_VCC1_EI", "ASZ_VCC1_EI_camo", "ASZ_VCC1_EI_plus", "ASZ_VCC1_EI_camo_plus", "ASZ_VCC2_EI"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["ASZ_AAV_El","ASZ_AAV_El_camo", "ASZ_SuperAV_El", "ASZ_SuperAV_El_battlefield", "ASZ_SuperAV_El_Command"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["ASZ_Dardo", "ASZ_Freccia", "ASZ_Freccia_AT"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["ASZ_Ariete", "ASZ_Ariete_camo", "ASZ_Ariete_plus", "ASZ_Ariete_camo_plus"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_HMMWV_Avenger_USMC"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["ASZ_VCC1_EI", "ASZ_VCC1_EI_camo", "ASZ_VCC1_EI_plus", "ASZ_VCC1_EI_camo_plus", "ASZ_VCC2_EI"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["ASZ_Dardo", "ASZ_Freccia", "ASZ_Freccia_AT"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_B_MK10_GB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["ASZ_AAV_EI", "ASZ_AAV_EI_camo", "ASZ_SuperAV_EI", "ASZ_SuperAV_EI_battlefield", "ASZ_SuperAV_EI_Command"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["ASZ_EFA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["ASZ_AV8B"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["ASZ_C130J_AM", "DDL_C27J_AM"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["ASZ_AB212_AM", "ASZ_AB212_MM", "ASZ_AB212_AM_ico"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["ASZ_CH47_EI", "ASZ_EH101_MM", "ASZ_NH90_EI_support","ASZ_NH90_MM", "ASZ_NH90_EI", "ASZ_NH90_EI_reos", "ASZ_NH90_MM_support"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["ASZ_AH6_EI_ffar", "ASZ_AB212_EI_FFAR", "ASZ_AB212_EI_M21"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["ASZ_A129", "ASZ_A129d"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_HE_BAF_WOOD", "CUP_B_M270_DPICM_BAF_WOOD"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["CUP_B_M270_HE_BAF_WOOD",["CUP_12Rnd_MLRS_HE"]],
["CUP_B_M270_DPICM_BAF_WOOD",["CUP_12Rnd_MLRS_DPICM"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["ASZ_VTML_M2", "ASZ_VTML_M2_LR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["ASZ_ACTL4x4_EI"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["ASZ_LR110_CCpara"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["ASZ_VCC1_EI", "ASZ_VCC1_EI_camo", "ASZ_VCC1_EI_plus", "ASZ_VCC1_EI_camo_plus", "ASZ_VCC2_EI"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["ASZ_LR110_CC"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_USMC"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_Stinger_AA_pod_Base_USMC"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_USMC"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine", "CUP_Mine_M"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;

#include "PED_Vehicle_Attributes.sqf"

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
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

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
	["ASZ_Launch_Spike", "", "", "", ["ASZ_Spike_Mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["ASZ_Launch_Stinger", "", "", "", ["ASZ_Stinger_Mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", [

]];
_loadoutData set ["lightATLaunchers", [["ASZ_PzF3_Loaded"]]];
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
_loadoutData set ["NVGs", ["mum"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["ASZ_Vector"]];

_loadoutData set ["traitorUniforms", ["ASZ_SOF_Uniform_CB60"]];
_loadoutData set ["traitorVests", ["ASZ_SODADP_vegecam_fuciliere"]];
_loadoutData set ["traitorHats", ["ASZ_BoonieHat_CB60"]];

_loadoutData set ["officerUniforms", ["ASZ_SOF_Uniform_CB60"]];
_loadoutData set ["officerVests", ["ASZ_SODADP_vegecam_TL"]];
_loadoutData set ["officerHats", ["ASZ_Basco_El"]];

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
_loadoutData set ["longRangeRadios", ["BackPanel_CBT"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["ASZ_Uniforme_EI_LS_CB60"]];
_sfLoadoutData set ["vests", ["ASZ_SODADP_vegecam_fuciliere", "ASZ_SODADP_vegecam_TL", "ASZ_SODADP_vegecam_marksman", "ASZ_SODADP_vegecam_assaulter"]];
_sfLoadoutData set ["mgVests", ["ASZ_SODADP_vegecam_mg"]];
_sfLoadoutData set ["medVests", ["ASZ_SODADP_vegecam_medic"]];
_sfLoadoutData set ["glVests", ["ASZ_SODADP_vegecam_GL"]];
_sfLoadoutData set ["backpacks", ["ASZ_BackPack_50lt_CB60", "ASZ_BackPack_40lt_CB60"]];
_sfLoadoutData set ["slBackpacks", ["ASZ_BackPack_30lt_CB60"]];
_sfLoadoutData set ["atBackpacks", ["ASZ_BackPack_75lt_CB60"]];
_sfLoadoutData set ["helmets", ["ASZ_Mich_CB60", "ASZ_Mich_ARC_CB60", "ASZ_Mich_ESS_CB60", "ASZ_Mich_Net_CB60"]];
_sfLoadoutData set ["slHat", ["ASZ_Basco_El"]];
_sfLoadoutData set ["sniHats", ["ASZ_BoonieHat_CB60"]];
_sfLoadoutData set ["NVGs", ["mum"]];
_sfLoadoutData set ["binoculars", ["ASZ_Vector"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_acog", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160", "asz_silencer_556_blk", "asz_pointer_blk", "asz_acog", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["ASZ_ARX160_IV_L_CC", "asz_silencer_556_blk", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160_IV_L_CC", "asz_silencer_556_blk", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""],
["ASZ_ARX160_IV_L_CC", "asz_silencer_556_blk", "asz_pointer_blk", "asz_acog", ["30Rnd_556x45_Stanag_SD_ASZ"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["ASZ_ARX160_GLS", "asz_silencer_556_blk", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS", "asz_silencer_556_blk", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "asz_silencer_556_blk", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "asz_silencer_556_blk", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag_SD_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_Subsonic_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["ASZ_M249mk1_base", "", "", "asz_eotech_blk", ["200Rnd_M249mag"], [], "asz_bipod_m249"]
]];
_sfLoadoutData set ["marksmanRifles", [
["APD_ARX200", "", "asz_pointer_blk", "asz_leupold_mk4_cqt", ["20Rnd_762x51_Mag"], [], ""],
["APD_ARX200_VGrip", "", "asz_pointer_blk", "asz_leupold_mk4_cqt", ["20Rnd_762x51_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["ASZ_M107_Blk", "", "", "asz_leupold_mk4_lrt_blk", ["7Rnd_408_Mag"], [], "asz_bipod_m107"],
["ASZ_MCM_tac50_blk", "", "", "asz_leupold_mk4_lrt_blk", ["ASZ_5x127_Mag"], [], "asz_bipod_tac50"]
]];
_sfLoadoutData set ["sidearms", [
["ASZ_glock17", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["ASZ_SOF_Uniform_CB60"]];
_eliteLoadoutData set ["slUniforms", ["ASZ_SOF_Uniform_CB60"]];
_eliteLoadoutData set ["vests", ["ASZ_SODADP_vegecam_fuciliere"]];
_eliteLoadoutData set ["mgVests", ["ASZ_SODADP_vegecam_mg"]];
_eliteLoadoutData set ["medVests", ["ASZ_SODADP_vegecam_medic"]];
_eliteLoadoutData set ["slVests", ["ASZ_SODADP_vegecam_TL"]];
_eliteLoadoutData set ["glVests", ["ASZ_SODADP_vegecam_GL"]];
_eliteLoadoutData set ["engVests", ["ASZ_SODADP_vegecam_assaulter"]];
_eliteLoadoutData set ["backpacks", ["ASZ_BackPack_50lt_CB60", "ASZ_BackPack_40lt_CB60"]];
_eliteLoadoutData set ["slBackpacks", ["ASZ_BackPack_30lt_CB60"]];
_eliteLoadoutData set ["atBackpacks", ["ASZ_BackPack_75lt_CB60"]];
_eliteLoadoutData set ["helmets", ["ASZ_Mich_CB60", "ASZ_Mich_ARC_CB60", "ASZ_Mich_ESS_CB60", "ASZ_Mich_Net_CB60"]];
_eliteLoadoutData set ["sniHats", ["ASZ_BoonieHat_CB60"]];
_eliteLoadoutData set ["slHat", ["ASZ_Basco_EI"]];
_eliteLoadoutData set ["binoculars", ["ASZ_Vector"]];

_eliteLoadoutData set ["slRifles", [
["ASZ_ARX160", "", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "asz_pointer_blk", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["ASZ_ARX160", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["ASZ_ARX160_IV_L_CC", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160_IV_L_CC", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160_IV_L_CC", "", "", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["ASZ_ARX160_GLS", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_MP7", "", "", "", ["CUP_40Rnd_46x30_MP7"], [], ""],
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["ASZ_M249mk1_base", "", "", "asz_eotech_blk", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249_base", "", "", "asz_eotech_blk", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249mk1_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["ASZ_ARX160_C", "", "", "asz_acog", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["ASZ_M40A3_Green", "", "", "asz_leupold_vxr_patrol", ["5Rnd_762x51_Mag_ASZ"], [], "asz_bipod_m40a3"],
["ASZ_SakoTRG42", "", "", "asz_leupold_vxr_patrol", ["10Rnd_762x51_Mag_ASZ"], [], "asz_bipod_sakotrg42"]
]];
_eliteLoadoutData set ["sidearms", [
["ASZ_M92", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["ASZ_SOF_Uniform_CB60"]];
_militaryLoadoutData set ["slUniforms", ["ASZ_SOF_Uniform_CB60"]];
_militaryLoadoutData set ["vests", ["ASZ_SODADP_vegecam_fuciliere"]];
_militaryLoadoutData set ["mgVests", ["ASZ_SODADP_vegecam_mg"]];
_militaryLoadoutData set ["medVests", ["ASZ_SODADP_vegecam_medic"]];
_militaryLoadoutData set ["slVests", ["ASZ_SODADP_vegecam_TL"]];
_militaryLoadoutData set ["glVests", ["ASZ_SODADP_vegecam_GL"]];
_militaryLoadoutData set ["engVests", ["ASZ_SODADP_vegecam_assaulter"]];
_militaryLoadoutData set ["backpacks", ["ASZ_BackPack_50lt_CB60", "ASZ_BackPack_40lt_CB60"]];
_militaryLoadoutData set ["slBackpacks", ["ASZ_BackPack_30lt_CB60"]];
_militaryLoadoutData set ["atBackpacks", ["ASZ_BackPack_75lt_CB60"]];
_militaryLoadoutData set ["helmets", ["ASZ_Mich_CB60", "ASZ_Mich_ARC_CB60", "ASZ_Mich_ESS_CB60", "ASZ_Mich_Net_CB60"]];
_militaryLoadoutData set ["sniHats", ["ASZ_BoonieHat_CB60"]];
_militaryLoadoutData set ["slHat", ["ASZ_Basco_EI"]];
_militaryLoadoutData set ["binoculars", ["ASZ_Vector"]];

_militaryLoadoutData set ["slRifles", [
["ASZ_ARX160", "", "asz_pointer_blk", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "asz_pointer_blk", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "asz_pointer_blk", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["ASZ_ARX160", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160", "", "", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["ASZ_ARX160_IV_L_CC", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160_IV_L_CC", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""],
["ASZ_ARX160_IV_L_CC", "", "", "", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["ASZ_ARX160_GLS", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "", "", "asz_aimpoint_pro_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_ARX160_GLS_CC", "", "", "asz_eotech_blk", ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_MP7", "", "", "", ["CUP_40Rnd_46x30_MP7"], [], ""],
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["ASZ_M249mk1_base", "", "", "asz_eotech_blk", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249_base", "", "", "asz_eotech_blk", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249mk1_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["ASZ_ARX160_C", "", "", "asz_acog", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["ASZ_M40A3_Green", "", "", "asz_leupold_vxr_patrol", ["5Rnd_762x51_Mag_ASZ"], [], "asz_bipod_m40a3"],
["ASZ_SakoTRG42", "", "", "asz_leupold_vxr_patrol", ["10Rnd_762x51_Mag_ASZ"], [], "asz_bipod_sakotrg42"]
]];
_militaryLoadoutData set ["sidearms", [
["ASZ_M92", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["ASZ_SOD_DC_CC"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["ASZ_Basco_El"]];

_policeLoadoutData set ["shotGuns", [
["CUP_sgun_SPAS12", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["CUP_smg_MP7", "", "", "", ["CUP_20Rnd_46x30_MP7"], [], ""],
["CUP_smg_MP7", "", "", "", ["CUP_20Rnd_46x30_MP7"], [], ""],
["CUP_smg_BallisticShield_MP7", "", "", "", ["CUP_20Rnd_46x30_MP7"], [], ""],
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""],
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""],
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    "ASZ_M84"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["ASZ_Uniforme_EI_CB60"]];
_militiaLoadoutData set ["vests", ["ASZ_NC4_09", "ASZ_NC4_09_GL", "ASZ_NC4_09_MG"]];
_militiaLoadoutData set ["sniVests", ["ASZ_NC4_09_MarkS"]];
_militiaLoadoutData set ["backpacks", ["ASZ_BackPack_30lt_CB60", "ASZ_BackPack_40lt_CB60"]];
_militiaLoadoutData set ["slBackpacks", ["ASZ_BackPack_30lt_CB60"]];
_militiaLoadoutData set ["atBackpacks", ["ASZ_BackPack_50lt_CB60"]];
_militiaLoadoutData set ["helmets", ["ASZ_mach_2_CBT", "ASZ_mach_2_netting_CBT"]];
_militiaLoadoutData set ["sniHats", ["ASZ_BoonieHat_CB60"]];
_militiaLoadoutData set ["slHat", ["ASZ_Basco_EI"]];

_militiaLoadoutData set ["rifles", [
["ASZ_AR7090", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], [], ""],
["ASZ_SC90", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["ASZ_SCS90", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["ASZ_AR7090_gl", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ASZ_SC90_gl", "", "", "", ["20Rnd_556x45_Stanag_ASZ"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["ASZ_M249mk1_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"],
["ASZ_M249_base", "", "", "", ["200Rnd_M249mag"], [], "asz_bipod_m249"]
]];
_militiaLoadoutData set ["marksmanRifles", [
["ASZ_AR7090", "", "", "asz_leupold_vxr_patrol", ["20Rnd_556x45_Stanag_ASZ"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["ASZ_M40A3_Green", "", "", "asz_leupold_vxr_patrol", ["5Rnd_762x51_Mag_ASZ"], [], "asz_bipod_m40a3"],
["ASZ_SakoTRG42", "", "", "asz_leupold_vxr_patrol", ["5Rnd_762x51_Mag_ASZ"], [], "asz_bipod_sakotrg42"]
]];
_militiaLoadoutData set ["sidearms", [
    "ASZ_M84"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["ASZ_Uniforme_Wheel_Crew"]];			
_crewLoadoutData set ["vests", ["ASZ_NC4_09_Base"]];				
_crewLoadoutData set ["helmets", ["ASZ_Helmet_Crew_Wheel"]];	
_crewLoadoutData set ["carbines", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["ASZ_uniform_Pilot_AM"]];
_pilotLoadoutData set ["vests", ["ASZ_GearHelyPilot"]];
_pilotLoadoutData set ["helmets", ["ASZ_Helm_HeliPilot_AM"]];
_pilotLoadoutData set ["carbines", [
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
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