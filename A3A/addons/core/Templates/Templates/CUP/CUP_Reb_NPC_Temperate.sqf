///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "NPC"] call _fnc_saveToTemplate;                         //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;                         //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", ""] call _fnc_saveToTemplate;                 //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "Faction_CUP_NAPA"] call _fnc_saveToTemplate;             //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

["vehicleBasic", "I_Quadbike_01_F"] call _fnc_saveToTemplate;
["vehicleLightUnarmed", "CUP_I_Hilux_armored_unarmed_NAPA"] call _fnc_saveToTemplate;
["vehicleLightArmed", "CUP_I_Hilux_DSHKM_NAPA"] call _fnc_saveToTemplate;
["vehicleTruck", "CUP_V3S_Open_NAPA"] call _fnc_saveToTemplate;
["vehicleAT", "CUP_I_Hilux_SPG9_NAPA"] call _fnc_saveToTemplate;
["vehicleAA", "CUP_I_Hilux_zu23_NAPA"] call _fnc_saveToTemplate;
["vehicleBoat", "I_G_Boat_Transport_01_F"] call _fnc_saveToTemplate;
["vehicleRepair", "CUP_I_V3S_Repair_TKG"] call _fnc_saveToTemplate;
["vehiclePlane", "CUP_C_DC3_CIV"] call _fnc_saveToTemplate;
["vehicleHeli", ""] call _fnc_saveToTemplate;

["vehicleCivCar", "CUP_O_Hilux_unarmed_CR_CIV"] call _fnc_saveToTemplate;
["vehicleCivTruck", "CUP_C_Ural_Civ_03"] call _fnc_saveToTemplate;
["vehicleCivHeli", "CUP_C_412"] call _fnc_saveToTemplate;
["vehicleCivBoat", "C_Rubberboat"] call _fnc_saveToTemplate;

["staticMG", "CUP_I_DSHKM_NAPA"] call _fnc_saveToTemplate;
["staticAT", "CUP_I_SPG9_NAPA"] call _fnc_saveToTemplate;
["staticAA", "CUP_I_ZU23_NAPA"] call _fnc_saveToTemplate;

["staticMortar", "CUP_I_2b14_82mm_NAPA"] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;                 //this line determines AT mines needed for spawning in minefields -- Example: ["minefieldAT", ["ATMine_Range_Mag"]] -- String, can only use one
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;             //this line determines APERS mines needed for spawning in minefields -- Example: ["minefieldAPERS", ["APERSMine_Range_Mag"]] -- String, can only use one

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_sgun_CZ584", "CUP_srifle_CZ550_rail", "CUP_srifle_Remington700", "CUP_1Rnd_12Gauge_Pellets_No00_Buck", "CUP_1Rnd_12Gauge_Pellets_No3_Buck", "CUP_5x_22_LR_17_HMR_M", "CUP_6Rnd_762x51_R700",
    "CUP_hgun_M9", "CUP_hgun_TaurusTracker455", "CUP_15Rnd_9x19_M9", "CUP_6Rnd_45ACP_M",
    "CUP_launch_RPG18",
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "CUP_V_I_Carrier_Belt", "CUP_V_I_Guerilla_Jacket", "CUP_V_I_RACS_Carrier_Rig_2", "CUP_V_I_RACS_Carrier_Rig_wdl_2",
    "CUP_V_RUS_Smersh_New_Light", "CUP_V_OI_TKI_Jacket1_06", "CUP_V_OI_TKI_Jacket5_05", "CUP_V_OI_TKI_Jacket5_06", "CUP_V_OI_TKI_Jacket3_04",
    "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk",
    "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "tf_anprc155"};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "TFAR_anprc155"};

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "CUP_O_TKI_Khet_Partug_05",
    "CUP_O_TKI_Khet_Partug_04",
    "CUP_I_B_PARA_Unit_8",
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_I_GUE_Woodland1",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_WorkU_01",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];          //Uniforms given to Normal Rebels

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Rebels

if (allowDLCEnoch) then {_dlcUniforms append [];
};

if (allowDLCExpansion) then {_dlcUniforms append [];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Pakol_1_01",
    "CUP_H_TKI_Pakol_1_02",
    "CUP_H_TKI_Pakol_1_03",
    "CUP_H_TKI_Pakol_1_04"
]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

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