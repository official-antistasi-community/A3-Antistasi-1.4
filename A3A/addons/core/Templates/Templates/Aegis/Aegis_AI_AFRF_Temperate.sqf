private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AFRF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AFRF"]] call _fnc_saveToTemplate;

["flag", "Flag_Russia_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\A3_Aegis\Data_F_Aegis\Flags\flag_RUS_CO.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_Russia"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "O_R_supplyCrate_F"] call _fnc_saveToTemplate;     
["surrenderCrate", "Box_RUS_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_RUS_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["O_R_Quadbike_01_F"]] call _fnc_saveToTemplate;

private _lightUnarmed = ["O_R_MRAP_02_F"];
private _lightArmed = ["O_R_MRAP_02_hmg_F", "O_R_MRAP_02_gmg_F"];
if (_hasApex) then {
    _lightUnarmed pushBack "O_R_LSV_02_unarmed_F";
    _lightArmed append ["O_R_LSV_02_AT_F", "O_R_LSV_02_armed_F"];
};
["vehiclesLightUnarmed", _lightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _lightArmed] call _fnc_saveToTemplate;

["vehiclesTrucks", ["O_R_Truck_03_transport_F", "O_R_Truck_03_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["O_R_Truck_02_cargo_F", "O_R_Truck_02_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_R_Truck_03_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_R_Truck_03_repair_F", "O_R_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_R_Truck_03_fuel_F", "O_R_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_R_Truck_03_medical_F", "O_R_APC_Tracked_02_medical_F", "O_R_Truck_02_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["O_R_APC_Wheeled_04_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["Aegis_O_R_APC_Tracked_02_30mm_lxWS"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["Aegis_O_R_APC_Tracked_02_30mm_lxWS"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["O_R_APC_Wheeled_04_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", []] call _fnc_saveToTemplate;
private _tanks = ["O_R_MBT_02_cannon_F"];
if (_hasTanks) then {
    _tanks append ["O_R_MBT_04_cannon_F", "O_R_MBT_04_command_F"];
};
["vehiclesTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesAA", ["Aegis_O_R_Truck_02_aa_F", "O_R_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_R_Boat_Transport_01_ard_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_R_Boat_Armed_01_hmg_ard_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_R_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_R_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["O_T_VTOL_02_infantry_dynamicLoadout_F", "O_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

private _lightHelicopters = ["O_R_Heli_Light_02_unarmed_F"];
private _transportHelicopters = ["O_R_Heli_Light_02_unarmed_F"];

if (_hasHelicopters) then {
    _lightHelicopters pushBack "O_R_Heli_Transport_04_bench_F";
    _transportHelicopters append ["O_R_Heli_Transport_04_covered_F", "O_R_Heli_Transport_04_bench_F"]; 
};

["vehiclesHelisLight", _lightHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _transportHelicopters] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["O_R_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Aegis_O_R_Heli_Attack_04_F", "O_R_Heli_Attack_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_R_MBT_02_arty_F", "O_R_Truck_02_MRL_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["O_R_MBT_02_arty_F", ["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]],
["O_R_Truck_02_MRL_F",["32Rnd_155mm_Mo_shells_O", "2Rnd_155mm_Mo_Cluster_O"]]
]] call _fnc_saveToTemplate;
["uavsAttack", ["O_R_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = if (_hasWs) then {["Aegis_O_R_UAV_02_lxWS", "O_R_UAV_01_F"]} else {["O_R_UAV_01_F"]};
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["O_G_Offroad_01_armed_F", "O_G_Offroad_01_AT_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_R_Truck_02_transport_F", "O_R_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_G_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["O_R_APC_Wheeled_04_cannon_F"]] call _fnc_saveToTemplate;

private _policeVehs = if (_hasContact) then {
    ["B_GEN_Offroad_01_covered_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_gen_F"]
} else {
    ["B_GEN_Offroad_01_gen_F"]
};

["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;

["staticMGs", ["O_HMG_01_high_F", "O_HMG_01_high_F", "O_HMG_01_high_F", "O_GMG_01_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_R_Static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_R_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_R_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "O_R_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "O_R_SAM_System_04_F"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

if (_hasTanks) then {
    _tanks append ["O_MBT_04_cannon_F", "O_MBT_04_command_F"];
};

["variants", [
    ["O_T_VTOL_02_infantry_dynamicLoadout_F", ["Grey",1]],
    ["O_Plane_Transport_01_infantry_F", ["Grey",1]],
    ["O_G_Offroad_01_armed_F", ["Olive", 1]],
    ["O_G_Offroad_01_AT_F", ["Olive", 1]],
    ["O_G_Offroad_01_F", ["Olive", 1]]
]] call _fnc_saveToTemplate;

["animations", [
    ["O_R_MBT_04_command_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["O_R_MBT_04_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["O_R_MBT_02_cannon_F", ["showCamonetHull", 0.3, "showCamonetTurret", 0.3, "showLog", 0.4]],
    ["O_R_LSV_02_armed_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_R_LSV_02_unarmed_F", ["Unarmed_Doors_Hide",0.3]],
    ["O_R_LSV_02_AT_F", ["Unarmed_Doors_Hide",0.3]],
    ["Aegis_O_R_APC_Tracked_02_30mm_lxWS", ["showTracks",0.3,"showCamonetHull",0.3,"showSLATHull",0.3]],
    ["O_R_APC_Tracked_02_AA_F", ["showTracks",0.3,"showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3]]
]] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
["faces", [
	"RussianHead_1", 
	"RussianHead_2", 
	"RussianHead_3", 
	"RussianHead_4", 
	"RussianHead_5", 
	"WhiteHead_29", 
	"WhiteHead_30", 
	"LivonianHead_1", 
	"LivonianHead_2",
	"LivonianHead_3",
	"LivonianHead_4",
	"LivonianHead_5",
	"LivonianHead_6",
	"LivonianHead_7",
	"LivonianHead_8",
	"LivonianHead_9",
	"LivonianHead_10",
	"AsianHead_A3_03",
	"AsianHead_A3_06",
	"Mavros"
]] call _fnc_saveToTemplate; 

["sfInsignia", ["Spetsnaz223rdDetachment", "", ""]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", [
["launch_O_Titan_camo_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];
_loadoutData set ["policeWeapons", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade_East", "HandGrenade_Guer"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["O_NVGoggles_grn_F"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_O_R_officer_noInsignia_taiga_F"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli", "V_BandollierB_rgr"]];
_loadoutData set ["traitorHats", ["H_Watchcap_camo_hs", "H_MilCap_taiga"]];

_loadoutData set ["officerUniforms", ["U_O_R_OfficerUniform_taiga_F"]];
_loadoutData set ["officerVests", ["V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["H_MilCap_taiga"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_taiga_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Watchcap_camo_hs", "H_MilCap_taiga"]];
_loadoutData set ["sniHats", ["H_Cap_headphones", "H_Booniehat_taiga"]];

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
    "G_Sport_Greenblack",
    "G_Balaclava_blk",
    "G_Balaclava_oli",
    "G_Bandanna_oli",
    "G_Bandanna_shades"
]];
_loadoutData set ["goggles", ["G_Lowprofile", "G_Balaclava_lowprofile"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["Opf_U_O_S_Gorka_01_autumn_F", "U_O_R_Gorka_01_brown_F", "U_O_R_Gorka_01_F"]];
_sfLoadoutData set ["vests", ["V_SmershVest_01_F", "V_SmershVest_01_radio_F"]];
_sfLoadoutData set ["backpacks", ["B_Carryall_green_exp_F", "B_AssaultPackSpec_rgr"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_green_exp_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetAggressor_cover_taiga_F", "H_HelmetAggressor_F", "H_Bandanna_khk", "H_Watchcap_camo_hs", "H_Booniehat_taiga"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_02"]];
_sfLoadoutData set ["NVGs", ["O_NVGoggles_grn_F"]];

_sfLoadoutData set ["slRifles", [
["arifle_AK12_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR_lush_lxWS", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""],
["arifle_AK12_GL_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareCIR_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR_lush_lxWS", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareCIR_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_AK12_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR_lush_lxWS", "optic_Holosight_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_AK12U_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_ACO_grn_AK_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR_lush_lxWS", "optic_Holosight_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], ["1Rnd_HEDP_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_AK12_GL_lush_F", "aegis_muzzle_snds_pbs_762_lush", "acc_pointer_IR_lush_lxWS", "optic_Arco_AK_lush_F", ["30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_F", "30rnd_762x39_AK12_Lush_Mag_Tracer_F"], ["1Rnd_HEDP_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""]
]];

_sfLoadoutData set ["machineGuns", [
    ["arifle_RPK12_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_NVS", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
    ["arifle_RPK12_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
    ["arifle_RPK12_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];

private _marksmanRifles = [
    ["srifle_DMR_01_black_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_NVS", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "aegis_muzzle_snds_pbs_762_blk", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_blk"]
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
["hgun_Rook40_F", "muzzle_snds_L", "", "", [], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_O_R_CombatUniform_taiga_F", "U_O_R_CombatUniform_taiga_F", "U_O_R_CombatUniform_taiga_F", "U_O_R_CombatUniform_tshirt_taiga_F"]];
_eliteLoadoutData set ["vests", ["V_TacVest_grn"]];
_eliteLoadoutData set ["glVests", ["V_lxWS_TacVestIR_oli"]];
_eliteLoadoutData set ["Hvests", ["V_lxWS_TacVestIR_oli"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_green_F", "B_Carryall_green_F", "B_FieldPack_khk"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_green_F"]];
_eliteLoadoutData set ["helmets", ["H_HelmetAggressor_cover_taiga_F", "H_HelmetAggressor_cover_F", "H_HelmetAggressor_F"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator_01_khk_F"]];
_eliteLoadoutData set ["NVGs", ["O_NVGoggles_grn_F"]];

_eliteLoadoutData set ["lightATLaunchers", [
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_F"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HEAT"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "UGL_FlareCIR_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12U_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

_eliteLoadoutData set ["machineGuns", [
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_NVS", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_RPK12_F", "", "acc_pointer_IR", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];

private _marksmanRifles = [
    ["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_DMS", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_Arco", [], [], "bipod_02_F_blk"],
    ["srifle_DMR_01_black_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_02_F_blk"]
];
if (_hasMarksman) then {
    _marksmanRifles append [
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_Nightstalker", [], [], "bipod_02_F_blk"],
        ["srifle_DMR_04_F", "", "acc_pointer_IR", "optic_DMS_weathered_Kir_F", [], [], "bipod_02_F_blk"]
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
_militaryLoadoutData set ["uniforms", ["Atlas_U_O_Afghanka_01_rutaiga_F", "Atlas_U_O_Afghanka_02_rutaiga_F"]];
_militaryLoadoutData set ["slUniforms", ["Aegis_U_O_LightCombatFatigues_rutaiga_F"]];
_militaryLoadoutData set ["vests", ["Aegis_V_OCarrierLuchnik_Lite_F", "Aegis_V_OCarrierLuchnik_Lite_grn_F", "Aegis_V_OCarrierLuchnik_CQB_F", "Aegis_V_OCarrierLuchnik_CQB_grn_F", "V_SmershVest_01_F", "V_SmershVest_01_radio_F"]];
_militaryLoadoutData set ["glVests", ["Aegis_V_OCarrierLuchnik_GL_F", "Aegis_V_OCarrierLuchnik_GL_grn_F",  "Aegis_V_OCarrierLuchnik_CQB_F", "Aegis_V_OCarrierLuchnik_CQB_grn_F"]];
_militaryLoadoutData set ["backpacks", ["B_FieldPack_green_F", "B_Carryall_green_F"]];
_militaryLoadoutData set ["atBackpacks", ["B_Carryall_green_F"]];
_militaryLoadoutData set ["helmets", ["H_HelmetLuchnik_cover_rutaiga_F", "H_HelmetLuchnik_cover_grn_F", "H_HelmetLuchnik_olive_F", "H_HelmetLuchnik_headset_grn_F"]];
_militaryLoadoutData set ["lightATLaunchers", [
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_F"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HEAT"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
["arifle_AK12_GL_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell"], ""],
["arifle_AK12U_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_AK12_545_F", "", "acc_flashlight", "optic_ACO_grn_AK_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_ACO_grn_AK_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_AK12U_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_ACO_grn_AK_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_545_F", "", "acc_flashlight", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AK12_GL_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["Aegis_arifle_RPK12_545_F", "", "", "optic_NVS", ["Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
["Aegis_arifle_RPK12_545_F", "", "acc_flashlight", "optic_ACO_grn_AK_F", ["Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
["Aegis_arifle_RPK12_545_F", "", "acc_flashlight", "optic_MRCO", ["Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
["Aegis_arifle_RPK12_545_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F", "Aegis_60Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
["arifle_RPK12_F", "", "", "optic_NVS", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
["arifle_RPK12_F", "", "acc_flashlight", "optic_Arco_AK_blk_F", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["srifle_DMR_01_black_F", "", "", "optic_NVS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_DMS", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_Arco_blk_F", [], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "", "optic_SOS", [], [], "bipod_02_F_blk"]
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
_policeLoadoutData set ["policeWeapons", [
["sgun_Mp153_black_F", "", "", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""],
["SMG_02_F", "", "acc_flashlight", "", [], [], ""]
]];

private _sidearms = if (_hasApex) then { ["hgun_Pistol_01_F"] } else { ["hgun_Rook40_F"] };
_policeLoadoutData set ["sidearms", _sidearms];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["helmets", ["lxWS_H_ssh40_green", "H_HelmetLuchnik_olive_F", "H_MilCap_taiga", "H_Watchcap_camo"]];
_militiaLoadoutData set ["uniforms", ["Atlas_U_O_Afghanka_01_rutaiga_F", "Atlas_U_O_Afghanka_02_rutaiga_F"]];
_militiaLoadoutData set ["slUniforms", ["U_O_R_officer_noInsignia_taiga_F"]];
_militiaLoadoutData set ["vests", ["Aegis_V_ChestrigEast_RUtaiga_F", "Aegis_V_ChestrigEast_grn_F", "V_TacVest_grn"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_green_F", "B_FieldPack_green_F", "B_FieldPack_green_F", "B_Carryall_green_F"]];
_militiaLoadoutData set ["atBackpacks", ["B_Carryall_green_F"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["launch_RPG32_green_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""]
]];

_militiaLoadoutData set ["rifles", [
    ["Aegis_arifle_AK74_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_plum_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""],
    ["Aegis_arifle_AKM74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["Aegis_arifle_AKS74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
    ["arifle_AKSM_alt_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["Aegis_arifle_AK74_GL_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_GL_F", "", "", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_AKM74_sand_GL_F", "", "", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["Opf_arifle_SKS_oak_F", "", "acc_flashlight_pistol", "optic_Arco_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
    ["Opf_arifle_SKS_F", "", "acc_flashlight_pistol", "optic_Arco_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["arifle_RPK_F", "", "acc_flashlight_pistol", "", ["75Rnd_762x39_Mag_Green_F", "75Rnd_762x39_Mag_Green_F", "75Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
]];

private _sidearms = if (_hasApex) then { ["hgun_Pistol_01_F"] } else { ["hgun_Rook40_F"] };
_militiaLoadoutData set ["sidearms", _sidearms];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militiaLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["Aegis_U_O_LightCombatFatigues_rutaiga_F"]];
_crewLoadoutData set ["vests", ["V_BandollierB_rgr"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _militiaLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_O_R_PilotCoveralls"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O", "H_PilotHelmetHeli_O_visor_up"]];

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