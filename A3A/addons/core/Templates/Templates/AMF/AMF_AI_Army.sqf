//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "French Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "French Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa)] call _fnc_saveToTemplate;			
["flagMarkerType", "flag_France"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["R3F_PVP_CE", "B_AMF_VAB_ULTIMA_X8_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["R3F_PVP_FN_CE", "AMF_VBMR_L_01"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["AMF_GBC180_PERS_01", "R3F_KAMAZ_CE_trans"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["AMF_GBC180_PLATEAU_01", "AMF_GBC180_PERS_01"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["AMF_GBC180_AmmoTruck"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["AMF_GBC180_MECA_01"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["R3F_KAMAZ_CE_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["R3F_KAMAZ_CE_medevac", "AMF_VBMR_SAN_CE"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["B_AMF_VAB_ULTIMA_X8_F", "AMF_VBMR_HMG_CE", "AMF_VBMR_GENIE_OD", "AMF_VBMR_L_CE_01"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["B_AMF_VAB_ULTIMA_X8_F", "AMF_VBMR_HMG_CE", "AMF_VBCI_CE_01_F", "AMF_EBRC_CE_01", "B_AMF_AMX10_RCR_01_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["R3F_PANDUR_CE", "B_AMF_AMX10_RCR_01_F", "B_AMF_VAB_ULTIMA_TOP_X8_F", "AMF_VBMR_COMMANDEMENT_CE", "AMF_VBCI_CE_01_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["AMF_VBCI_CE_01_F", "B_AMF_AMX10_RCR_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["B_AMF_AMX10_RCR_SEPAR_01_F", "R3F_DCL_CE"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["B_AMF_TANK_01", "B_AMF_TANK_CE_02_F", "R3F_MBT52_CE"]] call _fnc_saveToTemplate;
["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["R3F_PANDUR_CE"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["R3F_ALCA_ADLA", "AMF_RAFALE_B_01_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["AMF_RAFALE_B_01_F", "R3F_GRIPEN", "B_AMF_PLANE_FIGHTER_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_AMF_PLANE_TRANSPORT_01_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["AMF_gazelle_afte_f", "R3F_AH6_CE", "R3F_LYNX_CE"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["amf_nh90_tth_transport", "amf_cougar", "R3F_MERLIN_CE"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["R3F_AH6_CE_ARMED", "R3F_LYNX_CE_ARMED"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["AMF_TIGRE_01"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
    ["B_T_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["R3F_PVP_FN_CE"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["AMF_GBC180_PERS_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["R3F_PVP_CE"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["R3F_FENNEC_CE"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["R3F_PVP_GENDARMERIE"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["AMF_WiredGuided_mmp_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["R3F_MO81_LLR"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

["voices", ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

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
    ["AMF_AT4CS_Loaded", "", "", "", ["Eryx_HEAT"], [], ""],
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["R3F_STINGER", "", "", "", ["R3F_STINGER_mag"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
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

_loadoutData set ["traitorUniforms", ["amf_uniform_03_CE_HS"]];
_loadoutData set ["traitorVests", ["amf_DCS_01_RG", "amf_JPC_01"]];
_loadoutData set ["traitorHats", ["AMF_BERET_INFANTERIE"]];

_loadoutData set ["officerUniforms", ["R3F_uniform_off"]];
_loadoutData set ["officerVests", ["amf_SMB_BME"]];
_loadoutData set ["officerHats", ["R3F_casquette_off"]];

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
_loadoutData set ["slHat", ["AMF_BERET_INFANTERIE"]];
_loadoutData set ["sniHats", ["AMF_BERET_INFANTERIE"]];

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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["amf_uniform_04_OD", "amf_uniform_05_OD"]];
_sfLoadoutData set ["vests", ["amf_JPC_01_OD", "amf_DCS_01_OD"]];
_sfLoadoutData set ["mgVests", ["amf_SMB_ART_TDF"]];
_sfLoadoutData set ["medVests", ["amf_DCS_03_OD"]];
_sfLoadoutData set ["glVests", ["amf_SMB_GRE_TDF"]];
_sfLoadoutData set ["backpacks", ["AMF_rush24_01"]];
_sfLoadoutData set ["slBackpacks", ["R3F_sac_petit_noir"]];
_sfLoadoutData set ["atBackpacks", ["AMF_Bergen_F2"]];
_sfLoadoutData set ["helmets", ["AMF_opscore4", "AMF_OPSCORE2_OD1_2"]];
_sfLoadoutData set ["slHat", ["AMF_BERET_MARINE_PARA"]];
_sfLoadoutData set ["sniHats", ["AMF_F3_L02"]];
_sfLoadoutData set ["NVGs", ["AMF_BINYX_BLK_NVG"]];
_sfLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

_sfLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_sfLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_sfLoadoutData set ["slRifles", [
    ["AMF_614_long_FS_BLK", "AMF_ROTEX_III", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "AMF_WMX200", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_Samas_VALO_01_F", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["25Rnd_samas_f1_mag"], [], "amf_acc_famas_grip5"]
]];
_sfLoadoutData set ["rifles", [  
    ["R3F_SCAR_L_BLACK", "R3F_SILENCIEUX_ROTEX", "r3f_acc_anpeq_laser_scar", "R3F_ELCAN_5_56", ["R3F_30Rnd_Magpul_556x45"], [], ""],
    ["AMF_614_long_FS3_BLK", "AMF_ROTEX_V", "", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS3_BLK", "AMF_ROTEX_V", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["AMF_614_short_fs2_blk", "", "", "AMF_Eotech_552", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS_BLK", "", "", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS3_BLK", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS5_BLK", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["R3F_SCAR_H_CAM_LG", "", "AMF_WMX200", "AMF_specter_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
    ["R3F_SCAR_H_CAM_LG_GHILLIE", "", "AMF_WMX200", "AMF_specter_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
    ["R3F_SCAR_L_CQC_LG_CAM", "", "AMF_WMX200", "R3F_ELCAN_5_56_DES", ["R3F_30Rnd_Magpul_556x45_tan"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["R3F_MP7A2", "R3F_SILENCIEUX_MP7A2", "", "AMF_Red_Dot_Sight", ["R3F_40Rnd_460x30"], [], "r3f_acc_poignee_black"],
    ["R3F_MP5SD", "R3F_SILENCIEUX_MP7A2", "", "R3F_Eotech_HWS", ["R3F_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["R3F_Minimi_762_HG", "", "", "R3F_ELCAN_7_62", ["R3F_100Rnd_762x51_MINIMI"], [], ""],
    ["R3F_Minimi_HG", "", "", "R3F_EOTECH", ["R3F_200Rnd_556x45_MINIMI"], [], ""],
    ["amf_mini_mg_tactical_mk3", "", "", "", ["150Rnd_MINI_MG_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "R3F_NF", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["R3F_SCAR_H_TPR_20pcs_blk", "", "AMF_AN_PEQ_15_black", "R3F_NF42", ["R3F_20Rnd_762x51_SCAR"], [], "R3F_BIPIED_HK417"]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "optic_LRPS", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
    ["R3F_HKUSP", "", "", "", [], [], ""],
    ["AMF_Pamas", "", "", "", [], [], ""],
    ["R3F_G17", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["amf_uniform_01_CE_HS", "amf_uniform_01_RE_CE_HS", "amf_uniform_03_CE_HS", "amf_uniform_05_TAN"]];
_eliteLoadoutData set ["slUniform", ["amf_uniform_04_TAN"]];
_eliteLoadoutData set ["vests", ["amf_DCS_04_TAN", "amf_DCS_03_TAN", "amf_DCS_02_TAN"]];
_eliteLoadoutData set ["mgVests", ["amf_SMB_ART_TAN"]];
_eliteLoadoutData set ["medVests", ["amf_SMB_AUXSAN_TAN", "amf_JPC_03_TAN"]];
_eliteLoadoutData set ["slVests", ["amf_DCS_01_TAN", "amf_SMB_LEADER_TAN"]];
_eliteLoadoutData set ["glVests", ["amf_SMB_GRE_TAN"]];
_eliteLoadoutData set ["engVests", ["amf_SMB_GRE_FAMAS_TAN"]];
_eliteLoadoutData set ["backpacks", ["AMF_rush24_01_TAN", "AMF_FELIN_BACKPACK_TAN", "AMF_Bergen_F2"]];
_eliteLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK_MEDIC_TAN", "AMF_FELIN_BACKPACK_LIGHT_TAN"]];
_eliteLoadoutData set ["atBackpacks", ["amf_tecpack_70L_TAN"]];
_eliteLoadoutData set ["helmets", ["AMF_FELIN_05_TAN", "AMF_FELIN_06_TAN", "AMF_OPSCORE_TAN_2", "AMF_OPSCORE3_TAN", "AMF_OPSCORE4_TAN"]];
_eliteLoadoutData set ["sniHats", ["AMF_FELIN_L06_TAN", "AMF_FELIN_L04_TAN"]];
_eliteLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

_eliteLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_eliteLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_eliteLoadoutData set ["slRifles", [
    ["AMF_614_short_FS_TAN2", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_long_FS_TAN2", "", "AMF_AN_PEQ_15_black", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_long_FS3_BLK", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_SCAR_L_01_F", "", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["AMF_614_short_FS3_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_long_FS3_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_614_long_FS5_BLK", "", "AMF_AN_PEQ_15_black", "AMF_EOTECH_553_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_Samas_VALO_01_F", "", "", "AMF_EOTECH_553", ["25Rnd_samas_f1_mag"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_Samas_FELIN_01_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["25Rnd_samas_f1_mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["AMF_614_short_FS3_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_long_FS3_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["R3F_SCAR_H_CAM_LG_GHILLIE", "", "", "AMF_xps3_magnifier_side_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["R3F_SCAR_H_CAM_LG", "", "", "AMF_EOTECH_553_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["amf_hk_mp5_02_f", "", "", "AMF_specter", ["30Rnd_9x19_mag"], [], "amf_acc_hkmp5_grip3"]
]];
_eliteLoadoutData set ["machineGuns", [
    ["amf_mini_mg_tactical_mk3", "", "", "AMF_specter", ["150Rnd_MINI_MG_mag"], [], "amf_acc_mini_grip2"],
    ["amf_mini_mg_tactical_mk3", "", "", "AMF_EOTECH_553", ["150Rnd_MINI_MG_mag"], [], "amf_acc_mini_grip3"]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["20Rnd_762x51_Mag"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "amf_acc_714_long_grip3"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sidearms", [
    ["AMF_Glock_17_BLK", "", "", "", ["16Rnd_9x21_Mag"], [], ""],
    ["R3F_HKUSP", "", "", "", ["R3F_15Rnd_9x19_HKUSP"], [], ""],
    ["AMF_Pamas", "", "", "", ["15Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["amf_uniform_01_CE_HX", "amf_uniform_01_RE_CE_MD", "amf_uniform_01_RE_NG_CE_HS"]];
_militaryLoadoutData set ["slUniform", ["amf_uniform_05_TAN"]];
_militaryLoadoutData set ["vests", ["amf_SMB_AUXSAN_TAN", "amf_SMB_AUXSAN_FAMAS_TAN", "amf_JPC_01_TAN"]];
_militaryLoadoutData set ["mgVests", ["amf_SMB_ART_TAN"]];
_militaryLoadoutData set ["medVests", ["amf_SMB_FUS_TAN", "amf_jpc_02_TAN"]];
_militaryLoadoutData set ["slVests", ["amf_DCS_03_TAN", "amf_JPC_03_TAN", "amf_DCS_02_TAN"]];
_militaryLoadoutData set ["glVests", ["amf_SMB_GRE_TAN"]];
_militaryLoadoutData set ["engVests", ["amf_SMB_GRE_FAMAS_TAN"]];
_militaryLoadoutData set ["backpacks", ["AMF_rush24_01_TAN", "amf_tecpack_30L_TAN", "AMF_FELIN_BACKPACK_TAN"]];
_militaryLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TAN", "AMF_rush24_01_TAN"]];
_militaryLoadoutData set ["atBackpacks", ["AMF_Bergen_F2"]];
_militaryLoadoutData set ["helmets", ["AMF_FELIN_05_TAN", "AMF_FELIN_05_CE", "AMF_FELIN_06_CE", "AMF_FELIN_06_TAN", "AMF_TC801_TAN_EARPROT_BLK", "AMF_TC801_TAN_EARPROT_BLK_2"]];
_militaryLoadoutData set ["sniHats", ["AMF_FELIN_L05_TAN", "AMF_FELIN_L05_CE", "AMF_TC800_TAN_EARPROT_TAN", "AMF_TC800_TAN_EARPROT_TAN_2"]];
_militaryLoadoutData set ["binoculars", ["AMF_APX_M241"]];

_militaryLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_militaryLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_militaryLoadoutData set ["slRifles", [
    ["AMF_614_short_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_long_01_F", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_short_FS_BLK", "", "", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
]];
_militaryLoadoutData set ["rifles", [
    ["AMF_614_short_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_long_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_Samas_G2_01_F", "", "", "", ["30Rnd_556x45_Stanag"], [], ""],
    ["AMF_Samas_VALO_01_F", "", "", "", ["25Rnd_samas_f1_mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["R3F_SCAR_H_CAM_LG_GHILLIE", "", "", "AMF_xps3_magnifier_side_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["R3F_SCAR_H_CAM_LG", "", "", "AMF_EOTECH_553_painted", ["R3F_20Rnd_762x51_SCAR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["amf_hk_mp5_02_f", "", "", "AMF_Red_Dot_Sight", ["30Rnd_9x19_mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["amf_mini_mg_tactical_mk3", "", "", "AMF_specter", ["150Rnd_MINI_MG_mag"], [], "amf_acc_mini_grip2"],
    ["amf_mini_mg_tactical_mk3", "", "", "AMF_EOTECH_553", ["150Rnd_MINI_MG_mag"], [], "amf_acc_mini_grip3"]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["20Rnd_762x51_Mag"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "amf_acc_714_long_grip3"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sidearms", [
    ["AMF_Glock_17_BLK", "", "", "", ["16Rnd_9x21_Mag"], [], ""],
    ["AMF_Pamas", "", "", "", ["15Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["R3F_vestetactique_noire", "V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_Beret_gen_F"]];

_policeLoadoutData set ["SMGs", [
    ["AMF_Samas_F1_01_F", "", "", "", ["25Rnd_samas_f1_mag_Tracer_green", "25Rnd_samas_f1_mag_Tracer_red"], [], ""],
    ["amf_hk_mp5_01_f", "", "", "", ["30Rnd_9x19_mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["R3F_G17", "", "", "", ["R3F_17Rnd_9x19_G17"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["amf_uniform_01_RE_NG_OD_HX", "amf_uniform_01_RE_OD_HS"]];
_militiaLoadoutData set ["vests", ["amf_SMB_TDF"]];
_militiaLoadoutData set ["sniVests", ["amf_SMB_TP_SCAR_TAN"]];
_militiaLoadoutData set ["backpacks", ["AMF_rush24_01_TAN", "amf_tecpack_30L_TAN"]];
_militiaLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK_TAN"]];
_militiaLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_militiaLoadoutData set ["helmets", ["AMF_FELIN_05_CE", "AMF_FELIN_05_TAN", "AMF_FELIN_06_CE"]];
_militiaLoadoutData set ["sniHats", ["AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"]];

_militiaLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_militiaLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_militiaLoadoutData set ["rifles", [
    ["R3F_SIG551_CE", "", "", "", ["R3F_30Rnd_556x45_SIG551"], [], ""],
    ["R3F_SIG551_CE", "", "", "", ["R3F_30Rnd_556x45_SIG551"], [], ""],
    ["AMF_Samas_G2_01_F", "", "", "", ["30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["R3F_HK416F_short", "", "", "", ["R3F_30Rnd_556x45"], [], ""],
    ["R3F_SCAR_L_CQC_CAM", "", "", "", ["R3F_30Rnd_Magpul_556x45_tan"], [], ""],
    ["AMF_Samas_F1_01_F", "", "", "AMF_Red_Dot_Sight", ["25Rnd_samas_f1_mag"], [], ""],
    ["AMF_Samas_F1_01_F", "", "", "", ["25Rnd_samas_f1_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["R3F_SCAR_L_CQC_LG_CAM", "", "", "AMF_EOTECH_553_painted", ["R3F_30Rnd_Magpul_556x45_tan"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["amf_hk_mp5_01_f", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["amf_mag58_01_f", "", "", "", ["50Rnd_mag58_mag"], [], ""],
    ["amf_aanf1_01_f", "", "", "", ["50Rnd_762x51_band"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["20Rnd_762x51_Mag"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sidearms", [
    ["AMF_Glock_17_TAN", "", "", "", ["16Rnd_9x21_Mag"], [], ""],
    ["AMF_Pamas", "", "", "", ["15Rnd_9x21_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["amf_uniform_01_RE_CE_HS"]];
_crewLoadoutData set ["vests", ["amf_SMB_TDF"]];
_crewLoadoutData set ["helmets", ["AMF_ELNO_DH_586"]];
_crewLoadoutData set ["carbines", [
    ["amf_hk_mp5_01_f", "", "", "", ["30Rnd_9x19_mag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["amf_pilot_01_f"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_pilotLoadoutData set ["helmets", ["AMF_ALPHA900"]];
_pilotLoadoutData set ["carbines", [
    ["amf_hk_mp5_01_f", "", "", "", ["30Rnd_9x19_mag"], [], ""],
    ["R3F_SIG551", "", "", "", ["R3F_30Rnd_556x45_SIG551"], [], ""]
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
