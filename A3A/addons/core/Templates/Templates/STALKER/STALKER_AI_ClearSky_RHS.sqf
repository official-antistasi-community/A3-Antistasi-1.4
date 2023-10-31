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

["vehiclesBasic", ["C_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_cdf_b_reg_uaz", "rhsusf_m1025_w"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm", "rhsgref_cdf_b_reg_uaz_ags", "rhsusf_m1151_m2_v1_usarmy_wd"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhs_gaz66_msv", "rhs_gaz66o_msv", "RHS_Ural_Open_MSV_01]"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["rhs_gaz66_msv", "RHS_Ural_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhs_gaz66_ammo_msv"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhs_gaz66_msv"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_BRDM2_msv", "rhsgref_BRDM2_HQ_msv", "rhsgref_BRDM2_ATGM_msv" ]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["rhsgref_cdf_b_reg_uaz_dshkm", "rhsgref_cdf_b_reg_uaz_ags", "rhsusf_m1151_m2_v1_usarmy_wd"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhs_btr70_msv", "rhs_btr80_msv", "rhs_btr80a_msv" ]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["rhs_bmp1p_msv", "rhs_Ob_681_2" ]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["rhs_bmp3_late_msv"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhs_t80b", "rhs_t72ba_tv"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhs_zsu234_aa", "RHS_Ural_Zu23_VMF_01" ]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_T_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["rhs_btr80_msv" ]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHS_Su25SM_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_mig29sm_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["RHS_Mi8AMT_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["RHS_Mi24V_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_Mi8MTV3_heavy_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_mi28n_vvsc","RHS_Ka52_vvsc"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["RHS_BM21_MSV_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["RHS_BM21_MSV_01", ["rhs_mag_m21of_1"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhs_gaz66_msv"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["rhsgref_BRDM2_HQ_msv"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_ins_DSHKM", "RHS_M2StaticMG_WD" ]] call _fnc_saveToTemplate;
["staticAT", ["rhs_Kornet_9M133_2_msv"]] call _fnc_saveToTemplate;
["staticAA", ["rhs_igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["rhs_2b14_82mm_msv"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhs_D30_msv"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "STALKER_Vehicle_Attributes_RHS.sqf"

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
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag" ], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["rhs_weap_igla", "", "", "", ["rhs_mag_9k38_rocket"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
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
_loadoutData set ["longRangeRadios", ["B_rhsusf_B_BACKPACK"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["rhsusf_mich_bare_norotos_arc_alt"]];
_loadoutData set ["sniHats", ["rhssaf_helmet_m97_veil_woodland"]];

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
_sfLoadoutData set ["vests", ["SCE_Exo2G_Merc"]];
_sfLoadoutData set ["mgVests", ["SCE_Exo2G_Merc"]];
_sfLoadoutData set ["medVests", ["SCE_Exo2G_Merc"]];
_sfLoadoutData set ["glVests", ["SCE_Exo2G_Merc"]];
_sfLoadoutData set ["backpacks", ["SE_SEVA_Oxygen_Tank"]];
_sfLoadoutData set ["slBackpacks", ["SE_Explorer_Backpack"]];
_sfLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_sfLoadoutData set ["helmets", ["SCE_Exo_Helmet_Mercenary"]];
_sfLoadoutData set ["slHat", ["SCE_Exo_Helmet_Mercenary"]];
_sfLoadoutData set ["sniHats", ["SCE_Exo_Helmet_Mercenary"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_sfLoadoutData set ["binoculars", ["rhs_pdu4"]];

_sfLoadoutData set ["glasses", [
	"SE_S10"
]];

_sfLoadoutData set ["slRifles", [
    ["rhs_weap_SCARH_FDE_STD", "rhsusf_acc_aac_scarh_silencer", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["rhs_weap_mk18", "rhsusf_acc_nt4_black", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
    ["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_grip1", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""],
    ["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "rhsusf_acc_grip_m203_wd", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1_specops", "", "", "rhsusf_acc_eotech_552_wd", ["rhsgref_30rnd_1143x23_M1T_2mag_SMG"], [], ""],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_552_wd", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_m249_pip_S", "rhsusf_acc_nt4_black", "", "rhsusf_acc_elcan", ["rhsusf_200Rnd_556x45_mixed_soft_pouch"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_m14dcqd_silencer", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_20Rnd_762x51_m993_mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["rhs_weap_m40a5", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_10Rnd_762x51_m993_Mag"], [], ""],
    ["rhs_weap_XM2010", "rhsusf_acc_m2010s_wd", "rhsusf_acc_harris_bipod", "rhsusf_acc_m8541", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_m136", "rhs_weap_M136_hedp" ]];
_sfLoadoutData set ["ATLaunchers", [
    ["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_eliteLoadoutData set ["slUniform", ["SCE_ClearSky_CBRN"]];
_eliteLoadoutData set ["vests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["mgVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["medVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["slVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["glVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["engVests", ["SCE_V_SEVA_ClearSky"]];
_eliteLoadoutData set ["backpacks", ["SCE_B_SEVA_ClearSky"]];
_eliteLoadoutData set ["slBackpacks", ["SCE_B_SEVA_ClearSky"]];
_eliteLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_eliteLoadoutData set ["helmets", ["SCE_H_SEVA_ClearSky"]];
_eliteLoadoutData set ["sniHats", ["SCE_H_SEVA_ClearSky"]];
_eliteLoadoutData set ["binoculars", ["rhs_pdu4"]];

_eliteLoadoutData set ["glasses", [
    "SCE_G_SEVA_HELMET_VISOR"
]];

_eliteLoadoutData set ["slRifles", [
    ["rhs_weap_SCARH_FDE_STD", "", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], ""]
]];
_eliteLoadoutData set ["rifles", [  
    ["rhs_weap_mk18", "", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
    ["rhs_weap_hk416d145", "", "rhsusf_acc_grip1", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [  
    ["rhs_weap_m4a1", "", "rhsusf_acc_grip1", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_hk416d145_m320", "", "", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""],
    ["rhs_weap_m4a1_m203s", "", "rhsusf_acc_grip_m203_wd", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1_specops", "", "", "rhsusf_acc_eotech_552_wd", ["rhsgref_30rnd_1143x23_M1T_2mag_SMG"], [], ""],
    ["rhsusf_weap_MP7A2", "", "", "rhsusf_acc_eotech_552_wd", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["rhs_weap_m249_pip_S", "", "", "rhsusf_acc_elcan", ["rhsusf_200Rnd_556x45_mixed_soft_pouch"], [], ""],
	["rhs_weap_m240B", "", "", "rhsusf_acc_elcan", ["rhsusf_100Rnd_762x51"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14_socom_rail", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_20Rnd_762x51_m993_mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [   
    ["rhs_weap_m40a5", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_10Rnd_762x51_m993_Mag"], [], ""],
    ["rhs_weap_XM2010", "", "rhsusf_acc_harris_bipod", "rhsusf_acc_m8541", ["rhsusf_5Rnd_300winmag_xm2010"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_m136", "rhs_weap_M136_hedp" ]];
_eliteLoadoutData set ["ATLaunchers", [
    ["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SCE_ClearSky_1"]];
_militaryLoadoutData set ["slUniform", ["SCE_ClearSky_CBRN"]];
_militaryLoadoutData set ["vests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["mgVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["medVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["slVests", ["SCE_Sunrise_Mercenary"]];
_militaryLoadoutData set ["glVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["engVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["backpacks", ["SE_Scavenger_Backpack"]];
_militaryLoadoutData set ["slBackpacks", ["SE_Scavenger_Backpack"]];
_militaryLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militaryLoadoutData set ["helmets", ["rhs_altyn_novisor", "rhs_altyn"]];
_militaryLoadoutData set ["sniHats", []];
_militaryLoadoutData set ["binoculars", ["rhs_pdu4"]];

_militaryLoadoutData set ["glasses", [
    "SE_GP7",
    "SE_GP21",
	"CAU_G_CBRN_m04_hoodless"
]];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_m4a1_carryhandle", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""],
    ["rhs_weap_m16a4", "", "", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""],
    ["rhs_weap_g36kv", "", "", "rhsusf_acc_su230a", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""],
    ["rhs_weap_vhsd2", "", "", "rhsusf_acc_acog_usmc", ["rhsgref_30rnd_556x45_vhs2"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_m4a1_carryhandle", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""],
    ["rhs_weap_m16a4", "", "", "rhsusf_acc_acog_rmr", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""],
    ["rhs_weap_g36kv", "", "", "rhsusf_acc_su230a", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""],
    ["rhs_weap_m21a_pr", "", "", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_m21"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["rhs_weap_m4a1_carryhandle_mstock", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""],
    ["rhs_weap_hk416d10", "", "", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_hk416d145_m320", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""],
    ["rhs_weap_m4a1_m320", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_m397_HET", "rhs_mag_m662_red"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "", "", "rhsusf_acc_eotech_552_wd", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["rhs_weap_mg42", "", "", "rhsgref_mg42_acc_aasight", ["rhsgref_296Rnd_792x57_SmK_Alltracers_belt"], [], ""],
	["rhs_weap_m240B", "", "", "rhsusf_acc_elcan", ["rhsusf_100Rnd_762x51"], [], ""],
	["rhs_weap_m249_pip_ris", "", "", "rhsusf_acc_elcan", ["rhsusf_200Rnd_556x45_mixed_soft_pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14_ris_wd", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_20Rnd_762x51_m993_mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_m40a5", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541_wd", ["rhsusf_10Rnd_762x51_m993_Mag"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_m136", "rhs_weap_M136_hedp" ]];
_militaryLoadoutData set ["ATLaunchers", [
    ["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA"], [], ""],
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SCE_ClearSky_2"]];
_policeLoadoutData set ["vests", ["SE_Eastern_Chest_Rig_Black"]];
_policeLoadoutData set ["helmets", ["armst_Hood_mid_clearsky", "armst_Hood_closed_clearsky"]];

_policeLoadoutData set ["glasses", [
    "SE_GP5",
    "SCE_G_CN2F"
]];

_policeLoadoutData set ["SMGs", [
    ["rhs_weap_m590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck"], [], ""],
	["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["rhs_weap_cz99_etched", "", "", "", ["rhssaf_mag_15Rnd_9x19_FMJ"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SE_Assault_Fatigues_Clear_Sky"]];
_militiaLoadoutData set ["vests", ["SE_Assault_Vest_Black"]];
_militiaLoadoutData set ["sniVests", ["SE_Eastern_Chest_Rig_Black"]];
_militiaLoadoutData set ["backpacks", ["SE_Explorer_Backpack"]];
_militiaLoadoutData set ["slBackpacks", ["SE_Hunting_Backpack"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militiaLoadoutData set ["helmets", ["armst_Hood_mid_clearsky", "armst_Hood_closed_clearsky"]];
_militiaLoadoutData set ["sniHats", ["armst_Hood_full_clearsky"]];

_militiaLoadoutData set ["glasses", [
    "SCE_G_CN2F",
    "CAU_G_CBRN_s10_gray"
]];

_militiaLoadoutData set ["rifles", [
    ["rhs_weap_m21a", "", "", "", ["rhsgref_30rnd_556x45_m21"], [], ""],
    ["rhs_weap_m4", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_vhsd2", "", "", "rhsusf_acc_acog_usmc", ["rhsgref_30rnd_556x45_vhs2"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_MP44", "", "", "", ["rhsgref_30Rnd_792x33_SmE_StG"], [], ""],
    ["rhs_weap_mosin_sbr", "", "", "", ["rhsgref_5Rnd_762x54_m38"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m79", "", "", "", ["rhs_mag_M441_HE"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51"], [], ""],
    ["rhs_weap_minimi_para_railed", "", "", "rhsusf_acc_elcan", ["rhsusf_200Rnd_556x45_box"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m14_rail", "", "", "rhsusf_acc_m8541_low_wd", ["rhsusf_20Rnd_762x51_m80_mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_m38_rail", "", "", "rhsusf_acc_leupoldmk4", ["rhsgref_5Rnd_762x54_m38"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m136", "rhs_weap_M136_hedp" ]];
_militiaLoadoutData set ["ATLaunchers", [
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
	["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_crewLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
    ["rhs_weap_m4a1_carryhandle_mstock", "", "", "", ["rhs_mag_30Rnd_556x45_m855A1_Stanag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SCE_ClearSky_CBRN"]];
_pilotLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_alt"]];
_pilotLoadoutData set ["carbines", [
    ["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""]
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
