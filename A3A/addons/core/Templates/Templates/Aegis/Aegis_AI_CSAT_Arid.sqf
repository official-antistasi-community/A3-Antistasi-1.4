private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSAT"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CSAT"]] call _fnc_saveToTemplate;

["flag", "Flag_CSAT_F"] call _fnc_saveToTemplate;
["flagTexture", "A3\Data_F\Flags\Flag_CSAT_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CSAT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     
["surrenderCrate", "Box_East_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_CSAT_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["O_Quadbike_01_F"]] call _fnc_saveToTemplate;

private _lightUnarmed = ["O_MRAP_02_F"];
private _lightArmed = ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
if (_hasApex) then {
    _lightUnarmed pushBack "O_LSV_02_unarmed_F";
    _lightArmed append ["O_LSV_02_AT_F", "O_LSV_02_armed_F"];
};
["vehiclesLightUnarmed", _lightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _lightArmed] call _fnc_saveToTemplate;

["vehiclesTrucks", ["O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"]] call _fnc_saveToTemplate;
private _cargoTrucks = ["O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"];
["vehiclesAmmoTrucks", ["O_Truck_02_Ammo_F", "O_Truck_03_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_Truck_02_box_F", "O_Truck_03_repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_Truck_03_fuel_F", "O_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_Truck_02_medical_F", "O_Truck_03_medical_F"]] call _fnc_saveToTemplate;
private _lightAPCs = ["O_APC_Wheeled_02_rcws_v2_F"];
private _apcs = ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_v2_F"];
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesAirborne", ["O_APC_Wheeled_02_rcws_v2_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["O_APC_Wheeled_02_rcws_v2_F"]] call _fnc_saveToTemplate;
private _tanks = ["O_MBT_02_cannon_F"];
["vehiclesAA", ["O_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_Plane_Transport_01_infantry_F", "O_T_VTOL_02_infantry_hex_F"]] call _fnc_saveToTemplate;


private _lightHelicopters = ["O_Heli_Light_02_unarmed_F"];
private _transportHelicopters = ["O_Heli_Light_02_unarmed_F"];

if (_hasHelicopters) then {
    _transportHelicopters append ["O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_bench_F"]; 
};

["vehiclesHelisLight", _lightHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
private _lightAttackHelicopters = ["O_Heli_Light_02_dynamicLoadout_F"];
["vehiclesHelisAttack", ["O_Heli_Attack_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_MBT_02_arty_F", "O_Truck_02_MRL_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["O_Truck_02_MRL_F", ["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]],
["O_MBT_02_arty_F",["32Rnd_155mm_Mo_shells_O", "2Rnd_155mm_Mo_Cluster_O"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = if (_hasWs) then {["O_UAV_02_lxWS", "O_UAV_01_F"]} else {["O_UAV_01_F"]};
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["O_MRAP_02_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_Truck_02_transport_F", "O_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_MRAP_02_F"]] call _fnc_saveToTemplate;
private _militiaAPCs = ["O_APC_Wheeled_02_rcws_v2_F"];

private _policeVehs = if (_hasContact) then {
    ["B_GEN_Offroad_01_covered_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_gen_F"]
} else {
    ["B_GEN_Offroad_01_gen_F"]
};

["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;

["staticMGs", ["O_HMG_01_high_F", "O_HMG_01_high_F", "O_HMG_01_high_F", "O_GMG_01_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "O_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "O_SAM_System_04_F"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

if (_hasTanks) then {
    _tanks append ["O_MBT_04_cannon_F", "O_MBT_04_command_F"];
};

if (_hasWs) then {
    _cargoTrucks = ["O_Truck_02_cargo_lxWS", "O_Truck_02_flatbed_lxWS"];
    _lightAPCs = ["O_APC_Wheeled_02_hmg_lxWS"];
    _militiaAPCs = ["O_APC_Wheeled_02_hmg_lxWS"];
    _apcs pushBack "O_APC_Tracked_02_30mm_lxWS";
};

["vehiclesLightAPCs", _lightAPCs] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _cargoTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _militiaAPCs] call _fnc_saveToTemplate;
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesAPCs", _apcs] call _fnc_saveToTemplate;
["vehiclesHelisLight", _lightHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _lightAttackHelicopters] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

["animations", [
    ["O_MBT_04_command_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["O_MBT_04_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["O_MBT_02_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3, "showLog", 0.4]],
    ["O_APC_Wheeled_02_hmg_lxWS", ["mg_hide_armor_front",0.3,"mg_hide_armor_rear",0.3,"mg_Hide_Rail",0.3,"showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_APC_Wheeled_02_unarmed_lxWS", ["showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_APC_Wheeled_02_rcws_v2_F", ["showCanisters",0.3,"showTools",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_LSV_02_armed_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_LSV_02_unarmed_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_LSV_02_AT_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_APC_Tracked_02_cannon_F", ["showTracks",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_APC_Tracked_02_30mm_lxWS", ["showTracks",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_APC_Tracked_02_AA_F", ["showTracks",0.3,"showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3]]
]] call _fnc_saveToTemplate;

["variants", [
    ["O_Heli_Light_02_unarmed_F", ["Opfor",0.3]],
    ["O_Heli_Light_02_dynamicLoadout_F", ["Opfor",0.3]]
]] call _fnc_saveToTemplate;
/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;

private _faces = [
    "PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03",
    "PersianHead_A3_06","PersianHead_A3_07", "PersianHead_A3_05"
];
if (_hasWs) then {
    _faces append [
        "CamoHead_Persian_01_F", 
        "CamoHead_Persian_02_F", 
        "CamoHead_Persian_03_F", 
        "lxWS_African_Head_01", 
        "lxWS_African_Head_02", 
        "lxWS_African_Head_05",
        "lxWS_African_Head_04",
        "lxWS_Said_Head",
        "lxWS_African_Head_Old_Bard",
        "lxWS_African_Head_03"
    ];
};
["faces", _faces] call _fnc_saveToTemplate;

["insignia", ["CSAT_ScimitarRegiment", "GryffinRegiment", ""]] call _fnc_saveToTemplate;
["milInsignia", ["CSAT_Patch", "", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["CSAT_ScorpionRegiment", "", ""]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["launch_RPG32_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];

_loadoutData set ["ATLaunchers", [
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HEAT"], [], ""],
["launch_O_Vorona_brown_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""],
["launch_O_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT", "Titan_AP"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_O_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", ["hgun_Rook40_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["officerUniforms", ["U_O_OfficerUniform_ocamo"]];
_loadoutData set ["officerVests", ["V_TacVest_khk"]];
_loadoutData set ["officerHats", ["H_MilCap_ocamo", "H_Beret_CSAT_01_F"]];

_loadoutData set ["traitorUniforms", ["U_O_officer_noInsignia_hex_F"]];
_loadoutData set ["traitorVests", ["V_TacVest_brn", "V_TacVest_khk", "V_BandollierB_cbr", "V_BandollierB_khk"]];
_loadoutData set ["traitorHats", ["H_Cap_tan"]];

_loadoutData set ["cloakUniforms", ["U_O_FullGhillie_ard", "U_O_FullGhillie_sard", "U_O_GhillieSuit", "U_O_C_D_Sniper_oicamo_F"]];
_loadoutData set ["cloakVests", ["V_HarnessOSpec_brn", "V_HarnessO_brn", "V_TacVest_khk"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_ocamo"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_hex_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_CSAT_01_F", "H_MilCap_ocamo"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack"
]];
_loadoutData set ["goggles", ["G_Lowprofile"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_O_SpecopsUniform_ocamo"]];
_sfLoadoutData set ["vests", ["V_HarnessO_brn"]];
_sfLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_sfLoadoutData set ["Hvests", ["V_TacVest_brn"]];
_sfLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["H_HelmetSpecO_ocamo"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_sfLoadoutData set ["slRifles", [
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_Katiba_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

if (_hasWs) then {
    _sfLoadoutData set ["designatedGrenadeLaunchers", [
        ["glaunch_GLX_lxWS", "", "acc_pointer_IR", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""],
        ["glaunch_GLX_hex_lxWS", "", "acc_pointer_IR", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell"], [], ""]
    ]];
};

_sfLoadoutData set ["SMGs", [
["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco", [], [], ""],
["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];

private _mgs = [
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Aco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_ACO_grn", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
];

if (_hasWs) then {
    _mgs append [
        ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR", "optic_Aco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "suppressor_h_lxWS", "acc_pointer_IR", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]
    ];
};
_sfLoadoutData set ["machineGuns", _mgs];

private _marksmanRifles = [
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_DMS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_NVS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "muzzle_snds_B", "", "optic_SOS", [], [], "bipod_02_F_hex"]
];

if (_hasMarksman) then {
    _marksmanRifles append [
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_01_F_blk"]
    ];
};

_sfLoadoutData set ["marksmanRifles", _marksmanRifles];
_sfLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_eliteLoadoutData set ["slUniforms", ["U_O_OfficerUniform_ocamo"]];
_eliteLoadoutData set ["vests", ["V_HarnessO_brn"]];
_eliteLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_eliteLoadoutData set ["Hvests", ["V_TacVest_brn"]];
_eliteLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_eliteLoadoutData set ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator_02"]];

_eliteLoadoutData set ["slRifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_Katiba_C_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Aco", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["SMG_03C_TR_camo", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_ACO_grn", [], [], ""],
["SMG_02_F", "", "acc_pointer_IR", "optic_Aco_smg", [], [], ""]
]];

private _mgs = [
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_pointer_IR", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
];
if (_hasWs) then {
    _mgs append [
        ["LMG_S77_lxWS", "", "acc_pointer_IR", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "", "acc_pointer_IR", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]
    ];
};
if (_hasMarksman) then {
    _mgs append [
        ["MMG_01_tan_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_tan"],
        ["MMG_01_hex_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_hex"],
        ["MMG_01_tan_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_tan"]
    ];
};
_eliteLoadoutData set ["machineGuns", _mgs];

private _marksmanRifles = [
    ["srifle_DMR_01_F", "", "", "optic_DMS", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_F", "", "", "optic_SOS", [], [], "bipod_02_F_hex"]
];
if (_hasMarksman) then {
    _marksmanRifles append [
        ["srifle_DMR_05_blk_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
        ["srifle_DMR_05_hex_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_hex"],
        ["srifle_DMR_05_tan_f", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_tan"]
    ];
};
_eliteLoadoutData set ["marksmanRifles", _marksmanRifles];

_eliteLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_militaryLoadoutData set ["slUniforms", ["U_O_OfficerUniform_ocamo"]];
_militaryLoadoutData set ["vests", ["V_HarnessO_brn"]];
_militaryLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_militaryLoadoutData set ["Hvests", ["V_TacVest_brn"]];
_militaryLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_militaryLoadoutData set ["helmets", ["H_HelmetO_ocamo", "H_HelmetLeaderO_ocamo"]];

_militaryLoadoutData set ["slRifles", [
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Katiba_GL_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_Katiba_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_Katiba_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
["arifle_Katiba_C_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_Katiba_GL_F", "", "acc_flashlight", "optic_ACO_grn", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_01_F", "", "", "optic_Aco", [], [], ""],
["SMG_01_F", "", "", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_ACO_grn", [], [], ""],
["SMG_03C_TR_camo", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_ACO_grn", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];

private _mgs = [
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_NVS", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_ACO_grn", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
    ["LMG_Zafir_F", "", "acc_flashlight", "optic_Arco", ["150Rnd_762x54_Box", "150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
];
if (_hasWs) then {
    _mgs append [
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_Arco", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["LMG_S77_Hex_lxWS", "", "acc_flashlight", "optic_ACO_grn", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""]
    ];
};
_militaryLoadoutData set ["machineGuns", _mgs];

_militaryLoadoutData set ["marksmanRifles", [
["srifle_DMR_01_F", "", "", "optic_NVS", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "", "", "optic_DMS", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
["srifle_DMR_01_F", "", "", "optic_SOS", [], [], "bipod_02_F_hex"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["hgun_Rook40_F"]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
private _helmets = ["H_MilCap_gen_F", "H_Beret_gen_F"];
if (_hasLawsOfWar) then {
    _helmets pushBack "H_PASGT_basic_blue_F";
};
_policeLoadoutData set ["helmets", _helmets];

_policeLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco", [], [], ""],
["SMG_01_F", "", "acc_flashlight_smg_01", "optic_Aco_smg", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_ACO_grn", [], [], ""],
["SMG_03C_TR_black", "", "acc_flashlight", "optic_Aco_smg", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_ACO_grn", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "optic_Aco_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_Rook40_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_O_LCF_noInsignia_hex_lxws", "Aegis_U_O_CombatUniform_tshirt_hex_F", "Aegis_U_O_CombatFatigues_F", "Aegis_U_O_CombatFatigues_02_F"]];
_militiaLoadoutData set ["slUniforms", ["U_O_OfficerUniform_ocamo"]];
_militiaLoadoutData set ["vests", ["V_HarnessO_brn", "Atlas_V_OCarrierRig_Lite_Hex_F", "Atlas_V_OCarrierRig_Lite_khk_F"]];
_militiaLoadoutData set ["glVests", ["V_HarnessOGL_brn", "Atlas_V_OCarrierRig_GL_khk_F", "Atlas_V_OCarrierRig_GL_Hex_F"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_brn", "Atlas_V_OCarrierRig_CQB_khk_F", "Atlas_V_OCarrierRig_CQB_Hex_F"]];
_militiaLoadoutData set ["backpacks", ["B_TacticalPack_ocamo", "B_Carryall_ocamo", "B_FieldPack_ocamo", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_militiaLoadoutData set ["helmets", ["H_Cap_brn_SPECOPS", "H_Bandanna_cbr", "H_ShemagOpen_tan", "H_O_Helmet_canvas_ocamo", "H_PASGT_basic_sand_F"]];

private _slRifles = [
    ["arifle_Mk20_hex_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["arifle_Mk20_GL_hex_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_Katiba_F", "", "acc_flashlight", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
    ["arifle_Katiba_GL_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
];
private _rifles = [
    ["arifle_Katiba_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
    ["arifle_Mk20_hex_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
private _carbines = [
    ["arifle_Katiba_C_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], [], ""],
    ["arifle_Mk20C_hex_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
private _grenadeLaunchers = [
    ["arifle_Katiba_GL_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_hex_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
];
private _mgs = [
    ["LMG_Zafir_F", "", "acc_flashlight", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
];
private _marksmanRifles = [
    ["srifle_DMR_01_F", "", "", "optic_Arco", [], [], "bipod_02_F_hex"],
    ["srifle_DMR_01_black_F", "", "", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"]
];

if (_hasWs) then {
    _rifles append [
        ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
        ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
        ["arifle_Galat_lxWS", "", "acc_flashlight", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
    ];
    _slRifles append [
        ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
        ["arifle_VelkoR5_GL_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
    ];
    _carbines append [
        ["arifle_VelkoR5_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
    ];
    _grenadeLaunchers append [
        ["arifle_VelkoR5_GL_lxWS", "", "acc_flashlight", "", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""]
    ];
    _mgs append [
        ["LMG_S77_lxWS", "", "acc_flashlight", "optic_MRCO", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
        ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
        ["arifle_Velko_lxWS", "", "acc_flashlight", "", ["50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_reload_tracer_green_lxWS", "50Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
    ];
    _marksmanRifles append [
        ["arifle_SLR_lxWS", "", "", "optic_MRCO", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
        ["arifle_SLR_lxWS", "", "", "optic_MRCO", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]
    ];
};
_militiaLoadoutData set ["slRifles", _slRifles];
_militiaLoadoutData set ["rifles", _rifles];
_militiaLoadoutData set ["carbines", _carbines];
_militiaLoadoutData set ["grenadeLaunchers",_grenadeLaunchers];
_militiaLoadoutData set ["machineGuns", _mgs];
_militiaLoadoutData set ["marksmanRifles", _marksmanRifles];

_militiaLoadoutData set ["SMGs", [
["SMG_01_F", "", "acc_flashlight_smg_01", "", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_GM6_F", "", "", "optic_Arco", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
["srifle_GM6_F", "", "", "optic_Arco_blk_F", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_Rook40_F"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_O_CombatUniform_ocamo"]];
_crewLoadoutData set ["vests", ["V_HarnessO_brn"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_O"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_O_PilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_BandollierB_khk"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;