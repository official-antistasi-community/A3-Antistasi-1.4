//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Clear Sky"] call _fnc_saveToTemplate;
["spawnMarkerName", "Clear Sky Support Tunnel"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_clearsky"] call _fnc_saveToTemplate;

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

_loadoutData set ["traitorUniforms", ["SCE_ClearSky_CBRN"]];
_loadoutData set ["traitorVests", ["SCE_Sunrise_Black"]];
_loadoutData set ["traitorHats", ["armst_Hood_closed_clearsky"]];

_loadoutData set ["officerUniforms", ["SCE_ClearSky_CBRN"]];
_loadoutData set ["officerVests", ["SCE_V_SEVA_ClearSky"]];
_loadoutData set ["officerHats", ["armst_Hood_full_clearsky"]];

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
_loadoutData set ["sniHats", ["H_Beret_blk"]];

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
_sfLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_sfLoadoutData set ["vests", ["SCE_V_SEVA_Loner_6", "SCE_V_SEVA_ClearSky"]];
_sfLoadoutData set ["mgVests", ["SCE_Exo2G_loner_2"]];
_sfLoadoutData set ["medVests", ["SCE_V_SEVA_ClearSky"]];
_sfLoadoutData set ["glVests", ["SCE_Exo2G_loner_2"]];
_sfLoadoutData set ["backpacks", ["SCE_B_SEVA_ClearSky"]];
_sfLoadoutData set ["slBackpacks", ["SE_SEVA_Oxygen_Tank"]];
_sfLoadoutData set ["atBackpacks", ["SCE_B_SEVA_Loner_6"]];
_sfLoadoutData set ["helmets", ["SCE_Exo_Helmet_Mercenary"]];
_sfLoadoutData set ["slHat", ["SCE_H_SEVA_ClearSky"]];
_sfLoadoutData set ["sniHats", ["SCE_H_SEVA_ClearSky"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_Hide"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];

_sfLoadoutData set ["glasses", [
    "CAU_G_CBRN_m04_hoodless"
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
    ["CUP_smg_MP5A5_Rail_VFG", "", "", "cup_optic_microt1", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_Kobra", ["CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "CUP_optic_1p63", ["CUP_60Rnd_TE1_Red_Tracer_545x39_AK74M_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
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
_eliteLoadoutData set ["uniforms", ["SCE_ClearSky_1"]];
_eliteLoadoutData set ["slUniform", ["SCE_ClearSky_CBRN"]];
_eliteLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_eliteLoadoutData set ["mgVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["medVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["slVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["glVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["engVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_blk"]];
_eliteLoadoutData set ["slBackpacks", ["SE_Scavenger_Backpack"]];
_eliteLoadoutData set ["atBackpacks", ["CUP_B_Bergen_BAF"]];
_eliteLoadoutData set ["helmets", ["CUP_H_USArmy_Helmet_ECH1_Black", "CUP_H_RUS_K6_3_black"]];
_eliteLoadoutData set ["sniHats", []];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["glasses", [
    "SE_GP7",
    "SE_GP21"
]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_DSA_SA58_OSW", "cup_muzzle_mfsup_flashhider_762x51_black", "", "cup_optic_elcan_reflex", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""],
    ["CUP_arifle_G36A", "", "", "cup_optic_g36optics15x", ["CUP_30Rnd_556x45_XM8"], [], ""],
    ["CUP_arifle_G36C", "", "cup_acc_llm_black", "cup_optic_zeisszpoint", ["CUP_30Rnd_556x45_G36"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_Mk16_CQC_FG_black", "", "", "cup_optic_elcan_specterdr_black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_HK416_Black", "", "", "cup_optic_zeisszpoint", ["CUP_30Rnd_556x45_Emag"], [], ""],
    ["CUP_arifle_G36CA3_afg", "", "", "cup_optic_microt1", ["CUP_30Rnd_556x45_G36"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2", "", "", "cup_optic_holoblack", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "", "", "cup_optic_compm2_black", ["CUP_30Rnd_556x45_Emag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK417_12_AG36", "", "", "cup_optic_elcan_specterdr_black", ["CUP_20Rnd_762x51_HK417"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM_black", "", "", "cup_optic_ac11704_black", ["CUP_30Rnd_556x45_Stanag_L85"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "", "", "cup_optic_holoblack", ["CUP_30Rnd_556x45_Stanag_L85"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
    ["CUP_arifle_G36A_AG36_RIS", "", "", "cup_optic_holoblack", ["CUP_30Rnd_556x45_G36"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_p90_black", "", "", "cup_optic_ac11704_black", ["50Rnd_570x28_SMG_03"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_arifle_MG36", "", "", "cup_optic_hensoldtzo", ["CUP_100Rnd_556x45_BetaCMag"], [], ""],
    ["CUP_lmg_L110A1", "", "", "cup_optic_acog2", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "", "", "cup_optic_sb_11_4x20_pm", ["CUP_20Rnd_762x51_HK417"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "cup_bipod_vltor_modpod_black", "cup_optic_leupoldmk4", ["CUP_5Rnd_86x70_L115A1"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_eliteLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SCE_ClearSky_1"]];
_militaryLoadoutData set ["slUniform", ["SCE_ClearSky_CBRN"]];
_militaryLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_militaryLoadoutData set ["mgVests", ["SCE_V_SEVA_ClearSky"]];
_militaryLoadoutData set ["medVests", ["SCE_V_SEVA_ClearSky"]];
_militaryLoadoutData set ["slVests", ["SCE_V_SEVA_ClearSky"]];
_militaryLoadoutData set ["glVests", ["SCE_V_SEVA_ClearSky"]];
_militaryLoadoutData set ["engVests", ["SCE_V_SEVA_ClearSky"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_blk"]];
_militaryLoadoutData set ["slBackpacks", ["SE_Scavenger_Backpack"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_Bergen_BAF"]];
_militaryLoadoutData set ["helmets", ["CUP_H_USArmy_Helmet_ECH1_Black", "CUP_H_RUS_K6_3_black"]];
_militaryLoadoutData set ["sniHats", []];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["glasses", [
    "SE_GP7",
    "SE_GP21"
]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_mk18_black", "", "", "cup_optic_microt1", ["CUP_30Rnd_556x45_Emag"], [], ""],
    ["CUP_arifle_AK12_VG_bicolor", "", "cup_acc_llm01_l", "cup_optic_ac11704_black", ["CUP_30Rnd_545x39_AK12_M"], [], ""],
    ["CUP_arifle_G36C", "", "cup_acc_llm_black", "cup_optic_zeisszpoint", ["CUP_30Rnd_556x45_G36"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_Mk16_CQC_AFG_black", "", "", "cup_optic_ac11704_black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG_black", "", "", "cup_optic_elcan_specterdr_black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_HK416_Black", "", "", "cup_optic_zeisszpoint", ["CUP_30Rnd_556x45_Emag"], [], ""],
    ["CUP_arifle_AK108", "", "", "CUP_optic_Kobra", ["CUP_30Rnd_556x45_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_OTS14_GROZA", "", "", "", ["CUP_20Rnd_9x39_SP5_GROZA_M"], [], ""],
    ["CUP_arifle_L85A2", "", "", "cup_optic_holoblack", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2", "", "", "cup_optic_microt1", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK417_12_AG36", "", "", "cup_optic_elcan_specterdr_black", ["CUP_20Rnd_762x51_HK417"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM_black", "", "", "cup_optic_ac11704_black", ["CUP_30Rnd_556x45_Stanag_L85"], ["1Rnd_HE_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "", "cup_optic_eotech553_black", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_Mk48_nohg", "", "", "cup_optic_elcan_specterdr_black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M110_black", "", "", "cup_optic_leupoldm3lr", ["CUP_20Rnd_762x51_B_M110"], [], ""],
    ["CUP_srifle_RSASS_Black", "", "", "cup_optic_leupoldmk4", ["CUP_20Rnd_762x51_B_M110"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "cup_bipod_vltor_modpod_black", "cup_optic_leupoldmk4", ["CUP_5Rnd_86x70_L115A1"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_militaryLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SCE_ClearSky_2"]];
_policeLoadoutData set ["vests", ["SE_Eastern_Chest_Rig_Black", "SCE_Sunrise_Black"]];
_policeLoadoutData set ["helmets", ["CUP_H_PMC_Cap_Grey", "CUP_H_PMC_Cap_Back_PRR_Grey"]];

_policeLoadoutData set ["glasses", [
    "CUP_G_Scarf_Face_Blk",
    "CAU_G_CBRN_m04_hoodless"
]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SCE_ClearSky_2"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_Interceptor_Base_Grey"]];
_militiaLoadoutData set ["sniVests", ["SCE_Sunrise_Black"]];
_militiaLoadoutData set ["backpacks", ["CUP_B_AssaultPack_Black"]];
_militiaLoadoutData set ["slBackpacks", ["CUP_B_USPack_Black"]];
_militiaLoadoutData set ["atBackpacks", ["B_Carryall_blk"]];
_militiaLoadoutData set ["helmets", ["CUP_H_PMC_Beanie_Black", "CUP_H_PMC_Beanie_Headphones_Black"]];
_militiaLoadoutData set ["sniHats", ["H_Beret_blk"]];

_militiaLoadoutData set ["glasses", [
    "SCE_G_CN2F",
    "SCE_G_CN3P"
]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["CUP_sgun_M1014", "", "", "", ["CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""],
    ["CUP_Famas_F1", "", "", "", ["CUP_25Rnd_556x45_Famas"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["CUP_arifle_ACR_blk_556", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK107_GL", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_EVO", "", "", "", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_m249_para", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_MG3_rail", "", "", "", ["CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1_HG_w", "", "", "cup_optic_sb_11_4x20_pm", ["CUP_20Rnd_762x51_L129_M"], [], ""],
    ["CUP_arifle_G3A3_modern_ris_black", "", "", "cup_optic_elcanm145", ["CUP_20Rnd_762x51_G3"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "cup_optic_leupoldmk4", ["CUP_1Rnd_762x51_CZ584"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_crewLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_crewLoadoutData set ["helmets", ["CUP_H_Ger_M92_Black_GG"]];
_crewLoadoutData set ["carbines", [
    ["CUP_smg_vityaz_top_rail", "", "", "cup_optic_ac11704_black", ["CUP_10Rnd_9x19_Saiga9"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_pilotLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_pilotLoadoutData set ["helmets", ["CUP_H_Ger_M92_Black_GG"]];
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
