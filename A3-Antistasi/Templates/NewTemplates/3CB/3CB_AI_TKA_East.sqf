//////////////////////////
//   Side Information   //
//////////////////////////

["name", localize "STR_antistasi_faction_TKAEast"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", "TKA East Support corridor"] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION

["flag", "Flag_TKA_O_Army"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "UK3CB_MARKER_TKA_O_Army"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_TKA_O_SUV_Armoured", "UK3CB_TKA_O_Tigr_FFV", "UK3CB_TKA_O_BRDM2_UM", "UK3CB_TKA_O_UAZ_Closed", "UK3CB_TKA_O_UAZ_Open", "UK3CB_TKA_O_BTR40"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_TKA_O_SUV_Armed", "UK3CB_TKA_O_LR_SF_M2", "UK3CB_TKA_O_Hilux_Dshkm", "UK3CB_TKA_O_Hilux_GMG", "UK3CB_TKA_O_GAZ_Vodnik_PKT", "UK3CB_TKA_O_BTR40_MG", "UK3CB_TKA_O_Tigr_STS", "UK3CB_TKA_O_BRDM2_HQ", "UK3CB_TKA_O_BRDM2"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_TKA_B_Ural_Open", "UK3CB_TKA_B_Ural"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_TKA_B_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_TKA_B_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_TKA_B_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_TKA_B_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_TKA_O_GAZ_Vodnik_MedEvac"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_TKA_O_BMP1", "UK3CB_TKA_O_BMP2", "UK3CB_TKA_O_BMP2K", "UK3CB_TKA_O_BTR60", "UK3CB_TKA_O_BTR70", "UK3CB_TKA_O_BTR80", "UK3CB_TKA_O_BTR80a"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_TKA_B_T72BM", "UK3CB_TKA_B_T72A", "UK3CB_TKA_B_T72B", "UK3CB_TKA_B_T55"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_TKA_B_ZsuTank", "UK3CB_TKA_B_Ural_Zu23", "UK3CB_TKA_O_MTLB_ZU23"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["UK3CB_TKA_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_TKA_O_BMP2", "UK3CB_TKA_O_BTR70"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_TKA_B_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_TKA_O_MIG29SM"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_TKA_B_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_TKA_B_UH1H", "UK3CB_TKA_B_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_TKA_B_Mi8AMT", "UK3CB_TKA_B_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_TKA_O_UH1H_GUNSHIP", "UK3CB_TKA_B_Mi8AMTSh", "UK3CB_TKA_B_Mi_24P", "UK3CB_TKA_B_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", [
["UK3CB_TKA_B_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_TKA_O_UAZ_MG", "UK3CB_TKA_O_Hilux_Dshkm", "UK3CB_TKA_O_UAZ_SPG9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_TKM_O_V3S_Open", "UK3CB_TKM_O_V3S_Closed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_TKM_O_Hilux_Open", "UK3CB_TKM_O_UAZ_Open", "UK3CB_TKM_O_UAZ_Closed", "UK3CB_TKM_O_LR_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_TKP_B_LandRover_Open", "UK3CB_TKP_B_LandRover_Closed", "UK3CB_TKP_B_Lada_Police", "UK3CB_TKP_O_UAZ_Closed", "UK3CB_TKP_O_UAZ_Open"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_TKA_O_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_TKA_O_Kornet", "UK3CB_TKA_B_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_TKA_B_Igla_AA_pod", "UK3CB_TKA_O_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_TKA_O_2b14_82mm"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

//Bagged weapon definitions
["baggedMGs", [
["RHS_DShkM_Gun_Bag", "RHS_DShkM_TripodHigh_Bag"]
]] call _fnc_saveToTemplate;
["baggedAT", [
["RHS_Kornet_Gun_Bag", "RHS_Kornet_Tripod_Bag"],
["RHS_SPG9_Gun_Bag", "RHS_SPG9_Tripod_Bag"]
]] call _fnc_saveToTemplate;
["baggedAA", [[]]] call _fnc_saveToTemplate;
["baggedMortars", [["RHS_Podnos_Gun_Bag", "RHS_Podnos_Bipod_Bag"]]] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//PvP definitions
["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", []] call _fnc_saveToTemplate;
["pvpVehicles", []] call _fnc_saveToTemplate;


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
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData setVariable ["ATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rshg2"]];
_loadoutData setVariable ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData setVariable ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData setVariable ["sidearms", [
"rhs_weap_makarov_pm", "rhs_weap_pya", "rhs_weap_6p53"]];

_loadoutData setVariable ["ATMines", ["ATMine"]];
_loadoutData setVariable ["APMines", ["Claymore_F", "APERSMine"]];
_loadoutData setVariable ["lightExplosives", ["rhs_ec200_sand_mag"]];
_loadoutData setVariable ["heavyExplosives", ["rhs_ec400_sand_mag"]];

_loadoutData setVariable ["antiTankGrenades", []];
_loadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]];
_loadoutData setVariable ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData setVariable ["signalsmokeGrenades", ["rhs_mag_nspd"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["ItemRadio"]];
_loadoutData setVariable ["gpses", ["ItemGPS"]];
_loadoutData setVariable ["NVGs", ["rhs_1PN138"]];
_loadoutData setVariable ["binoculars", ["Binocular"]];
_loadoutData setVariable ["rangefinder", ["rhs_pdu4"]];

_loadoutData setVariable ["uniforms", []];
_loadoutData setVariable ["vests", []];
_loadoutData setVariable ["SLvests", []];
_loadoutData setVariable ["GLvests", []];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["Toolsbackpacks", ["UK3CB_TKA_O_B_ENG_Tan"]]; // Both engineer and explosivesExpert
_loadoutData setVariable ["Medicbackpacks", ["UK3CB_B_Alice_Med_K"]];
_loadoutData setVariable ["ATbackpacks", ["rhs_rpg_empty"]];
_loadoutData setVariable ["backpacks", []];
_loadoutData setVariable ["longRangeRadios", []];
_loadoutData setVariable ["helmets", []];

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
_sfLoadoutData setVariable ["uniforms", ["UK3CB_TKA_O_U_CombatUniform_01_Des_TKA_Brush", "UK3CB_TKA_O_U_CombatUniform_02_Des_TKA_Brush",
"UK3CB_TKA_O_U_CombatUniform_03_Des_TKA_Brush"
]];
_sfLoadoutData setVariable ["helmets", ["UK3CB_TKA_O_H_6b27m_Surpat", "UK3CB_TKA_O_H_6b27m_ESS_Surpat", "UK3CB_TKA_O_H_6b7_1m_bala2_Surpat"]];
_sfLoadoutData setVariable ["vests", ["UK3CB_TKA_O_V_6b23_ml_Surpat_02"]];
_sfLoadoutData setVariable ["Medvests", ["UK3CB_TKA_O_V_6b23_medic_Surpat"]];
_sfLoadoutData setVariable ["SLvests", ["UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Surpat"]];
_sfLoadoutData setVariable ["GLvests", ["UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Surpat"]];
_sfLoadoutData setVariable ["Snivests", ["UK3CB_TKA_O_V_6b23_ml_sniper_Surpat"]];
_sfLoadoutData setVariable ["Engvests", ["UK3CB_TKA_O_V_6b23_ml_engineer_Surpat"]];
_sfLoadoutData setVariable ["backpacks", ["UK3CB_B_Alice_Bedroll_K"]];
_sfLoadoutData setVariable ["binoculars", ["Laserdesignator"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData setVariable ["rifles", [
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData setVariable ["grenadelaunchers", [
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk4screws", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk4short", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_rakursPM", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData setVariable ["smgs", [
["rhs_weap_pp2000", "", "", "rhs_acc_1p87", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_rakursPM", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_ekp8_18", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_44"], [], ""]
]];
_sfLoadoutData setVariable ["carbines", [
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pkas", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData setVariable ["machineGuns", [
["UK3CB_RPK_74N", "", "", "rhs_acc_pkas", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "rhs_acc_1p78", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "rhs_acc_1p29", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p29", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_sfLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData setVariable ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData setVariable ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData setVariable ["uniforms", ["UK3CB_TKA_O_U_CombatUniform_01_ADPM", "UK3CB_TKA_O_U_CombatUniform_02_ADPM", "UK3CB_TKA_O_U_CombatUniform_03_ADPM"]];
_militaryLoadoutData setVariable ["helmets", ["UK3CB_TKA_O_H_6b27m_ADPM", "UK3CB_TKA_O_H_6b27m_ESS_ADPM"]];
_militaryLoadoutData setVariable ["vests", ["UK3CB_TKA_O_V_6b23_ml_Oli"]];
_militaryLoadoutData setVariable ["Medvests", ["UK3CB_TKA_O_V_6b23_medic_Oli"]];
_militaryLoadoutData setVariable ["SLvests", ["UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli"]];
_militaryLoadoutData setVariable ["GLvests", ["UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli"]];
_militaryLoadoutData setVariable ["Snivests", ["UK3CB_TKA_O_V_6b23_ml_sniper_Oli"]];
_militaryLoadoutData setVariable ["Engvests", ["UK3CB_TKA_O_V_6b23_ml_engineer_Oli"]];
_militaryLoadoutData setVariable ["backpacks", ["rhs_sidor", "UK3CB_TKA_O_B_RIF_Tan"]];


_militaryLoadoutData setVariable ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData setVariable ["rifles", [
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak103", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData setVariable ["carbines", [
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData setVariable ["SMGs", ["rhs_weap_pp2000"]];
_militaryLoadoutData setVariable ["machineGuns", [
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR_green", "rhs_100Rnd_762x54mmR"], [], ""],
["rhs_weap_pkp", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p29",["rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_svdp_wd", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", [], [], ""]
]];
_militaryLoadoutData setVariable ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData setVariable ["uniforms", ["UK3CB_TKP_B_U_CombatUniform_TAN", "UK3CB_TKP_B_U_QRF_CombatUniform_TAN", "UK3CB_TKP_B_U_QRF_CombatUniform_Shortsleeve_TAN"]];
_policeLoadoutData setVariable ["vests", ["UK3CB_TKP_B_V_TacVest_Tan"]];
_policeLoadoutData setVariable ["helmets", ["UK3CB_TKP_B_H_Patrolcap_TAN"]];

_policeLoadoutData setVariable ["antiInfantryGrenades", ["rhs_mag_fakel", "rhs_mag_fakels", "rhs_mag_plamyam"]];
_policeLoadoutData setVariable ["rifles", [
["rhs_weap_ak103_1", "rhs_acc_dtk", "", "", ["rhs_10Rnd_762x39mm"], [], ""]
]];			//this line determines the rifles for police loadouts -- Example: ["arifle_MX_F", "arifle_MX_pointer_F"] -- Array, can contain multiple assets
_policeLoadoutData setVariable ["smgs", ["rhs_weap_pp2000"]];			//this line determines the smgs for police loadouts -- Example: ["SMG_01_F", "SMG_01_Holo_F"] -- Array, can contain multiple assets

_policeLoadoutData setVariable ["sidearms", [
["rhs_weap_pya", "", "", "", [], [""], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["UK3CB_TKA_I_U_CombatUniform_01_OLI", "UK3CB_TKA_I_U_CombatUniform_02_OLI", "UK3CB_TKA_I_U_CombatUniform_03_OLI"]];

_militiaLoadoutData setVariable ["vests", ["UK3CB_V_Chestrig_OLI", "V_TacVest_oli"]];
_militiaLoadoutData setVariable ["backpacks", ["UK3CB_B_Alice_K"]];
_militiaLoadoutData setVariable ["helmets", [
"UK3CB_TKA_I_H_Patrolcap_OLI", "UK3CB_TKA_I_H_SSh68_Oli"]];

_militiaLoadoutData setVariable ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData setVariable ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData setVariable ["SMGs", ["rhs_weap_pp2000"]];
_militiaLoadoutData setVariable ["machineGuns", ["rhs_weap_pkm"]];
_militiaLoadoutData setVariable ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData setVariable ["sniperRifles", ["rhs_weap_m38"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData setVariable ["uniforms", ["UK3CB_TKA_O_U_CrewUniform_01_ADPM"]];
_crewLoadoutData setVariable ["vests", ["V_TacVest_oli"]];
_crewLoadoutData setVariable ["helmets", ["H_HelmetCrew_I", "UK3CB_H_Crew_Cap"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["UK3CB_TKA_O_U_H_Pilot_03_ADD"]];
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
	["helmets"] call _fnc_setHelmet;
	[["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
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
	[["Medvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Medicbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
  	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
	[["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
	[["Engvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Toolsbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
	[["Engvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	[["Toolsbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
	[["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
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
	[["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "heavyATLaunchers"]] call _fnc_setLauncher;
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
	[["ATbackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
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
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
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
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	[selectRandom["smgs", "rifle"]] call _fnc_setPrimary;
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

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
