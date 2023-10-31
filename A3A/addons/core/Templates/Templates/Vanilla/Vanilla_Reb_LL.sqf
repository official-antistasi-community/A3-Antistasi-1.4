private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "LL"] call _fnc_saveToTemplate;

["flag", "Flag_Green_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_green_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_EnochLooters"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["I_G_Offroad_01_F"];
private _vehiclesLightArmed = ["I_G_Offroad_01_armed_F"];
private _vehiclesAt = ["I_G_Offroad_01_AT_F"];
["vehiclesTruck", ["I_G_Van_01_transport_F"]] call _fnc_saveToTemplate;;
private _vehiclesAA = [];

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlane", ["I_C_Plane_Civil_01_F"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F"];
["vehiclesCivTruck", ["C_Truck_02_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;


["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
private _staticAA = ["I_static_AA_F"];
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

if (_hasApex) then {
    _vehiclesCivCar pushBack "C_Offroad_02_unarmed_F";
    _vehiclesLightUnarmed pushBack "I_C_Offroad_02_unarmed_F";
    _vehiclesLightArmed pushBack "I_C_Offroad_02_LMG_F";
    _vehiclesAt pushBack "I_C_Offroad_02_AT_F";
};
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAt] call _fnc_saveToTemplate;

if (_hasWs) then {
  _vehiclesAA pushBack "I_Tura_Truck_02_aa_lxWS";
  _staticAA = ["I_Tura_ZU23_lxWS"];
};
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

//classname, price, type, availability condition
private _shopWs = if (_hasWs) then {
    [
        ["I_UAV_02_lxWS", 3500, "UAV", {tierWar > 2}], 
        ["I_G_UAV_02_IED_lxWS", 4500, "UAV", {tierWar > 3}],
        ["I_G_Offroad_01_armor_base_lxWS", 4500, "UNARMEDCAR", {true}],
        ["I_G_Offroad_01_armor_armed_lxWS", 4500, "ARMEDCAR", {true}],
        ["I_G_Offroad_01_armor_AT_lxWS", 4500, "ARMEDCAR", {true}]
    ]
} else {
    []
};

private _vehiclesBlackMarket = _shopWs + [
    ["I_UAV_01_F", 2000, "UAV", {true}],
    ["I_LT_01_AA_F", 7500, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],
    ["I_APC_Wheeled_03_cannon_F", 15000, "APC", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count seaports > 0}],
    ["B_Heli_Light_01_dynamicLoadout_F", 25000, "HELI", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}]
];
["blackMarketStock", _vehiclesBlackMarket] call _fnc_saveToTemplate;

["variants", [
    ["I_APC_Wheeled_03_cannon_F", ["Guerilla_01",1]],
    ["I_LT_01_AA_F", ["Indep_Olive",1]]
]] call _fnc_saveToTemplate;

#include "Vanilla_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "hgun_Pistol_heavy_02_F",
    "hgun_PDW2000_F",
    "30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag",
    "6Rnd_45ACP_Cylinder","MiniGrenade","SmokeShell",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_khk",
    "V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt",
    "Binocular",
    "acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol"
];

if (_hasLawsOfWar) then {
    _initialRebelEquipment append [
        "V_Pocketed_olive_F", 
        "V_Pocketed_coyote_F", 
        "V_Pocketed_black_F"
    ];
};

private _backpacks =  [];
if (_hasLawsOfWar) then {
    _backpacks append [
        "B_Messenger_Black_F", 
        "B_Messenger_Coyote_F", 
        "B_Messenger_Gray_F",
        "B_Messenger_Olive_F", 
        "B_LegStrapBag_black_F", 
        "B_LegStrapBag_coyote_F", 
        "B_LegStrapBag_olive_F"
    ];
} else {
    _backpacks append ["B_FieldPack_blk","B_AssaultPack_blk"];
};

_initialRebelEquipment append _backpacks;

if (_hasContact) then {
    _initialRebelEquipment append [
        "sgun_HunterShotgun_01_F",
        "sgun_HunterShotgun_01_sawedoff_F",
        "2Rnd_12Gauge_Pellets",
        "2Rnd_12Gauge_Slug"
    ];
};

if (_hasApex) then {
    _initialRebelEquipment append [
        "hgun_Pistol_01_F",
        "10Rnd_9x21_Mag",
        ["launch_RPG7_F", 3], 
        ["RPG7_F", 9]
    ];
} else {
    _initialRebelEquipment append [["launch_RPG32_F", 2], ["RPG32_F", 6]];
};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_IG_Guerrilla_6_1",
    "U_BG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Camo_F"
];

private _dlcUniforms = [];

if (_hasContact) then {
    _dlcUniforms append [
        "U_I_L_Uniform_01_camo_F",
        "U_I_L_Uniform_01_tshirt_black_F",
        "U_I_L_Uniform_01_tshirt_olive_F",
        "U_I_L_Uniform_01_tshirt_skull_F",
        "U_I_L_Uniform_01_tshirt_sport_F"
    ];
};


["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Cap_oli",
    "H_Cap_grn",
    "H_Booniehat_oli",
    "H_Bandanna_sgg",
    "H_Bandanna_khk"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;
["faces", [
    "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
    "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
    "LivonianHead_9", "LivonianHead_10",
    "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
    "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
    "WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
    "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms + _dlcUniforms];

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
