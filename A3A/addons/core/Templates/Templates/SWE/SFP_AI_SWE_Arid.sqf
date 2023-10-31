//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "SweAF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Swedish Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "sfp_flagcarrier_sweden"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa)] call _fnc_saveToTemplate; 				
["flagMarkerType", "sfp_marker_sweden"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["sfp_cykel42"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["sfp_tgb11", "sfp_81_tgb1112", "sfp_tgb1317"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["sfp_tgb13_ksp58", "sfp_tgb1111", "sfp_tgb1111_sog_rbs56"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["sfp_tgb20"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CUP_B_MTVR_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_MTVR_Ammo_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_B_MTVR_Repair_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_MTVR_Refuel_BAF_DES"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["sfp_tgb1314"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["sfp_patgb360", "sfp_bv206"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["sfp_81_pbv302_mounted", "sfp_pbv302_mounted", "sfp_pbv302", "sfp_81_pbv302"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["sfp_ikv91", "sfp_strf90c_desert", "sfp_strv103b", "sfp_strv103c"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["sfp_strv121", "sfp_strv122", "sfp_81_strv102"]] call _fnc_saveToTemplate;
["vehiclesAA", ["sfp_lvkv90c_desert"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["sfp_patgb360", "sfp_bv206"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["sfp_ikv91", "sfp_strf90c", "sfp_strv103b", "sfp_strv103c"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["sfp_gruppbat"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["sfp_strb90", "sfp_rbb_norrkoping"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_I_JAS39_RACS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_I_JAS39_RACS"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["sfp_tp84_2015", "sfp_s100b"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["sfp_hkp9", "sfp_hkp6"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["sfp_hkp9_sog", "sfp_hkp16", "sfp_hkp16_ffv","sfp_hkp4"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["sfp_hkp9_rb55"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH64_DL_BAF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["sfp_grkpbv90120"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["sfp_grkpbv90120", ["sfp_2Rnd_120mm_Mo_shells"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["sfp_tgb16_ksp58", "sfp_tgb16_rws"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["sfp_tgb20"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["sfp_tgb16"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["sfp_patgb360", "sfp_bv206"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["sfp_tgb16_ksp58_mp"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_USMC"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_USMC"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_Stinger_AA_pod_Base_USMC"]] call _fnc_saveToTemplate;
["staticMortars", ["CUP_B_M252_USMC"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "SFP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
"WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

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

]];
_loadoutData set ["AALaunchers", [
    ["sfp_rbs69", "", "", "", ["sfp_rbs69_mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["sfp_grg48", "", "", "", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""],
    ["sfp_grg86", "", "", "", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["sfp_rb57", "sfp_pskott86", "sfp_pskott68"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["sfp_handgrenade_shgr2000", "sfp_handgrenade_shgr07"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["CUP_LRTV"]];

_loadoutData set ["traitorUniforms", ["sfp_m90d_uniform_folded"]];
_loadoutData set ["traitorVests", ["sfp_kroppskydd94_rifle1"]];
_loadoutData set ["traitorHats", ["sfp_m90w_booniehat"]];

_loadoutData set ["officerUniforms", ["sfp_m90d_uniform_tucked_m08"]];
_loadoutData set ["officerVests", ["sfp_kroppsskydd94"]];
_loadoutData set ["officerHats", ["sfp_army_beret"]];

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
_loadoutData set ["longRangeRadios", ["sfp_lk35_ra145", "sfp_stridssack2000_ra_ksk90"]];
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
private _sfmmItems = ["CUP_optic_AN_PVS_10_black"];

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
_sfLoadoutData set ["uniforms", ["sfp_m90d_uniform", "sfp_m90d_uniform_folded", "sfp_m90d_uniform_tucked_m08", "sfp_m90d_uniform_long_m08", "sfp_m90d_uniform_fs18"]];
_sfLoadoutData set ["vests", ["sfp_kroppsskydd12", "sfp_kroppsskydd12_tl"]];
_sfLoadoutData set ["mgVests", ["sfp_kroppsskydd12_mg"]];
_sfLoadoutData set ["medVests", ["sfp_kroppsskydd12_medic"]];
_sfLoadoutData set ["glVests", ["sfp_kroppsskydd12_gl"]];
_sfLoadoutData set ["backpacks", ["sfp_backpack_stridssack08"]];
_sfLoadoutData set ["slBackpacks", ["sfp_backpack_stridssack08"]];
_sfLoadoutData set ["atBackpacks", ["sfp_backpack_stridssack2000"]];
_sfLoadoutData set ["helmets", ["sfp_m90d_helmet", "sfp_m90d_helmet_headset_nvg", "sfp_m90d_helmet_headset", "sfp_m90d_helmet_nvg", "sfp_m90d_helmet_peltor_nomic", "sfp_m90d_helmet_peltor_nvg", "sfp_m90d_helmet_peltor"]];
_sfLoadoutData set ["slHat", ["sfp_sf_beret"]];
_sfLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["sfp_ak5dmk2", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["sfp_ak5c_m203", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
["sfp_mp5", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""],
["sfp_cbj_ms", "", "", "", ["sfp_30Rnd_650x25mag", "sfp_30Rnd_650x25mag_subsonic"], [], ""],
["sfp_mp5_rail", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["sfp_ksp58B2", "", "", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp58f", "", "sfp_dbal2", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp90b", "", "", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp90c", "", "sfp_dbal2", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_kikarsikte09_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4"], [], ""],
["sfp_ak5c", "muzzle_snds_m", "", "sfp_optic_susat_4x", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["CUP_hgun_Glock17", "", "", "", [], [], ""],
["CUP_hgun_Glock17_blk", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["sfp_m90d_uniform", "sfp_m90d_uniform_folded", "sfp_m90d_uniform_tucked_m08", "sfp_m90d_uniform_long_m08", "sfp_m90d_uniform_fs18"]];
_eliteLoadoutData set ["slUniforms", ["sfp_m90d_uniform_tucked_m08"]];
_eliteLoadoutData set ["vests", ["sfp_kroppskydd94_rifle1"]];
_eliteLoadoutData set ["mgVests", ["sfp_kroppskydd94_sv2k_rifle1"]];
_eliteLoadoutData set ["medVests", ["sfp_kroppskydd94_rifle1"]];
_eliteLoadoutData set ["slVests", ["sfp_kroppsskydd94"]];
_eliteLoadoutData set ["glVests", ["sfp_kroppskydd94_sv2k_rifle1"]];
_eliteLoadoutData set ["engVests", ["sfp_kroppskydd94_sv2k_rifle1_diaper"]];
_eliteLoadoutData set ["backpacks", ["sfp_backpack_stridssack2000", "sfp_backpack_lk35"]];
_eliteLoadoutData set ["slBackpacks", ["sfp_backpack_stridssack08"]];
_eliteLoadoutData set ["atBackpacks", ["sfp_backpack_grg_loader"]];
_eliteLoadoutData set ["helmets", ["sfp_m90d_helmet", "sfp_m90d_helmet_headset_nvg", "sfp_m90d_helmet_headset", "sfp_m90d_helmet_nvg", "sfp_m90d_helmet_peltor_nomic", "sfp_m90d_helmet_peltor_nvg", "sfp_m90d_helmet_peltor"]];
_eliteLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];
_eliteLoadoutData set ["slHat", ["sfp_army_beret"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["slRifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["sfp_ak5dmk2", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["sfp_ak5c_m203", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["sfp_mp5", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""],
["sfp_cbj_ms", "", "", "", ["sfp_30Rnd_650x25mag", "sfp_30Rnd_650x25mag_subsonic"], [], ""],
["sfp_mp5_rail", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["sfp_ksp58B2", "", "", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp58f", "", "sfp_dbal2", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp90b", "", "", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp90c", "", "sfp_dbal2", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_kikarsikte09_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4"], [], ""],
["sfp_ak5c", "muzzle_snds_m", "", "sfp_optic_susat_4x", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["CUP_hgun_Glock17", "", "", "", [], [], ""],
["CUP_hgun_Glock17_blk", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["sfp_m90d_uniform", "sfp_m90d_uniform_folded", "sfp_m90d_uniform_tucked_m08", "sfp_m90d_uniform_long_m08", "sfp_m90d_uniform_fs18"]];
_militaryLoadoutData set ["slUniforms", ["sfp_m90d_uniform_tucked_m08"]];
_militaryLoadoutData set ["vests", ["sfp_kroppskydd94_rifle1"]];
_militaryLoadoutData set ["mgVests", ["sfp_kroppskydd94_sv2k_rifle1"]];
_militaryLoadoutData set ["medVests", ["sfp_kroppskydd94_rifle1"]];
_militaryLoadoutData set ["slVests", ["sfp_kroppsskydd94"]];
_militaryLoadoutData set ["glVests", ["sfp_kroppskydd94_sv2k_rifle1"]];
_militaryLoadoutData set ["engVests", ["sfp_kroppskydd94_sv2k_rifle1_diaper"]];
_militaryLoadoutData set ["backpacks", ["sfp_backpack_stridssack2000", "sfp_backpack_lk35"]];
_militaryLoadoutData set ["slBackpacks", ["sfp_backpack_stridssack08"]];
_militaryLoadoutData set ["atBackpacks", ["sfp_backpack_grg_loader"]];
_militaryLoadoutData set ["helmets", ["sfp_m90d_helmet", "sfp_m90d_helmet_headset_nvg", "sfp_m90d_helmet_headset", "sfp_m90d_helmet_nvg", "sfp_m90d_helmet_peltor_nomic", "sfp_m90d_helmet_peltor_nvg", "sfp_m90d_helmet_peltor"]];
_militaryLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];
_militaryLoadoutData set ["slHat", ["sfp_army_beret"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["sfp_ak5", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5b", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c", "", "sfp_dbal2", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5c_alt", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["sfp_ak5dmk2", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
["sfp_ak5d", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["sfp_ak5c_m203", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic", "sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["sfp_mp5", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""],
["sfp_cbj_ms", "", "", "", ["sfp_30Rnd_650x25mag", "sfp_30Rnd_650x25mag_subsonic"], [], ""],
["sfp_mp5_rail", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["sfp_ksp58B2", "", "", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp58f", "", "sfp_dbal2", "sfp_optic_susat_4x", ["sfp_100Rnd_762x51_ksp58"], [], ""],
["sfp_ksp90b", "", "", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp90c", "", "sfp_dbal2", "cup_optic_acog2", ["sfp_200Rnd_556x45_ksp90"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_kikarsikte09_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4"], [], ""],
["sfp_ak5c", "muzzle_snds_m", "", "sfp_optic_susat_4x", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["CUP_hgun_Glock17", "", "", "", [], [], ""],
["CUP_hgun_Glock17_blk", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["sfp_police_uniform_modern", "sfp_police_uniform_modern_tactical"]];
_policeLoadoutData set ["vests", ["sfp_police_belt", "sfp_kroppsskydd_police", "sfp_police_tacVest"]];
_policeLoadoutData set ["helmets", ["sfp_police_hat", "sfp_police_helmet"]];

_policeLoadoutData set ["shotGuns", [
	["sfp_remington870", "", "", "", ["sfp_12Gauge_8rd_Pellets", "sfp_12Gauge_8rd_Slug"], [], ""],
	["sfp_remington870_chrome", "", "", "", ["sfp_12Gauge_8rd_Pellets", "sfp_12Gauge_8rd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
	["sfp_cga5p", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
	["sfp_mp5", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""],
	["sfp_mp5_rail", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    "CUP_hgun_Glock17"
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["sfp_m90d_uniform", "sfp_m90d_uniform_folded", "sfp_m90d_uniform_tucked_m08", "sfp_m90d_uniform_long_m08", "sfp_m90d_uniform_fs18"]];
_militiaLoadoutData set ["vests", ["sfp_stridsvast2000", "sfp_stridsvast2000_ar", "sfp_stridsvast2000_gl", "sfp_stridsvast2000_mg", "sfp_stridsvast2000_light"]];
_militiaLoadoutData set ["sniVests", ["sfp_stridsvast2000_light"]];
_militiaLoadoutData set ["backpacks", ["sfp_stridssele_backpack"]];
_militiaLoadoutData set ["slBackpacks", ["sfp_stridssele_backpack"]];
_militiaLoadoutData set ["atBackpacks", ["sfp_stridssele_backpack_grg"]];
_militiaLoadoutData set ["helmets", ["sfp_m90d_helmet", "sfp_m90d_helmet_headset_nvg", "sfp_m90d_helmet_headset", "sfp_m90d_helmet_nvg", "sfp_m90d_helmet_peltor_nomic", "sfp_m90d_helmet_peltor_nvg", "sfp_m90d_helmet_peltor"]];
_militiaLoadoutData set ["sniHats", ["CUP_H_CZ_Booniehat_vz95_des"]];
_militiaLoadoutData set ["slHat", ["sfp_homeguard_beret"]];

_militiaLoadoutData set ["rifles", [
["sfp_ak4", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], [], ""],
["sfp_ak5b", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["sfp_ak4", "", "", "", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4"], [], ""],
["sfp_ak5c", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["sfp_ak4_m203", "", "", "", ["sfp_20Rnd_762x51_ak4", "sfp_20Rnd_762x51_ak4_tracer"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_White_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["sfp_kpistm45", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""],
["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""],
["sfp_kpistm45b", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["sfp_ksp58", "", "", "", ["sfp_50Rnd_762x51_ksp58"], [], ""],
["sfp_ksp58B2", "", "", "", ["sfp_50Rnd_762x51_ksp58"], [], ""],
["sfp_ksp58f", "", "", "", ["sfp_50Rnd_762x51_ksp58"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4_ap", "sfp_20Rnd_762x51_ak4"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];
_militiaLoadoutData set ["sidearms", [
    "CUP_hgun_Glock17"
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["sfp_m69p_uniform", "sfp_m69p_uniform_hood"]];			
_crewLoadoutData set ["vests", ["sfp_kroppsskydd12_crew"]];				
_crewLoadoutData set ["helmets", ["CUP_H_CZ_Helmet05"]];	
_crewLoadoutData set ["carbines", [
	["sfp_kpistm45", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45b", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["sfp_m87_flying_suit"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_pilotLoadoutData set ["helmets", ["sfp_flighthelmet116"]];
_pilotLoadoutData set ["carbines", [
	["sfp_kpistm45", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45b", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""]
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