//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "UNSC"] call _fnc_saveToTemplate;
["spawnMarkerName", "UNSC Infinity"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_unsc"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

/* ANTISTASI PLUS STUFF START */
["vehiclesMilitiaAPCs", ["OPTRE_M12_FAV_APC"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["OPTRE_M12_LRV"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M494"]] call _fnc_saveToTemplate;

["staticHowitzers", []] call _fnc_saveToTemplate;
["howitzerMagazineHE", ""] call _fnc_saveToTemplate;
["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "OPTRE_Lance"] call _fnc_saveToTemplate;
/* ANTISTASI PLUS STUFF END */

["vehiclesBasic", ["OPTRE_M274_ATV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_M813_TT", "OPTRE_M12_FAV"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV", "OPTRE_M12A1_LRV"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["OPTRE_m1087_stallion_unsc"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1087_stallion_cover_unsc"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1087_stallion_unsc_resupply"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1087_stallion_unsc_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1087_stallion_unsc_refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["OPTRE_m1087_stallion_unsc_medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
private _APCs = ["OPTRE_M412_IFV_UNSC", "OPTRE_M413_MGS_UNSC"];       //, "B_T_APC_Tracked_01_CRV_F"];
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_M808B_UNSC", "OPTRE_M808BM_UNSC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_M808B2"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_mg_f"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["optre_catfish_gauss_f"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A_VTOL"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_Pelican_unarmed"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["OPTRE_UNSC_falcon"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["OPTRE_UNSC_falcon_s"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["OPTRE_UNSC_hornet_CAS"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["OPTRE_AV22C_Sparrowhawk"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_M875_SPH"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["OPTRE_M875_SPH", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["OPTRE_Wombat_B"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["OPTRE_M12_FAV"]] call _fnc_saveToTemplate; // technically not armed, but has FFV slots
["vehiclesMilitiaTrucks", ["OPTRE_m1087_stallion_unsc"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_M274_ATV"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_M813_TT"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_Gauss"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["vehiclesAPCs", _APCs] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENG", "Male03ENGB", "Male04ENG", "Male05ENGB"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
/* ANTISTASI PLUS STUFF START */
_loadoutData set ["traitorUniforms", ["OPTRE_UNSC_Army_Uniform_R_BLK"]];
_loadoutData set ["traitorVests", ["OPTRE_UNSC_M52A_Armor_Breacher_URB", "OPTRE_UNSC_M52A_Armor1_URB"]];
_loadoutData set ["traitorHats", ["OPTRE_UNSC_CH252_Helmet_URB"]];

_loadoutData set ["officerUniforms", ["OPTRE_UNSC_Army_Uniform_BLKURB"]];
_loadoutData set ["officerVests", ["OPTRE_UNSC_M52A_Armor_Sniper_URB", "V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["OPTRE_PatrolCap_Navy"]];
/* ANTISTASI PLUS STUFF END */

_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["OPTRE_M41_SSR"]];
_loadoutData set ["missileATLaunchers", [
["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_Thermal"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["OPTRE_M9_Frag"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["OPTRE_NVG"]];
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
_loadoutData set ["sniHats", ["OPTRE_UNSC_CH252_Helmet_SNO", "OPTRE_UNSC_CH252_Helmet2_SNO"]];

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
_sfLoadoutData set ["uniforms", ["OPTRE_MJOLNIR_Undersuit"]];
_sfLoadoutData set ["vests", ["OPTRE_MJOLNIR_MkVBArmor", "OPTRE_MJOLNIR_MkVBArmor_MkV4"]];
_sfLoadoutData set ["backpacks", ["OPTRE_ANPRC_515_Spartan"]];
_sfLoadoutData set ["helmets", ["OPTRE_MJOLNIR_MkVBHelmet", "OPTRE_MJOLNIR_MkVBHelmet_UA_HUL", "OPTRE_MJOLNIR_EOD", "OPTRE_MJOLNIR_CQC"]];
_sfLoadoutData set ["sniHats", ["OPTRE_MJOLNIR_Commando", "OPTRE_MJOLNIR_Commando_HUL3"]];
_sfLoadoutData set ["binoculars", ["OPTRE_Binoculars"]];

_sfLoadoutData set ["rifles", [
["OPTRE_MA5B", "", "", "optre_ma5_smartlink", ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag"], [], ""],
["OPTRE_BR55HB", "", "", "optre_br55hb_scope", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["OPTRE_M392_DMR", "", "optre_dmr_light", "optre_br55hb_scope", ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag"], [], ""],
["OPTRE_Commando", "", "", "optic_Holosight_blk_F", ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["OPTRE_MA5BGL", "", "", "optre_ma5_smartlink", ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag"], ["3Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell", "OPTRE_1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["OPTRE_M7", "", "optre_m7_laser", "optre_m7_sight", [], [], ""],
["OPTRE_M45ATAC", "", "optre_m45_flashlight_green", "", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["OPTRE_M247H_Etilka", "", "", "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball", "OPTRE_200Rnd_127x99_M247H_Etilka_Ball", "OPTRE_200Rnd_127x99_M247H_Etilka_Ball"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["OPTRE_M393_DMR", "", "", "optre_m393_scope", ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag"], [], "bipod_01_f_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["OPTRE_SRS99C", "", "", "optre_srs99c_scope", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["OPTRE_M6G", "optre_m6_silencer", "optre_m6g_flashlight", "optre_m6g_scope", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["OPTRE_UNSC_Marine_Uniform"]];
_eliteLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor_Rifleman_MAR", "OPTRE_UNSC_M52A_Armor_Marksman_MAR"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack", "OPTRE_UNSC_Rucksack_Medic", "OPTRE_UNSC_Rucksack_Heavy"]];
_eliteLoadoutData set ["helmets", ["OPTRE_UNSC_CH252_Helmet_MAR", "OPTRE_UNSC_CH252_Helmet2_MAR"]];
_eliteLoadoutData set ["sniHats", ["OPTRE_UNSC_CH252A_Black_Helmet"]];
_eliteLoadoutData set ["binoculars", ["OPTRE_Binoculars"]];

_eliteLoadoutData set ["slRifles", [
["OPTRE_BR55", "optre_ma5suppressor", "", "optre_br55hb_scope", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["OPTRE_MA5C", "optre_ma5suppressor", "", "optre_ma5c_smartlink", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["OPTRE_MA37B", "optre_ma5suppressor", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["OPTRE_M319N", "", "", "", ["M319_HE_Grenade_Shell", "M319_Smoke", "OPTRE_signalSmokeB"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
["OPTRE_M7", "optre_m7_silencer", "", "optre_m393_eotech", [], [], ""],
["OPTRE_M45", "", "", "", [], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["OPTRE_M247", "", "", "", ["OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["OPTRE_M295_BMR", "optre_ma5suppressor", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["OPTRE_SRS99C", "optre_srs99d_suppressor", "", "optre_srs99c_scope", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["OPTRE_M6G", "", "optre_m6g_flashlight", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["OPTRE_UNSC_Army_Uniform_SNO", "OPTRE_UNSC_Army_Uniform_R_SNO_SlimLeg", "OPTRE_UNSC_Army_Uniform_S_SNO_SlimLeg"]];
_militaryLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor_Rifleman_SNO", "OPTRE_UNSC_M52A_Armor_Marksman_SNO"]];
_militaryLoadoutData set ["Hvests", ["OPTRE_UNSC_M52A_Armor_Breacher_SNO"]];
_militaryLoadoutData set ["glVests", ["OPTRE_UNSC_M52A_Armor_Grenadier_SNO"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack", "OPTRE_UNSC_Rucksack_Medic", "OPTRE_UNSC_Rucksack_Heavy"]];
_militaryLoadoutData set ["helmets", ["OPTRE_UNSC_CH252_Helmet_SNO", "OPTRE_UNSC_CH252_Helmet2_SNO"]];
_militaryLoadoutData set ["binoculars", ["OPTRE_Binoculars"]];

_militaryLoadoutData set ["slRifles", [
["OPTRE_BR55", "", "", "optre_br55hb_scope", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["OPTRE_MA5C", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["OPTRE_MA37B", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["OPTRE_M319N", "", "", "", ["M319_HE_Grenade_Shell", "M319_Smoke", "OPTRE_signalSmokeB"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["OPTRE_M7", "", "", "", [], [], ""],
["OPTRE_M45", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["OPTRE_M247", "", "", "", ["OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["OPTRE_M295_BMR", "", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["OPTRE_SRS99C", "", "", "optre_srs99c_scope", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["OPTRE_M6G", "", "optre_m6g_flashlight", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["OPTRE_CMA_Uniform", "OPTRE_CMA_Uniform_Rolled"]];
_policeLoadoutData set ["vests", ["OPTRE_Vest_CMA_Light", "OPTRE_Vest_CMA_Heavy"]];
_policeLoadoutData set ["helmets", ["OPTRE_CMA_Helmet_ear", "OPTRE_CMA_Helmet_chops"]];
_policeLoadoutData set ["NVGs", ["OPTRE_NVG_UAB_HUL", "OPTRE_NVG_UAB_UL_HUL"]];

_policeLoadoutData set ["SMGs", [
["OPTRE_MA37K", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["OPTRE_M6G"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["OPTRE_FC_Marines_Uniform_SNO_L", "OPTRE_FC_Marines_Uniform_SNO"]];
_militiaLoadoutData set ["vests", ["OPTRE_FC_M52B_Armor_Rifleman_SNO", "OPTRE_FC_M52B_Armor_Light_SNO"]];
_militiaLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["helmets", ["OPTRE_FC_CH255_Helmet_SNO"]];

_militiaLoadoutData set ["rifles", [
["OPTRE_MA5C", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["OPTRE_MA5A", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["OPTRE_M319", "", "", "", ["M319_HE_Grenade_Shell", "M319_Smoke", "OPTRE_signalSmokeB"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["OPTRE_MA37K", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["OPTRE_M73", "", "", "", ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["marksmanRifles", [
["OPTRE_M295_BMR_Snow", "", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["OPTRE_M6G"]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

/* ANTISTASI PLUS STUFF START */
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["OPTRE_UNSC_Navy_Uniform_White"]];
_crewLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor3_SNO"]];
_crewLoadoutData set ["helmets", ["OPTRE_UNSC_CH252_Helmet2_Vacuum_SNO"]];
_crewLoadoutData set ["carbines", [
["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_60Rnd_5x23mm_Mag", "OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["OPTRE_UNSC_Navy_Uniform_White"]];
_pilotLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor2_SNO"]];
_pilotLoadoutData set ["helmets", ["OPTRE_FC_VX19_Helmet_Snow"]];
_pilotLoadoutData set ["carbines", [
["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_60Rnd_5x23mm_Mag", "OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];
/* ANTISTASI PLUS STUFF END */

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
    ["sniHats"] call _fnc_setHelmet;
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
    ["sniHats"] call _fnc_setHelmet;
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
    ["NVGs"] call _fnc_addNVGs; // helmets look stupid without em
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
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Rifleman", _riflemanTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Medic", _medicTemplate, [["medic", true], ["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Grenadier", _grenadierTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["LAT", _latTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["AT", _atTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["AA", _aaTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["MachineGunner", _machineGunnerTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Marksman", _marksmanTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]],
    ["Sniper", _sniperTemplate, [["baseClass", "OPTRE_FC_Spartan_MkVI", false]]]
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [["baseClass", "OPTRE_Spartan3_Soldier_TeamLeader", true]], [_prefix]],
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;