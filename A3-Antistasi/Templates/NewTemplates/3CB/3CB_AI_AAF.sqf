//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAF"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "AAF Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate; 						
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate; 			

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["UK3CB_AAF_B_M1030"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["UK3CB_AAF_B_M1151", "UK3CB_AAF_B_M998_4DR", "UK3CB_AAF_B_M998_2DR", "UK3CB_AAF_B_LR_Closed", "UK3CB_AAF_B_LR_Open"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed", ["UK3CB_AAF_B_M1151_GPK_M2", "UK3CB_AAF_B_M1151_GPK_M240", "UK3CB_AAF_B_M1151_OGPK_M2", "UK3CB_AAF_B_M1151_OGPK_M240", "UK3CB_AAF_B_SUV_Armed",
"UK3CB_AAF_I_LR_SF_M2", "UK3CB_AAF_B_LR_M2"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["UK3CB_AAF_B_M939_Open", "UK3CB_AAF_B_M939", "UK3CB_AAF_B_MTVR_Closed", "UK3CB_AAF_B_MTVR_Open"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["UK3CB_AAF_I_M939_Recovery", "UK3CB_AAF_B_MTVR_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_AAF_B_MTVR_Reammo", "UK3CB_AAF_B_M939_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_AAF_B_M939_Repair", "UK3CB_AAF_B_MTVR_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_AAF_B_MTVR_Refuel", "UK3CB_AAF_B_M939_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_AAF_B_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_AAF_B_LAV25", "UK3CB_AAF_B_LAV25", "UK3CB_AAF_B_AAV", "UK3CB_AAF_B_LAV25_HQ", "UK3CB_AAF_B_M113_M2", "UK3CB_AAF_B_AAV"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["UK3CB_AAF_B_M60A3", "UK3CB_AAF_I_T72BC"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["UK3CB_AAF_O_ZsuTank", "UK3CB_AAF_O_MTLB_ZU23"]] call _fnc_saveToTemplate; //UK3CB_AAF_O_2S6M_Tunguska
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			
["vehiclesIFVs", []] call _fnc_saveToTemplate;				


["vehiclesTransportBoats", ["UK3CB_AAF_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_AAF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_AAF_B_AAV"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_AAF_B_L39_PYLON"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", ["UK3CB_AAF_O_MIG29S"]] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["UK3CB_AAF_B_C130J"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["UK3CB_AAF_B_UH1H", "UK3CB_AAF_B_Benches_MH9"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["UK3CB_AAF_B_UH60M2", "UK3CB_AAF_B_UH60M", "UK3CB_AAF_O_Mi8AMT", "UK3CB_AAF_O_Mi8", "UK3CB_AAF_I_UH1H_M240"]] call _fnc_saveToTemplate; 	
["vehiclesHelisAttack", ["UK3CB_AAF_B_AH1Z_GS", "UK3CB_AAF_B_AH1Z", "UK3CB_AAF_B_UH1H_GUNSHIP", "UK3CB_AAF_I_Mi_24V", "UK3CB_AAF_I_Mi8AMTSh"]] call _fnc_saveToTemplate; 		
/*
["vehiclesArtillery", ["UK3CB_AAF_B_M109"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_AAF_B_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;
*/
["vehiclesArtillery", [
["UK3CB_AAF_B_M109", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate; 				

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_AAF_I_LR_SF_M2", "UK3CB_AAF_I_LR_M2", "UK3CB_AAF_I_Offroad_M2", "UK3CB_AAF_I_UAZ_MG"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["UK3CB_AAF_I_Ural_Open"]] call _fnc_saveToTemplate; 	
["vehiclesMilitiaCars", ["UK3CB_AAF_I_UAZ_Open", "UK3CB_AAF_I_UAZ_Closed"]] call _fnc_saveToTemplate; 		

["vehiclesPolice", ["UK3CB_ADP_B_Hilux_Open", "UK3CB_ADP_B_Hilux_Closed", "UK3CB_ADP_B_LandRover_Closed", "UK3CB_ADP_B_LandRover_Open", "UK3CB_ADP_B_Van_Transport", "UK3CB_ADP_B_Offroad"]] call _fnc_saveToTemplate; 			

["staticMGs", ["RHS_M2StaticMG_D"]] call _fnc_saveToTemplate; 					
["staticAT", ["RHS_TOW_TriPod_D"]] call _fnc_saveToTemplate; 					
["staticAA", ["RHS_Stinger_AA_pod_D"]] call _fnc_saveToTemplate; 					
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate; 				

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate; 			
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		

["baggedMGs", [["RHS_M2_Gun_Bag", "RHS_M2_Tripod_Bag"]]] call _fnc_saveToTemplate;
["baggedAT", [["rhs_Tow_Gun_Bag", "rhs_TOW_Tripod_Bag"]]] call _fnc_saveToTemplate;
["baggedAA", []] call _fnc_saveToTemplate;
["baggedMortars", [["rhs_M252_Gun_Bag", "rhs_M252_Bipod_Bag"]]] call _fnc_saveToTemplate; 

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
//     "Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["SLrifles", []];
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanRifles", []];
_loadoutData setVariable ["sniperRifles", []];
_loadoutData setVariable ["AALaunchers", [ 				
"rhs_weap_fim92"
]];
_loadoutData setVariable ["sidearms", []];
_loadoutData setVariable ["GLsidearms", []];
_loadoutData setVariable ["ATMines", ["rhs_mine_M19_mag"]]; 					
_loadoutData setVariable ["APMines", ["rhsusf_mine_m14_mag"]]; 					
_loadoutData setVariable ["lightExplosives", ["rhsusf_m112_mag"]]; 			
_loadoutData setVariable ["heavyExplosives", ["rhsusf_m112x4_mag"]]; 			

_loadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_m67"]];
_loadoutData setVariable ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData setVariable ["signalsmokeGrenades", ["rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment.
_loadoutData setVariable ["maps", ["ItemMap"]];				
_loadoutData setVariable ["watches", ["ItemWatch"]];		
_loadoutData setVariable ["compasses", ["ItemCompass"]];	
_loadoutData setVariable ["radios", ["ItemRadio"]];			
_loadoutData setVariable ["gpses", ["ItemGPS"]];			
_loadoutData setVariable ["NVGs", ["rhsusf_ANPVS_14"]];						
_loadoutData setVariable ["binoculars", ["Binocular"]];		
_loadoutData setVariable ["Rangefinder", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData setVariable ["uniforms", []];					
_loadoutData setVariable ["SLuniforms", []];
_loadoutData setVariable ["MGvests", []];						
_loadoutData setVariable ["Medvests", []];
_loadoutData setVariable ["SLvests", []];
_loadoutData setVariable ["Snivests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["Engvests", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["backpacks", []];					
_loadoutData setVariable ["ATbackpacks", []];
_loadoutData setVariable ["SLbackpacks", []];			
_loadoutData setVariable ["helmets", []];					
_loadoutData setVariable ["offhat", ["UK3CB_AAF_B_H_Beret_Army"]];
_loadoutData setVariable ["snihat", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData setVariable ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; 
_loadoutData setVariable ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData setVariable ["items_squadleader_extras", ["ACE_microDAGR", "ACE_DAGR", "Laserbatteries", "Laserbatteries", "Laserbatteries"]];
_loadoutData setVariable ["items_rifleman_extras", []];
_loadoutData setVariable ["items_medic_extras", []];
_loadoutData setVariable ["items_grenadier_extras", []];
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector", "ACE_Clacker", "ACE_DefusalKit"]];
_loadoutData setVariable ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_lat_extras", []];
_loadoutData setVariable ["items_at_extras", []];
_loadoutData setVariable ["items_aa_extras", []];
_loadoutData setVariable ["items_machineGunner_extras", []];
_loadoutData setVariable ["items_marksman_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData setVariable ["items_sniper_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData setVariable ["items_police_extras", []];
_loadoutData setVariable ["items_crew_extras", []];
_loadoutData setVariable ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData setVariable ["uniforms", ["UK3CB_AAF_B_U_CombatUniform_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN"]];
_sfLoadoutData setVariable ["vests", ["rhsusf_mbav_rifleman"]];				
_sfLoadoutData setVariable ["MGvests", ["rhsusf_mbav_mg"]];						
_sfLoadoutData setVariable ["Medvests", ["rhsusf_mbav_medic"]];
_sfLoadoutData setVariable ["GLvests", ["rhsusf_mbav_grenadier"]];
_sfLoadoutData setVariable ["backpacks", ["B_Kitbag_mcamo", "rhsusf_falconii_mc"]];			
_sfLoadoutData setVariable ["SLbackpacks", ["UK3CB_B_I_Backpack_Radio_Chem"]];
_sfLoadoutData setVariable ["ATbackpacks", ["B_Carryall_mcamo"]];
_sfLoadoutData setVariable ["helmets", ["rhsusf_opscore_mc_cover", "rhsusf_opscore_mc_cover_pelt", "rhsusf_opscore_mc_cover_pelt_nsw", "rhsusf_opscore_mc_cover_pelt_cam",
"rhsusf_opscore_mc", "rhsusf_opscore_mc_pelt", "rhsusf_opscore_mc_pelt_nsw"]];
_sfLoadoutData setVariable ["offhat", ["UK3CB_AAF_B_H_Beret_SF"]];
_sfLoadoutData setVariable ["snihat", ["rhs_Booniehat_ocp"]];
_sfLoadoutData setVariable ["NVGs", ["rhsusf_ANPVS_15"]];
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator"]];

_sfLoadoutData setVariable ["SLrifles", [
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_su230a_mrds", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_acog_rmr", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_su230a", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];

_sfLoadoutData setVariable ["rifles", [
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsd2", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_eotech_xps3", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_g33_t1", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_compm4", ["UK3CB_FAMAS_25rnd_556x45"], [], ""],
["UK3CB_FAMAS_F1", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_g33_xps3", ["UK3CB_FAMAS_25rnd_556x45"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [
["rhs_weap_hk416d10", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_EOTECH_XPS3", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_EOTECH_XPS3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_vhsk2", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_EOTECH_XPS3", ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], [], "rhsusf_acc_kac_grip"]
]];
_sfLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FAMAS_F1_GLM203", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_su230a_mrds", ["UK3CB_FAMAS_25rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FAMAS_F1_GLM203", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_acog_rmr", ["UK3CB_FAMAS_25rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FAMAS_F1_GLM203", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15a", "rhsusf_acc_eotech_552", ["UK3CB_FAMAS_25rnd_556x45"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData setVariable ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_T1", ["rhsusf_mag_40Rnd_46x30_AP"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData setVariable ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_leupoldmk4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_m8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_leupoldmk4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_SR25_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14_socom_rail", "rhsusf_acc_aac_762sdn6_silencer", "", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_d", "rhsusf_acc_M2010S_d", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_leupoldmk4_2_d", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "rhsusf_acc_m24_silencer_black", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_M107", "", "", "rhsusf_acc_M8541", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData setVariable ["lightATLaunchers", [
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp"
]];
_sfLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_sfLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""]
]];
_sfLoadoutData setVariable ["GLsidearms", [
["rhs_weap_M320", "", "", "", ["rhs_mag_M397_HET", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP"], [], ""],
["rhs_weap_M320", "", "", "", ["rhs_mag_m4009", "rhs_mag_m714_White", "rhs_mag_m716_yellow"], [], ""] //Stun
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData setVariable ["uniforms", ["UK3CB_AAF_B_U_CombatUniform_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN"]];		
_militaryLoadoutData setVariable ["SLuniforms", ["UK3CB_AAF_B_U_Officer_DIGI_GRN"]];
_militaryLoadoutData setVariable ["vests", ["UK3CB_AAF_O_V_Eagle_RIF_DIGI_GRN"]];			
_militaryLoadoutData setVariable ["MGvests", ["UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN"]];						
_militaryLoadoutData setVariable ["Medvests", ["UK3CB_AAF_O_V_Eagle_MED_DIGI_GRN"]];
_militaryLoadoutData setVariable ["SLvests", ["UK3CB_AAF_O_V_Eagle_SL_DIGI_GRN"]];
_militaryLoadoutData setVariable ["GLvests", ["UK3CB_AAF_O_V_Eagle_GL_DIGI_GRN"]];
_militaryLoadoutData setVariable ["Engvests", ["UK3CB_AAF_O_V_Eagle_EOD_DIGI_GRN"]];
_militaryLoadoutData setVariable ["backpacks", ["B_AssaultPack_dgtl", "UK3CB_AAF_B_B_FIELDPACK_DIGI_GRN"]];		
_militaryLoadoutData setVariable ["SLbackpacks", ["UK3CB_AAF_I_B_FIELDPACK_DIGI_GRN_Radio"]];
_militaryLoadoutData setVariable ["ATbackpacks", ["UK3CB_AAF_B_B_CARRYALL_DIGI_GRN"]];
_militaryLoadoutData setVariable ["helmets", ["UK3CB_AAF_I_H_MKVI_Helmet_A_GRN"]];
_militaryLoadoutData setVariable ["snihat", ["H_Booniehat_dgtl"]];
_militaryLoadoutData setVariable ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData setVariable ["SLrifles", [
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_su230a_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3KA4_GL", "", "", "rhsusf_acc_su230a_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData setVariable ["rifles", [
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["UK3CB_G3KA4", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData setVariable ["SMGs", [
["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", [], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_mrds", [], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_T1_high", [], [], "rhs_acc_grip_ffg2"],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_xps3", [], [], "rhs_acc_grip_ffg2"]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["UK3CB_G3KA4_GL", "", "", "rhsusf_acc_eotech_552", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData setVariable ["machineGuns", [
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_eotech_552", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_su230a_mrds", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_acog_mdo", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""],
["UK3CB_G3SG1_RIS", "", "", "rhsusf_acc_leupoldmk4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], ""]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_nxs_3515x50f1_h58", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_leupoldmk4_2_mrds", ["UK3CB_G3_20rnd_762x51_GT", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_G"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData setVariable ["lightATLaunchers", [
"rhs_weap_m72a7"
]];
_militaryLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militaryLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ", "rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData setVariable ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData setVariable ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData setVariable ["helmets", ["H_Cap_police"]];
_policeLoadoutData setVariable ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData setVariable ["SMGs", [
["rhsusf_weap_MP7A2", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", [], [], ""],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_mrds", [], [], ""],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_T1_high", [], [], ""],
["rhsusf_weap_MP7A2", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_xps3", [], [], ""]
]];
_policeLoadoutData setVariable ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP"], [], ""]
]];
////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData setVariable ["uniforms", ["UK3CB_NAP_B_U_CombatUniform_01_WDL"]];
_militiaLoadoutData setVariable ["vests", ["UK3CB_ADA_B_V_TacVest_KHK"]];
_militiaLoadoutData setVariable ["Snivests", ["UK3CB_V_Chestrig_ERDL"]];
_militiaLoadoutData setVariable ["backpacks", ["UK3CB_UN_B_B_ASS"]];
_militiaLoadoutData setVariable ["SLbackpacks", ["UK3CB_B_I_Assault_camo_Radio"]];
_militiaLoadoutData setVariable ["ATbackpacks", ["UK3CB_CW_US_B_LATE_B_RIF_03"]];
_militiaLoadoutData setVariable ["helmets", ["rhsgref_helmet_pasgt_woodland", "H_Bandanna_camo"]];
_militiaLoadoutData setVariable ["snihat", ["UK3CB_CW_US_B_EARLY_H_BoonieHat_ERDL_01"]];
_militiaLoadoutData setVariable ["rifles", [
["UK3CB_M16A1", "", "", "", ["rhs_mag_20Rnd_556x45_M855A1_Stanag", "rhs_mag_20Rnd_556x45_M855A1_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["UK3CB_Sten", "", "", "", ["UK3CB_Sten_34Rnd_Magazine_G", "UK3CB_Sten_34Rnd_Magazine_G", "UK3CB_Sten_34Rnd_Magazine_GT"], [], ""]
]]; 					
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]]; 			
_militiaLoadoutData setVariable ["SMGs", [
["UK3CB_Sten", "", "", "", ["UK3CB_Sten_34Rnd_Magazine_G", "UK3CB_Sten_34Rnd_Magazine_G", "UK3CB_Sten_34Rnd_Magazine_GT"], [], ""]
]]; 						
_militiaLoadoutData setVariable ["machineGuns", [
["UK3CB_MG3", "", "", "", ["UK3CB_MG3_100rnd_762x51_GT"], [], ""]
]]; 				
_militiaLoadoutData setVariable ["marksmanRifles", [
["UK3CB_M14DMR_Railed", "", "", "uk3cb_optic_artel_m14", [], [], ""]
]]; 			
_militiaLoadoutData setVariable ["sniperRifles", [
["UK3CB_M14DMR_Railed", "", "", "uk3cb_optic_artel_m14", [], [], ""]
]]; 				
_militiaLoadoutData setVariable ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militiaLoadoutData setVariable ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militiaLoadoutData setVariable ["sidearms", ["rhsusf_weap_m1911a1"]]; 					

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData setVariable ["uniforms", ["UK3CB_AAF_B_U_CombatUniform_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN"]];			
_crewLoadoutData setVariable ["vests", ["UK3CB_AAF_O_V_Eagle_CREW_DIGI_GRN"]];				
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_I"]];			

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UK3CB_AAF_I_U_H_Pilot_DIGI_GRN"]];			
_pilotLoadoutData setVariable ["vests", ["UK3CB_AAF_O_V_Eagle_CREW_DIGI_GRN"]];			
_pilotLoadoutData setVariable ["helmets", ["UK3CB_H_Crew_Helmet", "UK3CB_H_Pilot_Helmet"]];			


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["offhat"] call _fnc_setHelmet;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["SLuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["SLbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["SLrifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Medvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["GLsidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
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
    [["Engvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["Engvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
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
    [["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    ["Rangefinder"] call _fnc_addBinoculars;
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;