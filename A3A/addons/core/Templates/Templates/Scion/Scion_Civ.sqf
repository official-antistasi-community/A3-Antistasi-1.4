private _hasApex = "expansion" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;

//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "SSV_Vehicle_Android_Ifrit", 0.3
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "C_Van_01_box_F", 1.0
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_rescue_F", 0.5,
    "C_Rubberboat", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Offroad_01_repair_F", 0.3,
    "C_Van_02_service_F", 0.3
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", ["C_Van_02_medevac_F", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Van_01_fuel_F", 0.2
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", ["SSV_Vehicle_Android_VTOL_Infantry"]] call _fnc_saveToTemplate;

//////////////////////////
//      Identities      //
//////////////////////////

["voices", ["Male01ENGVR","Male01PERVR","Male01GREVR"]] call _fnc_saveToTemplate;
["faces", ["SSV_android_face_01","SSV_android_face_02","SSV_android_face_03","hal_synth_face_01"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "SSV_Uniform_Android_Pilot",
    "SSV_Uniform_Android_Military"
];

private _pressUniforms = [
    "U_C_Journalist"
];

private _workerUniforms = [
    "SC_Workerbot_Uniform"
];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;

["headgear", []] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["workerHelmets", ["SC_Workerbot_Head"]];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", []];

private _pressHelmets = if (_hasLawsOfWar) then {
    ["H_Cap_press", "H_PASGT_basic_blue_press_F", "H_PASGT_neckprot_blue_press_F"];
} else {
    ["H_Cap_press"];
};

_loadoutData set ["pressHelmets", _pressHelmets];

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
    ["workerHelmets"] call _fnc_setHelmet;
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