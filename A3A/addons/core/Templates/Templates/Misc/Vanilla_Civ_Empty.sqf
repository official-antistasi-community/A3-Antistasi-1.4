private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;

//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["attributeLowCiv", true] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

private _civCarsWithWeights = [
    "C_Quadbike_01_F", 0.3
    ,"C_Hatchback_01_F", 1.0
    ,"C_Hatchback_01_sport_F", 0.3
    ,"C_Offroad_01_F", 1.0
    ,"C_SUV_01_F", 1.0
    ,"C_Van_02_vehicle_F", 1.0                // van from Orange
    ,"C_Van_02_transport_F", 0.2            // minibus
    ,"C_Offroad_02_unarmed_F", 0.5            // Apex 4WD
    ,"C_Offroad_01_comms_F", 0.1            // Contact
    ,"C_Offroad_01_covered_F", 0.1
];

if (_hasApex) then {
    _civCarsWithWeights append ["C_Offroad_02_unarmed_F", 1.0];
};

["vehiclesCivCar", _civCarsWithWeights] call _fnc_saveToTemplate;


["vehiclesCivIndustrial", [
    "C_Van_01_transport_F", 1.0
    ,"C_Van_01_box_F", 0.8
    ,"C_Truck_02_transport_F", 0.5
    ,"C_Truck_02_covered_F", 0.5
    ,"C_Tractor_01_F", 0.3    ]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_rescue_F", 0.1            // motorboats
    ,"C_Boat_Civil_01_police_F", 0.1
    ,"C_Boat_Civil_01_F", 1.0
    ,"C_Rubberboat", 1.0                    // rescue boat
    ,"C_Boat_Transport_02_F", 1.0            // RHIB
    ,"C_Scooter_Transport_01_F", 0.5]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Offroad_01_repair_F", 0.3
    ,"C_Van_02_service_F", 0.3                // orange
    ,"C_Truck_02_box_F", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivMedical", ["C_Van_02_medevac_F", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Van_01_fuel_F", 0.2
    ,"C_Truck_02_fuel_F", 0.1]] call _fnc_saveToTemplate;

["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_C_Man_casual_1_F"
];

["uniforms", _civUniforms] call _fnc_saveToTemplate;

["headgear", []] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _civUniforms];
_loadoutData set ["workerUniforms", _civUniforms];
_loadoutData set ["pressVests", []];
_loadoutData set ["helmets", []];
_loadoutData set ["pressHelmets", []];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];

private _manTemplate = {
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