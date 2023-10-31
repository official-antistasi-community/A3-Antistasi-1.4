private _hasLawsOfWar = "orange" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "HIDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "HIDF"]] call _fnc_saveToTemplate;

["flag", "Flag_CHC"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F_Exp\Flags\flag_Tanoa_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Tanoa"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_T_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_GEN_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_B_M1030_HIDF"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_hidf_m1025", "rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_M998_2dr_halftop", "rhsgref_hidf_M998_2dr", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_m998_4dr"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_mk19"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_B_MTVR_Closed_HIDF", "UK3CB_B_MTVR_Open_HIDF"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_B_MTVR_Recovery_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_B_MTVR_Reammo_HIDF"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_B_MTVR_Repair_HIDF"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_B_MTVR_Refuel_HIDF"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhsusf_m113_usarmy_medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_mk19", "UK3CB_B_LAV25_HQ_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_mk19", "UK3CB_B_LAV25_HQ_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_B_AAV_HIDF", "UK3CB_B_LAV25_HIDF"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_B_M60A1_HIDF"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhsusf_m1a1hc_wd", "UK3CB_B_M60A3_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHSGREF_A29B_HIDF", "UK3CB_B_Mystere_HIDF_CAS1"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_B_Mystere_HIDF_AA1"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["rhs_uh1h_hidf_unarmed", "UK3CB_B_Bell412_Utility_HIDF"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["rhs_uh1h_hidf", "UK3CB_B_Bell412_Utility_HIDF"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_B_Bell412_Armed_AT_HIDF", "UK3CB_B_Bell412_Armed_HIDF", "UK3CB_B_Bell412_Armed_dynamicLoadout_HIDF", "rhs_uh1h_hidf_gunship", "rhs_uh1h_hidf_gunship", "rhs_uh1h_hidf_gunship"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_B_Bell412_Armed_AT_HIDF", "UK3CB_B_Bell412_Armed_HIDF", "UK3CB_B_Bell412_Armed_dynamicLoadout_HIDF", "rhs_uh1h_hidf_gunship", "rhs_uh1h_hidf_gunship", "rhs_uh1h_hidf_gunship"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CW_US_B_EARLY_M109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CW_US_B_EARLY_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_ADM_B_LR_SF_M2", "UK3CB_ADM_B_LR_SPG9", "UK3CB_ADM_B_LR_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_B_M939_Closed_HIDF", "UK3CB_B_M939_Guntruck_HIDF", "UK3CB_B_M939_Open_HIDF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_ADM_B_LR_Closed", "UK3CB_ADM_B_LR_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["rhsgref_hidf_m113a3_m2"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CPD_B_UAZ_Closed", "UK3CB_CPD_B_Gaz24", "UK3CB_CPD_B_Lada", "UK3CB_CPD_B_S1203"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;
["staticHowitzers", ["RHS_M119_WD"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "RHS_mag_m1_he_12"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

["animations", [
    ["rhsusf_m113_usarmy_medical", ["IFF_Panels_Hide", 1, "hatchGunner", 1]],
    ["RHS_M6_wd", ["IFF_Panels_Hide", 1]]
]] call _fnc_saveToTemplate;

["variants", [
    ["rhsusf_m113_usarmy_medical", ["Olive",1]],
    ["UK3CB_ADM_B_LR_Closed", ["Green",1]],
    ["UK3CB_ADM_B_LR_Open", ["Green",1]],
    ["UK3CB_ADM_B_LR_SF_M2", ["Green",1]],
    ["UK3CB_ADM_B_LR_M2", ["Green",1]],
    ["UK3CB_ADM_B_LR_SPG9", ["Green",1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_loadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HE"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_grenade_mkii_mag", "rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["UK3CB_ANPVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["traitorUniforms", ["rhsgref_uniform_olive"]];
_loadoutData set ["traitorVests", ["rhs_chicom_khk"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["rhs_uniform_bdu_erdl"]];
_loadoutData set ["officerVests", ["rhsgref_TacVest_ERDL"]];
_loadoutData set ["officerHats", ["rhsgref_hat_M1951", "H_Beret_blk"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["ATvests", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["rhsgref_hidf_alicepack", "B_FieldPack_oli", "B_TacticalPack_rgr", "B_Kitbag_rgr"]];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["aaBackpacks", []];
_loadoutData set ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["rhsgref_hat_M1951", "H_Beret_blk"]];
_loadoutData set ["sniHats", ["UK3CB_CW_US_B_EARLY_H_BoonieHat_ERDL_02"]];

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
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Clear",
    "G_Tactical_Black",
    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_grn",
    "rhsusf_shemagh2_grn"
]];
_loadoutData set ["goggles", ["rhs_ess_black"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["rhsgref_uniform_TLA_1", "rhsgref_uniform_TLA_2"]];
_sfLoadoutData set ["vests", ["UK3CB_TKA_B_V_GA_LITE_WDL", "UK3CB_TKA_B_V_GA_HEAVY_WDL"]];
_sfLoadoutData set ["backpacks", ["rhsusf_falconii_coy", "B_Kitbag_cbr", "B_Carryall_cbr"]];
_sfLoadoutData set ["medBackpacks", ["UK3CB_KRG_B_B_FieldPack_SF_MED"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_cbr"]];
_sfLoadoutData set ["helmets", ["rhsusf_ach_bare_des", "rhsusf_ach_bare_des_ess"]];

_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];

_sfLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15A", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15A", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15A", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15A", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_anpas13gv1", [], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_BHP", "muzzle_snds_L", "", "", ["UK3CB_BHP_9_13Rnd"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["rhsgref_uniform_TLA_1", "rhsgref_uniform_TLA_2"]];
_eliteLoadoutData set ["vests", ["UK3CB_TKA_B_V_GA_LITE_WDL", "UK3CB_TKA_B_V_GA_HEAVY_WDL"]];
_eliteLoadoutData set ["backpacks", ["rhsusf_falconii_coy", "B_Kitbag_cbr", "B_Carryall_cbr"]];
_eliteLoadoutData set ["medBackpacks", ["UK3CB_KRG_B_B_FieldPack_SF_MED"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_cbr"]];
_eliteLoadoutData set ["helmets", ["rhsusf_ach_bare_des", "rhsusf_ach_bare_des_ess"]];

_eliteLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15A", "", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15A", "", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_RX01_NoFilter", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_552", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhssaf_30rnd_556x45_SPR_G36", "rhssaf_30rnd_556x45_SOST_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15A", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15A", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_socom_rail", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_d", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_anpas13gv1", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_anpas13gv1", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_eliteLoadoutData set ["sidearms", ["UK3CB_BHP"]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhsgref_uniform_woodland", "rhsgref_uniform_woodland_olive"]];
_militaryLoadoutData set ["vests", ["UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest", "UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest"]];
_militaryLoadoutData set ["MGvests", ["UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest"]];
_militaryLoadoutData set ["MEDvests", ["UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest"]];
_militaryLoadoutData set ["helmets", ["rhsgref_helmet_pasgt_woodland", "rhsgref_helmet_pasgt_woodland_rhino"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_FNFAL_FULL", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_militaryLoadoutData set ["rifles", [
["UK3CB_FNFAL_FULL", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_FNFAL_PARA", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1T_SMG"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "", ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"], [], ""],
["rhs_weap_m249_pip", "", "", "", ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"], [], ""],
["rhs_weap_fnmag", "", "", "",["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer", "rhsusf_100Rnd_762x51_m61_ap"], [], ""],
["rhs_weap_fnmag", "", "", "rhsusf_acc_ELCAN",["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer", "rhsusf_100Rnd_762x51_m61_ap"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_anpvs2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_PVS4_M14", ["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["rhsusf_weap_m9"]];

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
_policeLoadoutData set ["SMGs", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""],
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1T_SMG"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl", "rhsgref_uniform_ERDL", "rhsgref_uniform_og107", "rhsgref_uniform_og107_erdl"]];
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_TacVest_ERDL"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_oli", "UK3CB_B_Alice_K"]];
_militiaLoadoutData set ["helmets", ["rhsgref_helmet_M1_erdl", "rhsgref_helmet_M1_painted", "rhsgref_helmet_M1_painted_alt01", "H_Bandanna_khk", "H_Cap_oli"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militiaLoadoutData set ["lightHELaunchers", []];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_militiaLoadoutData set ["rifles", [
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["designatedGrenadeLaunchers", [
["UK3CB_M79", "", "", "", ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_Bren", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine_RT"], [], ""],
["UK3CB_M16A1_LSW", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_RT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl"]];	
_crewLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_alt_helmet"]];
_crewLoadoutData set ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1T_SMG"], [], ""]
]];
_crewLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhs_uniform_bdu_erdl"]];			
_pilotLoadoutData set ["vests", ["rhsgref_TacVest_ERDL"]];			
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_green", "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_green", "rhsusf_hgu56p_visor_mask_green"]];	
_pilotLoadoutData set ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1T_SMG"], [], ""]
]];
_pilotLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
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
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["GLVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
