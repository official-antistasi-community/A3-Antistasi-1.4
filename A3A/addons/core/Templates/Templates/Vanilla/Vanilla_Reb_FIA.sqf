///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["I_G_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["I_G_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["I_G_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesAT", ["I_G_Offroad_01_AT_F"]] call _fnc_saveToTemplate;
private _vehicleAA = [];

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
private _staticAA = ["I_static_AA_F"];
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;


if (allowDLCWS) then {
  _vehicleAA append ["I_Tura_Truck_02_aa_lxWS"];
  _staticAA insert [0, ["I_Tura_ZU23_lxWS"]];
};
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

#include "Vanilla_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"hgun_Pistol_heavy_02_F","hgun_P07_F",
"SMG_01_F","SMG_02_F",
"6Rnd_45ACP_Cylinder","16Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_9x21_Mag_SMG_02","MiniGrenade","SmokeShell",
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_khk",
"V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr",
"V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt",
"Binocular",
"acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol"];

if (allowDLCExpansion) then {
    _initialRebelEquipment append [["launch_RPG7_F", 15], ["RPG7_F", 45]];
} else {
    _initialRebelEquipment append [["launch_RPG32_F", 15], ["RPG32_F", 30]];
};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F",
    "U_I_L_Uniform_01_deserter_F"
];

private _dlcUniforms = [];

if (allowDLCEnoch) then {_dlcUniforms append [
    "U_I_L_Uniform_01_camo_F"
];
};

if (allowDLCExpansion) then {_dlcUniforms append [
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Camo_F"
];
};

if (allowDLCWS) then {_dlcUniforms append [
    "U_lxWS_ION_Casual1",
    "U_lxWS_ION_Casual2",
    "U_lxWS_ION_Casual3",
    "U_lxWS_ION_Casual4",
    "U_lxWS_ION_Casual5",
    "U_lxWS_SFIA_deserter"
];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_ShemagOpen_tan",
    "H_Shemag_olive_hs",
    "H_Bandanna_khk_hs",
    "H_Bandanna_sand",
    "H_Bandanna_cbr"
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
