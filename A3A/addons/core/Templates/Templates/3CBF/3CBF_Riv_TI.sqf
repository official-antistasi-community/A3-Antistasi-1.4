////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "TF"] call _fnc_saveToTemplate;
["nameLeader", "Ahmad Hajar"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_East_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["UK3CB_TKM_O_Hilux_GMG", "UK3CB_TKM_O_Hilux_Dshkm", "UK3CB_TKM_O_Hilux_M2", "UK3CB_TKM_O_Hilux_Pkm", "UK3CB_TKM_O_Hilux_Spg9", "UK3CB_TKM_O_BRDM2", "UK3CB_TKM_O_BRDM2_ATGM", "UK3CB_TKM_O_Pickup_DSHKM", "UK3CB_TKM_O_Pickup_M2", "UK3CB_TKM_O_V3S_Zu23", "UK3CB_TKM_O_Ural_Zu23"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["UK3CB_TKM_O_V3S_Open", "UK3CB_TKM_O_V3S_Closed", "UK3CB_TKM_O_Ural_Open", "UK3CB_TKM_O_Ural_Covered"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["UK3CB_TKM_O_BRDM2_UM", "UK3CB_TKM_O_Hilux_Open", "UK3CB_TKM_O_Pickup"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["UK3CB_TKM_O_BMP1", "UK3CB_TKM_O_BTR40_MG", "UK3CB_TKM_O_BTR60", "UK3CB_TKM_O_MTLB_PKT", "UK3CB_TKM_O_MTLB_ZU23"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["UK3CB_TKM_O_T34", "UK3CB_TKM_O_T55"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["UK3CB_ADA_O_Mi8AMT"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["O_UAV_01_F"]] call _fnc_saveToTemplate;			

["staticLowWeapons", ["rhsgref_ins_DSHKM_Mini_TriPod", "rhsgref_ins_AGS30_TriPod"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_ins_2b14"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["rhs_ammo_rgd5", "rhs_ammo_f1"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];

_loadoutData set ["facewear", [
	"G_Shades_Black", 
	"G_Shades_Blue", 
	"G_Shades_Green", 
	"G_Shades_Red", 
	"G_Aviator",
	"G_Spectacles", 
	"G_Spectacles_Tinted",
	"G_Sport_BlackWhite", 
	"G_Sport_Blackyellow", 
	"G_Sport_Greenblack", 
	"G_Sport_Checkered", 
	"G_Sport_Red"
]];

_loadoutData set ["headgear", [
    "UK3CB_TKM_O_H_Turban_01_1",
    "UK3CB_TKM_O_H_Turban_02_1",
    "UK3CB_TKM_O_H_Turban_05_1",
    "UK3CB_TKM_O_H_Turban_04_1",
    "UK3CB_TKM_O_H_Turban_03_1"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];
_loadoutData set ["Rangefinder", ["rhs_pdu4"]];

_loadoutData set ["uniforms", [
	"UK3CB_TKM_O_U_01",
	"UK3CB_TKM_O_U_01_B",
	"UK3CB_TKM_O_U_01_C",
	"UK3CB_TKM_O_U_01_D",
	"UK3CB_TKM_O_U_03",
	"UK3CB_TKM_O_U_03_B",
	"UK3CB_TKM_O_U_03_C",
	"UK3CB_TKM_O_U_04",
	"UK3CB_TKM_O_U_04_B",
	"UK3CB_TKM_O_U_04_C",
	"UK3CB_TKM_O_U_05",
	"UK3CB_TKM_O_U_05_B",
	"UK3CB_TKM_O_U_05_C"
]];

_loadoutData set ["offuniforms", ["UK3CB_TKM_O_U_06", "UK3CB_TKM_O_U_06_B", "UK3CB_TKM_O_U_06_C"]];
_loadoutData set ["vests", ["UK3CB_V_Pouch"]];
_loadoutData set ["heavyVests", ["rhssaf_vest_md99_woodland_rifleman_radio", "rhssaf_vest_md99_woodland_rifleman", "rhssaf_vest_md98_rifleman"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_2", "B_Carryall_oli"]];
_loadoutData set ["backpacks", ["B_FieldPack_oli", "B_Carryall_oli", "UK3CB_B_TacticalPack_Oli", "UK3CB_LNM_B_B_CARRYALL_WDL_01"]];
_loadoutData set ["helmets", ["rhs_ssh60", "rhs_ssh68_2", "rhsgref_M56"]];
_loadoutData set ["heavyHelmets", ["rhssaf_helmet_m97_olive_nocamo", "rhssaf_helmet_m97_olive_nocamo_black_ess_bare", "rhssaf_helmet_m97_olive_nocamo_black_ess", "rhssaf_helmet_m97_woodland", "rhssaf_helmet_m97_woodland_black_ess", "rhssaf_helmet_m97_woodland_black_ess_bare"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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

_loadoutData set ["rifles", [
	["rhs_weap_pm63", "rhs_acc_dtkakm", "", "",  ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
	["rhs_weap_akm", "rhs_acc_dtkakm", "", "",  ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
	["rhs_weap_akms", "rhs_acc_dtkakm", "", "",  ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
	["rhs_weap_m70b1", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_m70ab2", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
	["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
	["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
	["rhs_weap_m70b3n", "", "", "rhs_acc_ekp8_02", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_m70b3n", "", "", "rhs_acc_ekp1", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_m70b3n", "", "", "rhs_acc_okp7_dovetail", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["rhs_weap_ak103_zenitco01_b33_grip1", "rhs_acc_dtk1", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], "rhs_acc_grip_ffg2"],
	["rhs_weap_ak103_zenitco01_b33_grip1", "rhs_acc_dtk3", "rhs_acc_perst3", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], ""],
	["rhs_weap_ak103_zenitco01_b33_grip1", "rhs_acc_dtk2", "rhs_acc_perst3_2dp_h", "rhs_acc_rakursPM", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], [], "rhs_acc_grip_rk6"],
	["rhs_weap_m21a", "", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
	["rhs_weap_m21a", "", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
	["rhs_weap_m21a", "", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
	["rhs_weap_savz58p_rail_black", "rhsgref_acc_zendl", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58p_rail_black", "rhsgref_acc_zendl", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58v_rail_black", "rhsgref_acc_zendl", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58v_rail_black", "rhsgref_acc_zendl", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58v_ris", "rhsgref_acc_zendl", "rhs_acc_perst1ik_ris", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
	["rhs_weap_savz58v_ris", "rhsgref_acc_zendl", "rhs_acc_perst1ik_ris", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
	["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
	["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];
_loadoutData set ["carbines", [
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
	["rhs_weap_ak105", "rhs_acc_dtk", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer", "rhs_30Rnd_762x39mm_polymer_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_m70b3n_pbg40", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_m70b3n_pbg40", "", "", "rhs_acc_ekp8_02", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_m70b3n_pbg40", "", "", "rhs_acc_ekp1", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""],
	["rhs_weap_m70b3n_pbg40", "", "", "rhs_acc_okp7_dovetail", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""]
]];
_loadoutData set ["machineGuns", [
	["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
	["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
	["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_pkas", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_nita", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103", "rhs_acc_dtk", "", "rhs_acc_1pn34", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_akmn", "", "", "", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_akmn", "", "", "rhs_acc_pkas", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_akmn", "", "", "rhs_acc_nita", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_akmn", "", "", "rhs_acc_1pn34", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer", "rhs_75Rnd_762x39mm_89"], [], ""],
	["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
	["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
	["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
	["rhs_weap_m84", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
	["rhs_weap_m84", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
	["rhs_weap_m84", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
	["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""],
	["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""],
	["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""],
	["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "UK3CB_SVD_10rnd_762x54_RT"], [], ""],
	["rhs_weap_m76", "", "", "rhs_acc_pso1m2",["rhsgref_10Rnd_792x57_m76", "rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
	["rhs_weap_m76", "", "", "rhs_acc_pso1m2",["rhsgref_10Rnd_792x57_m76", "rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
	["rhs_weap_m76", "", "", "rhs_acc_1p29",["rhsgref_10Rnd_792x57_m76", "rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
	["rhs_weap_m76", "", "", "rhs_acc_1pn34",["rhsgref_10Rnd_792x57_m76", "rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""],
	["rhs_weap_ak103_1", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer", "rhs_10Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103_1", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer", "rhs_10Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103_1", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer", "rhs_10Rnd_762x39mm_89"], [], ""],
	["rhs_weap_ak103_1", "rhs_acc_dtk", "", "rhs_acc_1pn34", ["rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm", "rhs_10Rnd_762x39mm_tracer", "rhs_10Rnd_762x39mm_89"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["rhs_weap_m80", "rhs_weap_rpg75", "rhs_weap_rpg26", "rhs_weap_rpg18"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7V_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_6p53", "rhs_weap_tt33", "rhs_weap_cz99"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["rhsgref_TacVest_ERDL", "rhsgref_chicom", "rhs_vydra_3m"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess", "rhs_tsh4"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["rhsgref_TacVest_ERDL", "rhsgref_chicom", "rhs_vydra_3m"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	if (random 100 > 60) then {
		["heavyHelmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
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

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["ATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 4] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
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
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;