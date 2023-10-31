//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ARVN"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "ARVN"]] call _fnc_saveToTemplate;

["flag", "vn_flag_arvn"] call _fnc_saveToTemplate;
["flagTexture", "\vn\objects_f_vietnam\flags\data\vn_flag_01_arvn_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_arvn"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "vn_o_ammobox_04"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["vn_i_wheeled_m151_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_i_wheeled_m151_01", "vn_i_wheeled_m151_02"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["vn_i_wheeled_m151_mg_01", "vn_i_wheeled_m151_mg_02_marines", "vn_i_wheeled_m151_mg_01", "vn_i_wheeled_m151_mg_02_marines", "vn_i_wheeled_m151_mg_06", "vn_i_wheeled_m151_mg_05_marines", "vn_i_armor_m132_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["vn_i_wheeled_m54_01", "vn_i_wheeled_m54_02"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["vn_i_wheeled_m54_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["vn_i_wheeled_m54_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["vn_i_wheeled_m54_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["vn_i_armor_m577_01"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["vn_i_armor_m113_01"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["vn_i_armor_m113_01"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["vn_i_armor_m113_01", "vn_i_armor_m113_acav_05", "vn_i_armor_m113_acav_03", "vn_i_armor_m113_acav_06", "vn_i_armor_m113_acav_01", "vn_i_armor_m113_acav_02", "vn_i_armor_m113_acav_04"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["vn_i_armor_m41_01", "vn_i_armor_type63_01"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["vn_i_armor_m48_01_01", "vn_i_armor_m67_01_01"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_b_wheeled_m54_mg_02"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["vn_o_boat_02_01", "vn_b_boat_10_01", "vn_b_boat_09_01"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["vn_b_boat_13_02", "vn_b_boat_06_02", "vn_b_boat_05_02", "vn_b_boat_12_02"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["vn_b_air_f4c_at", "vn_b_air_f100d_at"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["vn_b_air_f4c_cap", "vn_b_air_f100d_cap"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["vn_i_air_ch34_02_01"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["vn_i_air_uh1d_02_01", "vn_i_air_uh1c_07_01", "vn_i_air_ch34_01_02", "vn_i_air_ch34_02_02"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["vn_i_air_uh1c_02_01", "vn_i_air_uh1c_01_01"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["vn_b_air_ah1g_02", "vn_b_air_ah1g_03", "vn_b_air_ah1g_04", "vn_b_air_ah1g_07", "vn_b_air_ah1g_08", "vn_b_air_ah1g_09"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["vn_i_static_m101_02"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["vn_i_static_m101_02", ["vn_cannon_m101_mag_he_x8", "vn_cannon_m101_mag_ab_x8", "vn_cannon_m101_mag_wp_x8"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["vn_b_air_oh6a_01"]] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["vn_i_wheeled_m151_mg_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["vn_i_wheeled_m54_01", "vn_i_wheeled_m54_02"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["vn_i_wheeled_m151_01", "vn_i_wheeled_m151_02"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["vn_i_armor_m113_01"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["vn_i_wheeled_m151_01_mp", "vn_i_wheeled_m151_02_mp"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_i_marines_static_m1919a4_high", "vn_i_marines_static_m2_high"]] call _fnc_saveToTemplate;
["staticAT", ["vn_i_marines_static_m40a1rr"]] call _fnc_saveToTemplate;
["staticAA", ["vn_i_static_m45"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_i_static_mortar_m2"]] call _fnc_saveToTemplate;
["staticHowitzers", ["vn_i_static_m101_02"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "vn_cannon_m101_mag_he_x8"] call _fnc_saveToTemplate;

["mortarMagazineHE", "vn_mortar_m2_mag_he_x8"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "vn_mortar_m2_mag_wp_x8"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "vn_mortar_m2_mag_lume_x8"] call _fnc_saveToTemplate;


["minefieldAT", ["vn_mine_m15"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["vn_mine_m14"]] call _fnc_saveToTemplate;

#include "VN_Vehicle_Attributes.sqf"

["flares", ["vn_40mm_m583_flare_w_ammo", "vn_40mm_m661_flare_g_ammo", "vn_40mm_m662_flare_r_ammo", "vn_40mm_m695_flare_y_ammo"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["vie"]] call _fnc_saveToTemplate;

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

_loadoutData set ["lightATLaunchers", ["vn_m72"]];
_loadoutData set ["ATLaunchers", [
	["vn_m20a1b1_01", "", "", "", ["vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag"], [], ""],
	["vn_m20a1b1_01", "", "", "", ["vn_m20a1b1_heat_mag", "vn_m20a1b1_heat_mag", "vn_m20a1b1_wp_mag"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["vn_mine_m15_mag"]];
_loadoutData set ["APMines", ["vn_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiInfantryGrenades", ["vn_m67_grenade_mag", "vn_m61_grenade_mag", "vn_m34_grenade_mag", "vn_m14_early_grenade_mag", "vn_m14_grenade_mag"]];
_loadoutData set ["smokeGrenades", ["vn_m18_white_mag"]];
_loadoutData set ["signalsmokeGrenades", ["vn_m18_yellow_mag", "vn_m18_red_mag", "vn_m18_purple_mag", "vn_m18_green_mag"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["vn_b_item_map"]];
_loadoutData set ["watches", ["vn_b_item_watch"]];
_loadoutData set ["compasses", ["vn_b_item_compass"]];
_loadoutData set ["radios", ["vn_b_item_radio_urc10"]];
_loadoutData set ["binoculars", ["vn_mk21_binocs"]];

_loadoutData set ["traitorUniforms", ["vn_o_uniform_vc_mf_01_07"]];
_loadoutData set ["traitorVests", ["vn_o_vest_05", "vn_o_vest_04"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["vn_b_uniform_macv_01_01", "vn_b_uniform_macv_01_07"]];
_loadoutData set ["officerVests", ["vn_b_vest_usarmy_09"]];
_loadoutData set ["officerHats", ["vn_b_beret_03_01"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["MGbackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["engBackpacks", []];
_loadoutData set ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _eeItems = ["vn_b_item_toolkit", "vn_b_item_trapkit"];
private _mmItems = [];

if (A3A_hasACE) then {
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadLeader_extras", []];
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
    "vn_b_aviator",
    "vn_b_scarf_01_01",
    "vn_b_spectacles",
    "vn_g_spectacles_02",
    "vn_g_spectacles_01",
    "vn_b_squares",
    "vn_b_squares_tinted",
    "vn_g_glasses_01",
    "vn_b_spectacles_tinted"
]];
_loadoutData set ["goggles", ["vn_b_acc_goggles_01"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["vn_b_uniform_sog_01_01", "vn_b_uniform_sog_01_04", "vn_b_uniform_sog_01_06", "vn_b_uniform_sog_01_02", "vn_b_uniform_sog_01_05", "vn_b_uniform_sog_02_01", "vn_b_uniform_sog_02_04", "vn_b_uniform_sog_02_06", "vn_b_uniform_sog_02_02", "vn_b_uniform_sog_02_05"]];
_sfLoadoutData set ["vests", ["vn_b_vest_sog_04"]];
_sfLoadoutData set ["medVests", ["vn_b_vest_sog_02"]];
_sfLoadoutData set ["engVests", ["vn_b_vest_sog_03"]];
_sfLoadoutData set ["mgVests", ["vn_b_vest_sog_05"]];
_sfLoadoutData set ["slVests", ["vn_b_vest_sog_06"]];
_sfLoadoutData set ["backpacks", ["vn_b_pack_trp_02", "vn_b_pack_lw_03"]];
_sfLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04", "vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_sfLoadoutData set ["MGbackpacks", ["vn_b_pack_trp_01", "vn_b_pack_trp_01_02"]];
_sfLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_sfLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_sfLoadoutData set ["helmets", ["vn_b_boonie_02_02", "vn_b_boonie_02_01", "vn_b_beret_01_01", "vn_b_beret_01_06", "vn_b_bandana_02"]];
_sfLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];

_sfLoadoutData set ["slRifles", [
["vn_m16_camo", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
["vn_m14a1_shorty", "", "", "vn_o_m14_front", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_xm177_xm148_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_xm177_xm148_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""]
]];
_sfLoadoutData set ["rifles", [
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["slSidearms", [
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_sfLoadoutData set ["carbines", [
["vn_xm177_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_short", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_short", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_stock", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_stock_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_gau5a", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_gau5a", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m14a1_shorty", "", "", "", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14a1_shorty", "", "", "vn_o_m14_front", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
"vn_m1carbine_shorty"
]];
_sfLoadoutData set ["designatedGrenadeLaunchers", [
["vn_m79", "", "", "", ["vn_40mm_m576_buck_mag"], ["vn_40mm_m397_ab_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m680_smoke_w_mag"], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["vn_xm177_xm148_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_xm177_xm148_camo", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""],
["vn_m60_shorty_camo", "", "", "", [], [], ""],
["vn_rpd", "", "", "", [], [], ""],
["vn_m63a_cdo", "", "", "", ["vn_m63a_150_mag", "vn_m63a_150_mag", "vn_m63a_150_t_mag"], [], ""],
["vn_m63a_lmg", "", "", "", ["vn_m63a_100_mag", "vn_m63a_100_mag", "vn_m63a_100_t_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["vn_m16_camo", "vn_s_m16", "", "vn_o_9x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m16_camo", "vn_s_m16", "", "vn_o_anpvs2_m16", ["vn_m16_40_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"], [], ""],
["vn_m14_camo", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "vn_s_m14", "", "vn_o_anpvs2_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14a1"],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14a1"],
["vn_m14a1", "vn_s_m14", "", "vn_o_anpvs2_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14a1"]
]];
_sfLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["vn_mx991_m1911", "vn_s_m1911", "", "", [], [], ""],
["vn_mk22", "vn_s_mk22", "", "", [], [], ""],
["vn_p38", "vn_s_ppk", "", "", [], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_05", "vn_b_uniform_macv_02_05", "vn_b_uniform_macv_03_05", "vn_b_uniform_macv_04_05", "vn_b_uniform_macv_05_05", "vn_b_uniform_macv_06_05"]];
_eliteLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_eliteLoadoutData set ["glVests", ["vn_b_vest_usarmy_05"]];
_eliteLoadoutData set ["sniVests", ["vn_b_vest_usarmy_08"]];
_eliteLoadoutData set ["medVests", ["vn_o_vest_06", "vn_b_vest_usarmy_12"]];
_eliteLoadoutData set ["engVests", ["vn_b_vest_usarmy_12", "vn_b_vest_usarmy_11"]];
_eliteLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_eliteLoadoutData set ["slVests", ["vn_b_vest_usarmy_09", "vn_b_vest_usarmy_11"]];
_eliteLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_eliteLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_eliteLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_eliteLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_eliteLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_eliteLoadoutData set ["helmets", ["vn_b_helmet_m1_01_01", "vn_b_helmet_m1_10_01", "vn_b_helmet_m1_11_01", "vn_b_headband_08", "vn_b_boonie_02_05", "vn_b_beret_01_08", "vn_b_bandana_05"]];
_eliteLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];

_eliteLoadoutData set ["slRifles", [
["vn_xm16e1", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_fg", "", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "vn_s_m16", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""]
]];
_eliteLoadoutData set ["rifles", [
["vn_xm16e1", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "vn_s_m16", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "vn_s_m16", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""],
["vn_m63a", "", "", "", ["vn_m63a_30_mag", "vn_m63a_30_mag", "vn_m63a_30_t_mag"], [], ""]
]];
_eliteLoadoutData set ["slSidearms", [
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79_p", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_eliteLoadoutData set ["carbines", [
["vn_xm177", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_short", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_stock", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_gau5a", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_fg", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_short", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_stock", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_gau5a", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm177_fg", "", "", "vn_o_1x_sp_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["vn_m79", "", "", "", ["vn_40mm_m576_buck_mag"], ["vn_40mm_m397_ab_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m680_smoke_w_mag"], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["vn_xm177_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_xm177_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m16_xm148", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""],
["vn_m60_shorty_camo", "", "", "", [], [], ""],
["vn_m63a_cdo", "", "", "", ["vn_m63a_150_mag", "vn_m63a_150_mag", "vn_m63a_150_t_mag"], [], ""],
["vn_m63a_lmg", "", "", "", ["vn_m63a_100_mag", "vn_m63a_100_mag", "vn_m63a_100_t_mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["vn_m16", "vn_s_m16", "", "vn_o_9x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m16", "vn_s_m16", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m16", "vn_s_m16", "", "vn_o_anpvs2_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14a1", "vn_s_m14", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14a1", "vn_s_m14", "", "vn_o_anpvs2_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "vn_s_m14", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", ["vn_mx991_m1911","vn_mk22"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_17", "vn_b_uniform_macv_02_17", "vn_b_uniform_macv_03_17", "vn_b_uniform_macv_04_17", "vn_b_uniform_macv_05_17", "vn_b_uniform_macv_06_17"]];
_militaryLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_militaryLoadoutData set ["glVests", ["vn_b_vest_usarmy_05"]];
_militaryLoadoutData set ["sniVests", ["vn_b_vest_usarmy_08"]];
_militaryLoadoutData set ["medVests", ["vn_o_vest_06", "vn_b_vest_usarmy_12"]];
_militaryLoadoutData set ["engVests", ["vn_b_vest_usarmy_12", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_militaryLoadoutData set ["slVests", ["vn_b_vest_usarmy_09", "vn_b_vest_usarmy_11"]];
_militaryLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_militaryLoadoutData set ["slBackpacks", ["vn_b_pack_trp_04_02", "vn_b_pack_prc77_01", "vn_b_pack_lw_06"]];
_militaryLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_militaryLoadoutData set ["medBackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_militaryLoadoutData set ["engBackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_militaryLoadoutData set ["helmets", ["vn_i_helmet_m1_02_01", "vn_i_helmet_m1_03_01", "vn_i_helmet_m1_01_01", "vn_b_helmet_m1_01_01"]];
_militaryLoadoutData set ["binoculars", ["vn_anpvs2_binoc"]];

_militaryLoadoutData set ["slRifles", [
["vn_xm16e1", "", "", "vn_o_4x_m16", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1", "", "", "", ["vn_m16_30_mag", "vn_m16_30_mag", "vn_m16_30_t_mag"], [], ""],
["vn_xm16e1_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""],
["vn_xm16e1_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"], ""]
]];
_militaryLoadoutData set ["rifles", [
["vn_xm16e1", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_xm16e1", "", "vn_b_m16", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m2carbine", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
["vn_m45", "", "", "", ["vn_m45_mag", "vn_m45_mag", "vn_m45_t_mag"], [], ""],
["vn_m45", "", "", "", ["vn_m45_mag", "vn_m45_mag", "vn_m45_t_mag"], [], ""],
["vn_xm177e1", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_xm177e1", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["vn_m1a1_tommy_so", "", "", "", ["vn_m1a1_20_mag", "vn_m1a1_20_mag", "vn_m1a1_20_t_mag"], [], ""],
["vn_m3a1", "", "", "", ["vn_m3a1_mag", "vn_m3a1_mag", "vn_m3a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["designatedGrenadeLaunchers", [
["vn_m79", "", "", "", [], ["vn_40mm_m406_he_mag", "vn_40mm_m406_he_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m79", "", "", "", [], ["vn_40mm_m406_he_mag", "vn_40mm_m406_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m680_smoke_w_mag"], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["vn_m2carbine_gl", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_xm16e1_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_xm16e1_xm148", "", "", "", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["vn_m60", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["vn_xm16e1", "", "", "vn_o_9x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_xm16e1", "", "", "vn_o_4x_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_xm16e1", "", "", "vn_o_anpvs2_m16", ["vn_m16_20_mag", "vn_m16_20_mag", "vn_m16_20_t_mag"], [], ""],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], ""],
["vn_m14_camo", "", "", "vn_o_9x_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"],
["vn_m14_camo", "", "", "vn_o_anpvs2_m14", ["vn_m14_mag", "vn_m14_mag", "vn_m14_t_mag"], [], "vn_b_camo_m14"]
]];
_militaryLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911",
"vn_p38s"
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_03"]];
_policeLoadoutData set ["vests", ["vn_b_vest_usarmy_01"]];
_policeLoadoutData set ["helmets", ["vn_i_helmet_m1_01_02","vn_b_boonie_02_01"]];

_policeLoadoutData set ["rifles", [
["vn_m1a1_tommy", "", "", "", ["vn_m1a1_20_mag", "vn_m1a1_20_mag", "vn_m1a1_20_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m1897", "", "", "", ["vn_m1897_buck_mag", "vn_m1897_fl_mag"], [], ""]
]];

_policeLoadoutData set ["sidearms", [
"vn_m1911",
"vn_mx991_m1911",
"vn_p38s"
]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["vn_b_uniform_macv_02_01", "vn_b_uniform_macv_02_07", "vn_b_uniform_macv_01_01"]];
_militiaLoadoutData set ["vests", ["vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"]];
_militiaLoadoutData set ["GLvests", ["vn_b_vest_usarmy_05"]];
_militiaLoadoutData set ["Snivests", ["vn_b_vest_usarmy_08"]];
_militiaLoadoutData set ["Medvests", ["vn_o_vest_06"]];
_militiaLoadoutData set ["mgVests", ["vn_b_vest_usarmy_06"]];
_militiaLoadoutData set ["slVests", ["vn_b_vest_usarmy_09"]];
_militiaLoadoutData set ["backpacks", ["vn_b_pack_lw_01", "vn_b_pack_lw_03"]];
_militiaLoadoutData set ["MGbackpacks", ["vn_b_pack_lw_02", "vn_b_pack_lw_05", "vn_b_pack_trp_01_02"]];
_militiaLoadoutData set ["Medbackpacks", ["vn_b_pack_lw_07", "vn_b_pack_m5_01"]];
_militiaLoadoutData set ["ENGbackpacks", ["vn_b_pack_lw_04", "vn_b_pack_trp_03_02"]];
_militiaLoadoutData set ["helmets", ["vn_b_helmet_m1_01_01", "vn_b_bandana_04", "vn_b_headband_02", "vn_b_helmet_m1_01_01", "vn_b_bandana_06"]];
_militiaLoadoutData set ["binoculars", ["vn_mk21_binocs"]];

_militiaLoadoutData set ["slRifles", [
["vn_m1903", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], [], ""],
["vn_m1903", "", "vn_b_m1903", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], [], ""],
["vn_m1903_gl", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1903_gl", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1_garand", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1_garand", "", "vn_b_m1_garand", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];

_militiaLoadoutData set ["rifles", [
["vn_m1_garand", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1_garand", "", "vn_b_m1_garand", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1903", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], [], ""],
["vn_m1903", "", "vn_b_m1903", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], [], ""]
]];

_militiaLoadoutData set ["carbines", [
["vn_m1carbine", "", "vn_b_carbine", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m1carbine", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], [], ""],
["vn_m45", "", "", "", ["vn_m45_mag", "vn_m45_mag", "vn_m45_t_mag"], [], ""],
["vn_m45", "", "", "", ["vn_m45_mag", "vn_m45_mag", "vn_m45_t_mag"], [], ""]
]];
_militiaLoadoutData set ["designatedGrenadeLaunchers", [
["vn_m79", "", "", "", [], ["vn_40mm_m381_he_mag", "vn_40mm_m381_he_mag", "vn_40mm_m381_he_mag", "vn_40mm_m576_buck_mag", "vn_40mm_m680_smoke_w_mag"], ""],
["vn_m79", "", "", "", [], ["vn_40mm_m381_he_mag", "vn_40mm_m381_he_mag", "vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m680_smoke_w_mag"], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["vn_m1carbine_gl", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1carbine_gl", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1carbine_gl", "", "", "", ["vn_carbine_15_mag", "vn_carbine_15_mag", "vn_carbine_15_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1903_gl", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], ["vn_22mm_m1a2_frag_mag", "vn_22mm_m1a2_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_m1903_gl", "", "", "", ["vn_m1903_mag", "vn_m1903_mag", "vn_m1903_t_mag"], ["vn_22mm_m17_frag_mag", "vn_22mm_m17_frag_mag", "vn_22mm_m9_heat_mag", "vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["vn_m1918", "", "", "", ["vn_m1918_mag", "vn_m1918_mag", "vn_m1918_t_mag"], [], "vn_bipod_m1918"],
["vn_m1918", "", "", "", ["vn_m1918_mag", "vn_m1918_mag", "vn_m1918_t_mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["vn_m1_garand", "", "", "vn_o_3x_m84", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""],
["vn_m1_garand", "", "", "vn_o_3x_m84", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], "vn_b_camo_m1_garand"],
["vn_m1_garand", "", "vn_b_m1_garand", "vn_o_3x_m84", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], "vn_b_camo_m40a1"],
["vn_m40a1_camo", "", "", "vn_o_9x_m40a1", ["vn_m40a1_mag", "vn_m40a1_mag", "vn_m40a1_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["vn_m1911", "vn_mx991_m1911", "vn_p38s"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["vn_b_uniform_macv_01_07", "vn_b_uniform_macv_01_01", "vn_b_uniform_macv_01_04"]];
_crewLoadoutData set ["vests", ["vn_b_vest_usarmy_12", "vn_b_vest_usarmy_11", "vn_b_vest_usarmy_10", "vn_b_vest_usarmy_10", "vn_b_vest_usarmy_10", "vn_b_vest_usarmy_10"]];
_crewLoadoutData set ["helmets", ["vn_b_helmet_t56_01_01", "vn_b_helmet_t56_02_01", "vn_b_helmet_t56_01_02", "vn_b_helmet_t56_02_02", "vn_b_helmet_t56_01_03", "vn_b_helmet_t56_02_03"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["vn_b_uniform_heli_01_01"]];
_pilotLoadoutData set ["vests", ["vn_b_vest_aircrew_05", "vn_b_vest_aircrew_03"]];
_pilotLoadoutData set ["helmets", ["vn_b_helmet_svh4_02_01", "vn_b_helmet_svh4_01_01", "vn_b_helmet_svh4_01_04", "vn_b_helmet_svh4_02_04"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "slRifles"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

	[["slSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
	["handgun", 4] call _fnc_addMagazines;
	["handgun", 4] call _fnc_addAdditionalMuzzleMagazines;
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

	["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _medicTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
  	["carbines"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _grenadierTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };

	["primary", 8] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	[["slSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
	["handgun", 4] call _fnc_addMagazines;
	["handgun", 2] call _fnc_addAdditionalMuzzleMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _explosivesExpertTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;


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
};

private _engineerTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	["carbines"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
};

private _latTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	[selectRandom ["lightATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;

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
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	["ATLaunchers"] call _fnc_setLauncher;

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
};

private _aaTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;

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
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["MGbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
};

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
	["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	[["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sniperRifles"] call _fnc_setPrimary;
	["primary", 8] call _fnc_addMagazines;

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
	["binoculars"] call _fnc_addBinoculars;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["rifles", "shotGuns"]] call _fnc_setPrimary;
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

	["SMGs"] call _fnc_setPrimary;
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
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
