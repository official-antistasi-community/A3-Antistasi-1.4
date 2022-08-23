//////////////////////////
//   Side Information   //
//////////////////////////

["name", "PAVN"] call _fnc_saveToTemplate;
["spawnMarkerName", "PAVN support corridor"] call _fnc_saveToTemplate;

["flag", "vn_flag_pavn"] call _fnc_saveToTemplate;
["flagTexture", "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_pavn"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "vn_o_ammobox_04"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

// All fo bellow are optional overrides
["firstAidKits", ["vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;
["mediKits", ["vn_o_item_medikit_01"]] call _fnc_saveToTemplate;

["placeIntel_desk", ["Land_vn_us_common_table_01",0]] call _fnc_saveToTemplate;
["placeIntel_itemMedium", ["Land_vn_file1_f",-25,false]] call _fnc_saveToTemplate;
["placeIntel_itemLarge", ["Land_vn_filephotos_f",-25,false]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["vn_o_bicycle_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_o_wheeled_btr40_01"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["vn_o_wheeled_btr40_mg_02", "vn_o_wheeled_btr40_mg_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["vn_o_wheeled_z157_01", "vn_o_wheeled_z157_02"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["vn_o_wheeled_z157_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["vn_o_wheeled_z157_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["vn_o_wheeled_z157_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["vn_o_wheeled_btr40_02"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["vn_o_armor_m113_acav_01","vn_o_armor_m113_acav_03","vn_o_armor_m113_01"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["vn_o_armor_m41_01","vn_o_armor_pt76a_01","vn_o_armor_pt76b_01","vn_o_armor_type63_01"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_o_wheeled_btr40_mg_03", "vn_o_wheeled_z157_mg_02"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["vn_o_boat_01_mg_03"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["vn_o_boat_04_02"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["vn_o_air_mig19_at"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["vn_o_air_mig19_cap"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["vn_o_air_mi2_01_03"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["vn_o_air_mi2_01_03"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["vn_o_air_mi2_04_02", "vn_o_air_mi2_05_04"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["vn_o_vc_static_mortar_type53", "vn_o_nva_static_h12", "vn_o_nva_static_d44_01"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["vn_o_vc_static_mortar_type53", ["vn_mortar_type53_mag_he_x8"]],
["vn_o_nva_static_h12", ["vn_h12_v_12_he_mag"]],
["vn_o_nva_static_d44_01", ["vn_cannon_d44_mag_he_x12"]]
]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["vn_o_wheeled_btr40_mg_02_nva65"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["vn_o_wheeled_z157_01_nva65"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["vn_o_wheeled_btr40_01_nva65"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["vn_i_wheeled_m151_02_mp"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_o_nva_static_dshkm_high_01", "vn_o_nva_static_rpd_high"]] call _fnc_saveToTemplate;
["staticAT", ["vn_o_vc_static_type56rr"]] call _fnc_saveToTemplate;
["staticAA", ["vn_o_nva_static_zpu4"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_o_nva_65_static_mortar_type63"]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["mortarMagazineHE", "vn_mortar_type63_mag_he_x8"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "vn_mortar_type63_mag_wp_x8"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["vn_mine_tripwire_arty"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["vn_mine_punji_02"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["vie"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["ATLaunchers", ["vn_rpg2", "vn_rpg7"]];
_loadoutData set ["AALaunchers", ["vn_sa7", "vn_sa7b"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["vn_mine_tripwire_f1_04_mag"]];
_loadoutData set ["APMines", ["vn_mine_punji_01_mag"]];
_loadoutData set ["lightExplosives", ["vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiTankGrenades", ["vn_rkg3_grenade_mag"]];
_loadoutData set ["antiInfantryGrenades", ["vn_t67_grenade_mag", "vn_rgd33_grenade_mag", "vn_rg42_grenade_mag", "vn_rgd5_grenade_mag"]];
_loadoutData set ["smokeGrenades", ["vn_rdg2_mag"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["vn_o_item_map"]];
_loadoutData set ["watches", ["vn_b_item_watch"]];
_loadoutData set ["compasses", ["vn_b_item_compass"]];
_loadoutData set ["radios", ["vn_o_item_radio_m252"]];
_loadoutData set ["binoculars", ["vn_mk21_binocs"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["engBackpacks", []];
_loadoutData set ["longRangeRadios", []];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_11_03", "vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_09_04"]];
_sfLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_sfLoadoutData set ["medVests", ["vn_o_vest_06"]];
_sfLoadoutData set ["engVests", ["vn_o_vest_08"]];
_sfLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_sfLoadoutData set ["slVests", ["vn_o_vest_07"]];
_sfLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_sfLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_sfLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_sfLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_sfLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
"vn_dp28", "vn_pk"
]];
_sfLoadoutData set ["marksmanRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
"vn_fkb1_pm", "vn_pm", "vn_tt33",
["vn_izh54_p", "", "", "", ["vn_izh54_mag", "vn_izh54_so_mag"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_11_03", "vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_04_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_09_04"]];
_militaryLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_militaryLoadoutData set ["medVests", ["vn_o_vest_06"]];
_militaryLoadoutData set ["engVests", ["vn_o_vest_08"]];
_militaryLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_militaryLoadoutData set ["slVests", ["vn_o_vest_07"]];
_militaryLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_militaryLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_militaryLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_militaryLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_militaryLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_militaryLoadoutData set ["rifles", [
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_militaryLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m433_hedp_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m680_smoke_w_mag"], ["vn_40mm_m576_buck_mag"], ""],
["vn_m79", "", "", "", ["vn_40mm_m381_he_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m661_flare_g_mag"], ["vn_40mm_m576_buck_mag"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
"vn_dp28", "vn_pk"
]];
_militaryLoadoutData set ["marksmanRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
"vn_fkb1_pm", "vn_pm", "vn_tt33",
["vn_izh54_p", "", "", "", ["vn_izh54_mag", "vn_izh54_so_mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_02_01"]];
_policeLoadoutData set ["vests", ["vn_o_vest_07"]];
_policeLoadoutData set ["helmets", []];

_policeLoadoutData set ["rifles", [
["vn_sks", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["vn_izh54", "", "", "", ["vn_izh54_mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
"vn_tt33",
"vn_fkb1_pm"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03", "vn_o_uniform_nva_army_01_04", "vn_o_uniform_nva_army_10_03", "vn_o_uniform_nva_army_10_04",
"vn_o_uniform_nva_army_12_03", "vn_o_uniform_nva_army_02_04", "vn_o_uniform_nva_army_03_04", "vn_o_uniform_nva_army_05_03", "vn_o_uniform_nva_army_06_03", "vn_o_uniform_nva_army_07_03"]];
_militiaLoadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_02"]];
_militiaLoadoutData set ["medVests", ["vn_o_vest_06"]];
_militiaLoadoutData set ["engVests", ["vn_o_vest_08"]];
_militiaLoadoutData set ["mgVests", ["vn_o_vest_03"]];
_militiaLoadoutData set ["slVests", ["vn_o_vest_07"]];
_militiaLoadoutData set ["backpacks", ["vn_o_pack_04", "vn_o_pack_01", "vn_o_pack_02"]];
_militiaLoadoutData set ["slBackpacks", ["vn_o_pack_t884_01"]];
_militiaLoadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_militiaLoadoutData set ["engBackpacks", ["vn_o_pack_05"]];
_militiaLoadoutData set ["helmets", ["vn_o_helmet_nva_01", "vn_o_helmet_nva_04", "vn_o_helmet_nva_03", "vn_o_helmet_nva_02"]];

_militiaLoadoutData set ["rifles", [
["vn_sks", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
["vn_ppsh41", "", "", "", ["vn_ppsh41_71_mag", "vn_ppsh41_71_mag", "vn_ppsh41_71_t_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
"vn_dp28"
]];
_militiaLoadoutData set ["marksmanRifles", [
["vn_sks", "", "", "vn_o_3x_m9130", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["vn_m9130", "", "", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
["vn_m9130", "", "vn_b_m38", "vn_o_3x_m9130", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_04_03"]];
_crewLoadoutData set ["vests", ["vn_o_vest_06"]];
_crewLoadoutData set ["helmets", ["vn_o_helmet_tsh3_01", "vn_o_helmet_tsh3_02"]];


private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["vn_o_uniform_nva_army_01_03"]];
_pilotLoadoutData set ["vests", ["vn_o_vest_05"]];
_pilotLoadoutData set ["helmets", ["vn_o_helmet_zsh3_02", "vn_o_helmet_zsh3_01"]];

