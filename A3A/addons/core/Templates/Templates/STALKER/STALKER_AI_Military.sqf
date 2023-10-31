//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Military"] call _fnc_saveToTemplate;
["spawnMarkerName", "Military Support Tunnel"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_military"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; // due to emissions in "the zone" and such, you don't want helis and planes flying around all the time

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["CUP_O_TT650_TKA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_O_UAZ_Unarmed_SLA", "CUP_O_GAZ_Vodnik_Unarmed_RU"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_O_UAZ_MG_SLA", "CUP_O_UAZ_METIS_SLA", "CUP_O_GAZ_Vodnik_PK_RU"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_O_Ural_SLA", "CUP_O_Ural_Open_SLA"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CUP_O_Ural_SLA", "CUP_O_Ural_Open_SLA"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_O_Ural_Reammo_SLA"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_O_Ural_Repair_SLA"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_O_Ural_Refuel_SLA"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_O_GAZ_Vodnik_MedEvac_RU"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CUP_O_GAZ_Vodnik_PK_RU", "CUP_O_GAZ_Vodnik_AGS_RU"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["CUP_O_GAZ_Vodnik_PK_RU", "CUP_O_GAZ_Vodnik_AGS_RU"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_O_BTR60_SLA"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["CUP_O_BMP3_RU"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["CUP_O_BMP2_SLA"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_O_T72_SLA", "CUP_O_T55_SLA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_O_ZSU23_SLA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CUP_O_PBX_RU"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_O_LCVP_SLA"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", []] call _fnc_saveToTemplate;
["vehiclesPlanesAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_O_AN2_TK"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_O_Mi24_P_Dynamic_RU"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_O_Mi8_medevac_RU"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CUP_O_Mi24_V_Dynamic_RU"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_O_Mi8_RU"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_O_BM21_RU"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_O_BM21_RU", ["CUP_40Rnd_GRAD_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["CUP_O_Pchela1T_RU"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_O_UAZ_MG_SLA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_O_Ural_Open_SLA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_O_UAZ_Open_SLA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["CUP_O_BRDM2_SLA"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CUP_O_UAZ_Unarmed_RU"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_O_DSHKM_SLA"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_O_SPG9_SLA"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_Igla_AA_pod_SLA"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;
["staticHowitzers", ["CUP_O_D30_RU"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "CUP_30Rnd_122mmHE_D30_M"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "STALKER_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5",
"LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9",
"RussianHead_1","RussianHead_2","RussianHead_3","Sturrock",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_12",
"WhiteHead_13","WhiteHead_14","WhiteHead_17","WhiteHead_18",
"WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

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
    ["CUP_launch_Metis", "", "", "", ["CUP_AT13_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [""], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["SCE_Military_3"]];
_loadoutData set ["traitorVests", ["SCE_V_SEVA_Military"]];
_loadoutData set ["traitorHats", ["CUP_H_CZ_Patrol_Cap"]];

_loadoutData set ["officerUniforms", ["CUP_U_O_RUS_VSR98_worn_gloves_MSV"]];
_loadoutData set ["officerVests", ["CUP_V_CZ_vest01"]];
_loadoutData set ["officerHats", ["CUP_H_CZ_Patrol_Cap"]];

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
_loadoutData set ["longRangeRadios", ["CUP_B_Kombat_Radio_Olive"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CUP_H_RUS_6B27_headset"]];
_loadoutData set ["sniHats", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

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

_loadoutData set ["glasses", [
    "SCE_G_CN3P"
]];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["CAU_U_CBRN_blk"]];
_sfLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_nk_black", "CUP_V_B_Interceptor_Rifleman_Grey"]];
_sfLoadoutData set ["mgVests", ["CUP_V_B_Interceptor_Grenadier_Grey"]];
_sfLoadoutData set ["medVests", ["CUP_V_B_Ciras_Black"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_IOTV_Black_Gren"]];
_sfLoadoutData set ["backpacks", ["CUP_B_AssaultPack_Black"]];
_sfLoadoutData set ["slBackpacks", ["CUP_B_USPack_Black"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_blk"]];
_sfLoadoutData set ["helmets", ["CUP_H_Ger_M92_Black"]];
_sfLoadoutData set ["slHat", ["CUP_H_SLA_BeretRed"]];
_sfLoadoutData set ["sniHats", ["CUP_H_Ger_M92_Black_GG"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_HMNVS"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];

_sfLoadoutData set ["glasses", [
    "CAU_G_CBRN_m04_blk_hood"
]];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_AK107_railed", "CUP_muzzle_TGPA", "", "cup_optic_ac11704_black", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_AK107_railed", "CUP_muzzle_TGPA", "", "cup_optic_zeisszpoint", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_AK105_top_rail", "CUP_muzzle_TGPA", "", "cup_optic_1p87_ris", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_AK105_top_rail", "CUP_muzzle_TGPA", "", "cup_optic_compm2_low", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_AK109_railed", "CUP_muzzle_snds_KZRZP_AK762", "", "cup_optic_sb_11_4x20_pm", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK109", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["CUP_arifle_AS_VAL_VFG_top_rail", "", "", "cup_optic_ac11704_black", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""],
    ["CUP_arifle_AS_VAL_flash_top", "", "", "cup_optic_okp_7_rail", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["CUP_arifle_AKS74U", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK_M"], [], ""],
    ["CUP_arifle_OTS14_GROZA_Grip", "", "", "", ["CUP_20Rnd_9x39_SP5_GROZA_M"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK107_GL", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK107_GL", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK109_GL", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_1p63", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK109_GL", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_Kobra", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK103_GL", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_Kobra", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK103_GL", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_1p63", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_vityaz_vfg_top_rail", "cup_muzzle_mfsup_flashhider_762x39_black", "", "cup_optic_zeisszpoint", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_bizon", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_Kobra", ["CUP_64Rnd_Red_Tracer_9x19_Bizon_M"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Pecheneg_B50_vfg", "", "", "CUP_optic_Kobra", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_Pecheneg_B50_vfg", "", "", "CUP_optic_1p63", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_PKMN", "", "", "CUP_optic_1p63", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_PKMN", "", "", "CUP_optic_Kobra", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_Kobra", ["CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_1p63", ["CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["CUP_srifle_ksvk", "", "", "CUP_optic_PSO_3", ["CUP_5Rnd_127x108_KSVK_M"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_sfLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Duty", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SCE_Military_3"]];
_eliteLoadoutData set ["slUniform", ["SE_Assault_Fatigues_Loner"]];
_eliteLoadoutData set ["vests", ["CUP_Vest_RUS_6B45_Sh117_Green"]];
_eliteLoadoutData set ["mgVests", ["CUP_Vest_RUS_6B45_Sh117_PKP_Green"]];
_eliteLoadoutData set ["medVests", ["CUP_Vest_RUS_6B45_Sh117_Nut_Green"]];
_eliteLoadoutData set ["slVests", ["CUP_Vest_RUS_6B45_Sh117_PKP_Nut_Green"]];
_eliteLoadoutData set ["glVests", ["CUP_Vest_RUS_6B45_Sh117_VOG_Del_Green"]];
_eliteLoadoutData set ["engVests", ["CUP_Vest_RUS_6B45_Sh117_Del_Nut_Green"]];
_eliteLoadoutData set ["backpacks", ["SE_Scavenger_Backpack", "CUP_B_Kombat_Olive"]];
_eliteLoadoutData set ["slBackpacks", ["CUP_B_Kombat_Radio_Olive"]];
_eliteLoadoutData set ["atBackpacks", ["CUP_O_RUS_Patrol_bag_Green"]];
_eliteLoadoutData set ["helmets", ["CUP_H_RUS_6B27", "CUP_H_RUS_6B27_headset", "CUP_H_RUS_6B27_goggles"]];
_eliteLoadoutData set ["sniHats", []];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["glasses", [
    "SE_GP21",
    "CAU_G_CBRN_m50_hoodless"
]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_AK12_VG_black", "cup_muzzle_mfsup_flashhider_762x39_black", "", "cup_optic_sb_11_4x20_pm", ["CUP_30Rnd_545x39_AK12_M"], [], ""],
    ["CUP_arifle_AK15_VG_black", "", "cup_acc_llm_black", "cup_optic_zeisszpoint", ["CUP_30Rnd_762x39_AK15_M"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_AS_VAL", "", "", "cup_optic_ekp_8_02", ["CUP_20Rnd_9x39_SP5_VSS_M"], [], ""],
    ["CUP_arifle_AS_VAL_top_rail", "", "", "cup_optic_ac11704_black", ["CUP_20Rnd_9x39_SP5_VSS_M"], [], ""],
    ["CUP_arifle_AK15_VG_black", "", "cup_acc_llm_black", "", ["CUP_30Rnd_762x39_AK15_M"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_OTS14_GROZA_762_Grip", "", "", "", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK12_GP34_black", "", "", "cup_optic_ac11704_black", ["CUP_30Rnd_545x39_AK12_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK15_GP34_black", "", "", "cup_optic_okp_7_rail", ["CUP_30Rnd_762x39_AK15_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "", "", "cup_optic_sb_11_4x20_pm", ["CUP_30Rnd_556x45_AK19_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_vityaz_vfg", "", "", "cup_optic_ekp_8_02", ["CUP_30Rnd_9x19_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_front_rail", "", "", "cup_optic_mrad", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_PKM_B50_vfg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_Pecheneg", "", "", "CUP_optic_1p63", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_Pecheneg", "", "", "CUP_optic_Kobra", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_1p63", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_Kobra", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "CUP_SVD_camo_g_half", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_eliteLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_TT", "", "", "", ["CUP_8Rnd_762x25_TT"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SCE_Military_3"]];
_militaryLoadoutData set ["slUniform", ["SE_Assault_Fatigues_Loner"]];
_militaryLoadoutData set ["vests", ["CUP_V_CDF_6B3_2_FST"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_CDF_6B3_3_FST"]];
_militaryLoadoutData set ["medVests", ["CUP_V_CDF_6B3_1_FST"]];
_militaryLoadoutData set ["slVests", ["CUP_V_CDF_6B3_5_FST"]];
_militaryLoadoutData set ["glVests", ["CUP_V_CDF_6B3_4_FST"]];
_militaryLoadoutData set ["engVests", ["CUP_V_CDF_6B3_1_FST"]];
_militaryLoadoutData set ["backpacks", ["SE_Scavenger_Backpack", "CUP_B_Kombat_Olive"]];
_militaryLoadoutData set ["slBackpacks", ["CUP_B_Kombat_Radio_Olive"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_O_RUS_Patrol_bag_Green"]];
_militaryLoadoutData set ["helmets", ["CUP_H_RUS_6B27", "CUP_H_RUS_6B27_headset", "CUP_H_RUS_6B27_goggles"]];
_militaryLoadoutData set ["sniHats", []];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["glasses", [
    "SE_S10",
    "SCE_G_CN3P"
]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_AK12_VG_black", "cup_muzzle_mfsup_flashhider_762x39_black", "", "cup_optic_sb_11_4x20_pm", ["CUP_30Rnd_545x39_AK12_M"], [], ""],
    ["CUP_arifle_AK15_VG_black", "", "cup_acc_llm_black", "cup_optic_zeisszpoint", ["CUP_30Rnd_762x39_AK15_M"], [], ""],
    ["CUP_arifle_AK109", "", "cup_acc_flashlight", "CUP_optic_PechenegScope", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_AS_VAL", "", "", "cup_optic_ekp_8_02", ["CUP_20Rnd_9x39_SP5_VSS_M"], [], ""],
    ["CUP_arifle_AS_VAL_top_rail", "", "", "cup_optic_ac11704_black", ["CUP_20Rnd_9x39_SP5_VSS_M"], [], ""],
    ["CUP_arifle_AK107", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_AK108", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_556x45_AK"], [], ""],
    ["CUP_arifle_AK109", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_OTS14_GROZA", "", "", "", ["CUP_20Rnd_9x39_SP5_GROZA_M"], [], ""],
    ["CUP_arifle_AKS74", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AKS74_GL", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK107_GL", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK108_GL", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK109_GL", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK109_GL", "", "", "CUP_optic_1p63", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK108_GL", "", "", "CUP_optic_1p63", ["CUP_30Rnd_556x45_AK"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AK107_GL", "", "", "CUP_optic_1p63", ["CUP_30Rnd_545x39_AK74M_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_vityaz_vfg", "", "", "cup_optic_ekp_8_02", ["CUP_30Rnd_9x19_Vityaz"], [], ""],
    ["CUP_smg_bizon", "", "", "CUP_optic_Kobra", ["CUP_64Rnd_9x19_Bizon_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_PKM_B50_vfg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_Pecheneg", "", "", "CUP_optic_1p63", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_lmg_Pecheneg", "", "", "CUP_optic_Kobra", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_1p63", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_Kobra", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "CUP_SVD_camo_g_half", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_militaryLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_TT", "", "", "", ["CUP_8Rnd_762x25_TT"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SCE_Military_1"]];
_policeLoadoutData set ["vests", ["SE_Eastern_Chest_Rig_Black", "CUP_V_OI_TKI_Jacket2_04", "CUP_V_CDF_CrewBelt"]];
_policeLoadoutData set ["helmets", ["armst_Hood_mid_loner6", "armst_Hood_full_loner6", "armst_Hood_closed_loner6"]];

_policeLoadoutData set ["glasses", [
    "CUP_G_Scarf_Face_Blk",
    "CUP_RUS_Balaclava_blk"
]];

_policeLoadoutData set ["SMGs", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SCE_Military_3"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_RRV_Scout"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_B_RRV_Scout3_GRN"]];
_militiaLoadoutData set ["backpacks", ["CUP_B_Kombat_Olive"]];
_militiaLoadoutData set ["slBackpacks", ["CUP_B_Kombat_Radio_Olive"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_RUS_Backpack"]];
_militiaLoadoutData set ["helmets", ["CUP_H_CZ_Patrol_Cap", "CUP_H_CZ_Patrol_Cap", "CUP_H_CZ_Hat02"]];
_militiaLoadoutData set ["sniHats", ["CUP_H_CZ_Hat03"]];

_militiaLoadoutData set ["glasses", [
    "SCE_G_CN3P",
    "CUP_G_Scarf_Face_Blk"
]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_AK103", "", "", "", ["CUP_30Rnd_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK105", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_AKS74", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK103_GL", "", "", "", ["CUP_30Rnd_762x39_AK103_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_vityaz", "", "", "", ["CUP_30Rnd_9x19_Vityaz"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74_45", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_Makarov_M"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_O_RUS_VSR98_worn_VDV_rolled_up"]];
_crewLoadoutData set ["vests", ["SE_Eastern_Chest_Rig_Green"]];
_crewLoadoutData set ["helmets", ["CUP_H_RUS_6B47"]];
_crewLoadoutData set ["carbines", [
    ["CUP_smg_vityaz_top_rail", "", "", "cup_optic_ac11704_black", ["CUP_10Rnd_9x19_Saiga9"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_Vest_RUS_6B45_Sh117_Green"]];
_pilotLoadoutData set ["helmets", ["CUP_H_RUS_6B47_headset"]];
_pilotLoadoutData set ["carbines", [
    ["CUP_smg_saiga9", "", "", "", ["CUP_10Rnd_9x19_Saiga9"], [], ""]
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
