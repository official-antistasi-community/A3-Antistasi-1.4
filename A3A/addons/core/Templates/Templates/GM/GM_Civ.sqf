//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "gm_gc_civ_p601",  1
    ,"gm_gc_ff_p601", 0.2
    ,"gm_gc_dp_p601", 0.2
    ,"gm_ge_civ_typ1200", 2
    ,"gm_ge_dbp_typ1200", 0.2
    ,"gm_ge_ff_typ1200", 0.2
    ]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "gm_ge_civ_u1300l", 1
    ,"gm_ge_ff_u1300l_firefighter", 0.2
    ,"gm_gc_civ_ural375d_cargo",  1  ]] call _fnc_saveToTemplate;

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

["vehiclesCivMedical", [
    "C_Van_02_medevac_F", 0.1
    ,"gm_gc_civ_mi2sr", 0.1
    ,"gm_ge_adak_bo105m_vbh", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Van_01_fuel_F", 0.2
    ,"C_Truck_02_fuel_F", 0.1]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

_uniforms = [
        "gm_ge_ff_uniform_man_80_orn",
        "gm_ge_army_uniform_pilot_sar",
        "gm_ge_army_uniform_pilot_rolled_sar",
        "gm_gc_civ_uniform_pilot_80_blk",
        "gm_gc_civ_uniform_man_03_80_blu",
        "gm_gc_civ_uniform_man_03_80_grn",
        "gm_gc_civ_uniform_man_03_80_gry"
    ];

_postUni = ["gm_ge_dbp_uniform_suit_80_blu"];

_wokerUni = [ "gm_gc_civ_uniform_man_04_80_blu", "gm_gc_civ_uniform_man_04_80_gry"];

_civHats = ["gm_ge_headgear_winterhat_80_oli", "gm_ge_headgear_hat_beanie_blk"];

["uniforms", _uniforms + _postUni + _wokerUni ] call _fnc_saveToTemplate;

["headgear", _civHats] call _fnc_saveToTemplate;

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["pressUniforms", _postUni];
_loadoutData set ["workerUniforms", _wokerUni];
_loadoutData set ["pressVests", ["gm_dk_army_vest_m00_blu"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["gm_dk_headgear_m96_blu"]];

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
