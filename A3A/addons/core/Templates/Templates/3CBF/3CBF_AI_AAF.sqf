private _hasLawsOfWar = "orange" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_AAF_B_M1030", "UK3CB_AAF_B_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_AAF_B_M1151", "UK3CB_AAF_B_M1025", "UK3CB_AAF_B_M998_2DR", "UK3CB_AAF_B_M998_4DR"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_AAF_B_M1025_MK19", "UK3CB_AAF_B_M1025_M2", "UK3CB_AAF_B_M1025_TOW", "UK3CB_AAF_B_M1151_GPK_M2", "UK3CB_AAF_B_M1151_GPK_M240", "UK3CB_AAF_B_M1151_GPK_MK19", "UK3CB_AAF_B_M1151_OGPK_M2", "UK3CB_AAF_B_M1151_OGPK_M240", "UK3CB_AAF_B_M1151_OGPK_MK19", "UK3CB_AAF_O_GAZ_Vodnik_Cannon", "UK3CB_AAF_O_GAZ_Vodnik_KVPT"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_AAF_B_MTVR_Closed", "UK3CB_AAF_B_MTVR_Open", "UK3CB_AAF_B_M977_Transport_Open", "UK3CB_AAF_B_M977_Transport_Covered"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_AAF_B_MTVR_Recovery", "UK3CB_AAF_B_M977A4_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_AAF_B_MTVR_Reammo", "UK3CB_AAF_B_M977A4_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_AAF_B_MTVR_Repair", "UK3CB_AAF_B_M977A4_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_AAF_B_MTVR_Refuel", "UK3CB_AAF_B_M977A4_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_AAF_B_M113_AMB", "UK3CB_AAF_O_GAZ_Vodnik"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_AAF_O_GAZ_Vodnik", "UK3CB_AAF_B_M1117", "UK3CB_AAF_B_M113_M2", "UK3CB_AAF_B_M113_M240", "UK3CB_AAF_B_M113_MK19", "UK3CB_AAF_B_LAV25_HQ"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["UK3CB_AAF_B_M113_M2", "UK3CB_AAF_B_M113_M240", "UK3CB_AAF_B_LAV25"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_AAF_O_BMP1", "UK3CB_AAF_B_LAV25", "UK3CB_AAF_B_AAV"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_AAF_O_T55", "UK3CB_AAF_I_M60A1"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_AAF_B_M60A3", "UK3CB_AAF_B_M1A1", "UK3CB_AAF_B_FV4201"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_AAF_O_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_AAF_B_Skiff", "UK3CB_AAF_B_Rubber_Rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_AAF_B_RHIB", "UK3CB_AAF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_AAF_O_Su25SM", "UK3CB_AAF_B_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_AAF_O_MIG29S", "UK3CB_AAF_B_Gripen"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_AAF_B_C130J", "UK3CB_AAF_B_C130J_G"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["UK3CB_AAF_O_Mi8AMT", "UK3CB_AAF_O_Mi8", "UK3CB_AAF_B_UH60M", "UK3CB_AAF_B_UH60M2", "UK3CB_AAF_O_Mi_24V"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["UK3CB_AAF_B_UH1H_M240", "UK3CB_AAF_B_Benches_MH9", "UK3CB_AAF_B_Bell412_Utility"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_AAF_I_Bell412_Armed_dynamicLoadout", "UK3CB_AAF_B_AH9", "UK3CB_AAF_B_UH1H_GUNSHIP", "UK3CB_AAF_O_Mi8AMTSh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_AAF_B_AH1Z_GS", "UK3CB_AAF_B_AH1Z", "UK3CB_AAF_I_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_AAF_B_M109", "UK3CB_AAF_I_Kamaz_MLRS", "UK3CB_AAF_I_2S1"]] call _fnc_saveToTemplate;

["magazines", createHashMapFromArray [
    ["UK3CB_AAF_B_M109",["rhs_mag_155mm_m795_28"]],
    ["UK3CB_AAF_I_Kamaz_MLRS",["12Rnd_230mm_rockets"]],
    ["UK3CB_AAF_I_2S1", ["rhs_mag_3of56_10"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_AAF_B_LR_M2", "UK3CB_AAF_B_Pickup_M2", "UK3CB_AAF_B_Offroad_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_AAF_B_M939_Guntruck", "UK3CB_AAF_B_M939", "UK3CB_AAF_B_M939_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_AAF_B_LR_Open", "UK3CB_AAF_B_LR_Closed", "UK3CB_AAF_B_Pickup", "UK3CB_AAF_B_Offroad"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["UK3CB_AAF_B_M113_M2", "UK3CB_AAF_B_M113_M240", "UK3CB_AAF_B_M113_MK19", "UK3CB_AAF_I_MTLB_PKT", "UK3CB_AAF_I_BTR70"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ADP_B_LandRover_Open", "UK3CB_ADP_B_LandRover_Closed", "UK3CB_ADP_B_Hilux_Open", "UK3CB_ADP_B_Hilux_Closed"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_AAF_B_M240_High", "UK3CB_AAF_B_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_AAF_B_TOW_TriPod"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_AAF_B_Stinger_AA_pod", "UK3CB_AAF_B_RBS70"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_AAF_B_M252"]] call _fnc_saveToTemplate;
["staticHowitzers", ["UK3CB_AAF_B_M119"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "RHS_mag_m1_he_12"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "3CBF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros"
]] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

["insignia", ["AAF_1stRegiment", "", ""]] call _fnc_saveToTemplate;
["milInsignia", ["AAF_3rdRegiment", "", ""]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];

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
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["traitorUniforms", ["U_BG_Guerrilla_6_1"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli", "V_TacVest_camo", "V_BandollierB_oli"]];
_loadoutData set ["traitorHats", ["H_Cap_grn","H_Cap_oli"]];

_loadoutData set ["officerUniforms", ["U_I_OfficerUniform"]];
_loadoutData set ["officerVests", ["UK3CB_AAF_B_V_TacVest_DIGI_GRN"]];
_loadoutData set ["officerHats", ["H_MilCap_dgtl", "UK3CB_AAF_B_H_Beret_Army_Off"]];

_loadoutData set ["uniforms", ["UK3CB_AAF_B_U_CombatUniform_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN", "UK3CB_AAF_B_U_JumperUniform_DIGI_GRN", "U_BG_Guerilla1_2_F"]];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["UK3CB_AAF_B_B_CARRYALL_DIGI_GRN"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_digi_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_MilCap_dgtl", "UK3CB_AAF_B_H_Beret_Army"]];
_loadoutData set ["sniHats", ["H_Booniehat_dgtl", "UK3CB_H_Woolhat_GRN"]];

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

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Squares_Tinted",
    "G_Squares",
    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
    "rhs_googles_black", 
    "rhs_googles_clear", 
    "rhs_googles_orange"
]];
_loadoutData set ["goggles", [
    "rhs_ess_black", 
    "rhs_googles_yellow",
    "rhsusf_shemagh_gogg_tan",
    "rhsusf_shemagh2_gogg_tan",
    "rhsusf_shemagh_gogg_od",
    "rhsusf_shemagh2_gogg_od",
    "rhsusf_oakley_goggles_clr",
    "rhsusf_oakley_goggles_blk",
    "rhsusf_oakley_goggles_ylw"
]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", [
    "UK3CB_AAF_B_U_CombatUniform_DIGI_BRN", 
    "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01", 
    "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01", 
    "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_02", 
    "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_02",
    "UK3CB_AAF_B_U_JumperUniform_Digi_Mix_02",
    "UK3CB_AAF_B_U_JumperUniform_Digi_Mix_01"
]];
_sfLoadoutData set ["vests", [
    "UK3CB_AAF_I_V_Falcon_1_DIGI_BRN", 
    "UK3CB_AAF_I_V_Falcon_2_DIGI_BRN", 
    "UK3CB_AAF_I_V_Falcon_3_DIGI_BRN", 
    "UK3CB_AAF_I_V_Falcon_4_DIGI_BRN", 
    "UK3CB_AAF_I_V_Falcon_5_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_6_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_7_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_8_DIGI_BRN",
    "UK3CB_AAF_I_V_Falcon_9_DIGI_BRN"
]];
_sfLoadoutData set ["atBackpacks", ["UK3CB_AAF_B_B_CARRYALL_DIGI_BRN"]];
_sfLoadoutData set ["backpacks", ["UK3CB_AAF_B_B_FIELDPACK_DIGI_BRN", "UK3CB_AAF_B_B_ASS_DIGI_BRN"]];
_sfLoadoutData set ["helmets", ["rhsusf_opscore_mar_ut", "rhsusf_opscore_mar_ut_pelt", "rhsusf_opscore_rg_cover", "rhsusf_opscore_rg_cover_pelt", "H_Booniehat_khk_hs", "H_Bandanna_sand", "H_Watchcap_khk"]];
_sfLoadoutData set ["slHat", ["H_MilCap_gry", "UK3CB_AAF_B_H_Beret_SF_Off"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_khk_hs"]];
_sfLoadoutData set ["NVGs", ["NVGoggles"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_M136_hp"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];

_sfLoadoutData set ["rifles", [
["rhs_weap_m16a4", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_ACOG_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_RX01_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d_mstock", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_ACOG_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d_mstock", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d_mstock", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_d_mstock", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_top", "rhsusf_acc_RX01_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_ACOG_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_eotech_552_d", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_RX01_NoFilter_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15side", "rhsusf_acc_RX01_tan", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203s", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_carryhandle_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_G3KA4", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15side_bk", "uk3cb_optic_PVS4_G3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_USP", "muzzle_snds_L", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""],
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["vests", ["UK3CB_AAF_B_V_RFL_Vest_DIGI_GRN"]];
_eliteLoadoutData set ["MGvests", ["UK3CB_AAF_B_V_MG_Vest_DIGI_GRN"]];
_eliteLoadoutData set ["MEDvests", ["UK3CB_AAF_B_V_MD_Vest_DIGI_GRN"]];
_eliteLoadoutData set ["SLvests", ["UK3CB_AAF_B_V_SL_Vest_DIGI_GRN"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_dgtl", "UK3CB_AAF_B_B_FIELDPACK_DIGI_GRN", "UK3CB_AAF_B_B_CARRYALL_DIGI_GRN", "B_Bergen_dgtl_F"]];
_eliteLoadoutData set ["helmets", ["UK3CB_AAF_I_H_MKVI_Helmet_A_GRN", "UK3CB_AAF_I_H_MKVI_Helmet_B_GRN"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_g36kv", "rhssaf_acc_G36_Rotex", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36kv", "rhssaf_acc_G36_Rotex", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36kv", "rhssaf_acc_G36_Rotex", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36kv", "rhssaf_acc_G36_Rotex", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36kv", "rhssaf_acc_G36_Rotex", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_m16a4_imod", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_MDO", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m16a4_imod", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_g36c", "rhssaf_acc_G36_Rotex", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36c", "rhssaf_acc_G36_Rotex", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG_MDO", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36c", "rhssaf_acc_G36_Rotex", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36c", "rhssaf_acc_G36_Rotex", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_g36c", "rhssaf_acc_G36_Rotex", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36", "rhssaf_30rnd_556x45_SPR_G36"], [], ""],
["rhs_weap_m4a1_mstock", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_MDO", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["rhs_weap_m4a1_mstock", "", "rhsusf_acc_anpeq15_bk_top", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG_MDO", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_m203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["rhs_weap_m16a4_imod_M203", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_Stanag"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01_NoFilter", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], ["rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_anpas13gv1", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["rhs_weap_m240B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_anpas13gv1", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq15side_bk", "uk3cb_optic_PVS4_G3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["UK3CB_USP", "", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""],
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", ["UK3CB_AAF_O_V_Eagle_RIF_DIGI_GRN"]];
_militaryLoadoutData set ["MGvests", ["UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN"]];
_militaryLoadoutData set ["MEDvests", ["UK3CB_AAF_O_V_Eagle_MED_DIGI_GRN"]];
_militaryLoadoutData set ["SLvests", ["UK3CB_AAF_O_V_Eagle_SL_DIGI_GRN"]];
_militaryLoadoutData set ["GLvests", ["UK3CB_AAF_O_V_Eagle_GL_DIGI_GRN"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_dgtl", "UK3CB_AAF_B_B_FIELDPACK_DIGI_GRN", "UK3CB_AAF_B_B_CARRYALL_DIGI_GRN"]];
_militaryLoadoutData set ["helmets", ["UK3CB_AAF_O_H_6b27m_DIGI_GRN", "UK3CB_AAF_O_H_6b27m_ESS_DIGI_GRN", "UK3CB_AAF_B_H_PASGT_DIGI_GRN", "UK3CB_AAF_B_H_PASGT_RHINO_DIGI_GRN"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_g36c", "", "rhsusf_acc_wmx_bk", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP510", "", "", "", ["UK3CB_MP5_30Rnd_10_Magazine", "UK3CB_MP5_30Rnd_10_Magazine", "UK3CB_MP5_30Rnd_10_Magazine_RT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A4", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_g33_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_low", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200rnd_556x45_mixed_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ACOG", ["rhsusf_200rnd_556x45_mixed_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_mixed_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ELCAN", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_RM", "UK3CB_MG3_100rnd_762x51_RT"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1", "", "", "uk3cb_optic_accupoint_g3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_G3SG1", "", "", "uk3cb_optic_ZFSG1", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_G3SG1", "", "", "uk3cb_optic_PVS4_G3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_ACOG", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["UK3CB_USP","rhsusf_weap_glock17g4"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
private _helmets = ["H_Cap_police"];
if (_hasLawsOfWar) then {
    _helmets pushBack "H_PASGT_basic_blue_F";
};
_policeLoadoutData set ["helmets", _helmets];
_policeLoadoutData set ["shotguns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["UK3CB_MP510", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_MP5_30Rnd_10_Magazine", "UK3CB_MP5_30Rnd_10_Magazine", "UK3CB_MP5_30Rnd_10_Magazine_RT"], [], ""],
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""],
["UK3CB_USP", "", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["rhsgref_uniform_altis_lizard", "rhsgref_uniform_altis_lizard_olive"]];
_militiaLoadoutData set ["vests", ["V_TacVest_camo", "V_BandollierB_rgr", "rhsgref_chestrig"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_LDF_B_B_ASS_WDL", "B_FieldPack_oli"]];
_militiaLoadoutData set ["atBackpacks", ["B_FieldPack_oli"]];
_militiaLoadoutData set ["helmets", ["rhsgref_helmet_M1_painted", "rhsgref_helmet_M1_painted_alt01", "H_Bandanna_khk", "UK3CB_H_Woolhat_KHK", "rhsgref_helmet_pasgt_altis_lizard"]];
_militiaLoadoutData set ["slHat", ["UK3CB_AAF_B_H_Beret_Army"]];
_militiaLoadoutData set ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];
_militiaLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7", "rhs_weap_rpg18"]];

_militiaLoadoutData set ["slRifles", [
["UK3CB_HK33KA1", "", "", "uk3cb_optic_STANAGZF_G3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_militiaLoadoutData set ["rifles", [
["UK3CB_HK33KA1", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];

_militiaLoadoutData set ["carbines", [
["UK3CB_HK33KA3", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GDM40"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_fnmag", "", "", "", ["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
["UK3CB_MG3", "", "", "", ["UK3CB_MG3_50rnd_762x51", "UK3CB_MG3_50rnd_762x51", "UK3CB_MG3_50rnd_762x51_RM", "UK3CB_MG3_50rnd_762x51_RT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1", "", "", "uk3cb_optic_STANAGZF2D_G3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_Tank_green_F"]];
_crewLoadoutData set ["vests", ["UK3CB_AAF_B_V_TacVest_DIGI_GRN"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_AAF_B_U_H_Pilot_NATO", "UK3CB_AAF_I_U_H_Pilot_DIGI_GRN", "U_I_HeliPilotCoveralls"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest", "UK3CB_AAF_B_V_TacVest_DIGI_GRN"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I", "H_CrewHelmetHeli_I"]];

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

    ["grenadeLaunchers"] call _fnc_setPrimary;

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
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
    ["items_miscEsseriflesntials"] call _fnc_addItemSet;
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


    [selectRandom ["SMGs", "shotguns"]] call _fnc_setPrimary;
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
