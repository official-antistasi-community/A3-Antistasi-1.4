//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Covenant"] call _fnc_saveToTemplate;
["spawnMarkerName", "Covenant Supercarrier"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_covenant_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_covenant"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

/* ANTISTASI PLUS STUFF START */
["vehiclesMilitiaAPCs", ["OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["OPTRE_FC_Spectre"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_FC_Spectre"]] call _fnc_saveToTemplate;

["staticHowitzers", []] call _fnc_saveToTemplate;
["howitzerMagazineHE", ""] call _fnc_saveToTemplate;
["vehicleRadar", "O_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "OPTRE_FC_TyrantAA"] call _fnc_saveToTemplate;
/* ANTISTASI PLUS STUFF END */

["vehiclesBasic", ["OPTRE_FC_Ghost_Driverless"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_FC_Ghost_Driverless"]] call _fnc_saveToTemplate; // yes it's armed, cry (or find an unarmed version)
["vehiclesLightArmed", ["OPTRE_FC_Ghost_Needler_Driverless", "OPTRE_FC_Ghost_Armor_Driverless"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["OPTRE_m1015_mule_ins", "OPTRE_m1015_mule_cover_ins"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1015_mule_ins", "OPTRE_m1015_mule_cover_ins"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1015_mule_ammo_ins"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1015_mule_repair_ins"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1015_mule_fuel_ins"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["OPTRE_m1015_mule_medical_ins"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_FC_Wraith"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_FC_AA_Wraith"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["OPTRE_FC_Ghost_Driverless"]] call _fnc_saveToTemplate; // ghost is basically the only vehicle that actually moves on water

["vehiclesPlanesCAS", ["OPTRE_FC_Type26B_Banshee"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_FC_Type26N_Banshee"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate; // I pray this works

["vehiclesHelisLight", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate;

if (["MEU_Covenant"] call A3U_fnc_hasAddon) then {
    ["vehiclesHelisTransport", ["MEU_Phantom_Light"]] call _fnc_saveToTemplate;
    ["vehiclesHelisAttack", ["MEU_Phantom"]] call _fnc_saveToTemplate;
} else {
    ["vehiclesHelisTransport", ["OPTRE_FC_Spirit"]] call _fnc_saveToTemplate;
    ["vehiclesHelisAttack", ["OPTRE_FC_Spirit_Concussion"]] call _fnc_saveToTemplate;
};

["vehiclesHelisLightAttack", ["OPTRE_FC_Spirit_Concussion"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_m1015_mule_mlr_ins_IND"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["OPTRE_m1015_mule_mlr_ins_IND", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["OPTRE_FC_Ghost_Driverless"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["B_T_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate; // none of the MGs fit in outpost towers, they just blow up.
["staticAT", ["OPTRE_FC_T26_AT"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_FC_T26_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["Plasma_Mortar"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "Guided_Plasma_Mag_Test"] call _fnc_saveToTemplate; //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["vehiclesAPCs", ["OPTRE_FC_Spectre", "OPTRE_FC_Spectre_Empty"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["EliteVO_1"]] call _fnc_saveToTemplate;
["faces", ["sangheiliHead_01","sangheiliHead_02","sangheiliHead_03","sangheiliHead_VP","sangheiliHead_LV","sangheiliHead_DV"]] call _fnc_saveToTemplate;
["polFaces", ["OPTRE_JackalFace_01", "OPTRE_JackalFace_02"]] call _fnc_saveToTemplate; // so jackals don't have arma man heads... trust me that will stay in your mind
["sfVoices", ["EliteVO_2"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
/* ANTISTASI PLUS STUFF START */
_loadoutData set ["traitorUniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_loadoutData set ["traitorVests", ["OPTRE_FC_Elite_Armor_Zealot"]];
_loadoutData set ["traitorHats", ["OPTRE_FC_Elite_Helmet_Zealot"]];

_loadoutData set ["officerUniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_loadoutData set ["officerVests", ["OPTRE_FC_Elite_Armor_Officer"]];
_loadoutData set ["officerHats", ["OPTRE_FC_Elite_Helmet_Officer"]];
/* ANTISTASI PLUS STUFF END */

_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack"], [], ""]]];
_loadoutData set ["ATLaunchers", ["OPTRE_FC_T33_FuelRod_Cannon"]];
_loadoutData set ["missileATLaunchers", [
["OPTRE_FC_T33_FuelRod_Cannon", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["OPTRE_FC_T33_FuelRod_Cannon_Guided", "", "", "", ["OPTRE_FC_T33_FuelRod_Pack_Guided"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["OPTRE_FC_PlasmaGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["OPTRE_FC_NVG"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["rangefinders", ["OPTRE_Smartfinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_sfLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_SpecOps"]];
_sfLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack_Heavy"]]; // gets hidden on the elite model, but make it default backpack incase players loot it
_sfLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_SpecOps"]];
_sfLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_sfLoadoutData set ["rifles", [
["OPTRE_FC_T60_PulseCarbine", "", "", "", ["OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery", "OPTRE_FC_T60_Pulse_Carbine_Battery"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["OPTRE_FC_T51_Carbine", "", "", "", ["OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge", "OPTRE_FC_T51_Ammo_Cartridge"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_eliteLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Minor"]];
_eliteLoadoutData set ["vestsSL", ["OPTRE_FC_Elite_Armor_Officer"]];
_eliteLoadoutData set ["Hvests", ["OPTRE_FC_Elite_Armor_Minor"]]; // leave these in, just becase we don't know if we truly want these to be the exact same
_eliteLoadoutData set ["glVests", ["OPTRE_FC_Elite_Armor_Minor"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_eliteLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Minor"]];
_eliteLoadoutData set ["helmetsSL", ["OPTRE_FC_Elite_Helmet_Officer"]];
_eliteLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_eliteLoadoutData set ["slRifles", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_militaryLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militaryLoadoutData set ["vestsSL", ["OPTRE_FC_Elite_Armor_Officer"]];
_militaryLoadoutData set ["Hvests", ["OPTRE_FC_Elite_Armor_Minor"]]; // leave these in, just becase we don't know if we truly want these to be the exact same
_militaryLoadoutData set ["glVests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_militaryLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Minor"]];
_militaryLoadoutData set ["helmetsSL", ["OPTRE_FC_Elite_Helmet_Officer"]];
_militaryLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_militaryLoadoutData set ["slRifles", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["OPTRE_FC_T50_SRS", "", "", "", ["OPTRE_FC_T50_SRS_Battery"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];

// Make these elites
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["OPTRE_U_Jackal_uniform"]];
_policeLoadoutData set ["vests", ["OPTRE_V_Jackal_vest"]];
_policeLoadoutData set ["helmets", []];

_policeLoadoutData set ["SMGs", [
["OPTRE_FC_Jackal_Shield", "", "", "", [], [], ""],
["OPTRE_FC_T25_Rifle", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["OPTRE_FC_Plasma_Pistol"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_militiaLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Minor"]];
_militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Minor"]];

_militiaLoadoutData set ["rifles", [
["OPTRE_FC_T25_Rifle", "", "", "", ["OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery", "OPTRE_FC_T25_Rifle_Battery"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["OPTRE_FC_T50_ConcussionRifle", "", "", "", ["OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag", "OPTRE_FC_T50_6rnd_mag"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["OPTRE_FC_Needler", "", "", "", ["OPTRE_FC_Needler_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["OPTRE_FC_T51J_Repeater", "", "", "", ["OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery", "OPTRE_FC_T51J_Repeater_Battery"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["marksmanRifles", [
["OPTRE_FC_T31_NeedleRifle", "", "", "", ["OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag", "OPTRE_FC_NeedleRifle_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["OPTRE_FC_Plasma_Pistol", "", "", "", ["OPTRE_FC_Plasma_Pistol_Battery"], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_crewLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Zealot"]];
_crewLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Zealot"]];
_crewLoadoutData set ["carbines", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["OPTRE_FC_Elite_CombatSkin"]];
_pilotLoadoutData set ["vests", ["OPTRE_FC_Elite_Armor_Ultra"]];
_pilotLoadoutData set ["helmets", ["OPTRE_FC_Elite_Helmet_Ultra"]];
_pilotLoadoutData set ["carbines", [
["OPTRE_FC_T51_Repeater", "", "", "", ["OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery", "OPTRE_FC_T51_Repeater_Battery"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet; // in this template we don't give any SL hats due to different skeletons
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate= {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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

/* ANTISTASI PLUS STUFF START */
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
/* ANTISTASI PLUS STUFF END */

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_FC_Elite_Ultra", true]], [_prefix]],
    ["Rifleman", _riflemanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["LAT", _latTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AT", _atTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AA", _aaTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Marksman", _marksmanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Sniper", _sniperTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]]
    // doesn't use the loadout system, so that way we don't mix and match gear. Of course, it has it's disadvantages...
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
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_FC_Elite_Major", true]], [_prefix]],
    ["Rifleman", _riflemanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["LAT", _latTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AT", _atTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AA", _aaTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Marksman", _marksmanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Sniper", _sniperTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]]
    // all of these are elites
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate, [["baseClass", "OPTRE_Jackal_base_F", false]], [_prefix]],
    ["Standard", _policeTemplate, [["baseClass", "OPTRE_Jackal_base_F", false]], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_FC_Elite_Officer", true]], [_prefix]],
    ["Rifleman", _riflemanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["LAT", _latTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AT", _atTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AA", _aaTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Marksman", _marksmanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Sniper", _sniperTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_FC_Elite_HonorGuard", true]], [_prefix]],
    ["Rifleman", _riflemanTemplate, [["baseClass", "OPTRE_FC_Elite_Zealot", true]], [_prefix]],
    ["Radioman", _radiomanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["LAT", _latTemplate, [["baseClass", "OPTRE_FC_Elite_Zealot2", true]], [_prefix]],
    ["AT", _atTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["AA", _aaTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Marksman", _marksmanTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]],
    ["Sniper", _sniperTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [["baseClass", "OPTRE_FC_Elite_Minor", false]], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;