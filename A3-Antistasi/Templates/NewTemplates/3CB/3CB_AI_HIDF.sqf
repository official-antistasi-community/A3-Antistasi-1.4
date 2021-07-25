//////////////////////////
//   Side Information   //
//////////////////////////

["name", "HIDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "HIDF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_HorizonIslands_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f_exp\flags\flag_tanoa_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Tanoa"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_B_M1030_HIDF"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_B_M151_Jeep_Closed_HIDF", "UK3CB_B_M151_Jeep_Closed_HIDF", "UK3CB_B_M151_Jeep_Open_HIDF", "UK3CB_B_M151_Jeep_Open_HIDF", "rhsgref_hidf_m1025", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_4dr_fulltop", "rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_M998_2dr_halftop"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_B_M151_Jeep_TOW_HIDF", "rhsgref_hidf_m1025_mk19", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_m2"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_B_M939_Closed_HIDF", "UK3CB_B_M939_Open_HIDF", "UK3CB_B_MTVR_Open_HIDF", "UK3CB_B_MTVR_Closed_HIDF", "UK3CB_B_M939_Guntruck_HIDF"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_B_M939_Recovery_HIDF", "UK3CB_B_MTVR_Recovery_HIDF"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_B_M939_Reammo_HIDF", "UK3CB_B_MTVR_Reammo_HIDF"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_B_M939_Repair_HIDF", "UK3CB_B_MTVR_Repair_HIDF"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_B_MTVR_Refuel_HIDF", "UK3CB_B_M939_Refuel_HIDF"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_US_B_EARLY_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_m2", "rhsgref_hidf_m113a3_mk19", "UK3CB_B_LAV25_HIDF", "UK3CB_B_LAV25_HIDF", "UK3CB_B_LAV25_HQ_HIDF", "UK3CB_B_AAV_HIDF", "UK3CB_B_AAV_HIDF"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_B_M60A3_HIDF", "UK3CB_B_M60A1_HIDF", "UK3CB_CW_US_B_EARLY_M1A1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_B_LAV25_HIDF", "UK3CB_B_AAV_HIDF"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHSGREF_A29B_HIDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_B_Mystere_HIDF_AA1"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["rhs_uh1h_hidf_unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["rhs_uh1h_hidf"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["rhs_uh1h_hidf_gunship"]] call _fnc_saveToTemplate;

/*
["vehiclesArtillery", ["UK3CB_CW_US_B_EARLY_M109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CW_US_B_EARLY_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;
*/

["vehiclesArtillery", [
["UK3CB_CW_US_B_EARLY_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["rhsgref_tla_g_offroad_armed", "UK3CB_I_G_LandRover_M2", "UK3CB_I_G_LandRover_SF_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_I_G_Ural_Covered", "UK3CB_I_G_Ural_Open", "I_G_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["rhsgref_tla_g_offroad", "UK3CB_I_G_LandRover_Closed"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F", "UK3CB_ADP_I_LandRover_Closed", "UK3CB_ADP_I_LandRover_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["baggedMGs", [["RHS_M2_Gun_Bag", "RHS_M2_Tripod_Bag"]]] call _fnc_saveToTemplate;
["baggedAT", [["rhs_Tow_Gun_Bag", "rhs_TOW_Tripod_Bag"]]] call _fnc_saveToTemplate;
["baggedAA", []] call _fnc_saveToTemplate;
["baggedMortars", [["rhs_M252_Gun_Bag", "rhs_M252_Bipod_Bag"]]] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanRifles", []];
_loadoutData setVariable ["sniperRifles", []];

_loadoutData setVariable ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp"
]];
_loadoutData setVariable ["ATLaunchers", []];
_loadoutData setVariable ["AALaunchers", [
"rhs_weap_fim92"
]];
_loadoutData setVariable ["sidearms", []];

_loadoutData setVariable ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData setVariable ["APMines", ["rhsusf_mine_m14_mag", "SLAMDirectionalMine_Wire_Mag"]];
_loadoutData setVariable ["lightExplosives", ["rhsusf_m112_mag", "DemoCharge_Remote_Mag"]];
_loadoutData setVariable ["heavyExplosives", ["rhsusf_m112x4_mag", "SatchelCharge_Remote_Mag"]];

_loadoutData setVariable ["antiTankGrenades", []];
_loadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData setVariable ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData setVariable ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["ItemRadio"]];
_loadoutData setVariable ["gpses", ["ItemGPS"]];
_loadoutData setVariable ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData setVariable ["binoculars", ["Binocular"]];
_loadoutData setVariable ["Rangefinder", ["Rangefinder"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["Snivests", ["UK3CB_V_Chestrig_ERDL"]];
_loadoutData setVariable ["backpacks", ["rhsusf_falconii", "rhsgref_hidf_alicepack", "UK3CB_B_Fieldpack", "B_Kitbag_rgr"]];
_loadoutData setVariable ["Engbackpacks", ["rhs_rk_sht_30_olive_engineer_empty"]];
_loadoutData setVariable ["Medbackpacks", ["UK3CB_B_TacticalPack_Med_Oli"]];
_loadoutData setVariable ["ATbackpacks", ["B_Kitbag_sgg"]];
_loadoutData setVariable ["SLbackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_loadoutData setVariable ["helmets", []];
_loadoutData setVariable ["offhat", ["H_Beret_blk"]];
_loadoutData setVariable ["snihat", ["UK3CB_CW_US_B_EARLY_H_BoonieHat_ERDL_02"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData setVariable ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData setVariable ["items_squadleader_extras", []];
_loadoutData setVariable ["items_rifleman_extras", []];
_loadoutData setVariable ["items_medic_extras", []];
_loadoutData setVariable ["items_grenadier_extras", []];
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_lat_extras", []];
_loadoutData setVariable ["items_at_extras", []];
_loadoutData setVariable ["items_aa_extras", []];
_loadoutData setVariable ["items_machineGunner_extras", []];
_loadoutData setVariable ["items_marksman_extras", []];
_loadoutData setVariable ["items_sniper_extras", []];
_loadoutData setVariable ["items_police_extras", []];
_loadoutData setVariable ["items_crew_extras", []];
_loadoutData setVariable ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData setVariable ["uniforms", ["rhs_uniform_g3_rgr"]];
_sfLoadoutData setVariable ["vests", ["V_TacVest_oli"]];
_sfLoadoutData setVariable ["Snivests", ["V_Chestrig_oli"]]; 
_sfLoadoutData setVariable ["backpacks", ["rhsusf_falconii"]];
_sfLoadoutData setVariable ["helmets", ["rhsusf_opscore_fg", "rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam"]];
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator_01_khk_F"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData setVariable ["rifles", [
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip2"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip3"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_grip3"]
]];
_sfLoadoutData setVariable ["SLrifles", [
["rhs_weap_m4a1_blockII_M203_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["rhs_weap_m4a1_blockII_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData setVariable ["carbines", [
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_m4a1_blockII_M203_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData setVariable ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_FMJ"], [], ""]
]];
_sfLoadoutData setVariable ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_soft_pouch"], [], "rhsusf_acc_grip4_bipod"]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m118_special_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_premier_mrds", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107_w", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];

_sfLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""],
["rhs_weap_smaw_green", "", "acc_pointer_IR", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], ["rhs_mag_smaw_SR"],""],
["rhs_weap_smaw_green", "", "acc_pointer_IR", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEDP", "rhs_mag_smaw_HEAA"], ["rhs_mag_smaw_SR"],""]

]];
_sfLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData setVariable ["uniforms", ["rhs_uniform_bdu_erdl"]];
_militaryLoadoutData setVariable ["vests", ["rhsgref_alice_webbing", "rhsgref_TacVest_ERDL", "rhsgref_TacVest_ERDL", "rhsgref_TacVest_ERDL"]];
_militaryLoadoutData setVariable ["Hvests", ["rhsgref_otv_khaki"]];
_militaryLoadoutData setVariable ["Snivests", ["rhsgref_alice_webbing"]];
_militaryLoadoutData setVariable ["helmets", ["rhsgref_helmet_pasgt_erdl"]];
_militaryLoadoutData setVariable ["binoculars", ["Laserdesignator_01_khk_F"]];

_militaryLoadoutData setVariable ["rifles", [
["UK3CB_HK33KA2_RIS", "", "", "", ["UK3CB_HK33_30rnd_556x45"], [], ""],
["UK3CB_HK33KA2_RIS", "", "", "rhsusf_acc_eotech_552", ["UK3CB_HK33_30rnd_556x45"], [], ""]
]];
_militaryLoadoutData setVariable ["SLrifles", [
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_compm4", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_ACOG", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["UK3CB_HK33KA3", "", "", "", ["UK3CB_HK33_30rnd_556x45"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["UK3CB_HK33KA2_RIS_GL", "", "", "", ["UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_HK33KA2_RIS_GL", "", "", "rhsusf_acc_eotech_552", ["UK3CB_HK33_30rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["UK3CB_MP5", "", "", "", ["UK3CB_MP5_30Rnd_Magazine"], [], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["UK3CB_MG3_KWS_G", "", "", "rhsusf_acc_ACOG_wd", ["UK3CB_MG3_100rnd_762x51_R", "UK3CB_MG3_100rnd_762x51_R", "UK3CB_MG3_100rnd_762x51_GM"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["UK3CB_M14_Railed", "", "", "uk3cb_optic_artel_m14", ["UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51", "UK3CB_M14_20rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["rhs_weap_m40a5", "", "", "rhsusf_acc_M8541_low_wd", ["rhsusf_5Rnd_762x51_AICS_m118_special_Mag"], [], "rhsusf_acc_harris_swivel"]
]];

_militaryLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", [
["rhsusf_weap_m9", "", "", "", ["rhsusf_mag_15Rnd_9x19_FMJ"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData setVariable ["uniforms", ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"]];
_policeLoadoutData setVariable ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData setVariable ["helmets", ["H_MilCap_gen_F", "H_Beret_gen_F"]];

_policeLoadoutData setVariable ["SMGs", [
["UK3CB_MP5", "", "", "", ["UK3CB_MP5_30Rnd_Magazine"], [], ""]
]];
_policeLoadoutData setVariable ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck"], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["rhs_uniform_bdu_erdl"]];
_militiaLoadoutData setVariable ["vests", ["rhsgref_chicom"]];
_militiaLoadoutData setVariable ["helmets", ["H_Bandanna_gry", "H_Cap_oli", "H_Bandanna_sgg"]];

_militiaLoadoutData setVariable ["rifles", [
["rhs_weap_l1a1_wood", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal"], [], ""],
["UK3CB_M16A1", "", "", "", ["UK3CB_M16_20rnd_556x45"], [], ""],
["UK3CB_FNFAL_FULL", "", "", "", ["UK3CB_FNFAL_20rnd_762x51"], [], ""],
["UK3CB_G3A3V", "", "", "", ["UK3CB_G3_20rnd_762x51"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["UK3CB_M16_20rnd_556x45"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["UK3CB_M16_20rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militiaLoadoutData setVariable ["SMGs", [
["rhs_weap_m3a1", "", "", "", ["rhsgref_30rnd_1143x23_M1911B_SMG"], [], ""],
["UK3CB_Sten", "", "", "", ["UK3CB_Sten_34Rnd_Magazine"], [], ""]
]];
_militiaLoadoutData setVariable ["machineGuns", [
["UK3CB_Bren", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine_GT"], [], ""],
["UK3CB_Bren", "", "", "", ["UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine", "UK3CB_Bren_30Rnd_762x51_Magazine_GT"], [], ""],
["rhs_weap_mg42", "", "", "rhsgref_mg42_acc_aasight", ["rhsgref_50Rnd_792x57_SmK_drum", "rhsgref_50Rnd_792x57_SmK_drum", "rhsgref_50Rnd_792x57_SmK_alltracers_drum"], [], ""],
["UK3CB_M60", "", "", "", ["UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51", "UK3CB_M60_100rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_m1garand_sa43", "", "", "", ["rhsgref_8Rnd_762x63_M2B_M1rifle"], [], ""]
]];
_militiaLoadoutData setVariable ["sniperRifles", [
["rhs_weap_kar98k", "", "", "", ["rhsgref_5Rnd_792x57_kar98k"], [], ""],
["rhs_weap_m38", "", "", "", ["rhsgref_5Rnd_762x54_m38"], [], ""]
]];

_militiaLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData setVariable ["lightATLaunchers", [
"rhs_weap_m72a7"
]];
_militiaLoadoutData setVariable ["sidearms", [
["rhsusf_weap_m1911a1", "", "", "", ["rhsusf_mag_7x45acp_MHP"], [], ""],
["UK3CB_BHP", "", "", "", ["UK3CB_BHP_9_13Rnd"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData setVariable ["uniforms", ["rhsgref_uniform_og107_erdl"]];
_crewLoadoutData setVariable ["vests", ["UK3CB_V_Chestrig_ERDL"]];
_crewLoadoutData setVariable ["helmets", ["rhsgref_hat_M1951"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_J_Pilot_Uniform_01_OLI"]];
_pilotLoadoutData setVariable ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData setVariable ["helmets", ["UK3CB_H_Pilot_Helmet"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["offhat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["SLbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["SLrifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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

    ["rifles"] call _fnc_setPrimary;
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
    [["Medbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["carbines", "SMGs"] call _fnc_fallback] call _fnc_setPrimary;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["Engbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["carbines", "SMGs"] call _fnc_fallback] call _fnc_setPrimary;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["Engbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["carbines", "SMGs"] call _fnc_fallback] call _fnc_setPrimary;
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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

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
    [["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
    [["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    ["snihat"] call _fnc_setHelmet;
    [["Snivests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["Rangefinder"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["snihat"] call _fnc_setHelmet;
    [["Snivests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["Rangefinder"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom["SMGs", "shotGuns"]] call _fnc_setPrimary;
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

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
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

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
