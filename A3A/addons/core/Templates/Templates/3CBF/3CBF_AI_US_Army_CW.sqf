//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Army"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "US"]] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "rhs_flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_B_M1030_USMC_WDL"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_CW_US_B_LATE_M1025_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_CW_US_B_LATE_M1025_M2", "UK3CB_CW_US_B_LATE_M1025_M2", "UK3CB_CW_US_B_LATE_M1025_M2", "UK3CB_CW_US_B_LATE_M1025_MK19", "UK3CB_CW_US_B_LATE_M1025_TOW"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CW_US_B_LATE_M939", "UK3CB_CW_US_B_LATE_M939_Guntruck", "UK3CB_CW_US_B_LATE_M939_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CW_US_B_LATE_M939_Recovery", "UK3CB_CW_US_B_LATE_M977A4_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CW_US_B_LATE_M977A4_Reammo", "UK3CB_CW_US_B_LATE_M939_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CW_US_B_LATE_M939_Repair", "UK3CB_CW_US_B_LATE_M977A4_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CW_US_B_LATE_M978A4_Fuel", "UK3CB_CW_US_B_LATE_M939_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_US_B_LATE_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_CW_US_B_LATE_AAV", "UK3CB_CW_US_B_LATE_M113_M2", "UK3CB_CW_US_B_LATE_M113_M240", "UK3CB_CW_US_B_LATE_M113_MK19"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["UK3CB_CW_US_B_LATE_LAV25"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CW_US_B_LATE_LAV25", "RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "UK3CB_CW_US_B_LATE_M2A2"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_CW_US_B_LATE_M60a3", "UK3CB_CW_US_B_EARLY_M60a1"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CW_US_B_LATE_M1A1", "rhsusf_m1a1hc_wd"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHS_A10"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhsusf_f22"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["UK3CB_CW_US_B_LATE_UH60M", "UK3CB_CW_US_B_LATE_UH60M2", "UK3CB_CW_US_B_LATE_CH47", "UK3CB_CW_US_B_LATE_CH47_LIGHT", "UK3CB_CW_US_B_LATE_UH1H_M240", "rhsusf_CH53E_USMC_GAU21", "rhsusf_CH53E_USMC"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["RHS_UH1Y_UNARMED", "UK3CB_CW_US_B_LATE_UH1H", "UK3CB_CW_US_B_LATE_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_UH1Y", "UK3CB_CW_US_B_LATE_UH1H_GUNSHIP"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_US_B_LATE_AH64", "UK3CB_CW_US_B_LATE_AH64_GS", "UK3CB_CW_US_B_LATE_AH64_AA", "UK3CB_CW_US_B_LATE_AH1Z", "UK3CB_CW_US_B_LATE_AH1Z_GS"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsusf_m109_usarmy"]] call _fnc_saveToTemplate;

["magazines", createHashMapFromArray [
    ["rhsusf_m109_usarmy",["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_CW_US_B_LATE_M1025_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CW_US_B_LATE_M939", "UK3CB_CW_US_B_LATE_M939_Guntruck", "UK3CB_CW_US_B_LATE_M939_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_US_B_LATE_M998_2DR", "UK3CB_CW_US_B_LATE_M998_4DR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["UK3CB_CW_US_B_LATE_M113_M2", "UK3CB_CW_US_B_LATE_M113_M240"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CW_US_B_LATE_M151_Jeep_Closed", "UK3CB_CW_US_B_LATE_M151_Jeep_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD", "RHS_M2StaticMG_WD", "UK3CB_CW_US_B_LATE_M240_High"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;
["staticHowitzers", ["RHS_M119_WD"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "RHS_mag_m1_he_12"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", [
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_fim92"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["UK3CB_ANPVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["traitorUniforms", ["rhs_uniform_bdu_erdl"]];
_loadoutData set ["traitorVests", ["V_BandollierB_rgr", "V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["UK3CB_CW_US_B_Early_U_OFFICER_Uniform_01_OLI", "UK3CB_CW_US_B_LATE_U_OFFICER_Uniform_01_WDL"]];
_loadoutData set ["officerVests", ["rhsgref_alice_webbing"]];
_loadoutData set ["officerHats", ["UK3CB_CW_US_B_LATE_H_OFF_Patrol_Cap_WDL_01"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_CW_US_B_LATE_H_Patrol_Cap_WDL_01"]];
_loadoutData set ["sniHats", ["UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_01", "UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_02"]];

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
    "G_Squares_Tinted",
    "G_Squares"
]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["UK3CB_B_U_CombatUniform_03_WDL"]];
_sfLoadoutData set ["vests", ["UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest", "UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest"]];
_sfLoadoutData set ["MGvests", ["UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_01"]];
_sfLoadoutData set ["MEDvests", ["UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest"]];
_sfLoadoutData set ["backpacks", ["UK3CB_CW_US_B_LATE_B_RIF", "UK3CB_CW_US_B_LATE_B_RIF_02", "UK3CB_CW_US_B_LATE_B_RIF_03"]];
_sfLoadoutData set ["helmets", ["H_Bandanna_camo", "UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_01", "UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_02", "rhsgref_helmet_pasgt_woodland_rhino", "H_Watchcap_camo"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];

_sfLoadoutData set ["rifles", [
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_anpas13gv1", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_socom", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_M8541_d", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], "rhsusf_acc_m14_bipod"],
["rhs_weap_m14_socom", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], "rhsusf_acc_m14_bipod"],
["rhs_weap_m14_socom", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], "rhsusf_acc_m14_bipod"],
["rhs_weap_m14_socom", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_anpas13gv1", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special"], [], "rhsusf_acc_m14_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["UK3CB_CW_US_B_LATE_U_CombatUniform_01_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_02_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_03_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_04_WDL", "UK3CB_CW_US_B_LATE_U_JNR_OFFICER_Uniform_01_WDL"]];
_eliteLoadoutData set ["vests", ["rhsgref_otv_khaki"]];
_eliteLoadoutData set ["backpacks", ["UK3CB_CW_US_B_LATE_B_RIF", "rhsgref_hidf_alicepack"]];
_eliteLoadoutData set ["helmets", ["rhsgref_helmet_pasgt_woodland_rhino"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
]];
_eliteLoadoutData set ["ATLaunchers", [
["rhs_weap_smaw", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_smaw", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_smaw", "", "", "", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_smaw", "", "", "", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ELCAN", ["rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_200Rnd_556x45_mixed_soft_pouch", "rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m240G", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_20Rnd_762x51_SR25_mk316_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25", "", "", "rhsusf_acc_ACOG", ["rhsusf_20Rnd_762x51_SR25_mk316_special_Mag", "rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_m62_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m82a1", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_CW_US_B_LATE_U_CombatUniform_01_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_02_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_03_WDL", "UK3CB_CW_US_B_LATE_U_CombatUniform_04_WDL", "UK3CB_CW_US_B_LATE_U_JNR_OFFICER_Uniform_01_WDL"]];
_militaryLoadoutData set ["vests", ["UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest", "UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest"]];
_militaryLoadoutData set ["MGvests", ["UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest"]];
_militaryLoadoutData set ["MEDvests", ["UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest"]];
_militaryLoadoutData set ["backpacks", ["UK3CB_CW_US_B_LATE_B_RIF", "UK3CB_LNM_B_B_CARRYALL_WDL_01", "rhsgref_hidf_alicepack"]];
_militaryLoadoutData set ["helmets", ["UK3CB_CW_US_B_LATE_H_PASGT_02_WDL", "UK3CB_CW_US_B_LATE_H_PASGT_01_WDL"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249", "", "", "", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249", "", "", "", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249", "", "", "", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m240B", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_M14DMR", "", "", "uk3cb_optic_artel_m14", ["UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51_RT"], [], ""],
["UK3CB_M14DMR", "", "", "uk3cb_optic_artel_m14", ["UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51_RT"], [], ""],
["UK3CB_M14DMR", "", "", "uk3cb_optic_artel_m14", ["UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51_RT"], [], ""],
["UK3CB_M14DMR", "", "", "uk3cb_optic_PVS4_M14", ["UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51", "UK3CB_DMR_20rnd_762x51_RT"], [], ""],
["UK3CB_M21", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M21", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M21", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M21", "", "", "uk3cb_optic_PVS4_M14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m82a1", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_m24sws", "rhsusf_acc_m24_muzzlehider_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_FMJ", "rhsusf_mag_15Rnd_9x19_JHP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["UK3CB_CW_US_B_Early_U_JNR_OFFICER_Uniform_01_OLI", "UK3CB_CW_US_B_Early_U_CombatUniform_01_OLI"]];
_policeLoadoutData set ["vests", ["V_TacVest_oli"]];
_policeLoadoutData set ["helmets", ["rhsgref_hat_M1951"]];
_policeLoadoutData set ["policeWeapons", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""],
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1", "rhsusf_weap_glock17g4"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", [
    "UK3CB_CW_US_B_Early_U_CombatUniform_01_OLI", 
    "UK3CB_CW_US_B_Early_U_CombatUniform_02_OLI", 
    "UK3CB_CW_US_B_Early_U_CombatUniform_03_OLI", 
    "UK3CB_CW_US_B_Early_U_SF_CombatUniform_03_ERDL_OLI",
    "UK3CB_CW_US_B_Early_U_SF_CombatUniform_01_ERDL",
    "UK3CB_CW_US_B_Early_U_SF_CombatUniform_04_ERDL_OLI",
    "UK3CB_CW_US_B_Early_U_SF_CombatUniform_02_ERDL",
    "rhs_uniform_bdu_erdl"
]];
_militiaLoadoutData set ["vests", ["rhsgref_alice_webbing", "rhsgref_TacVest_ERDL"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_B_Alice_K", "UK3CB_B_Alice_K", "UK3CB_B_Alice_K", "rhsgref_hidf_alicepack"]];
_militiaLoadoutData set ["helmets", ["UK3CB_MDF_B_H_M1", "UK3CB_MDF_B_H_M1_ALT", "rhsgref_helmet_M1_erdl", "rhsgref_hat_M1951", "H_Bandanna_khk", "H_Bandanna_camo"]];
_militiaLoadoutData set ["slHat", ["UK3CB_CW_US_B_LATE_H_Patrol_Cap_WDL_01"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_oli"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];

_militiaLoadoutData set ["slRifles", [
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_militiaLoadoutData set ["rifles", [
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M193_Stanag", "rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A1_LSW", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];

_militiaLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["designatedGrenadeLaunchers", [
["rhs_weap_m79", "", "", "", ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M583A1_white", "rhs_mag_m714_White"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M583A1_white", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1911B_SMG", "rhsgref_30rnd_1143x23_M1T_SMG"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_R", "UK3CB_M60_100rnd_762x51_RT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M14", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""],
["UK3CB_M21", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_RT"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_grenade_mkii_mag", "rhs_grenade_m15_mag", "rhs_mag_m67"]];



//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["UK3CB_CW_US_B_LATE_U_CombatUniform_01_WDL"]];
_crewLoadoutData set ["vests", ["UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_green_helmet", "rhsusf_cvc_green_alt_helmet", "rhsusf_cvc_helmet", "rhsusf_cvc_alt_helmet"]];
_crewLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_crewLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["rhs_uniform_acu_oefcp"]];
_pilotLoadoutData set ["vests", ["rhsusf_spcs_ocp"]];
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p_black", "rhsusf_hgu56p_mask_black", "rhsusf_hgu56p_visor_black", "rhsusf_hgu56p_visor_mask_black"]];
_pilotLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A3", "", "uk3cb_acc_surefiregrip", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    if (random 1 < 0.15) then {
		[["lightHELaunchers", "lightATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    [["MEDvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    [["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    [["MGvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
    [["SNIvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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


    ["policeWeapons"] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 3, "glasses", 0.75]] call _fnc_setFacewear;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
