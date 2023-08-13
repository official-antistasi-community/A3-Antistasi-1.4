///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Tura"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["O_SFIA_Offroad_lxWS","O_Tura_Offroad_armor_lxWS"];
private _vehiclesLightArmed = ["O_SFIA_Offroad_armed_lxWS","O_Tura_Offroad_armor_armed_lxWS"];
["vehiclesTruck", ["I_G_Van_01_transport_F"]] call _fnc_saveToTemplate;
private _vehiclesAT = ["O_SFIA_Offroad_AT_lxWS","O_Tura_Offroad_armor_AT_lxWS"];
["vehiclesAA", ["I_Tura_Truck_02_aa_lxWS"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["C_Offroad_lxWS", "C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F"];
["vehiclesCivTruck", ["C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["I_Tura_ZU23_lxWS"]] call _fnc_saveToTemplate;
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

if ("expansion" in A3A_enabledDLC) then {
    _vehiclesCivCar append ["C_Offroad_02_unarmed_F"];
	_vehiclesLightUnarmed append ["I_C_Offroad_02_unarmed_F"];
	_vehiclesLightArmed append ["I_C_Offroad_02_LMG_F"];
	_vehiclesAT append ["I_C_Offroad_02_AT_F"];
};
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;


#include "WS_Reb_Vehicle_Attributes.sqf"

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
    "U_lxWS_Djella_02_Sand",
    "U_lxWS_Djella_03_Green",
    "U_lxWS_Djella_02_Grey",
    "U_lxWS_Djella_02_Brown",
    "U_lxWS_SFIA_deserter"
];

private _dlcUniforms = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_lxWS_ION_Casual1",
    "U_lxWS_ION_Casual2",
    "U_lxWS_ION_Casual3",
    "U_lxWS_ION_Casual4",
    "U_lxWS_ION_Casual5"
];

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

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "lxWS_H_turban_02_yellow",
    "lxWS_H_turban_02_gray",
    "lxWS_H_turban_02_sand",
    "lxWS_H_turban_02_red",
    "lxWS_H_turban_02_orange",
    "lxWS_H_turban_02_green_pattern",
    "lxWS_H_turban_02_green",
    "lxWS_H_turban_02_blue",
    "lxWS_H_turban_02_black",
    "lxWS_H_turban_03_yellow",
    "lxWS_H_turban_03_gray",
    "lxWS_H_turban_03_sand",
    "lxWS_H_turban_03_red",
    "lxWS_H_turban_03_orange",
    "lxWS_H_turban_03_green_pattern",
    "lxWS_H_turban_03_green",
    "lxWS_H_turban_03_blue",
    "lxWS_H_turban_03_black",
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

["faces", ["lxWS_African_Head_Old","lxWS_African_Head_01","lxWS_African_Head_02",
"lxWS_African_Head_03","lxWS_African_Head_04","lxWS_African_Head_05","lxWS_Said_Head",
"lxWS_African_Head_Old_Bard"]] call _fnc_saveToTemplate;
["voices", ["male01fre", "male02fre", "male03fre"]] call _fnc_saveToTemplate;

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
