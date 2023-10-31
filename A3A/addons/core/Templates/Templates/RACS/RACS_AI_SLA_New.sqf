//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Liberation Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Sahrani Liberation Army Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\PRACS_SLA_Core\Flags\flag_north_co_mrk.paa"] call _fnc_saveToTemplate;		
["flagMarkerType", "PRACS_SLA_Flag_mrk"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_SLA_UAZ_open", "PRACS_SLA_UAZ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_SLA_UAZ_DSHKM", "PRACS_SLA_Tigr"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["PRACS_SLA_URAL"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_SLA_URAL"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_SLA_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_SLA_URAL_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_SLA_URAL_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_SLA_Ural_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["PRACS_SLA_MTLB", "PRACS_SLA_BRDM_HQ_PKT"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["PRACS_SLA_BMD1", "PRACS_SLA_BRDM", "PRACS_SLA_BTR60"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["PRACS_SLA_MTLB", "PRACS_SLA_BRDM"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["PRACS_SLA_BTR60", "PRACS_SLA_Type63"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["PRACS_SLA_BMP2", "PRACS_SLA_BMP1"]] call _fnc_saveToTemplate;
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

["vehiclesMilitiaLightArmed", ["PRACS_SLA_UAZ_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_SLA_Ural_flat_bed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_SLA_UAZ_open_guards"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["PRACS_SLA_BRDM_HQ_PKT"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["PRACS_SLA_UAZ_open_recon"]] call _fnc_saveToTemplate;

["staticMGs", ["PRACS_SLA_DShK"]] call _fnc_saveToTemplate;
["staticAT", ["PRACS_SLA_SPG9M_tripod"]] call _fnc_saveToTemplate;
["staticAA", ["rhs_Igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", ["PRACS_SLA_M46"]] call _fnc_saveToTemplate;

["vehicleRadar", "PRACS_P37_Radar"] call _fnc_saveToTemplate;
["vehicleSam", "PRACS_SLA_S60"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "PRACS_130mm_X32"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01RUS","Male02RUS","Male03RUS","Male04ENG","Male05ENG","Male06ENG"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_04","WhiteHead_05","WhiteHead_06"]] call _fnc_saveToTemplate;
["sfFaces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_22_sa"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

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
    ["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VR_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["rhs_weap_igla", "", "", "", ["Titan_AA"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

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
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["rhs_pdu4"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["traitorUniforms", ["PRACS_M10_Commando_uniform"]];
_loadoutData set ["traitorVests", ["PRACS_O_CIRAS_GAL_rifleman", "PRACS_O_CIRAS_G3_rifleman"]];
_loadoutData set ["traitorHats", ["PRACS_Patrol_ASDPM_B_Cap", "PRACS_Patrol_SDPM_Cap", "PRACS_Patrol_SMAR_Cap"]];

_loadoutData set ["officerUniforms", ["PRACS_M10_SNG_D_PL_uniform", "PRACS_M10_1ID_PL_uniform"]];
_loadoutData set ["officerVests", ["PRACS_holster_vest", "V_Rangemaster_belt", "rhs_6sh92_digi_radio"]];
_loadoutData set ["officerHats", ["PRACS_Patrol_6TDes_Cap", "PRACS_1st_Infantry_beret"]];

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
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_wdl_F"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["PRACS_SLA_M88_Especas_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_SLA_6sh92", "PRACS_SLA_6sh92_R"]];
_sfLoadoutData set ["mgVests", ["PRACS_SLA_6B23_6sh92"]];
_sfLoadoutData set ["medVests", ["PRACS_SLA_6B23_6sh92_L_Radio"]];
_sfLoadoutData set ["glVests", ["PRACS_SLA_6sh92_VOG", "PRACS_SLA_6sh92_VOG_SF"]];
_sfLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54"]];
_sfLoadoutData set ["slBackpacks", ["PRACS_SLA_RD54"]];
_sfLoadoutData set ["atBackpacks", ["PRACS_SLA_cammo_RD54"]];
_sfLoadoutData set ["helmets", ["PRACS_SLA_Especas_Beret"]];
_sfLoadoutData set ["slHat", ["PRACS_SLA_6B27M_ess"]];
_sfLoadoutData set ["sniHats", ["PRACS_SLA_Soft_Cap"]];
_sfLoadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_sfLoadoutData set ["binoculars", ["rhs_pdu4"]];

_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_sfLoadoutData set ["slRifles", [
    ["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_ak105_zenitco01", "rhs_acc_pgs64", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], "rhs_acc_grip_rk6"],
    ["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["rifles", [  
    ["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["PRACS_rk62", "", "", "", ["PRACS_30Rnd_762x39_Rk_7N6_mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["rhs_weap_ak74m_desert", "", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_desert_AK"], [], ""]
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
_eliteLoadoutData set ["slUniform", ["PRACS_SLA_M88_SL_uniform"]];
_eliteLoadoutData set ["vests", ["PRACS_SLA_6B23_6sh92_L_Radio"]];
_eliteLoadoutData set ["mgVests", ["PRACS_O_CIRAS_MG_SF"]];
_eliteLoadoutData set ["medVests", ["PRACS_SLA_6sh92_R_SF"]];
_eliteLoadoutData set ["slVests", ["PRACS_SLA_6B23_M"]];
_eliteLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_eliteLoadoutData set ["engVests", ["PRACS_SLA_6sh92"]];
_eliteLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["slBackpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["atBackpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["helmets", ["PRACS_SLA_6B27M"]];
_eliteLoadoutData set ["sniHats", ["PRACS_SLA_ssh68_cover"]];
_eliteLoadoutData set ["binoculars", ["rhs_pdu4"]];

_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_eliteLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_eliteLoadoutData set ["slRifles", [
["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], "rhs_acc_grip_rk6"]
]];
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

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["PRACS_SLA_M88_Guards_uniform"]];
_militaryLoadoutData set ["slUniform", ["PRACS_SLA_M88_Guards_SL_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_SLA_6b2_chicom"]];
_militaryLoadoutData set ["mgVests", ["PRACS_SLA_6B23_6sh92"]];
_militaryLoadoutData set ["medVests", ["PRACS_SLA_6B23_6sh92_L_Headset"]];
_militaryLoadoutData set ["slVests", ["PRACS_SLA_6B23_O"]];
_militaryLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_militaryLoadoutData set ["engVests", ["PRACS_SLA_6sh92_R"]];
_militaryLoadoutData set ["backpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["slBackpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["atBackpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["helmets", ["PRACS_SLA_Guards_Beret"]];
_militaryLoadoutData set ["sniHats", ["PRACS_SLA_6B27M_ess"]];
_militaryLoadoutData set ["binoculars", ["rhs_pdu4"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_akm_zenitco01_b33", "", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite"], [], ""],
    ["rhs_weap_g36c", "", "", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_aks74n_2_npz", "", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""],
    ["rhs_weap_m16a4_carryhandle", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
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
    ["rhs_weap_vss", "", "", "rhs_acc_pso1m2", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5"], [], ""]
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
_policeLoadoutData set ["sidearms", [
    ["rhs_weap_type94_new", "", "", "", ["rhs_mag_6x8mm_mhp"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["PRACS_SLA_M88_uniform"]];
_militiaLoadoutData set ["vests", ["rhs_suspender_AK"]];
_militiaLoadoutData set ["sniVests", ["rhs_suspender_SKS"]];
_militiaLoadoutData set ["backpacks", ["rhs_rd54"]];
_militiaLoadoutData set ["slBackpacks", ["PRACS_SLA_cammo_RD54"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_militiaLoadoutData set ["helmets", ["PRACS_SLA_ssh68"]];
_militiaLoadoutData set ["sniHats", ["PRACS_SLA_ssh68_cover"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militiaLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

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
    ["PRACS_UZI", "", "", "rhsusf_acc_eotech_xps3", [], [], ""],
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

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["PRACS_SLA_Border_Guard_uniform"]];
_crewLoadoutData set ["vests", ["rhs_belt_sks"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
    ["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""],
    ["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PRACS_SLA_M88_O_uniform"]];
_pilotLoadoutData set ["vests", ["rhs_vest_pistol_holster", "rhs_6sh46"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData set ["carbines", [
    ["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
    ["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""]
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
