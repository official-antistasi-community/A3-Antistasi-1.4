private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;

//////////////////////////////
//   Civilian Information   //
//////////////////////////////

["attributeCivNonHuman", true] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

private _civCarsWithWeights = [
    "C_Quadbike_01_F", 0.3
    ,"C_Tractor_01_F", 1.0
    ,"rhssaf_un_uaz_open", 1.0                
    ,"rhssaf_un_uaz", 1.0            
    ,"RHS_Ural_Civ_02", 0.1            
    ,"RHS_Ural_Open_Civ_02", 0.1            
    ,"RHS_Ural_Civ_01", 0.1
    ,"RHS_Ural_Open_Civ_01", 0.1
];

if (_hasApex) then {
    _civCarsWithWeights append ["rhssaf_un_uaz", 1.0];
};

["vehiclesCivCar", _civCarsWithWeights] call _fnc_saveToTemplate;


["vehiclesCivIndustrial", [
    "RHS_Ural_Civ_02", 1.0
    ,"RHS_Ural_Open_Civ_02", 0.8
    ,"RHS_Ural_Civ_01", 0.5
    ,"RHS_Ural_Open_Civ_01", 0.5
    ,"C_Tractor_01_F", 0.3    ]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Rubberboat", 1.0                    // rescue boat
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
	"SCE_Loner_4",
	"SCE_Loner_3",
	"SCE_Loner_2",
	"SCE_Loner_1",
	"SCE_Loner_CBRN",
	"SE_Assault_Fatigues_Loner",
	"SE_SEVA_Loner"
];

["uniforms", _civUniforms] call _fnc_saveToTemplate;

["headgear", []] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["pressUniforms", _civUniforms];
_loadoutData set ["workerUniforms", ["CAU_U_CBRN_blue"]];
_loadoutData set ["workerFacewear", ["CAU_G_CBRN_m50_blue_hood", "CAU_G_CBRN_s10_blue"]];
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

    ["workerFacewear"] call _fnc_setFacewear;

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

private _specialUnits = [
    "Zombie_O_Walker_Civ",
    "Zombie_O_Shambler_Civ",
    "WBK_SpecialZombie_Corrupted_3",
    "Zombie_Special_OPFOR_Leaper_2",
    "Zombie_Special_OPFOR_Boomer"
];

private _specialUnitsWeights = [
    1.0,
    0.8,
    0.4,
    0.1,
    0.07
];

private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate], // to-do: allow press to spawn but make them special infected
    ["Worker", _workerTemplate], // needed to be normal for resources, factories, etc
    ["Man", _manTemplate],
    ["Special", _manTemplate, [["baseClass", [_specialUnits, _specialUnitsWeights], true]]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;