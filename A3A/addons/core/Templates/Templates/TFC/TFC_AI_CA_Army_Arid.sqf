//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Canadian Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "Canadian Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\TFC\images\flag_canada_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Canada"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// This mod doesn't have much desert stuff, so it'll basically become USA... but hey, still canada

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["tfc_vs_luvw_arid_f", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m1043_d"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["tfc_vs_luvw_arid_armed_f", "rhsusf_m1043_d_m2", "rhsusf_m1151_m240_v2_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["rhsusf_M1078A1P2_D_fmtv_usarmy", "rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy", "rhsusf_M1084A1P2_B_D_fmtv_usarmy"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhsusf_M977A4_AMMO_BKIT_usarmy_d", "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["rhsusf_M977A4_REPAIR_BKIT_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["rhsusf_M978A4_BKIT_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["tfc_wheeled_lav6_isc_ar", "rhsusf_M1117_D", "rhsusf_stryker_m1126_m2_d", "rhsusf_stryker_m1132_m2_np_d"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["tfc_wheeled_lav6_isc_ar", "rhsusf_stryker_m1126_m2_d", "RHS_M2A3_BUSKI_d", "RHS_M2A3_d"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["tfc_wheeled_lav6_isc_ar", "rhsusf_M1220_M2_usarmy_d", "rhsusf_M1232_M2_usarmy_d"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["RHS_M2A2_BUSKI", "RHS_M6"]] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["RHS_M2A3_BUSKIII", "RHS_M2A2"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["TFC_MBT_Leopard2A4M_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["TFC_CP140_dynamicLoadout"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhsusf_f22"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["tfc_cc130_cargo"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["RHS_UH60M", "RHS_CH_47F_light"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["RHS_UH60M2"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_MELB_AH6M_M", "RHS_MELB_AH6M_H"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_AH64D"]] call _fnc_saveToTemplate;

["magazines", createHashMapFromArray [
    ["rhsusf_m109_usarmy",["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;
//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["tfc_vs_luvw_arid_armed_f", "rhsusf_m1025_d_m2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhsusf_M1078A1P2_D_fmtv_usarmy"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["tfc_vs_luvw_arid_f", "rhsusf_m998_d_2dr_halftop"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["tfc_wheeled_lav6_isc_ar"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["tfc_vs_luvw_armed_f", "rhsusf_m998_d_4dr_halftop"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_D"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;
["staticHowitzers", ["RHS_M119_D"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "RHS_mag_m1_he_12"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

// #include "RHS_Vehicle_Attributes.sqf"

["variants", [
    ["TFC_MBT_Leopard2A4M_F", ["tfc_Leopard2A4M_Sand",1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];
_loadoutData set ["GLsidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["TFC_NVG_PVS14", "TFC_NVG_PVS23"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["traitorUniforms", ["TFC_CU_CombatUniform_tunic_cadpat_AR"]];
_loadoutData set ["traitorVests", ["TFC_CV_SORD_Ballistic_AR", "TFC_CV_BV_AR"]];
_loadoutData set ["traitorHats", ["TFC_CH_CG634_CADPAT_SCRIM_01_AR", "TFC_CH_CG634_CADPAT_SCRIM_L_01_AR"]];

_loadoutData set ["officerUniforms", ["TFC_CU_CombatUniform_otw_cadpat_AR"]];
_loadoutData set ["officerVests", ["V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["TFC_CH_Beret_MPBranch"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["tfc_cb_Carryall_AR"]];
_loadoutData set ["longRangeRadios", ["TFC_CB_Smallpack_AR_TFAR"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["TFC_CH_CG634_HS_CADPAT_AR", "TFC_CH_CG634_CADPAT_GG_HS_AR"]];
_loadoutData set ["sniHats", ["TFC_CH_Booniehat_CADPAT_AR"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["TFC_CU_Operator_otw_mx_multicam", "TFC_CU_Operator_otw_multicam"]];
_sfLoadoutData set ["vests", ["tfc_vest_pico_dsx_astl", "tfc_vest_pico_dsx_astl2", "tfc_vest_pico_dsx_ast3"]];
_sfLoadoutData set ["MGvests", ["tfc_vest_pico_dsx_ast4"]];
_sfLoadoutData set ["MEDvests", ["tfc_vest_pico_dsx_Med"]];
_sfLoadoutData set ["GLvests", ["tfc_vest_pico_dsx_jtac", "tfc_vest_pico_dsx_ast3"]];
_sfLoadoutData set ["backpacks", ["TFC_Backpanel_TYR_Mcam", "TFC_Backpanel_2_Mcam"]];
_sfLoadoutData set ["helmets", ["tfc_ch_helmet_viper_p4", "tfc_ch_helmet_viper_p4_hel", "rhsusf_opscore_mc_cover_pelt", "rhsusf_opscore_mc_cover_pelt_cam"]];
_sfLoadoutData set ["NVGs", ["TFC_NVG_GPNVG18_blk"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_M136_hp"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];

_sfLoadoutData set ["rifles", [
    ["TFC_W_mrr_rifle_black", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
    ["TFC_W_mrr_rifle_black", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""],
    ["TFC_W_C8IUR", "rhsusf_acc_nt4_black", "TFC_WA_peq15_blk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], "TFC_WA_grip_afg"],
    ["TFC_W_C8IUR", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_harris_bipod"],
    ["TFC_W_C8IUR", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["TFC_W_mrr_carbine_Black", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull"], [], ""],
    ["TFC_W_mrr_carbine_Black", "rhsusf_acc_nt4_black", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull"], [], ""],
    ["TFC_W_C8SFW", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_Stanag_Pull"], [], "TFC_WA_grip_afg"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["rhs_weap_m4a1_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
    ["TFC_W_mk46", "", "", "rhsusf_acc_compm4", ["rhsusf_200rnd_556x45_M855_box"], [], ""],
    ["TFC_W_mk48", "", "", "rhsusf_acc_ELCAN", ["150Rnd_762x54_Box"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["TFC_W_c21_AR", "TFC_WA_supp_C21", "", "tfc_wa_5_25_x56_high", ["tfc_8rnd_338"], [], "tfc_wa_harris_bipod_small"],
    ["TFC_W_c21_AR", "TFC_WA_supp_C21", "", "rhsusf_acc_nxs_3515x50_md", ["tfc_8rnd_338"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sidearms", [
    ["tfc_w_P320_blk", "", "acc_flashlight_pistol", "", ["16Rnd_9x21_Mag"], [], ""]
]];
_sfLoadoutData set ["GLsidearms", [
    ["rhs_weap_M320", "", "", "", ["rhs_mag_M397_HET", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP"], [], ""],
    ["rhs_weap_M320", "", "", "", ["rhs_mag_m4009", "rhs_mag_m714_White", "rhs_mag_m716_yellow"], [], ""] //Stun
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["TFC_CU_Operator_otw_mc_ar", "TFC_CU_Operator_otw_ar_mc"]];
_eliteLoadoutData set ["vests", ["tfc_vest_pico_dsx", "tfc_vest_pico_dsx_astl"]];
_eliteLoadoutData set ["MGvests", ["tfc_vest_pico_dsx_ast3", "tfc_vest_pico_dsx_tl2"]];
_eliteLoadoutData set ["MEDvests", ["tfc_vest_pico_dsx_Med"]];
_eliteLoadoutData set ["GLvests", ["tfc_vest_pico_dsx_astl2", "tfc_vest_pico_dsx_ast4"]];
_eliteLoadoutData set ["backpacks", ["TFC_Backpanel_1_Mcam", "TFC_Backpanel_2_Mcam", "TFC_Backpanel_4_Mcam"]];
_eliteLoadoutData set ["atBackpacks", ["TFC_CB_Medbag_ar", "TFC_CB_Smallpack_AR"]];
_eliteLoadoutData set ["helmets", ["tfc_ch_helmet_viper_p4_Cover", "tfc_ch_helmet_viper_p4_Cover_Hel"]];
_eliteLoadoutData set ["NVGs", ["TFC_NVG_PVS23"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
    "rhs_weap_M136",
    "rhs_weap_M136_hedp",
    "rhs_weap_M136_hp"
]];
_eliteLoadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["TFC_W_mrr_rifle_black", "", "TFC_WA_peq15_blk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855_Stanag_Pull"], [], ""],
    ["TFC_W_mrr_carbine_Black", "", "TFC_WA_peq15_blk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_M855_Stanag_Pull"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["TFC_W_mrr_carbine_Black", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
    ["TFC_W_mrr_carbine_Black", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
    ["TFC_W_mrr_carbine_Black", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
    ["TFC_W_C8IUR", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
    ["TFC_W_C8IUR", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
    ["rhs_weap_m4a1_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["TFC_W_c9a2", "", "", "TFC_WA_c79_Elcan_3d", ["rhsusf_200rnd_556x45_M855_box"], [], ""],
    ["TFC_W_c9a2", "", "", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["TFC_W_mrr_rifle_black", "TFC_WA_opsinc_556", "", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_harris_bipod"],
    ["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
    ["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_eliteLoadoutData set ["sidearms", [
    ["tfc_w_P320_bat", "", "acc_flashlight_pistol", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_tunic_cadpat_AR", "TFC_CU_CombatUniform_otw_cadpat_AR"]];
_militaryLoadoutData set ["vests", ["TFC_CV_SORD_Ballistic_AR", "TFC_CV_SORD"]];
_militaryLoadoutData set ["MGvests", ["TFC_CV_OTV_BV_ar"]];
_militaryLoadoutData set ["MEDvests", ["TFC_CV_SORD"]];
_militaryLoadoutData set ["SLvests", ["TFC_CV_SORD_Ballistic_AR"]];
_militaryLoadoutData set ["SNIvests", ["TFC_CV_SORD"]];
_militaryLoadoutData set ["GLvests", ["TFC_CV_OTV_BV_ar"]];
_militaryLoadoutData set ["backpacks", ["TFC_CB_Smallpack_AR", "TFC_CB_Medbag_ar"]];
_militaryLoadoutData set ["helmets", ["TFC_CH_CG634_CADPAT_AR", "TFC_CH_CG634_CADPAT_GG_AR"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];

_militaryLoadoutData set ["slRifles", [
    ["TFC_W_c8a3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_c8a3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_C8IUR", "", "TFC_WA_peq15_blk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_C8SFW", "", "TFC_WA_peq15_blk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["tfc_w_c7a2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["tfc_w_c7a2", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["tfc_w_c7a2", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], "TFC_WA_Virtgrip"],
    ["TFC_W_c8a3", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_c8a3", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["TFC_W_c8a3", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_c8a3", "", "", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], "TFC_WA_Virtgrip"],
    ["TFC_W_c8a3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", [], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", [], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", [], [], "rhs_acc_grip_ffg2"],
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", [], [], "rhs_acc_grip_ffg2"]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m4_carryhandle_m203S", "", "rhsusf_acc_wmx_bk", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
    ["rhs_weap_m4_carryhandle_m203", "", "rhsusf_acc_wmx_bk", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["TFC_W_c9a2", "", "", "", ["rhsusf_100Rnd_556x45_M200_soft_pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_sr25", "", "", "rhsusf_acc_ACOG2", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag"], [], ""],
    ["TFC_W_c14", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["tfc_5rnd_338"], [], "rhsusf_acc_harris_bipod"],
    ["TFC_W_c20", "", "", "rhsusf_acc_ELCAN", ["20Rnd_762x51_Mag"], [], "TFC_WA_c20_vgbp"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], "rhsusf_acc_harris_bipod"],
    ["TFC_W_c21_AR", "", "", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
    ["TFC_W_c15a2", "", "", "rhsusf_acc_LEUPOLDMK4_2", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["tfc_w_P320_blk", "", "", "", ["16Rnd_9x21_Mag"], [], ""],
    ["tfc_w_bhp", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_tunic_cadpat_AR"]];
_policeLoadoutData set ["vests", ["TFC_CV_BV_ar", "V_Chestrig_rgr"]];
_policeLoadoutData set ["helmets", ["TFC_CH_Booniehat_CADPAT_AR", "TFC_CH_Beret_MPBranch"]];
_policeLoadoutData set ["policeWeapons", [
    ["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""],
    ["TFC_W_c8a3", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["tfc_w_bhp"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_otw_cadpat_AR", "TFC_CU_CombatUniform_tunic_cadpat_AR"]];
_militiaLoadoutData set ["vests", ["V_SmershVest_01_F", "V_Chestrig_khk", "TFC_CV_BV_ar"]];
_militiaLoadoutData set ["backpacks", ["TFC_CB_Smallpack_AR", "TFC_CB_Medbag_ar"]];
_militiaLoadoutData set ["atBackpacks", ["tfc_cb_Carryall_AR"]];
_militiaLoadoutData set ["helmets", ["TFC_CH_CG634_CADPAT_AR", "TFC_CH_CG634_CADPAT_GG_AR", "TFC_CH_BCAP_AR"]];
_militiaLoadoutData set ["slHat", ["TFC_CH_CG634_CADPAT_GG_HS_AR", "TFC_CH_CG634_HS_CADPAT_AR"]];
_militiaLoadoutData set ["sniHats", ["TFC_CH_Booniehat_CADPAT_AR"]];
_militiaLoadoutData set ["longRangeRadios", ["TFC_CB_Smallpack_AR_TFAR"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];

_militiaLoadoutData set ["slRifles", [
    ["TFC_W_c8a3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["tfc_w_c7a2", "", "", "TFC_WA_C79_Elcan", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""],
    ["TFC_W_C8SFW", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["tfc_w_c7a2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["TFC_W_c8a3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_m4_carryhandle_m203", "", "rhsusf_acc_wmx_bk", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["rhsusf_weap_MP7A2", "", "rhsusf_acc_wmx_bk", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["TFC_W_c9a2", "", "", "", ["rhsusf_100Rnd_556x45_M200_soft_pouch"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_sr25", "", "", "rhsusf_acc_ACOG2", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["tfc_w_bhp", "tfc_w_P226_rail"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_tunic_cadpat_AR"]];
_crewLoadoutData set ["vests", ["TFC_CV_BV_ar"]];
_crewLoadoutData set ["helmets", ["TFC_CH_CG634_CADPAT_GG_Crew_AR", "TFC_CH_CG634_CADPAT_Crew_AR"]];
_crewLoadoutData set ["carbines", [
    ["TFC_W_c8a3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];
_crewLoadoutData set ["SMGs", [
    ["TFC_W_c8a3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TFC_CU_CombatUniform_Aircrew_AR"]];
_pilotLoadoutData set ["vests", ["TFC_CV_AIRCREW_TEMPERATE"]];
_pilotLoadoutData set ["helmets", ["TFC_CH_Helo_Pilot", "TFC_CH_Helo_Crew"]];
_pilotLoadoutData set ["SMGs", [
    ["TFC_W_c8a3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    if (random 1 < 0.15) then {
		[["lightHELaunchers", "lightATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["MEDvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["GLsidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["MGvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SNIvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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


    ["policeWeapons"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;