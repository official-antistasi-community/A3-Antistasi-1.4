//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Liberation Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Sahrani Liberation Army Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\PRACS_SLA_Core\Flags\flag_north_co_mrk.paa"] call _fnc_saveToTemplate; // QPATHTOFOLDER(Templates\Templates\RACS\flag_sahrani_co.paa)				
["flagMarkerType", "PRACS_SLA_Flag_mrk"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

/* ANTISTASI PLUS STUFF START */
["vehiclesMilitiaAPCs", ["PRACS_SLA_BTR40_BG"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["PRACS_SLA_BTR60", "rhs_btr70_vmf"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["rhs_sprut_vdv", "PRACS_SLA_BMP1"]] call _fnc_saveToTemplate;

["staticHowitzers", ["PRACS_SLA_M46"]] call _fnc_saveToTemplate;
["howitzerMagazineHE", "PRACS_130mm_X32"] call _fnc_saveToTemplate;
["vehicleRadar", "PRACS_P37_Radar"] call _fnc_saveToTemplate;
["vehicleSam", "PRACS_SLA_S60"] call _fnc_saveToTemplate;
/* ANTISTASI PLUS STUFF END */

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_SLA_UAZ_open", "PRACS_SLA_UAZ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_SLA_UAZ_DSHKM", "PRACS_SLA_Tigr"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["PRACS_SLA_URAL"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_SLA_URAL"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_SLA_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_SLA_URAL_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_SLA_URAL_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_SLA_Ural_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["PRACS_SLA_T72B", "PRACS_SLA_T72BV"]] call _fnc_saveToTemplate;
["vehiclesAA", ["PRACS_SLA_BTR40_AAM", "PRACS_SLA_URAL_Zu23"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["PRACS_SLA_GoFast"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["PRACS_SLA_GoFast_gun"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["PRACS_SLA_BTR60"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["PRACS_SLA_MiG27", "PRACS_SLA_Su25"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["PRACS_SLA_MiG21", "PRACS_SLA_MiG23"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["PRACS_AN12B"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["PRACS_SLA_Mi8amt"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["PRACS_SLA_Mi24D"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["rhs_mi28n_vvs"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["RHS_Ka52_vvs"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["PRACS_SLA_2s1"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["PRACS_SLA_2s1", ["rhs_mag_bk13_5"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["PRACS_SLA_UAZ_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_SLA_Ural_flat_bed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_SLA_UAZ_open_guards"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["PRACS_SLA_UAZ_open_recon"]] call _fnc_saveToTemplate;

["staticMGs", ["PRACS_SLA_DShK"]] call _fnc_saveToTemplate;
["staticAT", ["PRACS_SLA_SPG9M_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["rhs_Igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["vehiclesAPCs", ["PRACS_SLA_BTR40", "PRACS_SLA_Type63"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["sfFaces", ["WhiteHead_22_sa"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
/* ANTISTASI PLUS STUFF START */
_loadoutData set ["traitorUniforms", ["PRACS_M10_Commando_uniform"]];
_loadoutData set ["traitorVests", ["PRACS_O_CIRAS_GAL_rifleman", "PRACS_O_CIRAS_G3_rifleman"]];
_loadoutData set ["traitorHats", ["PRACS_Patrol_ASDPM_B_Cap", "PRACS_Patrol_SDPM_Cap", "PRACS_Patrol_SMAR_Cap"]];

_loadoutData set ["officerUniforms", ["PRACS_M10_SNG_D_PL_uniform", "PRACS_M10_1ID_PL_uniform"]];
_loadoutData set ["officerVests", ["PRACS_holster_vest", "V_Rangemaster_belt", "rhs_6sh92_digi_radio"]];
_loadoutData set ["officerHats", ["PRACS_Patrol_6TDes_Cap", "PRACS_1st_Infantry_beret"]];
/* ANTISTASI PLUS STUFF END */

_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VL_mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["rhs_weap_smaw"]];
_loadoutData set ["missileATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VR_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["rhs_weap_igla", "", "", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
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
_loadoutData set ["binoculars", ["rhs_pdu4"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["PRACS_SLA_M88_Especas_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_SLA_6sh92", "PRACS_SLA_6sh92_VOG", "PRACS_SLA_6B23_6sh92_L_Radio", "PRACS_SLA_6B23_6sh92_L_Headset"]];
_sfLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54", "PRACS_SLA_bandolier"]];
_sfLoadoutData set ["helmets", ["PRACS_SLA_Especas_Beret"]];
_sfLoadoutData set ["sniHats", ["PRACS_SLA_Soft_Cap"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_sfLoadoutData set ["rifles", [
["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
["rhs_weap_ak105_zenitco01", "rhs_acc_pgs64", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], "rhs_acc_grip_rk6"],
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["carbines", [
["PRACS_rk62", "", "", "", ["PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_sfLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "rhsusf_acc_rm05", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""],
["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_pya", "", "", "", [], [], ""],
["rhs_weap_6p53", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["PRACS_SLA_M88_Paratrooper_uniform"]];
_eliteLoadoutData set ["vests", ["PRACS_SLA_6sh92_R_SF", "PRACS_SLA_6sh92", "PRACS_SLA_6B23_6sh92_L_Headset"]];
_eliteLoadoutData set ["backpacks", ["PRACS_Assault_pack"]];
_eliteLoadoutData set ["helmets", ["PRACS_SLA_Booniehat", "PRACS_SLA_Soft_Cap"]];
_eliteLoadoutData set ["sniHats", ["PRACS_SLA_6B27M_ess"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], "rhs_acc_grip_rk6"],
["rhs_weap_akm_zenitco01_b33", "rhs_acc_dtkakm", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite"], [], "rhs_acc_grip_rk6"]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_ak104", "", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "rhsusf_acc_rm05", [], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""],
["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["rhs_weap_pya", "", "", "", [], [], ""],
["rhs_weap_6p53", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["PRACS_SLA_M88_Guards_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_SLA_6B23_6sh92", "PRACS_SLA_6B23_6sh92_L_Radio"]];
_militaryLoadoutData set ["Hvests", ["PRACS_SLA_6b2_chicom"]];
_militaryLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_militaryLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54"]];
_militaryLoadoutData set ["helmets", ["PRACS_SLA_6B27M", "PRACS_SLA_6B27M_ess"]];
_militaryLoadoutData set ["binoculars", ["rhs_pdu4"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_akm_zenitco01_b33", "", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_aks74n_2_npz", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["PRACS_rk62", "", "", "", ["PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag", "PRACS_30Rnd_762x39_Rk_7N6_mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["PRACS_HK33", "", "", "rhsusf_acc_rm05", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["rhs_weap_makarov_pm", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["PRACS_SLA_Border_Guard_uniform"]];
_policeLoadoutData set ["vests", ["rhs_belt_AK", "rhs_belt_AK_back"]];
_policeLoadoutData set ["helmets", ["PRACS_SLA_Border_Guard_Cap"]];

_policeLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "", "", "", [], [], ""],
["rhs_weap_pp2000", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_type94_new"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["PRACS_SLA_M88_uniform"]];
_militiaLoadoutData set ["vests", ["rhs_suspender_AK", "rhs_suspender_AK4"]];
_militiaLoadoutData set ["backpacks", ["PRACS_SLA_bandolier"]];
_militiaLoadoutData set ["helmets", ["PRACS_SLA_ssh68", "PRACS_SLA_ssh68_cover"]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74", "", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_ak74n", "", "", "", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "", "", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_ak74m_desert_npz", "", "", "", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["PRACS_g3a3", "", "", "rhsusf_acc_m8541_low", ["PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["rhs_weap_makarov_pm", "", "", "", [], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

/* ANTISTASI PLUS STUFF START */
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["PRACS_SLA_Border_Guard_uniform"]];
_crewLoadoutData set ["vests", ["rhs_belt_sks"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PRACS_SLA_M88_O_uniform"]];
_pilotLoadoutData set ["vests", ["rhs_vest_pistol_holster", "rhs_6sh46"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
/* ANTISTASI PLUS STUFF END */

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
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

private _marksmanTemplate= {
    ["helmets"] call _fnc_setHelmet;
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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

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


    ["SMGs"] call _fnc_setPrimary;
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

/* ANTISTASI PLUS STUFF START */
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
/* ANTISTASI PLUS STUFF END */
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
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;