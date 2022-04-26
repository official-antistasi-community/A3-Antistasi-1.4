//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CUP_C_Lada_CIV", 0.5, 
    "gm_ge_civ_typ1200", 0.5, 
    "gm_ge_civ_u1300l", 0.5, 
    "gm_gc_civ_ural375d_cargo", 0.5, 
    "CUP_C_S1203_CIV_CR", 0.5, 
    "CUP_C_Skoda_CR_CIV", 0.5, 
    "cwr3_c_rapid", 0.5, 
    "CUP_C_TT650_CIV", 0.5, 
    "C_Tractor_01_F", 0.5, 
    "CUP_C_Pickup_unarmed_CIV", 0.5, 
    "CUP_C_Datsun_Covered", 0.5, 
    "CUP_C_Datsun_Plain", 0.5, 
    "CUP_C_Datsun_Tubeframe", 0.5, 
    "CUP_O_Hilux_unarmed_CR_CIV_White", 0.5, 
    "CUP_C_Ikarus_Chernarus", 0.2,
    "CUP_C_Bus_City_CRCIV", 0.2
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CUP_C_V3S_Open_TKC", 0.3, 
    "CUP_C_V3S_Covered_TKC", 0.2, 
    "CUP_C_Ural_Civ_01", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", [
    "gm_ge_adak_bo105m_vbh", 0.1, 
    "CUP_C_412", 0.1,
    "gm_ge_pol_bo105m_vbh", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "CUP_C_Fishing_Boat_Chernarus", 0.2, 
    "CUP_C_PBX_CIV", 0.7, 
    "CUP_C_Zodiac_CIV", 0.7
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "CUP_O_Ural_Repair_RU", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_B_S1203_Ambulance_CR", 0.1,
    "cwr3_c_s1203_ambulance", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "gm_pl_army_ural375d_refuel", 0.1,
    "CUP_O_Ural_Refuel_RU", 0.1
]] call _fnc_saveToTemplate;



//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "CUP_U_C_Citizen_02",
    "CUP_U_C_Citizen_01",
    "CUP_U_C_Citizen_04",
    "CUP_U_C_Citizen_03",
    "CUP_U_C_Rocker_01",
    "CUP_U_C_Rocker_02",
    "CUP_U_C_Rocker_03",
    "CUP_U_C_Rocker_04",
    "CUP_U_C_Tracksuit_02",
    "CUP_U_C_Tracksuit_01",
    "U_C_Man_casual_1_F",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Man_casual_6_F",
    "U_C_ArtTShirt_01_v1_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v3_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_ArtTShirt_01_v6_F",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_C_Poor_1",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_grn",
    "U_C_Uniform_Farmer_01_F",
    "U_C_Mechanic_01_F",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F"
];          //Uniforms given to Normal Civs

private _pressUniforms = ["U_C_Journalist", "U_Marshal"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["CUP_U_C_Worker_03", "CUP_U_C_Worker_04", "CUP_U_C_Worker_02", "CUP_U_C_Worker_01"];           //Uniforms given to Workers at Factories/Resources

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Civilians

if (allowDLCExpansion) then {_dlcUniforms append [];
};

if (allowDLCOrange) then {_dlcUniforms append [];
};

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = [
    "gm_ge_headgear_winterhat_80_oli", 
    "CUP_H_C_Ushanka_02", 
    "H_Cap_blu",
    "CUP_H_C_MAGA_01",
    "H_WirelessEarpiece_F"
];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;