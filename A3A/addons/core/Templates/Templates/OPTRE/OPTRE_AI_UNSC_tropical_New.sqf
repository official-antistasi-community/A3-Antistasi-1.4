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
["vehiclesAirborne", ["OPTRE_M12_LRV"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["OPTRE_M412_IFV_UNSC", "OPTRE_M413_MGS_UNSC"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M494"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_M808B_UNSC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_M808B2"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_mg_f"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["optre_catfish_gauss_f"]] call _fnc_saveToTemplate; // ghost is basically the only vehicle that actually moves on water

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A_VTOL"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_Pelican_unarmed"]] call _fnc_saveToTemplate; // I pray this works

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

["vehiclesMilitiaLightArmed", ["OPTRE_M12_FAV"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_m1087_stallion_unsc"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_M274_ATV"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["OPTRE_M12_FAV_APC"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_M813_TT"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_Gauss"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "OPTRE_Lance"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "OPTRE_Vehicle_Attributes.sqf"

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
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["missileATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_Thermal"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

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

_loadoutData set ["traitorUniforms", ["OPTRE_UNSC_Army_Uniform_R_BLK"]];
_loadoutData set ["traitorVests", ["OPTRE_UNSC_M52A_Armor_Breacher_URB", "OPTRE_UNSC_M52A_Armor1_URB"]];
_loadoutData set ["traitorHats", ["OPTRE_UNSC_CH252_Helmet_URB"]];

_loadoutData set ["officerUniforms", ["OPTRE_UNSC_Army_Uniform_BLKURB"]];
_loadoutData set ["officerVests", ["OPTRE_UNSC_M52A_Armor_Sniper_URB", "V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["OPTRE_PatrolCap_Navy"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["OPTRE_UNSC_CH252A_Black_Helmet"]];
_loadoutData set ["sniHats", ["OPTRE_UNSC_CH252A_Black_Helmet"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["OPTRE_MJOLNIR_Undersuit"]];
_sfLoadoutData set ["vests", ["OPTRE_MJOLNIR_MkVBArmor", "OPTRE_MJOLNIR_MkVBArmor_MkV4"]];
_sfLoadoutData set ["mgVests", ["OPTRE_MJOLNIR_MkVBArmor", "OPTRE_MJOLNIR_MkVBArmor_MkV4"]];
_sfLoadoutData set ["medVests", ["OPTRE_MJOLNIR_MkVBArmor", "OPTRE_MJOLNIR_MkVBArmor_MkV4"]];
_sfLoadoutData set ["glVests", ["OPTRE_MJOLNIR_MkVBArmor", "OPTRE_MJOLNIR_MkVBArmor_MkV4"]];
_sfLoadoutData set ["backpacks", ["OPTRE_ANPRC_515_Spartan"]];
_sfLoadoutData set ["slBackpacks", ["OPTRE_ANPRC_515_Spartan"]];
_sfLoadoutData set ["atBackpacks", ["OPTRE_ANPRC_515_Spartan"]];
_sfLoadoutData set ["helmets", ["OPTRE_MJOLNIR_MkVBHelmet", "OPTRE_MJOLNIR_MkVBHelmet_UA_HUL", "OPTRE_MJOLNIR_EOD"]];
_sfLoadoutData set ["slHat", ["OPTRE_MJOLNIR_CQC"]];
_sfLoadoutData set ["sniHats", ["OPTRE_MJOLNIR_Commando", "OPTRE_MJOLNIR_Commando_HUL3"]];

_sfLoadoutData set ["slRifles", [
    ["OPTRE_BR55HB", "", "", "optre_br55hb_scope", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["OPTRE_MA5B", "", "", "optre_ma5_smartlink", ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag"], [], ""],
    ["OPTRE_BR55HB", "", "", "optre_br55hb_scope", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["OPTRE_M392_DMR", "", "optre_dmr_light", "optre_br55hb_scope", ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag"], [], ""],
    ["OPTRE_Commando", "", "", "optic_Holosight_blk_F", ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA5BGL", "", "", "optre_ma5_smartlink", ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "OPTRE_1Rnd_SmokeGreen_Grenade_shell"], ""]
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

_sfLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_sfLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
if (["MA_Armor"] call A3U_fnc_hasAddon) then {
    _eliteLoadoutData set ["uniforms", ["MA_M56S_BDU"]];
    _eliteLoadoutData set ["slUniform", ["MA_M56S_BDU"]];
    _eliteLoadoutData set ["vests", ["MA_M56R_Vest"]];
    _eliteLoadoutData set ["mgVests", ["MA_M56R_CQB_Vest"]];
    _eliteLoadoutData set ["medVests", ["MA_M56S_Medic_Vest"]];
    _eliteLoadoutData set ["slVests", ["MA_M56S_Vest"]];
    _eliteLoadoutData set ["glVests", ["MA_M56_CustomVest_1"]];
    _eliteLoadoutData set ["engVests", ["MA_M56R_Vest_ODST_Radio"]];
    _eliteLoadoutData set ["backpacks", ["MA_M56S_Rucksack"]];
    _eliteLoadoutData set ["slBackpacks", ["MA_M56S_Rucksack_ODST_Radio"]];
    _eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
    _eliteLoadoutData set ["helmets", ["MA_M56SR_Helmet_Black_Visor", "MA_M56SH_Helmet_Black_Visor"]];
    _eliteLoadoutData set ["sniHats", ["MA_M56A_Helmet_Red_Visor"]];
} else {
    _eliteLoadoutData set ["uniforms", ["OPTRE_UNSC_ODST_Uniform"]];
    _eliteLoadoutData set ["slUniform", ["OPTRE_UNSC_ODST_Uniform"]];
    _eliteLoadoutData set ["vests", ["OPTRE_UNSC_M52D_Armor"]];
    _eliteLoadoutData set ["mgVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["medVests", ["OPTRE_UNSC_M52D_Armor_Medic"]];
    _eliteLoadoutData set ["slVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["glVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["engVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black"]];
    _eliteLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Medical"]];
    _eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
    _eliteLoadoutData set ["helmets", ["OPTRE_UNSC_CH252D_Helmet"]];
    _eliteLoadoutData set ["sniHats", ["OPTRE_UNSC_CH252A_Black_Helmet"]]; 
};

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

_eliteLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_eliteLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["OPTRE_UNSC_Army_Uniform_WDL", "OPTRE_UNSC_Army_Uniform_R_WDL_SlimLeg", "OPTRE_UNSC_Army_Uniform_S_WDL_SlimLeg"]];
_militaryLoadoutData set ["slUniform", ["OPTRE_UNSC_Army_Uniform_R_WDL_SlimLeg"]];
_militaryLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor_Rifleman_WDL"]];
_militaryLoadoutData set ["mgVests", ["OPTRE_UNSC_M52A_Armor_MG_WDL"]];
_militaryLoadoutData set ["medVests", ["OPTRE_UNSC_M52A_Armor_Corpsman_MAR"]];
_militaryLoadoutData set ["slVests", ["OPTRE_UNSC_M52A_Armor_TL_WDL"]];
_militaryLoadoutData set ["glVests", ["OPTRE_UNSC_M52A_Armor_Grenadier_WDL"]];
_militaryLoadoutData set ["engVests", ["OPTRE_UNSC_M52A_Armor1_WDL"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack", "OPTRE_UNSC_Rucksack_Medic", "OPTRE_UNSC_Rucksack_Heavy"]];
_militaryLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_militaryLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_militaryLoadoutData set ["helmets", ["OPTRE_UNSC_CH252_Helmet_WDL", "OPTRE_UNSC_CH252_Helmet2_WDL"]];
_militaryLoadoutData set ["sniHats", ["OPTRE_UNSC_CH252A_Helmet"]];

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

_militaryLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_militaryLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["OPTRE_CMA_Uniform", "OPTRE_CMA_Uniform_Rolled"]];
_policeLoadoutData set ["vests", ["OPTRE_Vest_CMA_Light", "OPTRE_Vest_CMA_Heavy"]];
_policeLoadoutData set ["helmets", ["OPTRE_CMA_Helmet_ear", "OPTRE_CMA_Helmet_chops"]];

_policeLoadoutData set ["SMGs", [
    ["OPTRE_MA37K", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["OPTRE_FC_Marines_Uniform_WDL_L"]];
_militiaLoadoutData set ["vests", ["OPTRE_FC_M52B_Armor_Rifleman_WDL", "OPTRE_FC_M52B_Armor_Light_WDL"]];
_militiaLoadoutData set ["sniVests", ["OPTRE_FC_M52B_Armor_Sniper_WDL"]];
_militiaLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["atBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["helmets", ["OPTRE_FC_CH255_Helmet"]];
_militiaLoadoutData set ["sniHats", ["OPTRE_FC_CH255_Helmet_Visor"]];

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
    ["OPTRE_M295_BMR", "", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""]
]];

_militiaLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_militiaLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["OPTRE_UNSC_Navy_Uniform_Olive"]];
_crewLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor3_WDL"]];
_crewLoadoutData set ["helmets", ["OPTRE_UNSC_CH252_Helmet2_Vacuum_WDL"]];
_crewLoadoutData set ["carbines", [
    ["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["OPTRE_UNSC_Navy_Uniform_Olive"]];
_pilotLoadoutData set ["vests", ["OPTRE_UNSC_M52A_Armor2_WDL"]];
_pilotLoadoutData set ["helmets", ["OPTRE_FC_VX19_Helmet"]];
_pilotLoadoutData set ["carbines", [
    ["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];

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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
private _spartanUnit = ["baseClass", "OPTRE_FC_Spartan_MkVI", false];

private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_spartanUnit], [_prefix]],
    ["Radioman", _radiomanTemplate, [_spartanUnit], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_spartanUnit], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _spartanUnit], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _spartanUnit], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _spartanUnit], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_spartanUnit], [_prefix]],
    ["LAT", _latTemplate, [_spartanUnit], [_prefix]],
    ["AT", _atTemplate, [_spartanUnit], [_prefix]],
    ["AA", _aaTemplate, [_spartanUnit], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_spartanUnit], [_prefix]],
    ["Marksman", _marksmanTemplate, [_spartanUnit], [_prefix]],
    ["Sniper", _sniperTemplate, [_spartanUnit], [_prefix]]
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
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
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
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
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
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
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
