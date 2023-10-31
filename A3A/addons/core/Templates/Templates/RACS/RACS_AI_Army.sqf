//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Royal Army Corps"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Sahrani Army Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\PRACS_Core\Flags\KingdomofSahrani_co_mrk.paa"] call _fnc_saveToTemplate; // QPATHTOFOLDER(Templates\Templates\RACS\flag_sahrani_co.paa)				
["flagMarkerType", "PRACS_Sahrani_Flag_mrk"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

/* ANTISTASI PLUS STUFF START */
["vehiclesMilitiaAPCs", ["PRACS_M1117"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["PRACS_M1117", "PRACS_BMR_M2"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["PRACS_M88", "PRACS_FV107"]] call _fnc_saveToTemplate;

["staticHowitzers", ["PRACS_M1"]] call _fnc_saveToTemplate;
["howitzerMagazineHE", "PRACS_155mm_HE_M1_x25"] call _fnc_saveToTemplate;
["vehicleRadar", "PRACS_MPQ64_Sentinel"] call _fnc_saveToTemplate;
["vehicleSam", "PRACS_MiM23_HAWK"] call _fnc_saveToTemplate;
/* ANTISTASI PLUS STUFF END */

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_M1025", "PRACS_M1025_marine"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_M1025_M2", "PRACS_M1151_M240"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["PRACS_M250_flat_bed", "PRACS_M250"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_M250_flat_bed", "PRACS_M250"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_M250_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_M250_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_M250_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_M250_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["PRACS_M1A1_AIM", "PRACS_M60A3"]] call _fnc_saveToTemplate;
["vehiclesAA", ["PRACS_M163_MACHBET", "PRACS_M163_VADS"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["PRACS_Mk5_SOCR"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["PRACS_BMR_HQ"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["PRACS_A4M", "PRACS_F16CJR", "PRACS_F16CJ"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["PRACS_MirageIII"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["PRACS_C130"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["PRACS_UH1H"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["PRACS_Sa330_Puma"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["PRACS_UH1H_CAS"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["PRACS_AH1S"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["PRACS_M109A6"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["PRACS_M109A6", ["PRACS_155mm_HE_M109A6_x25"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["PRACS_M1025_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_M250_flat_bed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_M998_cargo_open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["PRACS_M1097_Scout"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; //this line determines available HE-shells for the static mortars - !needs to be comtible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; //this line determines smoke-shells for the static mortar - !needs to be comtible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["vehiclesAPCs", ["PRACS_BMR_A3_M2", "PRACS_M113_M240"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["sfFaces", ["WhiteHead_22_sa"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
/* ANTISTASI PLUS STUFF START */
_loadoutData set ["traitorUniforms", ["PRACS_M10_Commando_uniform"]];
_loadoutData set ["traitorVests", ["PRACS_O_CIRAS_GAL_rifleman", "PRACS_O_CIRAS_G3_rifleman"]];
_loadoutData set ["traitorHats", ["PRACS_Patrol_ASDPM_B_Cap", "PRACS_Patrol_SDPM_Cap", "PRACS_Patrol_SMAR_Cap"]];

_loadoutData set ["officerUniforms", ["PRACS_M10_SNG_D_PL_uniform", "PRACS_M10_1ID_PL_uniform"]];
_loadoutData set ["officerVests", ["PRACS_holster_vest", "V_Rangemaster_belt", "rhs_6sh92_digi_radio"]];
_loadoutData set ["officerHats", ["PRACS_Patrol_6TDes_Cap", "PRACS_1st_Infantry_beret"]];
/* ANTISTASI PLUS STUFF END */

_loadoutData set ["expBackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["aaBackpacks", []];
_loadoutData set ["longRangeRadios", []];

_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
["rhs_weap_M136_hedp", "", "", "", ["rhs_m136_hedp_mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["rhs_weap_smaw"]];
_loadoutData set ["missileATLaunchers", [
["PRACS_SAAWS", "", "", "", ["rhs_mag_maaws_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["rhs_weap_fim92", "", "", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

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
_loadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_loadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
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
_sfLoadoutData set ["uniforms", ["PRACS_M10_Recon_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_CIRAS_Recon_SF", "PRACS_CIRAS_SL", "PRACS_CIRAS_grenadier_SF"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["helmets", ["PRACS_Booniehat_HS_SDPM", "PRACS_Recon_beret"]];
_sfLoadoutData set ["sniHats", ["rhsusf_mich_bare_norotos_arc_semi_headset"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_sfLoadoutData set ["rifles", [
["rhs_weap_hk416d10_LMT_wd", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_hk416d10_LMT_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_rvg_blk"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_m4a1_blockII_wd", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4a1_blockII_M203_wd", "rhsusf_acc_nt4_tan", "rhsusf_acc_m952v", "rhsusf_acc_acog", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_xps3", [], [], "rhsusf_acc_rvg_blk"]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip_S", "", "", "", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box"], [], "rhsusf_acc_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25", "", "", "rhsusf_acc_m8541", ["rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m118_special_Mag", "rhsusf_20Rnd_762x51_SR25_m118_special_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010", "", "", "rhsusf_acc_m8541", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_cz99", "", "", "", [], [], ""],
["rhs_weap_tt33", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["PRACS_M10_Digital_Commando_OD_uniform"]];
_eliteLoadoutData set ["vests", ["PRACS_O_CIRAS_rifleman", "PRACS_O_CIRAS_Recon_SF", "PRACS_O_CIRAS_medic"]];
_eliteLoadoutData set ["backpacks", ["PRACS_Assault_pack"]];
_eliteLoadoutData set ["helmets", ["rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam"]];
_eliteLoadoutData set ["sniHats", ["rhsusf_opscore_rg_cover"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_hk416d10_LMT_d", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG"], [], "rhsusf_acc_rvg_blk"],
["PRACS_galil_ACE23", "rhsusf_acc_sf3p556", "rhsusf_acc_anpeq15a", "rhsusf_acc_acog_usmc", ["PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_m4_mstock", "rhsusf_acc_nt4_tan", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_vhsk2", "rhsusf_acc_sf3p556", "", "rhsusf_acc_acog", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m4_carryhandle_m203S", "rhsusf_acc_nt4_tan", "rhsusf_acc_m952v", "rhsusf_acc_acog", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_xps3", [], [], "rhsusf_acc_rvg_blk"]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box", "rhsusf_200Rnd_556x45_box"], [], "rhsusf_acc_saw_bipod"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["PRACS_g3a4_w", "", "", "rhsusf_acc_m8541_low", ["PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag"], [], "pracs_g3_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "", "rhsusf_acc_m8541", [], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["rhs_weap_cz99", "", "", "", [], [], ""],
["rhs_weap_tt33", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["PRACS_M10_Fusilier_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_RFP_CIRAS_GAL_rifleman", "PRACS_RFP_CIRAS_GAL_medic"]];
_militaryLoadoutData set ["Hvests", ["rhsusf_mbav_mg"]];
_militaryLoadoutData set ["glVests", ["rhsusf_mbav_grenadier"]];
_militaryLoadoutData set ["backpacks", ["PRACS_FieldPack"]];
_militaryLoadoutData set ["expBackpacks", ["rhs_rk_sht_30_olive_engineer_empty", "rhs_assault_umbts_engineer_empty", "rhs_rk_sht_30_emr_engineer_empty"]];
_militaryLoadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_militaryLoadoutData set ["helmets", ["PRACS_ACH_RFP_F", "PRACS_ACH_QSB_camo"]];
_militaryLoadoutData set ["binoculars", ["rhsusf_bino_lrf_Vector21"]];

_militaryLoadoutData set ["slRifles", [
["PRACS_galil_ACE23", "", "", "rhsusf_acc_g33_t1", ["PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["PRACS_galil_ACE23", "", "", "rhsusf_acc_eotech_552", ["PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag", "PRACS_35rd_Galil_Mk262_mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_vhsd2", "", "", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_vhsd2_bg", "", "", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["PRACS_HK33", "", "", "rhsusf_acc_rm05", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["PRACS_Mk48_Para", "", "", "", ["PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48_light", "", "", "", ["PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_vss", "", "", "rhs_acc_pso1m2", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhsusf_acc_m8541", ["rhs_5Rnd_338lapua_t5000", "rhs_5Rnd_338lapua_t5000", "rhs_5Rnd_338lapua_t5000"], [], "rhs_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_m9", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["PRACS_Police_Uniform"]];
_policeLoadoutData set ["vests", ["PRACS_Police_Vest", "PRACS_holster_vest"]];
_policeLoadoutData set ["helmets", ["PRACS_Police_Cap"]];

_policeLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "", [], [], ""],
["PRACS_HK33A4", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhsusf_weap_m1911a1"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["PRACS_M10_1ID_uniform", "PRACS_M10_DES_uniform"]];
_militiaLoadoutData set ["vests", ["PRACS_C_CIRAS_G3_rifleman", "PRACS_C_CIRAS_G3_Recon"]];
_militiaLoadoutData set ["backpacks", ["PRACS_FieldPack"]];
_militiaLoadoutData set ["helmets", ["PRACS_LWH_6TDES", "PRACS_LWH_ESS_6TDES"]];

_militiaLoadoutData set ["rifles", [
["PRACS_g3a3", "", "", "", ["PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag", "PRACS_20rd_G3_mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["PRACS_galil_SAR", "", "", "", ["PRACS_35rd_Galil_mag", "PRACS_35rd_Galil_mag", "PRACS_35rd_Galil_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_vhsd2_bg", "", "", "rhsusf_acc_eotech_xps3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["PRACS_UZI", "", "", "rhsusf_acc_eotech_xps3", [], [], ""],
["PRACS_HK53", "", "", "rhsusf_acc_rm05", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["PRACS_Mk48_STD", "", "", "", ["PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""],
["PRACS_Mk48", "", "", "", ["PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch", "PRACS_100rd_Mk48_M80ball_Soft_pouch"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", [], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////

/* ANTISTASI PLUS STUFF START */
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["PRACS_M10_ADA_uniform"]];
_crewLoadoutData set ["vests", ["PRACS_C_CIRAS_G3_rifleman"]];
_crewLoadoutData set ["helmets", ["rhsusf_cvc_ess"]];
_crewLoadoutData set ["carbines", [
["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PRACS_Pilot_suit_uniform"]];
_pilotLoadoutData set ["vests", ["PRACS_Jet_Pilot_vest", "PRACS_Jet_Pilot_harness"]];
_pilotLoadoutData set ["helmets", ["PRACS_Attack_Heli_pilot_helmet", "rhsusf_hgu56p_visor"]];
_pilotLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""]
]];
/* ANTISTASI PLUS STUFF END */

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["helmets"] call _fnc_setHelmet;
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
    ["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
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
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;