private _hasLawsOfWar = "orange" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "NAPA"] call _fnc_saveToTemplate; 						

["flag", "Flag_NAP"] call _fnc_saveToTemplate; 						
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_NAP\Flag\nap_flag_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "UK3CB_Marker_NAP"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["UK3CB_NAP_I_TT650"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_NAP_B_Hilux_Pkm"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_NAP_B_Hilux_M2"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_I_G_V3S_Open"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_NAP_B_Hilux_Spg9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_I_G_V3S_Zu23"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["UK3CB_CHD_I_Fishing_Boat"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_CHC_I_Antonov_AN2", "UK3CB_NAP_I_C400"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_ADC_C_Skoda"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["UK3CB_CHC_C_Ural_Open"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["UK3CB_CHC_C_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["UK3CB_CHC_C_Fishing_Boat"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_LDF_I_M2_TriPod"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_nat_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_nat_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_nat_2b14"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["minesAT", [
	"ATMine_Range_Mag",
	"rhs_mine_tm62m_mag",
	"rhs_mine_M19_mag",
	"rhs_mag_mine_ptm1",
	"SLAMDirectionalMine_Wire_Mag",
	"rhssaf_mine_tma4_mag",
	"rhs_mine_TM43_mag"
]] call _fnc_saveToTemplate;
["minesAPERS", [
	"rhs_mine_M7A2_mag",
	"APERSMine_Range_Mag",
	"rhs_mine_pmn2_mag",
	"APERSBoundingMine_Range_Mag",
	"rhs_mag_mine_pfm1",
	"rhsusf_mine_m14_mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"APERSTripMine_Wire_Mag",
	"rhssaf_tm100_mag",
	"rhssaf_tm200_mag",
	"rhssaf_tm500_mag",
	"rhssaf_mine_pma3_mag",
	"rhssaf_mine_mrud_a_mag",
	"rhssaf_mine_mrud_b_mag",
	"rhssaf_mine_mrud_c_mag",
	"rhssaf_mine_mrud_d_mag",
	"rhs_mine_smine35_press_mag",
	"rhs_mine_smine44_press_mag",
	"rhs_mine_stockmine43_2m_mag",
	"rhs_mine_stockmine43_4m_mag",
	"rhs_mine_M3_tripwire_mag",
	"rhs_mine_Mk2_tripwire_mag",
	"rhs_mine_mk2_pressure_mag",
	"rhs_mine_m3_pressure_mag",
	"rhs_mine_glasmine43_hz_mag",
	"rhs_mine_glasmine43_bz_mag",
	"rhs_mine_m2a3b_press_mag",
	"rhs_mine_m2a3b_trip_mag",
	"rhs_mine_a200_bz_mag",
	"rhs_mine_a200_dz35_mag",
	"rhs_mine_m2a3b_press_mag",
	"rhs_mine_m2a3b_trip_mag",
	"rhs_mine_smine35_trip_mag",
	"rhs_mine_smine44_trip_mag"
]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["UK3CB_LDF_I_RBS70", 2500, "STATICAA", {tierWar > 3}],
    ["UK3CB_CW_US_B_LATE_TOW_TriPod", 3000, "STATICAT", {tierWar > 3}],
    ["rhsgref_nat_AGS30_TriPod", 3000, "STATICMG", {tierWar > 3}],

    ["UK3CB_NAP_I_Hilux_Mortar", 15000, "ARTILLERY", {tierWar > 5}],
    ["UK3CB_NAP_I_Hilux_Rocket", 25000, "ARTILLERY", {tierWar > 7}],
    ["UK3CB_NAP_I_Hilux_Rocket_Arty", 30000, "ARTILLERY", {tierWar > 8}],

    ["UK3CB_NAP_I_Hilux_Zu23", 1750, "CAR", {tierWar > 2}],
    ["UK3CB_NAP_I_Hilux_GMG", 2500, "CAR", {tierWar > 2}],
    ["UK3CB_NAP_I_BRDM2_UM", 1750, "CAR", {true}],
    ["UK3CB_NAP_I_BRDM2_HQ", 2050, "CAR", {true}],
    ["UK3CB_NAP_I_BRDM2", 2500, "CAR", {true}],

    ["UK3CB_NAP_I_MTLB_PKT", 2000, "APC", {true}],
    ["UK3CB_NAP_I_BTR60", 5000, "APC", {true}],
    ["UK3CB_NAP_I_BMP1", 9000, "APC", {tierWar > 3 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["UK3CB_NAP_I_BMP2", 12500, "APC", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["UK3CB_NAP_I_T55", 13000, "TANK", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],
    ["UK3CB_NAP_I_T72A", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["UK3CB_NAP_I_T72BM", 21000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    
    ["UK3CB_NAP_I_MTLB_ZU23", 7000, "AA", {tierWar > 3}],
    ["UK3CB_I_G_ZsuTank", 7500, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["UK3CB_ADA_I_L39_PYLON", 25000, "PLANE", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["rhs_l159_CDF", 40000, "PLANE", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],

    ["UK3CB_ADA_I_Mi8AMTSh", 25000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

#include "3CBF_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "UK3CB_CZ75", "UK3CB_CZ75_9_20Rnd",
    "rhs_weap_savz61_folded", "rhs_weap_savz61", "rhsgref_10rnd_765x17_vz61", "rhsgref_20rnd_765x17_vz61",
    "UK3CB_CZ550", "uk3cb_optic_sro", "UK3CB_CZ550_5rnd_Mag", "UK3CB_CZ550_5rnd_Mag_RT",
    "rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", "rhsgref_1Rnd_Slug",
    "rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k",
    "rhs_weap_panzerfaust60",
    "rhs_grenade_nbhgr39B_mag", "rhs_grenade_sthgr24_mag",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "B_FieldPack_oli",
    "Binocular",
    "rhs_weap_rsp30_white","rhs_mag_rsp30_white",
    "rhs_weap_rsp30_green","rhs_mag_rsp30_green",
    "rhs_weap_rsp30_red", "rhs_mag_rsp30_red",
    "rhs_mag_nspd", "rhs_mag_nspn_yellow", "rhs_mag_nspn_green", "rhs_mag_nspn_red",
    "rhsgref_chicom","V_BandollierB_oli",
    "UK3CB_CHC_C_B_MED", "B_AssaultPack_blk"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UK3CB_NAP_I_U_Tshirt_FLK",
    "UK3CB_NAP_I_U_Tshirt_BLK",
    "UK3CB_NAP_I_U_Tshirt_FLR",
    "UK3CB_NAP_I_U_Tshirt_FLK",
    "UK3CB_NAP_I_U_Pilot_FLORA",
    "UK3CB_NAP_I_U_Pilot_BLK",
    "UK3CB_NAP_I_U_Pilot_FLK",
    "UK3CB_NAP_I_U_Officer_Uniform_FLK_BLK",
    "UK3CB_NAP_I_U_Officer_Uniform_FLK_GRN",
    "UK3CB_NAP_I_U_Officer_Uniform_GRN_BLK",
    "UK3CB_NAP_I_U_Officer_Uniform_GRN",
    "UK3CB_NAP_I_U_Officer_Uniform_WDL_BLK",
    "UK3CB_NAP_I_U_Officer_Uniform_WDL_GRN",
    "UK3CB_NAP_I_U_CombatUniform_FLK",
    "UK3CB_NAP_I_U_CombatUniform_WDL",
    "UK3CB_NAP_I_U_CombatUniform_01_FLK",
    "UK3CB_NAP_I_U_CombatUniform_01_WDL",
    "UK3CB_LNM_I_U_CombatUniform_01",
    "UK3CB_LNM_I_U_CombatUniform_02",
    "UK3CB_LNM_I_U_CombatUniform_03",
    "UK3CB_LNM_I_U_CombatUniform_04",
    "UK3CB_LNM_I_U_CombatUniform_09",
    "UK3CB_LNM_I_U_CombatUniform_10",
    "UK3CB_LNM_I_U_CombatUniform_11",
    "UK3CB_LNM_I_U_CombatSmock_04",
    "UK3CB_LNM_I_U_CombatSmock_05",
    "UK3CB_LNM_I_U_CombatSmock_06",
    "UK3CB_LNM_I_U_CombatSmock_09",
    "UK3CB_LNM_I_U_CombatSmock_32",
    "UK3CB_LNM_I_U_Shirt_Pants_13",
    "UK3CB_LNM_I_U_Shirt_Pants_14",
    "UK3CB_LNM_I_U_Shirt_Pants_01",
    "UK3CB_LNM_I_U_Shirt_Pants_02",
    "rhsgref_uniform_alpenflage",
    "rhsgref_uniform_gorka_1_f",
    "rhsgref_uniform_dpm",
    "rhsgref_uniform_dpm_olive",
    "rhsgref_uniform_flecktarn",
    "rhsgref_uniform_flecktarn_full",
    "rhsgref_uniform_og107",
    "rhsgref_uniform_og107_erdl",
    "rhsgref_uniform_woodland",
    "rhsgref_uniform_woodland_olive"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "rhs_beanie_green",
    "H_Bandanna_khk",
    "H_Cap_blk",
    "H_Cap_oli",
    "H_Cap_headphones",
    "rhs_headband",
    "UK3CB_LNM_B_H_BoonieHat_FLK_01",
    "UK3CB_LNM_B_H_BoonieHat_FLK_02",
    "UK3CB_LNM_B_H_BoonieHat_FLK_03"

]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
    "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
    "LivonianHead_9", "LivonianHead_10","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
    "WhiteHead_05","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10",
    "WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16",
    "WhiteHead_17","WhiteHead_19","WhiteHead_20","WhiteHead_21"
]] call _fnc_saveToTemplate;
["voices", ["rhs_male01cz","rhs_male02cz","rhs_male03cz","rhs_male04cz","rhs_male05cz"]] call _fnc_saveToTemplate;

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
_loadoutData set ["facemask", ["rhssaf_veil_Green", "G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

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
