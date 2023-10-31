//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Monolith"] call _fnc_saveToTemplate;
["spawnMarkerName", "Monolith Support Tunnel"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_monolith"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; // due to emissions in "the zone" and such, you don't want helis and planes flying around all the time

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["C_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_cdf_b_reg_uaz", "rhsusf_m1025_w"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm", "rhsusf_m1151_m2_v1_usarmy_wd", "rhsgref_cdf_b_reg_uaz_ags"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["RHS_Ural_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["RHS_Ural_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhs_gaz66_ammo_vdv"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["RHS_Ural_Repair_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["RHS_Ural_Fuel_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhs_gaz66_msv"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_BRDM2_msv", "rhsgref_BRDM2_HQ_msv", "rhsgref_BRDM2_ATGM_msv"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["rhsgref_cdf_b_reg_uaz_dshkm", "rhsusf_m1151_m2_v1_usarmy_wd", "rhsgref_BRDM2_msv"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhs_btr70_msv"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["rhs_bmp2e_msv"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["rhs_bmp3mera_msv"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhs_t72ba_tv", "rhs_t80"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhs_zsu234_aa", "RHS_Ural_Zu23_MSV_01"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_T_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["rhsusf_mkvsoc"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["rhs_btr70_msv" ]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHS_Su25SM_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_mig29sm_vvs"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["RHS_Mi8AMT_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["RHS_Mi24V_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_Mi8MTV3_heavy_vdv"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_mi28n_vvsc","RHS_Ka52_vvsc"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["RHS_BM21_VMF_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["RHS_BM21_VMF_01", ["rhs_mag_m21of_1"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["rhs_pchela1t_vvs"]] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["RHS_Ural_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["rhsgref_BRDM2_msv"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["rhsusf_m1025_w"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_cdf_b_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_cdf_b_reg_M252"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhsgref_cdf_b_reg_d30"]] call _fnc_saveToTemplate;

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

["faces", ["RussianHead_1","RussianHead_2","RussianHead_3","Sturrock",
"WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_07"]] call _fnc_saveToTemplate;
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
    ["rhs_weap_M136", "", "", "", [""], [], ""],
	["rhs_weap_m72a7", "", "", "", [""], [], ""],
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""]
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
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["SE_Assault_Fatigues_Monolith"]];
_loadoutData set ["traitorVests", ["SCE_Sunrise_Black"]];
_loadoutData set ["traitorHats", ["armst_Hood_closed_mono"]];

_loadoutData set ["officerUniforms", ["SE_Assault_Fatigues_Monolith"]];
_loadoutData set ["officerVests", ["SCE_V_SEVA_Monolith"]];
_loadoutData set ["officerHats", ["armst_Hood_mid_mono"]];

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
_loadoutData set ["slHat", ["rhsusf_Bowman"]];
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
_sfLoadoutData set ["uniforms", ["SCE_Monolith_2"]];
_sfLoadoutData set ["vests", ["SCE_Exo2G_Monolith"]];
_sfLoadoutData set ["mgVests", ["SCE_Exo2G_Monolith"]];
_sfLoadoutData set ["medVests", ["SCE_Exo2G_Monolith"]];
_sfLoadoutData set ["glVests", ["SCE_Exo2G_Monolith"]];
_sfLoadoutData set ["backpacks", ["SE_Alice_Backpack"]];
_sfLoadoutData set ["slBackpacks", ["SE_Explorer_Backpack"]];
_sfLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_sfLoadoutData set ["helmets", ["SCE_Exo_Helmet_Monolith"]];
_sfLoadoutData set ["slHat", ["SCE_Exo_Helmet_Monolith"]];
_sfLoadoutData set ["sniHats", ["SCE_Exo_Helmet_Monolith"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_m24"]];

_sfLoadoutData set ["glasses", [
    "CAU_G_CBRN_m50_hoodless"
]]; 

_sfLoadoutData set ["slRifles", [
    ["rhs_weap_m16a4_carryhandle", "rhsusf_acc_nt4_black", "", "rhsusf_acc_acog2", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_g36c", "rhsusf_acc_nt4_black", "", "rhsusf_acc_eotech_552", ["rhsusf_30Rnd_556x45_EPR_G36"], [], ""],
    ["rhs_weap_ak74m_camo", "rhs_acc_tgpa", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["rhs_weap_asval_grip", "", "", "rhs_acc_okp7_dovetail", ["rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_aks74n_2", "rhs_acc_tgpa", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["rhs_weap_ak104_zenitco01", "rhs_acc_pbs1", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_tgpa", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m4a1_carryhandle_m203", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell"], ""],
    ["rhs_weap_ak74m_gp25", "rhs_acc_tgpa", "", "", ["rhs_30Rnd_545x39_7N10_plum_AK"], ["rhs_VOG25"], ""],
    ["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["rhs_weap_vss_grip", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_pkp", "", "", "rhs_acc_ekp1", ["rhs_100Rnd_762x54mmR"], [], ""],
    ["rhs_weap_m240b", "", "", "", ["rhsusf_100Rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_m8541", ["rhsusf_20Rnd_762x51_m80_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541", ["rhsusf_5Rnd_762x51_m118_special_Mag"], [], ""],
    ["rhs_weap_t5000", "", "", "rhsusf_acc_leupoldmk4_2", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7", "rhs_weap_rpg75"]];
_sfLoadoutData set ["ATLaunchers", [
    ["rhs_weap_M136", "", "", "", [""], [], ""],
	["rhs_weap_m72a7", "", "", "", [""], [], ""],
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["rhsusf_weap_MP7A2_folded", "rhsusf_acc_rotex_mp7", "", "rhs_acc_1p87", ["rhsusf_mag_40Rnd_46x30_FMJ"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SCE_Monolith_1"]];
_eliteLoadoutData set ["slUniform", ["SCE_Monolith_3"]];
_eliteLoadoutData set ["vests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["mgVests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["medVests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["slVests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["glVests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["engVests", ["SCE_V_SEVA_Monolith"]];
_eliteLoadoutData set ["backpacks", ["SCE_B_SEVA_Monolith"]];
_eliteLoadoutData set ["slBackpacks", ["SE_SEVA_Oxygen_Tank"]];
_eliteLoadoutData set ["atBackpacks", ["SCE_B_SEVA_Monolith"]];
_eliteLoadoutData set ["helmets", ["SCE_H_SEVA_Monolith"]];
_eliteLoadoutData set ["sniHats", ["SCE_H_SEVA_Monolith"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_m24"]];

_eliteLoadoutData set ["glasses", [
    "SCE_G_SEVA_HELMET_VISOR"
]];

_eliteLoadoutData set ["slRifles", [
    ["rhs_weap_m16a4_carryhandle", "", "", "rhsusf_acc_acog2", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_g36c", "", "", "rhsusf_acc_eotech_552", ["rhsusf_30Rnd_556x45_EPR_G36"], [], ""],
    ["rhs_weap_ak74m_camo", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["rhs_weap_asval_grip", "", "", "rhs_acc_okp7_dovetail", ["rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_aks74n_2", "rhs_acc_dtk3", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["rhs_weap_ak104_zenitco01", "", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m4a1_carryhandle_m203", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell"], ""],
    ["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_plum_AK"], ["rhs_VOG25"], ""],
    ["rhs_weap_hk416d10_m320", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["rhs_weap_vss_grip", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["rhs_weap_pkp", "", "", "rhs_acc_ekp1", ["rhs_100Rnd_762x54mmR"], [], ""],
    ["rhs_weap_m240b", "", "", "", ["rhsusf_100Rnd_762x51"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_m14ebrri", "", "", "rhsusf_acc_m8541", ["rhsusf_20Rnd_762x51_m80_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_m8541", ["rhsusf_5Rnd_762x51_m118_special_Mag"], [], ""],
    ["rhs_weap_t5000", "", "", "rhsusf_acc_leupoldmk4_2", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_eliteLoadoutData set ["ATLaunchers", [
    ["rhs_weap_M136", "", "", "", [""], [], ""],
	["rhs_weap_m72a7", "", "", "", [""], [], ""],
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SCE_Monolith_1"]];
_militaryLoadoutData set ["slUniform", ["SE_Assault_Fatigues_Monolith"]];
_militaryLoadoutData set ["vests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["mgVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["medVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["slVests", ["SE_Combat_Vest"]];
_militaryLoadoutData set ["glVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["engVests", ["SE_Assault_Vest_Black"]];
_militaryLoadoutData set ["backpacks", ["SE_Alice_Backpack", "SE_Scavenger_Backpack"]];
_militaryLoadoutData set ["slBackpacks", ["SE_Explorer_Backpack"]];
_militaryLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militaryLoadoutData set ["helmets", ["rhs_altyn", "rhs_altyn_novisor", "rhsusf_mich_bare_norotos_arc"]];
_militaryLoadoutData set ["sniHats", []];
_militaryLoadoutData set ["binoculars", ["rhsusf_bino_m24"]];

_militaryLoadoutData set ["glasses", [
    "CAU_G_CBRN_m50_white_hood",
    "CAU_G_CBRN_s10_white"
]];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_m4a1", "", "", "rhsusf_acc_acog2", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_hk416d145", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_ak104", "rhs_acc_dtk", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_polymer"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_asval_grip", "", "", "rhs_acc_okp7_dovetail", ["rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_hk416d145", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""],
    ["rhs_weap_aks74n_2", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["rhs_weap_ak104_zenitco01", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer"], [], ""],
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m4a1_carryhandle_m203", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], ["1Rnd_HE_Grenade_shell"], ""],
    ["rhs_weap_ak74m_gp25", "", "rhs_acc_dtk", "", ["rhs_30Rnd_545x39_7N10_plum_AK"], ["rhs_VOG25"], ""],
    ["rhs_weap_hk416d10_m320", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "", "", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhs_weap_vss_grip", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["rhs_weap_pkp", "", "", "rhs_acc_ekp1", ["rhs_100Rnd_762x54mmR"], [], ""],
    ["rhs_weap_m249", "", "", "", ["rhsusf_200Rnd_556x45_M855_soft_pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
    ["rhs_weap_SCARH_STD", "", "", "rhsusf_acc_su230_mrds", ["rhs_mag_20Rnd_SCAR_762x51_m80_ball"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_m40a5", "", "rhsusf_acc_harris_swivel", "rhsusf_acc_nxs_351x50_md", ["rhsusf_5Rnd_762x51_AICS_m118_special_Mag"], [], ""],
    ["rhs_weap_t5000", "", "", "rhsusf_acc_leupoldmk4_2", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_M136"]];
_militaryLoadoutData set ["ATLaunchers", [
    ["rhs_weap_M136", "", "", "", [""], [], ""],
	["rhs_weap_m72a7", "", "", "", [""], [], ""],
	["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_JHP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SCE_Monolith_3"]];
_policeLoadoutData set ["vests", ["SE_Eastern_Chest_Rig_Black", "SE_Eastern_Chest_Rig_Brown"]];
_policeLoadoutData set ["helmets", ["armst_Hood_full_mono", "armst_Hood_closed_mono"]];

_policeLoadoutData set ["glasses", [
    "SE_GP5"
]];

_policeLoadoutData set ["SMGs", [
    ["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_Slug"], [], ""],
	["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["rhs_weap_tt33", "", "", "", ["rhs_mag_762x25_B"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SCE_Monolith_3"]];
_militiaLoadoutData set ["vests", ["SE_Eastern_Tactical_Vest_Black"]];
_militiaLoadoutData set ["sniVests", ["SCE_Coat_Short_2"]];
_militiaLoadoutData set ["backpacks", ["SE_Hunting_Backpack"]];
_militiaLoadoutData set ["slBackpacks", ["B_AssaultPack_blk"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militiaLoadoutData set ["helmets", ["armst_Hood_full_mono", "armst_Hood_closed_mono"]];
_militiaLoadoutData set ["sniHats", ["armst_Hood_full_mono"]];

_militiaLoadoutData set ["glasses", [
    "SE_Respirator",
    "SE_GP5"
]];

_militiaLoadoutData set ["rifles", [
    ["rhs_weap_ak104", "rhs_acc_dtk", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_polymer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_plum_AK"], ["rhs_VOG25"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["rhs_weap_vss_grip", "", "", "rhs_acc_ekp1", ["rhs_20rnd_9x39mm_SP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["rhs_weap_pkp", "", "", "rhs_acc_ekp1", ["rhs_100Rnd_762x54mmR"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhsusf_acc_leupoldmk4_2", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militiaLoadoutData set ["ATLaunchers", [
	["rhs_weap_m72a7", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["rhs_weap_tt33", "", "", "", ["rhs_mag_762x25_B"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SCE_Monolith_1"]];
_crewLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_crewLoadoutData set ["helmets", ["armst_Hood_full_mono"]];
_crewLoadoutData set ["carbines", [
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CAU_U_CBRN_gray"]];
_pilotLoadoutData set ["vests", ["SCE_Sunrise_Black"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_visor_white"]];
_pilotLoadoutData set ["carbines", [
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK"], [], ""]
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
