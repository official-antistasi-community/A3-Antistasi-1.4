//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "PLA"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "PLA Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "mas_chi_FlagCarrier_opf"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\PLA\flag_china.paa)] call _fnc_saveToTemplate; 				
["flagMarkerType", "mas_chi_Marker_opf"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["O_mas_chi_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["O_mas_chi_LSV_02_unarmed_F", "O_mas_chi_MRAP_02_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["O_mas_chi_LSV_02_armed_F", "O_mas_chi_LSV_02_AT_F", "O_mas_chi_MRAP_02_hmg_F", "O_mas_chi_MRAP_02_gmg_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["O_mas_chi_Truck_02_transport_F","O_mas_chi_Truck_02_covered_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["O_mas_chi_Truck_02_transport_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["O_mas_chi_Truck_02_reammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["O_mas_chi_Truck_02_repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["O_mas_chi_Truck_02_refuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["O_T_Truck_03_medical_ghex_F","O_T_Truck_02_Medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["O_mas_chi_APC_Wheeled_02_rcws_F", "O_ZBL09"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["O_mas_chi_APC_Tracked_02_cannon_F", "O_ZBD04A"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["O_ZTL11"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["O_ZTQ15", "O_ZTZ96B", "O_ZTZ99", "O_ZTZ99A", "O_mas_chi_MBT_02_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["O_PGZ09_AA", "O_mas_chi_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["O_mas_chi_APC_Tracked_02_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["O_ZTL11"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_mas_chi_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["O_mas_chi_Boat_Armed_01_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_mas_chi_Plane_CAS_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_mas_chi_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_O_AN2_TK"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["Z20"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["Z8L","O_mas_chi_Heli_Light_02_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["Z11WA", "Z11WA_2"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Z19","Z10", "O_mas_chi_Heli_Attack_02_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["O_mas_chi_MBT_02_arty_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["O_mas_chi_MBT_02_arty_F", ["32Rnd_155mm_Mo_shells_O"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["O_mas_chi_UAV_02_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["O_mas_chi_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["O_mas_chi_LSV_02_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["O_mas_chi_Truck_02_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["O_mas_chi_LSV_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["O_ZBD04A"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["O_mas_chi_HMG_01_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["O_mas_chi_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["O_mas_chi_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_mas_chi_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "O_Radar_System_02_F"] call _fnc_saveToTemplate;
["vehicleSam", "O_SAM_System_04_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "PLA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;

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

_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
["launch_mas_chi_Strela_F", "", "", "", ["Strela_mas_chi"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["launch_mas_chi_RPG32_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["lightATLaunchers", [
["CUP_launch_RPG18", "", "", "", [], [], ""],
["CUP_launch_RPG26", "", "", "", [], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
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
_loadoutData set ["NVGs", ["NVGoggles_mas_chi_H"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_mas_chi_O_sf1"]];
_loadoutData set ["traitorVests", ["V_mas_chi_PlateCarrier_o"]];
_loadoutData set ["traitorHats", ["H_mas_chi_boonie_OS"]];

_loadoutData set ["officerUniforms", ["U_mas_chi_O_officer3"]];
_loadoutData set ["officerVests", ["V_mas_chi_PlateCarrier_o"]];
_loadoutData set ["officerHats", ["H_mas_chi_beret_O"]];

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
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_black_F"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["NVGoggles_mas_chi_H"];

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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["U_mas_chi_O_sf1", "U_mas_chi_O_sf2", "U_mas_chi_O_officer3"]];
_sfLoadoutData set ["vests", ["V_mas_chi_PlateCarrier_o"]];
_sfLoadoutData set ["mgVests", ["V_mas_chi_PlateCarrier_o"]];
_sfLoadoutData set ["medVests", ["V_mas_chi_PlateCarrier_o"]];
_sfLoadoutData set ["glVests", ["V_mas_chi_PlateCarrier_o"]];
_sfLoadoutData set ["backpacks", ["O_mas_chi_Kitbag_m"]];
_sfLoadoutData set ["slBackpacks", ["O_mas_chi_Kitbag_m"]];
_sfLoadoutData set ["atBackpacks", ["O_mas_chi_Kitbag_m2"]];
_sfLoadoutData set ["helmets", ["H_mas_chi_HelmetO_SF"]];
_sfLoadoutData set ["slHat", ["H_mas_chi_beret_OS"]];
_sfLoadoutData set ["sniHats", ["H_mas_chi_boonie_OS"]];
_sfLoadoutData set ["NVGs", ["NVGoggles_mas_chi_H"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["arifle_mas_qbz95", "muzzle_snds_58_blk_F", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["30Rnd_mas_chi_580x42SD_mag"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["arifle_mas_qbz95_cqb", "muzzle_snds_58_blk_F", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["30Rnd_mas_chi_580x42SD_mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_mas_qbz95_UW", "muzzle_snds_58_blk_F", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["30Rnd_mas_chi_580x42SD_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_mas_qbz95_gl", "muzzle_snds_58_blk_f", "CUP_acc_LLM_black", "cup_optic_hensoldtzo", ["30Rnd_mas_chi_580x42SD_mag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
["CUP_arifle_SR3M_Vikhr_VFG", "CUP_muzzle_snds_SR3M", "", "CUP_optic_OKP_7", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""],
["CUP_smg_bizon", "CUP_muzzle_Bizon", "", "CUP_optic_OKP_7", ["CUP_64Rnd_9x19_Bizon_M"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["arifle_mas_qbz95_mg", "muzzle_snds_58_blk_F", "CUP_acc_LLM_black", "cup_optic_hensoldtzo", ["100Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cmg", "muzzle_snds_58_blk_F", "CUP_acc_LLM_black", "cup_optic_hensoldtzo", ["100Rnd_580x42_Mag_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["arifle_mas_qbz95_snp", "cup_muzzle_snds_scar_h", "", "optic_KHS_blk", ["20Rnd_mas_chi_650x39SD_mag"], [], ""],
["arifle_mas_qbz95_csnp", "cup_muzzle_snds_scar_h", "", "optic_KHS_blk", ["20Rnd_mas_chi_650x39SD_mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_mas_chi_GM6_F", "", "optic_dms", "", ["5Rnd_mas_chi_127x108_APDS_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_Rook40_F", "CUP_muzzle_snds_M9", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["U_mas_chi_O_sf1", "U_mas_chi_O_sf2", "U_mas_chi_O_sold2_swt"]];
_eliteLoadoutData set ["slUniforms", ["U_mas_chi_O_officer3"]];
_eliteLoadoutData set ["vests", ["V_mas_chi_TacVest"]];
_eliteLoadoutData set ["mgVests", ["V_mas_chi_PlateCarrier_o"]];
_eliteLoadoutData set ["medVests", ["V_mas_chi_TacVest"]];
_eliteLoadoutData set ["slVests", ["V_mas_chi_PlateCarrier_o"]];
_eliteLoadoutData set ["glVests", ["V_mas_chi_PlateCarrier_o"]];
_eliteLoadoutData set ["engVests", ["V_mas_chi_PlateCarrier_o"]];
_eliteLoadoutData set ["backpacks", ["O_mas_chi_Kitbag_m"]];
_eliteLoadoutData set ["slBackpacks", ["O_mas_chi_Kitbag_m"]];
_eliteLoadoutData set ["atBackpacks", ["O_mas_chi_Kitbag_m2"]];
_eliteLoadoutData set ["helmets", ["H_mas_chi_HelmetO", "H_mas_chi_HelmetO_gog"]];
_eliteLoadoutData set ["sniHats", ["H_mas_chi_boonie_OS"]];
_eliteLoadoutData set ["slHat", ["H_mas_chi_beret_O"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["slRifles", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["arifle_mas_qbz95_gl", "", "", "", ["30Rnd_580x42_Mag_F"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_UZI", "", "", "", ["CUP_32Rnd_9x19_UZI_M"], [], ""],
["CUP_arifle_SR3M_Vikhr_VFG", "", "", "", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""],
["CUP_smg_bizon", "", "", "", ["CUP_64Rnd_9x19_Bizon_M"], [], ""],
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["LMG_mas_chi_pkm_F", "", "", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
["CUP_arifle_RPK74M", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["arifle_mas_qbz95_snp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
["arifle_mas_qbz95_csnp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["arifle_mas_qbz95_snp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
["arifle_mas_qbz95_csnp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_mas_chi_O_sf1", "U_mas_chi_O_sf2", "U_mas_chi_O_sold2_swt"]];
_militaryLoadoutData set ["slUniforms", ["U_mas_chi_O_officer3"]];
_militaryLoadoutData set ["vests", ["V_mas_chi_TacVest"]];
_militaryLoadoutData set ["mgVests", ["V_mas_chi_PlateCarrier_o"]];
_militaryLoadoutData set ["medVests", ["V_mas_chi_TacVest"]];
_militaryLoadoutData set ["slVests", ["V_mas_chi_PlateCarrier_o"]];
_militaryLoadoutData set ["glVests", ["V_mas_chi_PlateCarrier_o"]];
_militaryLoadoutData set ["engVests", ["V_mas_chi_PlateCarrier_o"]];
_militaryLoadoutData set ["backpacks", ["O_mas_chi_Kitbag_m"]];
_militaryLoadoutData set ["slBackpacks", ["O_mas_chi_Kitbag_m"]];
_militaryLoadoutData set ["atBackpacks", ["O_mas_chi_Kitbag_m2"]];
_militaryLoadoutData set ["helmets", ["H_mas_chi_HelmetO", "H_mas_chi_HelmetO_gog"]];
_militaryLoadoutData set ["sniHats", ["H_mas_chi_boonie_OS"]];
_militaryLoadoutData set ["slHat", ["H_mas_chi_beret_O"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_mas_qbz95", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "cup_optic_aimpoint_5000", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["arifle_mas_qbz95_cqb", "", "", "", ["30Rnd_580x42_Mag_F"], [], ""],
["CUP_arifle_AK107", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_mas_qbz95_gl", "", "", "", ["30Rnd_580x42_Mag_F"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_UZI", "", "", "", ["CUP_32Rnd_9x19_UZI_M"], [], ""],
["CUP_arifle_SR3M_Vikhr_VFG", "", "", "", ["CUP_30Rnd_9x39_SP5_VIKHR_M"], [], ""],
["CUP_smg_bizon", "", "", "", ["CUP_64Rnd_9x19_Bizon_M"], [], ""],
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_mas_chi_pkm_F", "", "", "", ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""],
["CUP_arifle_RPK74M", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["arifle_mas_qbz95_snp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
["arifle_mas_qbz95_csnp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["arifle_mas_qbz95_snp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
["arifle_mas_qbz95_csnp", "", "", "optic_KHS_old", ["20Rnd_650x39_Cased_Mag_F"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_mas_chi_O_sold4_swt"]];
_policeLoadoutData set ["vests", ["V_mas_chi_PlateCarrier_sf"]];
_policeLoadoutData set ["helmets", ["H_mas_chi_beret_ON"]];

_policeLoadoutData set ["shotGuns", [
["CUP_smg_SA61", "", "", "", ["CUP_20Rnd_B_765x17_Ball_M"], [], ""],
["CUP_smg_Mac10", "", "", "", ["CUP_30Rnd_45ACP_MAC10_M"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74M_M"], [], ""],
["CUP_smg_BallisticShield_Sa61", "", "", "", ["CUP_20Rnd_B_765x17_Ball_M"], [], ""],
["CUP_hgun_BallisticShield_PMM", "", "", "", ["CUP_12Rnd_9x18_PMM_M"], [], ""],
["CUP_smg_SA61", "", "", "", ["CUP_20Rnd_B_765x17_Ball_M"], [], ""],
["CUP_smg_Mac10", "", "", "", ["CUP_30Rnd_45ACP_MAC10_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    "CUP_hgun_TT",
	"CUP_hgun_PMM"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["U_mas_chi_O_sf1", "U_mas_chi_O_sf2", "U_mas_chi_O_sold2_swt"]];
_militiaLoadoutData set ["vests", ["V_mas_chi_TacVest"]];
_militiaLoadoutData set ["sniVests", ["V_mas_chi_TacVest"]];
_militiaLoadoutData set ["backpacks", ["O_mas_chi_Kitbag_m"]];
_militiaLoadoutData set ["slBackpacks", ["O_mas_chi_Kitbag_m"]];
_militiaLoadoutData set ["atBackpacks", ["O_mas_chi_Kitbag_m"]];
_militiaLoadoutData set ["helmets", ["H_mas_chi_cap_O", "H_mas_chi_HelmetO", "H_mas_chi_cap_O", "H_mas_chi_HelmetO_gog"]];
_militiaLoadoutData set ["sniHats", ["H_mas_chi_boonie_OS"]];
_militiaLoadoutData set ["slHat", ["H_mas_chi_beret_O"]];

_militiaLoadoutData set ["rifles", [
["CUP_arifle_AK47_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKM_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKM", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKMS_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AK47", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKS", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""],
["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKMS", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""],
["CUP_arifle_AKS", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AKM_GL_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AK47_GL_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKM_GL", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKMS_GL_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""],
["CUP_smg_SA61", "", "", "", ["CUP_20Rnd_B_765x17_Ball_M"], [], ""],
["CUP_smg_Mac10", "", "", "", ["CUP_30Rnd_45ACP_MAC10_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["CUP_arifle_RPK74", "", "", "", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""],
["CUP_arifle_RPK74_45", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["CUP_SKS", "", "", "", ["CUP_10Rnd_762x39_SKS_M"], [], ""],
["CUP_SKS_rail", "", "", "cup_optic_leupold_vx3", ["CUP_10Rnd_762x39_SKS_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["CUP_srifle_LeeEnfield", "", "", "cup_optic_no23mk2", ["CUP_10x_303_M"], [], ""],
["CUP_srifle_Mosin_Nagant", "", "", "cup_optic_pem", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    "hgun_Rook40_F"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_mas_chi_O_sold1_swt"]];
_crewLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Veh"]];
_crewLoadoutData set ["helmets", ["H_mas_chi_HelmetCrew_O"]];	
_crewLoadoutData set ["carbines", [
	["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_mas_chi_O_sold1_swt"]];
_pilotLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Veh"]];
_pilotLoadoutData set ["helmets", ["H_mas_chi_HelmetPilot_O"]];
_pilotLoadoutData set ["carbines", [
	["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], [], ""]
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