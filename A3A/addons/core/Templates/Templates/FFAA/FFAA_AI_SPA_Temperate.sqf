//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "SpAF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Spanish Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "ffaa_bandera_espa"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\FFAA\flag_spain_co.paa)] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_Spain"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["ffaa_et_neton_mk2"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ffaa_et_vamtac_ume","ffaa_et_vamtac_trans", "ffaa_et_vamtac_trans_blind"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["ffaa_et_vamtac_st5_m2", "ffaa_et_vamtac_m2", "ffaa_et_lince_m2", "ffaa_et_vamtac_st5_lag40", "ffaa_vamtac_lag40", "ffaa_et_lince_lag40", "ffaa_et_vamtac_st5_spike", "ffaa_et_vamtac_tow", "ffaa_et_vamtac_crows", "ffaa_et_rg31_samson", "ffaa_et_vamtac_cardom"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["ffaa_et_pegaso_carga", "ffaa_et_m250_carga_blin", "ffaa_et_pegaso_carga_Iona", "ffaa_et_m250_carga_Iona_blin"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["ffaa_et_m250_recuperacion_blin"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["ffaa_et_pegaso_municion", "ffaa_et_m250_municion_blin"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["ffaa_et_pegaso_repara_municion", "ffaa_et_m250_repara_municion_blin"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["ffaa_et_pegaso_combustible", "ffaa_et_m250_combustible_blin"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["ffaa_et_toa_ambulancia"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["ffaa_et_toa_m2", "ffaa_et_toa_zapador", "ffaa_et_toa_spike"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["ffaa_ar_piranhaIIIC"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["ffaa_et_pizarro_mauser", "ffaa_ar_piranhaIIIC_lance"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["ffaa_et_leopardo"]] call _fnc_saveToTemplate;
["vehiclesAA", ["ffaa_et_vamtac_mistral"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["ffaa_et_toa_m2"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["ffaa_et_pizarro_mauser", "ffaa_ar_piranhaIIIC_lance"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["ffaa_ar_supercat", "ffaa_ar_zodiac_hurricane", "ffaa_ar_zodiac_hurricane_long"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["ffaa_ar_harrier"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["ffaa_ea_ef18m"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["ffaa_ea_hercules"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["ffaa_famet_ec135", "ffaa_famet_cougar", "ffaa_nh90_tth_transport"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["ffaa_nh90_nfh_transport", "ffaa_famet_ch47_mg"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["ffaa_nh90_tth_armed", "ffaa_famet_cougar_armed"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["ffaa_famet_tigre"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["ffaa_ar_m109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["ffaa_ar_m109", ["32Rnd_155mm_Mo_Shells"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["ffaa_raven"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["ffaa_et_lince_mg3", "ffaa_et_vamtac_st5_mg3"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["ffaa_et_pegaso_carga"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["ffaa_et_anibal", "ffaa_et_neton_mk2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["ffaa_et_toa_m2"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CUP_LADA_LM_CIV", "CUP_C_S1203_Militia_CIV"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_USMC"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["ffaa_mistral_tripode"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_USMC"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "FFAA_Vehicle_Attributes.sqf"

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
    "ffaa_armas_c90_CR_BK", "ffaa_armas_c100_biv"
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    "ffaa_armas_c100", "ffaa_armas_c90_CR_AM"
]];
_loadoutData set ["lightATLaunchers", ["ffaa_armas_c90_CR_FIM"]];
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
_loadoutData set ["NVGs", ["ffaa_nvgoggles"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["CUP_LRTV"]];

_loadoutData set ["traitorUniforms", ["ffaa_brilat_CombatUniform_item_bk"]];
_loadoutData set ["traitorVests", ["ffaa_brilat_chaleco_01_bs"]];
_loadoutData set ["traitorHats", ["ffaa_brimz_boina"]];

_loadoutData set ["officerUniforms", ["ffaa_brilat_CombatUniform_item_bk"]];
_loadoutData set ["officerVests", ["ffaa_brilat_chaleco_01_bs"]];
_loadoutData set ["officerHats", ["ffaa_brimz_boina"]];

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
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_eaf_F", "B_RadioBag_01_wdl_F"]];
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
_sfLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_bk"]];
_sfLoadoutData set ["vests", ["ffaa_brilat_chaleco_06_bk"]];
_sfLoadoutData set ["mgVests", ["ffaa_brilat_chaleco_06_bk"]];
_sfLoadoutData set ["medVests", ["ffaa_brilat_chaleco_06_bk"]];
_sfLoadoutData set ["glVests", ["ffaa_brilat_chaleco_06_bk"]];
_sfLoadoutData set ["backpacks", ["CUP_B_USPack_Black"]];
_sfLoadoutData set ["slBackpacks", ["B_AssaultPack_blk"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_USPack_Black"]];
_sfLoadoutData set ["helmets", ["ffaa_moe_casco_02_1_bk", "ffaa_moe_casco_02_2_bk", "ffaa_moe_casco_02_3_bk", "ffaa_moe_casco_02_4_bk", "ffaa_moe_casco_02_5_bk"]];
_sfLoadoutData set ["slHat", ["ffaa_brimz_boina"]];
_sfLoadoutData set ["sniHats", ["ffaa_brimz_boina"]];
_sfLoadoutData set ["NVGs", ["ffaa_nvgoggles"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""],
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_OD_Top", "CUP_optic_CompM2_low_OD", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_OD", "CUP_optic_AIMM_M68_OD", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_OD_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "", "CUP_optic_HoloBlack", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["ffaa_armas_ameli", "", "", "CUP_optic_ElcanM145", ["ffaa_556x45_mg4", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_15_Black", "CUP_optic_ACOG_TA01B_Black", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
["ffaa_armas_aw50", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["ffaa_127x99_ap"], [], ""],
["ffaa_armas_m95", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["ffaa_127x99_ap"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["ffaa_armas_usp", "cup_muzzle_snds_m9", "", "", [], [], ""],
["ffaa_armas_p226", "cup_muzzle_snds_m9", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_b", "ffaa_CombatUniform_shortsleeve_item_b"]];
_eliteLoadoutData set ["slUniforms", ["ffaa_brilat_CombatUniform_item_b"]];
_eliteLoadoutData set ["vests", ["ffaa_brilat_chaleco_01_bs"]];
_eliteLoadoutData set ["mgVests", ["ffaa_brilat_chaleco_04_bs"]];
_eliteLoadoutData set ["medVests", ["ffaa_brilat_chaleco_05_bs"]];
_eliteLoadoutData set ["slVests", ["ffaa_brilat_chaleco_02_bs"]];
_eliteLoadoutData set ["glVests", ["ffaa_brilat_chaleco_05_bs"]];
_eliteLoadoutData set ["engVests", ["ffaa_brilat_chaleco_02_bs"]];
_eliteLoadoutData set ["backpacks", ["ffaa_brilat_mochila_asalto_boscoso", "ffaa_brilat_mochila_boscoso", "ffaa_brilat_mochila_ligera_boscoso", "ffaa_brilat_mochila_viaje_boscoso"]];
_eliteLoadoutData set ["slBackpacks", ["ffaa_brilat_mochila_boscoso"]];
_eliteLoadoutData set ["atBackpacks", ["ffaa_brilat_mochila_asalto_boscoso"]];
_eliteLoadoutData set ["helmets", ["ffaa_brilat_casco_b", "ffaa_casco_marte_04_mod_3_b", "ffaa_casco_marte_04_mod_1_b", "ffaa_casco_marte_04_mod_2_b", "ffaa_casco_marte_04_mod_4_b"]];
_eliteLoadoutData set ["sniHats", ["ffaa_brilat_chambergo_b"]];
_eliteLoadoutData set ["slHat", ["ffaa_moe_boina"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["slRifles", [
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["ffaa_armas_p90", "", "", "", ["ffaa_507x28_p90"], [], ""],
["ffaa_armas_ump", "", "", "", ["ffaa_9x19_ump"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["ffaa_armas_mg4", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["ffaa_armas_minimi", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["ffaa_armas_cetme_c", "", "", "ffaa_optic_susat", ["ffaa_762x51_cedmec"], [], ""],
["ffaa_armas_cetme_e", "", "", "ffaa_optic_susat", ["ffaa_762x51_cedmec"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["ffaa_armas_aw", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["ffaa_762x51_accuracy"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["ffaa_armas_usp", "", "", "", [], [], ""],
["ffaa_armas_p226", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_b", "ffaa_CombatUniform_shortsleeve_item_b"]];
_militaryLoadoutData set ["slUniforms", ["ffaa_brilat_CombatUniform_item_b"]];
_militaryLoadoutData set ["vests", ["ffaa_brilat_chaleco_01_bs"]];
_militaryLoadoutData set ["mgVests", ["ffaa_brilat_chaleco_04_bs"]];
_militaryLoadoutData set ["medVests", ["ffaa_brilat_chaleco_05_bs"]];
_militaryLoadoutData set ["slVests", ["ffaa_brilat_chaleco_02_bs"]];
_militaryLoadoutData set ["glVests", ["ffaa_brilat_chaleco_05_bs"]];
_militaryLoadoutData set ["engVests", ["ffaa_brilat_chaleco_02_bs"]];
_militaryLoadoutData set ["backpacks", ["ffaa_brilat_mochila_asalto_boscoso", "ffaa_brilat_mochila_boscoso", "ffaa_brilat_mochila_ligera_boscoso", "ffaa_brilat_mochila_viaje_boscoso"]];
_militaryLoadoutData set ["slBackpacks", ["ffaa_brilat_mochila_boscoso"]];
_militaryLoadoutData set ["atBackpacks", ["ffaa_brilat_mochila_asalto_boscoso"]];
_militaryLoadoutData set ["helmets", ["ffaa_brilat_casco_b", "ffaa_casco_marte_04_mod_3_b", "ffaa_casco_marte_04_mod_1_b", "ffaa_casco_marte_04_mod_2_b", "ffaa_casco_marte_04_mod_4_b"]];
_militaryLoadoutData set ["sniHats", ["ffaa_brilat_chambergo_b"]];
_militaryLoadoutData set ["slHat", ["ffaa_moe_boina"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e_normal", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k_normal", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["ffaa_armas_hkg36k", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36e", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
["ffaa_armas_hkag36k", "", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["ffaa_armas_p90", "", "", "", ["ffaa_507x28_p90"], [], ""],
["ffaa_armas_ump", "", "", "", ["ffaa_9x19_ump"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["ffaa_armas_mg4", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["ffaa_armas_minimi", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["ffaa_armas_cetme_c", "", "", "ffaa_optic_susat", ["ffaa_762x51_cedmec"], [], ""],
["ffaa_armas_cetme_e", "", "", "ffaa_optic_susat", ["ffaa_762x51_cedmec"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["ffaa_armas_aw", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["ffaa_762x51_accuracy"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["ffaa_armas_usp", "", "", "", [], [], ""],
["ffaa_armas_p226", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["ffaa_ar_uniforme_marinero_item"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["ffaa_ar_gorra_marinero"]];

_policeLoadoutData set ["shotGuns", [
["ffaa_armas_sdass", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""],
["ffaa_armas_sdassc", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["ffaa_armas_hkmp5a5", "", "", "", ["ffaa_9x19_mp5"], [], ""],
["ffaa_armas_hkmp5pdw", "", "", "", ["ffaa_9x19_mp5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    "ffaa_armas_fnp9"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["ffaa_brilat_CombatUniform_item_b", "ffaa_CombatUniform_shortsleeve_item_b"]];
_militiaLoadoutData set ["vests", ["ffaa_brilat_chaleco_01_bs"]];
_militiaLoadoutData set ["sniVests", ["ffaa_brilat_chaleco_05_bs"]];
_militiaLoadoutData set ["backpacks", ["ffaa_brilat_mochila_asalto_boscoso", "ffaa_brilat_mochila_boscoso", "ffaa_brilat_mochila_ligera_boscoso", "ffaa_brilat_mochila_viaje_boscoso"]];
_militiaLoadoutData set ["slBackpacks", ["ffaa_brilat_mochila_boscoso"]];
_militiaLoadoutData set ["atBackpacks", ["ffaa_brilat_mochila_asalto_boscoso"]];
_militiaLoadoutData set ["helmets", ["ffaa_moe_casco_01_1_b", "ffaa_moe_casco_01_2_b"]];
_militiaLoadoutData set ["sniHats", ["ffaa_brilat_chambergo_b"]];
_militiaLoadoutData set ["slHat", ["ffaa_emmoe_tropa_boina"]];

_militiaLoadoutData set ["rifles", [
["ffaa_armas_cetme_l", "", "", "", ["ffaa_556x45_cedmel"], [], ""],
["ffaa_armas_cetme_l", "", "", "", ["ffaa_556x45_cedmel"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["ffaa_armas_cetme_lc", "", "", "", ["ffaa_556x45_cedmel"], [], ""],
["ffaa_armas_cetme_lc", "", "", "", ["ffaa_556x45_cedmel"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["ffaa_armas_hkag36e_tir", "", "", "", ["ffaa_556x45_g36", "ffaa_556x45_g36_tracer_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""],
["ffaa_armas_hkag36k_tir", "", "", "", ["ffaa_556x45_g36", "ffaa_556x45_g36_tracer_green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["ffaa_armas_hkmp5a5", "", "", "", ["ffaa_9x19_mp5"], [], ""],
["ffaa_armas_sdass", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""],
["ffaa_armas_hkmp5a5", "", "", "", ["ffaa_9x19_mp5"], [], ""],
["ffaa_armas_sdassc", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["ffaa_armas_mg3", "", "", "", ["ffaa_762x51_mg3"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["ffaa_armas_cetme_c", "", "", "", ["ffaa_762x51_cedmec"], [], ""],
["ffaa_armas_cetme_e", "", "", "", ["ffaa_762x51_cedmec"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["ffaa_armas_aw", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["ffaa_762x51_accuracy"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];
_militiaLoadoutData set ["sidearms", [
    "ffaa_armas_fnp9"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["ffaa_CombatUniform_shortsleeve_item_b"]];			
_crewLoadoutData set ["vests", ["ffaa_brilat_chaleco_01_bs"]];				
_crewLoadoutData set ["helmets", ["ffaa_brilat_casco_tripulacion"]];	
_crewLoadoutData set ["carbines", [
   ["ffaa_armas_hkmp5a5", "", "", "", ["ffaa_9x19_mp5"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["ffaa_pilot_her_uniforme_item"]];
_pilotLoadoutData set ["vests", ["V_TacVest_oli"]];
_pilotLoadoutData set ["helmets", ["ffaa_casco_famet_hmsd"]];
_pilotLoadoutData set ["carbines", [
   ["ffaa_armas_hkmp5a5", "", "", "", ["ffaa_9x19_mp5"], [], ""]
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