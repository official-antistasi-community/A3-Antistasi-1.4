//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CDF"]] call _fnc_saveToTemplate;

["flag", "Flag_CHC"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_CHC\Flag\CHC_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CHC"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_B_LandRover_Closed_CDF", "UK3CB_B_LandRover_Open_CDF", "rhsgref_BRDM2UM_b"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_B_LandRover_AGS30_CDF", "UK3CB_B_LandRover_M2_CDF", "UK3CB_B_LandRover_SPG9_CDF", "rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2_HQ_b", "rhsgref_cdf_b_gaz66_zu23", "rhsgref_cdf_b_ural_Zu23", "rhsgref_cdf_b_reg_uaz_ags"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_B_Kamaz_Open_CDF", "UK3CB_B_Kamaz_Covered_CDF", "rhsgref_cdf_b_gaz66", "rhsgref_cdf_b_gaz66o", "rhsgref_cdf_b_ural_open", "rhsgref_cdf_b_ural"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["rhsgref_cdf_b_gaz66_flat", "rhsgref_cdf_b_gaz66o_flat"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_B_Ural_Ammo_CDF", "rhsgref_cdf_b_gaz66_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_B_Kamaz_Repair_CDF", "UK3CB_B_Ural_Repair_CDF", "rhsgref_cdf_b_gaz66_repair", "rhsgref_cdf_b_ural_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["rhsgref_cdf_b_ural_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["rhsgref_cdf_b_gaz66_ap2"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["rhsgref_cdf_b_btr60", "rhsgref_cdf_b_btr70", "rhsgref_cdf_b_btr80"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1k", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1pk", "rhsgref_cdf_b_bmd2","rhsgref_cdf_b_bmd2k"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhsgref_cdf_b_bmp2e", "rhsgref_cdf_b_bmp2", "rhsgref_cdf_b_bmp2d", "rhsgref_cdf_b_bmp2k", "rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1pk", "rhsgref_cdf_b_bmd2", "rhsgref_cdf_b_bmd2k"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["rhsgref_cdf_b_bmd1k", "UK3CB_B_T55_CDF"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhsgref_cdf_b_2s1_at","rhsgref_cdf_b_t72ba_tv", "rhsgref_cdf_b_t72bb_tv", "rhsgref_cdf_b_t80b_tv", "rhsgref_cdf_b_t80bv_tv", "rhsgref_cdf_b_t80u_tv", "rhsgref_cdf_b_t80uk_tv"]] call _fnc_saveToTemplate;
["vehiclesAA", ["rhsgref_cdf_b_zsu234"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["rhs_l39_cdf_b_cdf", "rhs_l159_cdf_b_CDF", "rhsgref_cdf_b_su25"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhs_l159_cdf_b_CDF_CAP", "rhsgref_cdf_b_mig29s"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_b_Mi24D_Early"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["rhsgref_cdf_b_reg_Mi8amt"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["rhsgref_cdf_b_reg_Mi17Sh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["rhsgref_cdf_b_Mi24D", "rhsgref_cdf_b_Mi24D_Early", "rhsgref_b_mi24g_CAS", "rhsgref_cdf_b_Mi35"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsgref_cdf_b_2s1", "rhsgref_cdf_b_reg_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhsgref_cdf_b_2s1",["rhs_mag_3of56_10"]],
["rhsgref_cdf_b_reg_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm", "rhsgref_cdf_b_reg_uaz_spg9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["rhsgref_cdf_b_gaz66", "rhsgref_cdf_b_gaz66_flat", "rhsgref_cdf_b_gaz66o", "rhsgref_cdf_b_gaz66o_flat"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_cdf_b_reg_uaz", "rhsgref_cdf_b_reg_uaz_open", "UK3CB_B_BTR40_CDF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["rhsgref_cdf_b_btr60", "rhsgref_cdf_b_btr70", "UK3CB_B_BTR40_MG_CDF"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CPD_B_UAZ_Closed", "UK3CB_CPD_B_Gaz24", "UK3CB_CPD_B_Lada", "UK3CB_CPD_B_S1203"]] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_cdf_b_DSHKM", "UK3CB_NFA_B_PKM_High", "RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_cdf_b_SPG9", "rhsgref_cdf_b_SPG9M"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_cdf_b_ZU23", "rhsgref_cdf_b_Igla_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_ins_2b14"]] call _fnc_saveToTemplate;
["staticHowitzers", ["rhsgref_cdf_b_reg_d30"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["rhs_male01cz","rhs_male02cz","rhs_male03cz","rhs_male04cz","rhs_male05cz"]] call _fnc_saveToTemplate;
["faces", [
    "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
    "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
    "LivonianHead_9", "LivonianHead_10",
    "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
    "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
    "WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
    "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"
]] call _fnc_saveToTemplate;

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
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo", "rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white", "rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd", "rhs_mag_an_m8hc", "rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["traitorUniforms", ["rhsgref_uniform_olive"]];
_loadoutData set ["traitorVests", ["rhs_chicom_khk"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["rhsgref_uniform_ttsko_mountain", "rhsgref_uniform_ttsko_forest"]];
_loadoutData set ["officerVests", ["rhs_gear_OFF", "rhs_vest_commander"]];
_loadoutData set ["officerHats", ["rhsgref_fieldcap_ttsko_mountain", "rhsgref_fieldcap_ttsko_forest"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["ATvests", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["aaBackpacks", ["rhs_tortila_olive"]];
_loadoutData set ["longRangeRadios", ["rhs_r148"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["rhsgref_fieldcap_ttsko_mountain"]];
_loadoutData set ["sniHats", ["H_Booniehat_mgrn", "rhs_beanie_green"]];

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
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack"
]];
_loadoutData set ["goggles", ["rhs_ess_black"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["rhssaf_uniform_m10_digital"]];
_sfLoadoutData set ["vests", ["rhsgref_6b23_ttsko_digi_rifleman", "rhsgref_6b23_ttsko_digi"]];
_sfLoadoutData set ["SNIvests", ["rhsgref_6b23_ttsko_digi_sniper"]];
_sfLoadoutData set ["MEDvests", ["rhsgref_6b23_ttsko_digi_medic"]];
_sfLoadoutData set ["SLvests", ["rhsgref_6b23_ttsko_digi_nco", "rhsgref_6b23_ttsko_digi_officer"]];
_sfLoadoutData set ["backpacks", ["rhssaf_kitbag_digital", "B_AssaultPack_sgg"]];
_sfLoadoutData set ["medBackpacks", ["B_AssaultPack_sgg"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_sfLoadoutData set ["helmets", ["rhsgref_fieldcap_ttsko_urban", "H_Bandanna_sgg", "rhs_beanie_green", "rhssaf_helmet_m97_digital", "rhssaf_helmet_m97_digital_black_ess_bare", "rhssaf_helmet_m97_digital_black_ess"]];
_sfLoadoutData set ["sniHats", ["rhssaf_booniehat_digital", "rhs_beanie_green"]];

_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [],""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_OG7V_mag"], [],""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VS_mag"], [],""]
]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsk2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsk2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsk2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_g33_T1", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_anpas13gv1", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svds", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_1pn34",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_mosin_sbr", "rhsgref_sdn6_suppressor", "", "rhsusf_acc_M8541_wd", ["rhsgref_5Rnd_762x54_m38"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", ["rhs_mag_9x18_8_57N181S"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["rhsgref_uniform_ttsko_mountain"]];
_eliteLoadoutData set ["vests", ["rhs_6b5_rifleman_spetsodezhda", "rhs_6b5_spetsodezhda"]];
_eliteLoadoutData set ["SLvests", ["rhs_6b5_officer_spetsodezhda"]];
_eliteLoadoutData set ["MEDvests", ["rhs_6b5_medic_spetsodezhda"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_oli"]];
_eliteLoadoutData set ["medBackpacks", ["B_Carryall_oli"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_eliteLoadoutData set ["helmets", ["rhsgref_6b27m_ttsko_mountain", "rhs_beret_vdv1", "rhs_stsh81_butan"]];
_eliteLoadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_eliteLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_eliteLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VS_mag"], [],""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_type69_airburst_mag"], [],""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VS_mag"], [],""]
]];

_eliteLoadoutData set ["slRifles", [
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36kv", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsd2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_g36c", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], [], ""],
["rhs_weap_vhsk2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsk2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""],
["rhs_weap_vhsk2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg_ct15x", "", "rhsusf_acc_anpeq15side_bk", "", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_vhsd2_bg", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_RX01", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_g36kv_ag36", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_EPR_G36", "rhssaf_30rnd_556x45_Tracers_G36"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "rhsusf_acc_RX01", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_compm4", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_g33_T1", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_anpas13gv1", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_1pn34",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier_anpvs27", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_eliteLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4"]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhsgref_uniform_ttsko_mountain"]];
_militaryLoadoutData set ["vests", ["rhsgref_6b23_ttsko_mountain_rifleman", "rhs_6b5_ttsko", "rhs_6b5_khaki", "rhs_6b5_rifleman_khaki", "rhs_6b5_rifleman_ttsko"]];
_militaryLoadoutData set ["MEDvests", ["rhsgref_6b23_ttsko_mountain_medic", "rhs_6b5_medic_ttsko", "rhs_6b5_medic_khaki"]];
_militaryLoadoutData set ["SLvests", ["rhsgref_6b23_ttsko_mountain_officer", "rhs_6b5_officer_ttsko", "rhs_6b5_officer_khaki"]];
_militaryLoadoutData set ["SNIvests", ["rhsgref_6b23_ttsko_mountain_sniper", "rhs_6b5_sniper_khaki", "rhs_6b5_sniper_ttsko"]];
_militaryLoadoutData set ["medBackpacks", ["rhs_rd54_vest"]];
_militaryLoadoutData set ["backpacks", ["rhs_rd54_vest", "rhs_sidor"]];
_militaryLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militaryLoadoutData set ["helmets", ["rhsgref_6b27m_ttsko_mountain", "rhsgref_6b27m_ttsko_mountain", "rhs_6b26_green", "rhsgref_ssh68_ttsko_mountain"]];
_militaryLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_OG7V_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],

["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],

["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],

["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],

["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_aks74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74u", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74u", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_savz61", "", "", "", ["rhsgref_20rnd_765x17_vz61"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74n_2_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_plum_AK",  "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer", "rhs_30Rnd_762x39mm_bakelite_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_RPK_74N_PLUM", "", "", "",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74N_PLUM", "", "", "rhs_acc_ekp1",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74N_PLUM", "", "", "rhs_acc_pkas",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74N_PLUM", "", "", "rhs_acc_1p63",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74N_PLUM", "", "", "rhs_acc_1pn34",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74N_PLUM", "", "", "rhs_acc_1p29",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_ekp1",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_pkas",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p63",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "rhs_acc_1pn34",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "rhs_acc_2dpZenit", "rhs_acc_1p29",["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["rhsusf_weap_glock17g4", "rhs_weap_6p53"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["UK3CB_CPD_B_U_CombatUniform_01_Urban"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk"]];
_policeLoadoutData set ["helmets", ["H_Bandanna_blu", "H_MilCap_blue", "UK3CB_H_Woolhat_BLU", "UK3CB_H_Beret_Officer_Blu_Star"]];
_policeLoadoutData set ["SMGs", [
["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_savz61", "", "", "", ["rhsgref_20rnd_765x17_vz61"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["rhsgref_uniform_ttsko_forest"]];
_militiaLoadoutData set ["vests", ["rhs_6b3", "rhs_6b3_AK", "rhs_6b3_AK_2", "rhs_6b3_AK_3", "rhs_6b3_RPK", "rhs_lifchik_light", "rhs_lifchik"]];
_militiaLoadoutData set ["ATvests", ["rhs_6b3", "rhs_6b3_AK", "rhs_6b3_AK_2", "rhs_6b3_AK_3"]];
_militiaLoadoutData set ["GLvests", ["rhs_6b3_VOG", "rhs_6b3_VOG_2", "rhs_lifchik_vog"]];
_militiaLoadoutData set ["SLvests", ["rhs_6b3_holster", "rhs_6b3_off", "rhs_lifchik_NCO"]];
_militiaLoadoutData set ["MGvests", ["rhs_6b3_RPK", "rhs_belt_RPK"]];
_militiaLoadoutData set ["backpacks", ["rhs_sidor"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_6b3"]];
_militiaLoadoutData set ["helmets", ["rhs_ssh60", "rhs_ssh68_2", "rhsgref_ssh68_ttsko_forest", "rhs_beanie_green", "rhs_fieldcap_m88_ttsko_alt_back", "rhs_fieldcap_m88_ttsko_alt", "rhs_ushanka"]];
_militiaLoadoutData set ["slHat", ["rhsgref_fieldcap_ttsko_forest"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18", "rhs_weap_rpg75"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_pm63", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58p_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_pm63", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58p_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58p_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_savz61", "", "", "", ["rhsgref_20rnd_765x17_vz61"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_RT"], [], ""],
["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_RT"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_savz58v", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58v_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58v", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58v_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58v", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""],
["rhs_weap_savz58v_black", "", "", "", ["rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58", "rhs_30Rnd_762x39mm_Savz58_tracer"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
["UK3CB_RPK_74", "", "", "", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["UK3CB_RPK_74_PLUM", "", "", "", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m38", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_savz61_folded"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["rhsgref_uniform_ttsko_mountain"]];	
_crewLoadoutData set ["vests", ["rhs_6b2_holster", "rhs_6b2"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess", "rhs_tsh4"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhsgref_uniform_ttsko_mountain"]];			
_pilotLoadoutData set ["vests", ["rhs_vest_commander"]];			
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];	

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
    ["medBackpacks"] call _fnc_setBackpack;

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
