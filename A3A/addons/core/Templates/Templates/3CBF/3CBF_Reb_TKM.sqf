private _hasLawsOfWar = "orange" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "TKM"] call _fnc_saveToTemplate;

["flag", "Flag_TKM_B"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_MARKER_B_TKM"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_TKM_I_YAVA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_TKM_I_LR_Closed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_TKM_I_Hilux_Dshkm"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["UK3CB_TKM_I_V3S_Open"]] call _fnc_saveToTemplate;
["vehiclesAT", ["UK3CB_TKM_I_Hilux_Spg9"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_TKM_I_V3S_Zu23"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["UK3CB_CHD_I_Fishing_Boat"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["UK3CB_CHC_I_Antonov_AN2", "I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["UK3CB_TKC_C_Hilux_Civ_Open"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["UK3CB_TKC_C_Ural_Open"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["UK3CB_TKC_C_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["UK3CB_CHC_C_Fishing_Boat"]] call _fnc_saveToTemplate;
["vehiclesCivSupply", ["UK3CB_ADC_C_S1203"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_TKM_I_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_TKM_I_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_TKM_I_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_TKM_I_2b14_82mm"]] call _fnc_saveToTemplate;
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
    ["rhsgref_nat_Igla_AA_pod", 3000, "STATICAA", {tierWar > 3}],
    ["UK3CB_LNM_I_Metis", 3000, "STATICAT", {tierWar > 3}],
    ["rhsgref_nat_AGS30_TriPod", 3000, "STATICMG", {tierWar > 3}],

    ["UK3CB_I_G_BRDM2_UM", 1750, "CAR", {true}],
    ["UK3CB_I_G_BRDM2_HQ", 2050, "CAR", {true}],
    ["UK3CB_I_G_BRDM2", 2500, "CAR", {true}],
    ["UK3CB_I_G_BRDM2_ATGM", 3500, "CAR", {tierWar > 3}],
    ["UK3CB_KDF_I_UAZ_AGS30", 2500, "CAR", {tierWar > 2}],

    ["UK3CB_I_G_MTLB_PKT", 2000, "APC", {true}],
    ["UK3CB_I_G_BTR40", 2250, "APC", {true}],
    ["UK3CB_I_G_BTR40_MG", 3000, "APC", {true}],
    ["UK3CB_KDF_I_BTR60", 5000, "APC", {true}],
    ["UK3CB_KDF_I_BTR70", 5000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
    ["UK3CB_KDF_I_BMD1K", 7500, "APC", {tierWar > 4 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["UK3CB_KDF_I_BMD2", 10000, "APC", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["UK3CB_I_G_T34", 10000, "TANK", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
    ["UK3CB_I_G_T55", 13000, "TANK", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],
    ["UK3CB_KDF_I_T72A", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["UK3CB_KDF_I_T80", 21000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    
    ["UK3CB_KDF_I_MTLB_ZU23", 7000, "AA", {tierWar > 3}],
    ["UK3CB_I_G_ZsuTank", 7500, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["UK3CB_KDF_I_MIG21_CAS", 35000, "PLANE", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    
    ["UK3CB_KDF_I_Mi8", 17500, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["UK3CB_KDF_I_Mi8AMTSh", 25000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

["variants", [
    ["UK3CB_KDF_I_MIG21_CAS", ["SIL",1]]
]] call _fnc_saveToTemplate;

#include "3CBF_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "UK3CB_BHP", "UK3CB_BHP_9_13Rnd",
    "rhs_weap_tt33", "rhs_mag_762x25_8",
    "uk3cb_ppsh41", "uk3cb_PPSH_71rnd_magazine", "uk3cb_PPSH_71rnd_magazine_RT", "uk3cb_PPSH_71rnd_magazine_RM", "uk3cb_PPSH_71rnd_magazine_R",
    "UK3CB_Sten", "UK3CB_Sten_34Rnd_Magazine", "UK3CB_Sten_34Rnd_Magazine_GT", "UK3CB_Sten_34Rnd_Magazine",
    "rhs_weap_m38", "rhsgref_5Rnd_762x54_m38",
    "UK3CB_Enfield", "UK3CB_Enfield_10rnd_Mag_GT", "UK3CB_Enfield_10rnd_Mag",
    "rhs_grenade_khattabka_vog17_mag", "rhs_grenade_khattabka_vog25_mag", "rhsgref_mag_rkg3em", "rhs_mag_rdg2_black", "rhs_mag_rdg2_white",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "Binocular",
    "B_FieldPack_oli",
    "rhs_weap_rsp30_white","rhs_mag_rsp30_white",
    "rhs_weap_rsp30_green","rhs_mag_rsp30_green",
    "rhs_weap_rsp30_red", "rhs_mag_rsp30_red",
    "rhs_mag_nspd", "rhs_mag_nspn_yellow", "rhs_mag_nspn_green", "rhs_mag_nspn_red",
    "UK3CB_V_CW_Chestrig","UK3CB_V_CW_Chestrig_2_Small",
    "UK3CB_V_Chicom_Brown", "UK3CB_V_Chicom_Brown_m88",
    "UK3CB_V_Chicom_Desert", "UK3CB_V_Chicom_Desert_m88",
    "UK3CB_CHC_C_B_MED", "B_AssaultPack_blk"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UK3CB_ADE_I_U_02_J",
    "UK3CB_ADM_I_U_Tshirt_01_WDL_03",
    "UK3CB_ADM_B_U_Tshirt_01_WDL",
    "UK3CB_TKM_I_U_01",
    "UK3CB_TKM_I_U_01_B",
    "UK3CB_TKM_I_U_01_C",
    "UK3CB_TKM_I_U_03",
    "UK3CB_TKM_I_U_03_B",
    "UK3CB_TKM_I_U_03_C",
    "UK3CB_TKM_I_U_04",
    "UK3CB_TKM_I_U_04_B",
    "UK3CB_TKM_I_U_04_C",
    "UK3CB_TKM_I_U_05",
    "UK3CB_TKM_I_U_05_B",
    "UK3CB_TKM_I_U_05_C",
    "UK3CB_TKM_I_U_06",
    "UK3CB_TKM_I_U_06_B",
    "UK3CB_TKM_I_U_06_C"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "UK3CB_TKC_H_Turban_01_1",
    "UK3CB_TKC_H_Turban_02_1",
    "UK3CB_TKC_H_Turban_06_1",
    "UK3CB_TKC_H_Turban_04_1",
    "UK3CB_TKC_H_Turban_05_1"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;

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
_loadoutData set ["facemask", ["rhs_scarf", "UK3CB_G_Balaclava_CHD", "G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

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
