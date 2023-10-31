private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AUKUS"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AUKUS"]] call _fnc_saveToTemplate;

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_CO.paa"] call _fnc_saveToTemplate; 	
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["B_A_MRAP_03_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["B_A_MRAP_03_gmg_F", "B_A_MRAP_03_hmg_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["B_A_Truck_01_transport_F", "B_A_Truck_01_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_A_Truck_01_cargo_F", "B_A_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["B_A_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["B_A_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["B_A_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["B_A_Truck_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["Atlas_B_G_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["B_A_APC_tracked_03_cannon_v2_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesAirborne", ["Atlas_B_G_APC_Wheeled_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  []] call _fnc_saveToTemplate;
["vehiclesTanks", ["Atlas_B_A_MBT_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_A_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_A_Boat_Armed_01_hmg_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_A_Plane_Fighter_05_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["Atlas_B_A_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["B_A_Heli_Transport_02_F", "Aegis_B_UN_lxWS_Heli_Transport_02_Heavy_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["B_A_Heli_light_03_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["B_A_Heli_light_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["B_A_Heli_Attack_01_dynamicLoadout_F", "Atlas_B_A_Heli_Attack_03_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]] call _fnc_saveToTemplate;

["magazines", createHashMapFromArray [
    ["B_MBT_01_arty_F",["32Rnd_155mm_Mo_shells", "2Rnd_155mm_Mo_Cluster"]],
    ["B_MBT_01_mlrs_F",["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_A_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
private _uavsPortable = if (_hasWs) then {["Aegis_B_A_UAV_02_lxWS", "B_A_UAV_01_F"]} else {["B_A_UAV_01_F"]};
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["Atlas_B_A_MRAP_03_hmg_ard_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Atlas_B_A_Truck_01_covered_ard_F", "Atlas_B_A_Truck_01_transport_ard_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Atlas_B_A_MRAP_03_ard_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["Atlas_B_A_APC_Wheeled_01_cannon_v2_ard_F", "Atlas_B_A_APC_Wheeled_01_command_lxWS"]] call _fnc_saveToTemplate;

private _policeVehs = if (_hasContact) then {
    ["B_GEN_Offroad_01_covered_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_gen_F"]
} else {
    ["B_GEN_Offroad_01_gen_F"]
};

["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F","B_A_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_A_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_A_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

["animations", [
    ["Atlas_B_G_APC_Wheeled_03_cannon_F", ["showCamonetHull",0.3,"showBags",0.3,"showBags2",0.3,"showTools",0.3,"showSLATHull",0.3]],
    ["Atlas_B_A_MBT_03_cannon_F", ["HideTurret",0.3,"HideHull",0.3,"showCamonetHull",0.3,"showCamonetTurret",0.3]],
    ["B_APC_Wheeled_01_cannon_v2_F", ["showBags",0,"showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3,"showSLATTurret",0.3]]
]] call _fnc_saveToTemplate;

["variants", [
    ["Atlas_B_A_Heli_Attack_03_F", ["BAF",1]],
    ["Atlas_B_G_APC_Wheeled_03_cannon_F", ["Sand_01",1]],
    ["Atlas_B_A_MBT_03_cannon_F", ["Sand_01",1]],
    ["Aegis_B_UN_lxWS_Heli_Transport_02_Heavy_F", ["BAF",1]],
    ["Atlas_B_A_Plane_Transport_01_infantry_F", ["Blue",1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate; 
["faces", ["Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

["insignia", ["NATO_19thBattalion", "", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["CombatPatrol", "", ""]] call _fnc_saveToTemplate;

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
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["launch_NLAW_F"]];
_loadoutData set ["missileATLaunchers", [
["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

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
_loadoutData set ["NVGs", ["NVGoggles"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_I_G_Story_Protagonist_F"]];
_loadoutData set ["traitorVests", ["V_BandollierB_blk", "V_TacVest_blk"]];
_loadoutData set ["traitorHats", ["H_Cap_blk", "H_Cap_oli", "H_Beret_02"]];

_loadoutData set ["officerUniforms", ["Atlas_U_B_A_CombatUniform_aucamo_ard"]];
_loadoutData set ["officerVests", ["V_Rangemaster_belt_cbr"]];
_loadoutData set ["officerHats", ["H_Beret_grn", "H_Beret_02", "H_MilCap_aucamo"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_aucamo_F", "B_RadioBag_01_coyote_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_grn"]];
_loadoutData set ["sniHats", ["H_Booniehat_aucamo_F", "H_Watchcap_cbr"]];

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
    "G_Shades_Yellowred",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Yellow",
    "G_Tactical_Clear",
    "G_Tactical_Black",
    "G_Tactical_Yellow",
    "G_Tactical_Camo",
    "G_Shemag_white",
    "G_Shemag_tan",
    "G_Shemag_khk",
    "G_Shemag_shades",
    "G_Shemag_tactical",
    "G_Shemag_tan"
]];
_loadoutData set ["goggles", ["G_Combat", "G_Combat_Goggles_blk_F"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt"]];
_sfLoadoutData set ["vests", ["V_PlateCarrier1_rgr"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrier2_rgr"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPackSpec_rgr", "B_Carryall_mcamo", "B_Kitbag_cbr"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_mcamo"]];
_sfLoadoutData set ["helmets", ["H_HelmetSpecB_blk", "H_HelmetSpecB", "H_Booniehat_mcamo", "H_Watchcap_khk"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];

_sfLoadoutData set ["slRifles", [
["arifle_SCAR_L_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_GL_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "UGL_FlareCIR_F", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "UGL_FlareCIR_F", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["arifle_SCAR_L_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_grip_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_grip_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""]

]];
_sfLoadoutData set ["carbines", [
["arifle_SCAR_L_short_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_short_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_short_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SCAR_L_short_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_SCAR_L_GL_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand", "30Rnd_556x45_Stanag_Sand_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Hamr", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["designatedGrenadeLaunchers", [
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["LMG_03_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Hamr", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_NVS", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "muzzle_snds_m_snd_F", "acc_pointer_IR", "optic_Holosight", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_Mk200_plain_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_snd"],
["LMG_Mk200_plain_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_NVS", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_snd"],
["LMG_Mk200_plain_F", "muzzle_snds_H_snd_F", "acc_pointer_IR", "optic_Holosight", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_snd"]
]];

private _marksmanRifles = [
    ["arifle_SCAR_grip_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_grip_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_grip_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_grip_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_F", "muzzle_snds_B_snd_F", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"],
    ["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_grip_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
    ["arifle_SCAR_black_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_blk_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_khk"],
    ["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
    ["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"]
];
if (_hasMarksman) then {
    _marksmanRifles append [
        ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "muzzle_snds_338_black", "acc_pointer_IR", "optic_tws_sniper", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_snd"],
        ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_AMS_snd", [], [], "bipod_01_F_snd"],
        ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
        ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_snd"],
        ["srifle_DMR_02_sniper_F", "muzzle_snds_338_sand", "acc_pointer_IR", "optic_tws_sniper", [], [], "bipod_01_F_snd"]
    ];
};
_sfLoadoutData set ["marksmanRifles", _marksmanRifles];

_sfLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],  
["srifle_LRR_F", "", "", "optic_tws_sniper", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", [], [], ""],
["hgun_P07_F", "muzzle_snds_L", "", "", [], [], ""],
["hgun_ACPC2_black_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""],
["hgun_G17_F", "muzzle_snds_L", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_B_CTRG_Soldier_Arid_F", "U_B_CTRG_Soldier_3_Arid_F", "U_B_CTRG_Soldier_2_Arid_F"]];
_eliteLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_Coyote_F"]];
_eliteLoadoutData set ["Hvests", ["V_CarrierRigKBT_01_heavy_Coyote_F"]];
_eliteLoadoutData set ["GLvests", ["V_CarrierRigKBT_01_heavy_Coyote_F"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_cbr", "B_Kitbag_cbr"]];
_eliteLoadoutData set ["helmets", ["H_HelmetSpecB_paint2", "H_HelmetB_desert", "H_HelmetB_TI_arid_F"]];
_eliteLoadoutData set ["glasses", ["G_Balaclava_TI_blk_F"]];
_eliteLoadoutData set ["goggles", ["G_Balaclava_TI_G_blk_F"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["ATLaunchers", [
    ["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT","Titan_AP"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
["arifle_SA80_snd_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_SA80_C_snd_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["arifle_SPAR_01_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_SA80_GL_snd_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];

private _mgs = [
    ["LMG_Mk200_plain_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_ERCO_blk_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"],
    ["LMG_Mk200_plain_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_ERCO_blk_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_blk"]
];
private _marksmanRifles = [
    ["arifle_SPAR_03_blk_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_AMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["arifle_SPAR_03_blk_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_SOS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["arifle_SPAR_03_snd_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_AMS_snd", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
    ["arifle_SPAR_03_snd_F", "muzzle_mzls_B", "acc_pointer_IR", "optic_SOS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"]
];

if (_hasMarksman) then {
    _mgs append [
        ["MMG_02_black_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", [], [], "bipod_01_F_blk"],
        ["MMG_02_camo_F", "", "acc_pointer_IR", "optic_Holosight", [], [], "bipod_01_F_mtp"],
        ["MMG_02_sand_F", "", "acc_pointer_IR", "optic_tws_mg", [], [], "bipod_01_F_snd"]
    ];
    _marksmanRifles append [
        ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_NVS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_LRPS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_02_F", "", "acc_pointer_IR", "optic_tws", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_03_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
        ["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_snd"],
        ["srifle_DMR_03_tan_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_snd"]
    ];
};
_eliteLoadoutData set ["machineGuns", _mgs];
_eliteLoadoutData set ["marksmanRifles", _marksmanRifles];

_eliteLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""],
["srifle_LRR_F", "", "", "optic_tws_sniper", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["hgun_Pistol_heavy_01_F", "", "acc_flashlight_pistol", "optic_MRD", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_B_UBACS_mtp_f", "U_B_UBACS_vest_mtp_f", "U_B_UBACS_tshirt_mtp_f"]];
_militaryLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_MTP_F"]];
_militaryLoadoutData set ["glVests", ["V_CarrierRigKBT_01_light_MTP_F", "V_CarrierRigKBT_01_heavy_MTP_F", "V_CarrierRigKBT_01_heavy_Khaki_F"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_mcamo", "B_Kitbag_mcamo"]];
_militaryLoadoutData set ["atBackpacks", ["B_Carryall_mcamo"]];
_militaryLoadoutData set ["helmets", ["H_HelmetB_camo_mcamo", "H_HelmetB_plain_mcamo", "H_HelmetB_light_mcamo"]];

_militaryLoadoutData set ["slRifles", [
["arifle_SA80_blk_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"],["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_SA80_blk_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_SA80_C_snd_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_C_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
["arifle_SA80_C_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_blk_F", "", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_SA80_GL_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HEDP_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SMG_04_blk_F", "", "", "optic_Holosight_smg_blk_F", ["40Rnd_460x30_Mag_F", "40Rnd_460x30_Mag_F"], [], ""],
["SMG_04_snd_F", "", "", "optic_Holosight_smg", ["40Rnd_460x30_Mag_F", "40Rnd_460x30_Mag_F"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_03_F", "", "acc_flashlight", "optic_MRCO", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_flashlight", "optic_MRCO", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_snd_F", "", "acc_flashlight", "optic_Holosight", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_Mk200_plain_F", "", "acc_flashlight", "optic_MRCO", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
["LMG_Mk200_plain_F", "", "acc_flashlight", "optic_Holosight", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_SOS", [], [], ""],
["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_ERCO_blk_F", [], [], ""],
["arifle_SPAR_03_snd_F", "", "acc_pointer_IR", "optic_SOS", [], [], ""],
["arifle_SPAR_03_snd_F", "", "acc_pointer_IR", "optic_ERCO_snd_F", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["hgun_G17_F","hgun_G17_black_F"]];

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
["sgun_M4_F", "", "acc_flashlight_pistol", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""],
["SMG_05_F", "", "acc_flashlight", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_05_F", "", "acc_flashlight", "", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"], [], ""],
["SMG_03C_hex", "", "", "", [], [], ""],
["SMG_03C_hex", "", "", "", [], [], ""],
["Aegis_arifle_M4A1_short_F", "", "", "optic_Aco_smg", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["Aegis_arifle_M4A1_short_F", "", "", "optic_Aco_smg", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
["Aegis_arifle_M4A1_short_F", "", "", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_G17_black_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////


private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_aucamo_ard", "Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_ard"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_khk", "V_PlateCarrier1_aucamo_ard_F", "Atlas_V_PlateCarrier2_alt_aucamo_ard"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_khk", "B_AssaultPack_aucamo_F", "B_Kitbag_aucamo_F"]];
_militiaLoadoutData set ["atBackpacks", ["B_Kitbag_aucamo_F"]];
_militiaLoadoutData set ["helmets", ["H_HelmetB_light", "H_HelmetHBK_aucamo_arid_F", "H_MilCap_aucamo", "H_Bandanna_khk", "H_Cap_aucamo"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_aucamo_F", "H_Watchcap_khk"]];
_militiaLoadoutData set ["longRangeRadios", ["B_RadioBag_01_aucamo_F"]];

_militiaLoadoutData set ["slRifles", [
["arifle_Mk20_plain_F", "", "acc_flashlight", "acc_o_FMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_Mk20_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_Mk20_GL_plain_F", "", "acc_flashlight", "acc_o_FMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_Mk20_GL_plain_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
["arifle_AUG_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
["arifle_Mk20_plain_F", "", "acc_flashlight", "acc_o_FMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_Mk20_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_AUG_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["arifle_Mk20C_plain_F", "", "acc_flashlight", "acc_o_FMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_Mk20C_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_AUG_C_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_C_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_Mk20_GL_plain_F", "", "acc_flashlight", "acc_o_FMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_Mk20_GL_plain_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_flashlight", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["LMG_03_F", "", "acc_flashlight", "optic_MRCO", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "acc_flashlight", "", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["arifle_SLR_V_lxWS", "", "", "optic_MRCO", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_G17_F", "hgun_G17_black_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_B_UBACS_vest_mtp_f", "U_B_UBACS_mtp_f"]];
_crewLoadoutData set ["vests", ["V_CarrierRigKBT_01_MTP_F"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_UBACS_vest_mtp_f", "U_B_UBACS_mtp_f"]];
_pilotLoadoutData set ["vests", ["V_CarrierRigKBT_01_MTP_F"]];
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