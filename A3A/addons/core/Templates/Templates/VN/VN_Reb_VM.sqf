///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "VM"] call _fnc_saveToTemplate;

["flag", "vn_flag_lao_dmg"] call _fnc_saveToTemplate;
["flagTexture", "\vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_lao"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["vn_b_item_firstaidkit", "vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["vn_b_item_medikit_01", "vn_o_item_medikit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["toolKits", ["vn_b_item_toolkit"]] call _fnc_saveToTemplate;  // Relies on autodetection.
["itemMaps", ["vn_b_item_map"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["vehicleHealthStation", ["Land_vn_tent_mash_02_01", 75]] call _fnc_saveToTemplate;

["diveGear", ["vn_b_uniform_seal_09_01", "vn_b_acc_seal_01", "vn_b_vest_seal_01"]] call _fnc_saveToTemplate;

["flyGear", ["vn_b_uniform_heli_01_01"]] call _fnc_saveToTemplate;

["vehiclesBasic", ["vn_c_bicycle_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_b_wheeled_lr2a_01_aus_army", "vn_b_wheeled_lr2a_02_aus_army"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["vn_i_wheeled_lr2a_mg_01_fank_71"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["vn_i_wheeled_m54_01_marines"]] call _fnc_saveToTemplate;
["vehiclesAT", ["vn_b_wheeled_lr2a_mg_03_aus_army"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_b_wheeled_lr2a_mg_02_aus_army"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["vn_i_boat_02_mg_00_fank_70", "vn_i_boat_01_mg_00_fank_70"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["vn_o_air_mig19_gun"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["vn_c_car_02_01", "vn_c_car_01_01","vn_c_car_03_01","vn_c_wheeled_m151_02","vn_c_wheeled_m151_01","vn_c_car_04_01"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["vn_b_wheeled_m54_01_airport"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["vn_b_air_uh1d_04_09"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["vn_c_boat_08_01"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["vn_i_wheeled_m54_03_marines"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_i_fank_71_static_m1919a4_low", "vn_i_fank_71_static_m1919a6", "vn_i_fank_71_static_m1919a4_high"]] call _fnc_saveToTemplate;
["staticAT", ["vn_i_fank_71_static_m40a1rr", "vn_i_static_m101_01"]] call _fnc_saveToTemplate;
["staticAA", ["vn_i_fank_70_static_zgu1_01", "vn_i_fank_71_static_m2_high"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_i_static_mortar_m2"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "vn_mortar_m2_mag_he_x8"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "vn_mortar_m2_mag_wp_x8"] call _fnc_saveToTemplate;

["mineAT", "vn_mine_m15_mag"] call _fnc_saveToTemplate;
["mineAPERS", "vn_mine_m14_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["vn_mine_m112_remote_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["vn_mine_satchel_remote_02_mag", 1], ["vn_mine_m112_remote_mag", 2]]] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["vn_b_seal_static_mk18", 2500, "STATICMG", {tierWar > 3}],
    ["vn_b_rok_army_static_mortar_m29", 3000, "STATICMORTAR", {tierWar > 5}],

    ["vn_i_armor_m113_acav_02_fank_71", 5000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count milbases > 0}],
    ["vn_i_armor_m113_acav_06_fank_71", 7500, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count milbases > 0}],

    ["vn_i_armor_m41_01", 20000, "TANK", {tierWar > 6 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count milbases > 0}}],

    ["vn_b_air_oh6a_06", 25000, "HELI", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["vn_b_air_oh6a_05", 25000, "HELI", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["vn_b_air_oh6a_04", 25000, "HELI", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["vn_b_air_oh6a_07", 25000, "HELI", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

#include "VN_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "vn_sten", "vn_sten_mag", "vn_sten_t_mag",
    "vn_mc10", "vn_mc10_mag", "vn_mc10_t_mag",
    "vn_m10", "vn_m10_mag",
    "vn_type64", "vn_type64_mag",
    "vn_m127",
    "vn_p38s",
    "vn_m19_binocs_grey", "vn_mx991", "vn_mx991_red",
    "vn_m_mk2_knife_01", "vn_m_axe_01",
    "vn_m18_white_mag", "vn_molotov_grenade_mag", "vn_m127_mag", "vn_mine_punji_03_mag",
    "B_FieldPack_oli", "vn_b_vest_usarmy_01",
    "vn_c_pack_01"
];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "vn_o_uniform_vc_01_01",
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_02_07",
    "vn_o_uniform_vc_03_02",
    "vn_o_uniform_vc_04_02",
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_02_05",
    "vn_o_uniform_vc_04_03",
    "vn_o_uniform_vc_03_03"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "vn_c_conehat_02",
    "vn_c_conehat_01",
    "vn_b_headband_05",
    "vn_b_headband_04",
    "vn_b_headband_01",
    "vn_o_boonie_vc_01_01",
    "vn_o_boonie_vc_01_02"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
