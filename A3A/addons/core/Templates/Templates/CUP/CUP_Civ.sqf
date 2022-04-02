//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CUP_O_Hilux_unarmed_TK_CIV", 0.5
    , "CUP_C_LR_Transport_CTK", 0.5
    , "CUP_C_Bus_City_TKCIV", 0.2
    , "CUP_C_SUV_TK", 0.3
    , "CUP_C_Datsun_4seat", 0.5
    , "CUP_C_Golf4_black_Civ", 0.5
    , "CUP_C_Golf4_random_Civ", 0.5
    , "CUP_C_Octavia_CIV", 0.5
    , "CUP_C_Pickup_unarmed_CIV", 0.5
    , "CUP_C_TowingTractor_CIV", 0.3
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CUP_C_V3S_Open_TKC", 0.3
    , "CUP_C_V3S_Covered_TKC", 0.2
    , "CUP_C_Ural_Civ_01", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", [
    "CUP_C_412", 0.1
    , "CUP_C_412_Sheriff", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "CUP_C_Fishing_Boat_ChernaRUS", 0.2
    , "CUP_C_PBX_CIV", 0.7
    , "CUP_C_Zodiac_CIV", 0.7
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Truck_02_box_F", 0.1
    , "C_Offroad_01_repair_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_C_S1203_Ambulance_CIV", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 0.1
    , "C_Van_01_fuel_F", 0.1
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
    "CUP_U_C_AirMedic_yellow_01",
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
    "U_NikosBody",
    "U_NikosAgedBody",
    "U_C_Journalist",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_OrestesBody",
    "U_C_Poor_1",
    "U_C_WorkerCoveralls",
    "U_C_HunterBody_grn",
    "U_C_Uniform_Farmer_01_F",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_C_Scientist",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F"
];          //Uniforms given to Normal Civs

private _pressUniforms = ["U_C_Journalist", "U_Marshal"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["CUP_U_C_Worker_03", "CUP_U_C_Worker_04", "CUP_U_C_Worker_02", "CUP_U_C_Worker_01"];           //Uniforms given to Workers at Factories/Resources

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Civilians

if (allowDLCExpansion) then {_dlcUniforms append [];
};

if (allowDLCOrange) then {_dlcUniforms append [];
};

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civhats = ["H_Cap_tan", "CUP_H_TKI_SkullCap_01", "CUP_H_TKI_SkullCap_02"];

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