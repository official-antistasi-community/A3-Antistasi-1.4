//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "OPTRE_Genet", 2.0,
    "OPTRE_M12_CIV2", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "OPTRE_cart", 0.5,
    "OPTRE_forklift", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_F", 0.5,
    "C_Scooter_Transport_01_F", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["OPTRE_M914_RV", 0.3]] call _fnc_saveToTemplate;

["vehiclesCivMedical", ["OPTRE_M12_FAV_APC_MED", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Van_01_fuel_F", 0.2,
    "C_Truck_02_fuel_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06",
"GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Barklem", "AfricanHead_02",
"AsianHead_A3_02", "AsianHead_A3_03", "WhiteHead_05"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_C_ArtTShirt_01_v1_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v3_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_ArtTShirt_01_v6_F",
    "U_OrestesBody",
    "U_C_HunterBody_grn",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F"
];

private _pressUniforms = [
    "OPTRE_ONI_Researcher_Uniform_Light",
    "OPTRE_ONI_Researcher_Uniform"
];

private _workerUniforms = [
    "OPTRE_UNSC_Navy_Uniform_Orange",
    "OPTRE_UNSC_Navy_Uniform_Gray",
    "OPTRE_UNSC_Navy_Uniform_Red",
    "OPTRE_UNSC_Navy_Uniform_White"
];

private _dlcUniforms = [];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "H_EarProtectors_white_F",
    "H_EarProtectors_yellow_F",
    "H_EarProtectors_black_F",
    "H_EarProtectors_orange_F",
    "OPTRE_Cap_FinalDawn",
    "OPTRE_UNSC_Watchcap",
    "OPTRE_h_Booniehat_Grey"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["OPTRE_FC_M52B_Armor_Vest_SNO"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_PASGT_basic_blue_press_F"]];

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
