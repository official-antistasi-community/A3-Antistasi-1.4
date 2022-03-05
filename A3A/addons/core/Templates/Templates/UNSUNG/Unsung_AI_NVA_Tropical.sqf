//////////////////////////
//   Side Information   //
//////////////////////////

["name", "NV Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "NV Reinforcements"] call _fnc_saveToTemplate;

["flag", "uns_FlagCarrierNVA"] call _fnc_saveToTemplate;
["flagTexture", "\uns_flags\flag_pavn_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_UNS_NVA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["uns_willys"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["uns_Type55"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["uns_Type55_LMG","uns_Type55_MG","uns_Type55_patrol","uns_Type55_twinMG","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_M40","uns_nvatruck_mg"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["uns_nvatruck_open","uns_zil157","uns_nvatruck_camo","uns_nvatruck"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["uns_nvatruck_open","uns_zil157"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["uns_nvatruck_reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["uns_nvatruck_repair","uns_zil157_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["uns_nvatruck_refuel","uns_Zil157_refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["uns_Type63_amb"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["uns_BTR152_DSHK","uns_Type63_mg","uns_pt76","uns_ot34_85_nva"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["uns_t54_nva","uns_t55_nva","uns_to55_nva"]] call _fnc_saveToTemplate;
["vehiclesAA", ["uns_ZSU23_NVA","uns_ZSU57_NVA","uns_Type55_ZU","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_nvatruck_s60"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["UNS_Zodiac_NVA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UNS_PATROL_BOAT_NVA","UNS_ASSAULT_BOAT_NVA"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["uns_Type63_mg","uns_pt76"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["uns_Mig21_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["uns_Mig21_CAP"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["uns_an2_transport"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["uns_Mi8T_VPAF"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["uns_Mi8TV_VPAF_MG"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["uns_m110sp"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["uns_m110sp",["uns_30Rnd_203mmHE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["uns_Type55_LMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["uns_zil157"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["uns_willys"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["uns_willys_2_usmp"]] call _fnc_saveToTemplate;

["staticMGs", ["uns_dshk_high_NVA"]] call _fnc_saveToTemplate;
["staticAT", ["uns_SPG9_73mm_NVA"]] call _fnc_saveToTemplate;
["staticAA", ["uns_ZPU4_NVA"]] call _fnc_saveToTemplate;
["staticMortars", ["uns_m1941_82mm_mortarNVA"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "uns_8Rnd_82mmHE_M1941"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "uns_8Rnd_82mmSMOKE_M1941"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["uns_mine_t59"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["uns_mine_md82"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [["uns_rpg2", "", "", "", ["uns_rpg2grenade"], [], ""], 
["uns_B40", "", "", "", ["uns_B40grenade"], [], ""]]];
_loadoutData set ["ATLaunchers", [["uns_rpg7", "", "", "", ["uns_rpg7grenade"], [], ""]]];
_loadoutData set ["missileATLaunchers", [["uns_rpg7", "", "", "", ["uns_rpg7grenade"], [], ""]]];
_loadoutData set ["AALaunchers", [["uns_sa7b", "", "", "", ["uns_sa7bmag"], [], ""]]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["uns_mine_AT_mag"]];
_loadoutData set ["APMines", ["uns_mine_AP_mag"]];
_loadoutData set ["lightExplosives", ["uns_M118_mag_remote"]];
_loadoutData set ["heavyExplosives", ["DemoCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", ["uns_molotov_mag","uns_rkg3gren"]];
_loadoutData set ["antiInfantryGrenades", ["uns_f1gren","uns_rg42gren","uns_rgd33gren","uns_rgd5gren"]];
_loadoutData set ["smokeGrenades", ["uns_rdg2"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["UNS_ItemRadio_T884_TFAR"]];
_loadoutData set ["gpses", [""]];
_loadoutData set ["NVGs", [""]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinder", ["uns_ANPVS2"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["UNS_NVA_RTO"]];
_loadoutData set ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["UNS_NVA_CC"]];
_sfLoadoutData set ["vests", ["uns_Simc_Barbelt","uns_Simc_Barbelt_M56","uns_Simc_Barbelt_M56_zusp"]];
_sfLoadoutData set ["backpacks", ["uns_simc_ARVN_ruck_1","uns_simc_ARVN_ruck_2","uns_simc_ARVN_ruck_3"]];
_sfLoadoutData set ["helmets", ["UNS_NVA_SSH60","UNS_NVA_SSH40","UNS_Beret_AVAB","UNS_M1_1V1","UNS_M1_1V2","UNS_M1_1V1N"]];
_sfLoadoutData set ["binoculars", ["uns_ANPVS2"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [["uns_sa58p", "", "", "", ["uns_sa58mag"], [], ""],
	["uns_sa58p", "", "", "", ["uns_sa58mag"], [], ""]]];
_sfLoadoutData set ["carbines", [["uns_sa58v", "", "", "", ["uns_sa58mag"], [], ""],
	["uns_sa58vf", "", "", "", ["uns_sa58mag"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["uns_ex41", "", "", "", ["uns_ex41mag"], ["uns_1Rnd_Smoke_40mm"], ""]]];
_sfLoadoutData set ["SMGs", [["uns_type50", "", "", "", ["uns_ppshmag_NT"], [], ""],
	["uns_ppsh41", "", "", "", ["uns_ppshmag_NT"], [], ""],
	["uns_m2carbine_shorty", "", "", "", ["uns_m2carbinemag_NT"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["uns_rpd", "", "", "", ["uns_rpdmag"], [], ""],
	["uns_RPK_drum", "", "", "", ["uns_75Rnd_akdr"], [], ""],
	["uns_PK", "", "", "", ["uns_100Rnd_762x54_PK"], [], ""],
	["uns_RPK_40", "", "", "", ["uns_rpkmag"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["uns_SVD_CAMO_base", "", "", "uns_o_pso1_camo", ["uns_svdmag"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["uns_SVD_CAMO_base", "", "", "uns_o_pso1_camo", ["uns_svdmag"], [], ""]]];
_sfLoadoutData set ["sidearms", [["uns_sa61_p", "", "", "", ["uns_20Rnd_sa61_pa"], [], ""],
	["uns_p64", "", "", "", ["uns_6Rnd_czak"], [], ""],
	["uns_p64", "", "", "", ["uns_6Rnd_czak"], [], ""],
	["uns_sw_m10", "", "", "", ["uns_38specmag"], [], ""],
	["uns_Tt33", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_tt30", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_pm63p", "", "", "", ["uns_25Rnd_pm_pa"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UNS_NVA_GS","UNS_NVA_G","uns_U_Simc_nva_1","uns_U_Simc_nva_1_trop","uns_U_Simc_nva_2","uns_U_Simc_nva_2_trop"]];
_militaryLoadoutData set ["vests", ["uns_Simc_Barbelt","uns_Simc_Barbelt_M56","uns_Simc_Barbelt_M56_zusp"]];
_militaryLoadoutData set ["backpacks", ["uns_simc_ARVN_ruck_1","uns_simc_ARVN_ruck_2","uns_simc_ARVN_ruck_3"]];
_militaryLoadoutData set ["helmets", ["UNS_NVA_SSH60","UNS_NVA_SSH40","uns_nva_m56","UNS_NVA_HGG","UNS_NVA_HG","UNS_PAVN_HG"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["rifles", [["uns_type56", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_ak47", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_aks47", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akm", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akm_drum", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akms", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akms_drum", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akmsf", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akmsf_drum", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_ak47_52", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_ak47_49", "", "", "", ["uns_ak47mag"], [], ""]]];
_militaryLoadoutData set ["carbines", [["uns_sks", "", "", "", ["uns_sksmag"], [], ""],
	["uns_type56", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_ak47", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_aks47", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akm", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akms", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_akmsf", "", "", "", ["uns_ak47mag"], [], ""],
	["uns_sks", "", "", "", ["uns_sksmag_NT"], [], ""]]];
_militaryLoadoutData set ["grenadeLaunchers", [["uns_ex41", "", "", "", ["uns_ex41mag"], ["uns_1Rnd_Smoke_40mm"], ""],
	["uns_mas4956_gl", "", "", "", ["uns_mas4956mag"], ["Uns_1Rnd_22mm_AT","Uns_1Rnd_22mm_smoke","Uns_1Rnd_22mm_WP"], ""]]];
_militaryLoadoutData set ["SMGs", [["uns_sa61", "", "", "", ["uns_20Rnd_sa61"], [], ""],
	["uns_pm63", "", "", "", ["uns_25Rnd_pm"], [], ""],
	["uns_mat49", "", "", "", ["uns_mat49mag"], [], ""],
	["uns_mac10", "", "", "", ["uns_mac10mag"], [], ""],
	["uns_m50", "", "", "", ["uns_m50mag"], [], ""],
	["uns_m50f", "", "", "", ["uns_m50mag"], [], ""],
	["uns_f1_smg", "", "", "", ["uns_f1_smg_mag"], [], ""],
	["uns_type50", "", "", "", ["uns_ppshmag"], [], ""],
	["uns_uzi", "", "", "", ["uns_32Rnd_uzi"], [], ""],
	["uns_m45", "", "", "", ["uns_m45mag"], [], ""],
	["uns_m45f", "", "", "", ["uns_m45mag"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["uns_rpd", "", "", "", ["uns_rpdmag"], [], ""],
	["uns_RPK_drum", "", "", "", ["uns_75Rnd_akdr"], [], ""],
	["uns_PK", "", "", "", ["uns_100Rnd_762x54_PK"], [], ""],
	["uns_RPK_40", "", "", "", ["uns_rpkmag"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["uns_svd_base", "", "", "uns_o_pso1", ["uns_svdmag_T"], [], ""],
	["uns_mas4956", "", "", "uns_o_apxsom", ["uns_mas4956mag"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["uns_mosin", "", "", "uns_o_pu", ["uns_mosinmag_T"], [], ""],
	["uns_kar98k", "", "", "uns_o_zf41", ["uns_kar98kmag"], [], ""],
	["uns_type99", "", "", "uns_o_akatihi4x", ["uns_type99mag"], [], ""],
	["uns_m1903", "", "", "uns_o_unertl8x", ["uns_springfieldmag"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["uns_sa61_p", "", "", "", ["uns_20Rnd_sa61_pa"], [], ""],
	["uns_p64", "", "", "", ["uns_6Rnd_czak"], [], ""],
	["uns_p64", "", "", "", ["uns_6Rnd_czak"], [], ""],
	["uns_sw_m10", "", "", "", ["uns_38specmag"], [], ""],
	["uns_Tt33", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_tt30", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_pm63p", "", "", "", ["uns_25Rnd_pm_pa"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["UNS_NVA_KS"]];
_policeLoadoutData set ["vests", ["UNS_NVA_S2"]];
_policeLoadoutData set ["helmets", ["UNS_NVA_HK"]];

_policeLoadoutData set ["SMGs", [["uns_PPS43", "", "", "", ["uns_k50mag"], [], ""],
	["uns_PPS43f", "", "", "", ["uns_k50mag"], [], ""],
	["uns_ppsh41", "", "", "", ["uns_k50mag"], [], ""],
	["uns_mp40", "", "", "", ["uns_mp40mag"], [], ""],
	["uns_type100", "", "", "", ["uns_type100mag"], [], ""],
	["uns_sten", "", "", "", ["uns_stenmag"], [], ""],
	["uns_owen", "", "", "", ["uns_owenmag"], [], ""],
	["uns_PPS52", "", "", "", ["uns_k50mag"], [], ""]]];
_policeLoadoutData set ["sidearms", [["uns_Tt33", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_tt30", "", "", "", ["uns_tokarevmag"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["UNS_NVA_K"]];
_militiaLoadoutData set ["vests", ["uns_Simc_garlan","uns_Simc_garlan_M56","uns_Simc_garlan_M56_zusp"]];
_militiaLoadoutData set ["backpacks", ["UNS_NVA_R1","UNS_NVA_RC","UNS_NVA_R3","UNS_NVA_MED"]];
_militiaLoadoutData set ["helmets", ["UNS_NVA_HK","UNS_NVA_HKG","UNS_PAVN_HN","UNS_PAVN_HC"]];

_militiaLoadoutData set ["rifles", [["uns_type99", "", "", "", ["uns_type99mag"], [], ""],
	["uns_smle", "", "", "", ["uns_smlemag"], [], ""],
	["uns_m1903", "", "", "", ["uns_springfieldmag"], [], ""],
	["uns_mas36", "", "", "", ["uns_mas36mag"], [], ""],
	["uns_kar98k", "", "", "", ["uns_kar98kmag"], [], ""],
	["uns_mosin", "", "", "", ["uns_mosinmag"], [], ""]]];
_militiaLoadoutData set ["carbines", [["uns_sks", "", "", "", ["uns_sksmag"], [], ""],
	["uns_sks", "", "", "", ["uns_sksmag_NT"], [], ""],
	["uns_svt", "", "", "", ["uns_svtmag"], [], ""],
	["uns_STG_44", "", "", "", ["uns_30Rnd_kurtz_stg"], [], ""],
	["uns_mas36short", "", "", "", ["uns_mas36mag"], [], ""],
	["uns_mas4956", "", "", "", ["uns_mas4956mag"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["uns_type99_gl", "", "", "", ["uns_type99mag"], ["Uns_1Rnd_30mm_FRAG"], ""],
	["uns_mas36_gl", "", "", "", ["uns_mas36mag"], ["Uns_1Rnd_22mm_AT","Uns_1Rnd_22mm_smoke","Uns_1Rnd_22mm_WP"], ""],
	["uns_mas36short_gl", "", "", "", ["uns_mas36mag"], ["Uns_1Rnd_22mm_AT","Uns_1Rnd_22mm_smoke","Uns_1Rnd_22mm_WP"], ""]]];
_militiaLoadoutData set ["SMGs", [["uns_PPS43", "", "", "", ["uns_k50mag"], [], ""],
	["uns_PPS43f", "", "", "", ["uns_k50mag"], [], ""],
	["uns_ppsh41", "", "", "", ["uns_k50mag"], [], ""],
	["uns_ppsh41", "", "", "", ["uns_ppshmag"], [], ""],
	["uns_mp40", "", "", "", ["uns_mp40mag"], [], ""],
	["uns_type100", "", "", "", ["uns_type100mag"], [], ""],
	["uns_sten", "", "", "", ["uns_stenmag"], [], ""],
	["uns_owen", "", "", "", ["uns_owenmag"], [], ""],
	["uns_PPS52", "", "", "", ["uns_k50mag"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["uns_MG42", "", "", "", ["uns_50Rnd_792x57_Mg42"], [], ""],
	["uns_mg42_bakelite", "", "", "", ["uns_50Rnd_792x57_Mg42"], [], ""],
	["uns_m1919a6", "", "", "", ["uns_100Rnd_m1919"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["uns_kar98k", "", "", "uns_o_zf41", ["uns_kar98kmag"], [], ""],
	["uns_type99", "", "", "uns_o_akatihi4x", ["uns_type99mag"], [], ""],
	["uns_m1903", "", "", "uns_o_unertl8x", ["uns_springfieldmag"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["uns_Tt33", "", "", "", ["uns_tokarevmag"], [], ""],
	["uns_sw_m10", "", "", "", ["uns_38specmag"], [], ""],
	["uns_tt30", "", "", "", ["uns_tokarevmag"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["UNS_NVA_G"]];
_crewLoadoutData set ["vests", ["UNS_NVA_S2"]];
_crewLoadoutData set ["helmets", ["UNS_NVA_CH","UNS_NVA_CHB","UNS_NVA_CHG","UNS_NVA_CHBG"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UNS_NVA_CG","UNS_NVA_CK","UNS_NVA_CP"]];
_pilotLoadoutData set ["vests", ["uns_Simc_garlan_M56"]];
_pilotLoadoutData set ["helmets", ["UNS_NVA_PL","UNS_NVA_PLC"]];


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
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _marksmanTemplate = {
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
