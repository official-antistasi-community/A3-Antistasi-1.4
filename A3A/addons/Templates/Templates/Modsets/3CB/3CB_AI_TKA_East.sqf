//////////////////////////
//   Side Information   //
//////////////////////////

["name", "TKA East"] call _fnc_saveToTemplate;
["spawnMarkerName", "TKA East Support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_TKA_O_Army"] call _fnc_saveToTemplate;
["flagTexture", "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_MARKER_TKA_O_Army"] call _fnc_saveToTemplate;

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

["vehiclesPlanesCAS", ["UK3CB_TKA_B_Su25SM_CAS", "UK3CB_TKA_B_MIG21_AT"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_TKA_O_MIG29SM", "UK3CB_TKA_B_MIG21_AA"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_TKA_B_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_TKA_B_UH1H", "UK3CB_TKA_B_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_TKA_B_Mi8AMT", "UK3CB_TKA_B_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_TKA_O_UH1H_GUNSHIP", "UK3CB_TKA_B_Mi8AMTSh", "UK3CB_TKA_B_Mi_24P", "UK3CB_TKA_B_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_TKA_B_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
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

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rshg2"]];
_loadoutData set ["heavyATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", [
"rhs_weap_makarov_pm", "rhs_weap_pya", "rhs_weap_6p53"]];

_loadoutData set ["ATMines", ["ATMine"]];
_loadoutData set ["APMines", ["Claymore_F", "APERSMine"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_sand_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_sand_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_loadoutData set ["engBackpacks", ["UK3CB_TKA_O_B_ENG_Tan"]]; // Both engineer and explosivesExpert
_loadoutData set ["medBackpacks", ["UK3CB_B_Alice_Med_K"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_TKA_B_H_Beret"]];
_loadoutData set ["sniHats", ["H_Booniehat_mgrn"]];

_loadoutData set ["glasses", ["G_Tactical_Clear", "G_Tactical_Black", "G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Combat", "G_Lowprofile"]];

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

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["uniforms", ["UK3CB_TKA_O_U_CombatUniform_01_Des_TKA_Brush", "UK3CB_TKA_O_U_CombatUniform_02_Des_TKA_Brush",
"UK3CB_TKA_O_U_CombatUniform_03_Des_TKA_Brush"]];
_sfLoadoutData set ["helmets", ["UK3CB_TKA_O_H_6b27m_Surpat", "UK3CB_TKA_O_H_6b27m_ESS_Surpat", "UK3CB_TKA_O_H_6b7_1m_bala2_Surpat"]];
_sfLoadoutData set ["vests", ["UK3CB_TKA_O_V_6b23_ml_Surpat_02"]];
_sfLoadoutData set ["medVests", ["UK3CB_TKA_O_V_6b23_medic_Surpat"]];
_sfLoadoutData set ["slVests", ["UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Surpat"]];
_sfLoadoutData set ["glVests", ["UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Surpat"]];
_sfLoadoutData set ["sniVests", ["UK3CB_TKA_O_V_6b23_ml_sniper_Surpat"]];
_sfLoadoutData set ["engVests", ["UK3CB_TKA_O_V_6b23_ml_engineer_Surpat"]];
_sfLoadoutData set ["backpacks", ["UK3CB_B_Alice_Bedroll_K"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk4screws", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk4short", "rhs_acc_perst3_2dp_h", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak103_gp25", "rhs_acc_dtk4screws", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk4screws", "", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk4short", "", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhs_acc_rakursPM", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["SMGs", [
["rhs_weap_pp2000", "", "", "rhs_acc_1p87", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_rakursPM", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_ekp8_18", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "rhs_acc_okp7_picatinny", ["rhs_mag_9x19mm_7n31_44"], [], ""],
["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_44"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_dtk4short", "", "", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pkas", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"],
["rhs_weap_vss_grip", "", "rhs_acc_perst1ik_ris", "rhs_acc_pso1m21", ["rhs_20rnd_9x39mm_SP5"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["machineGuns", [
["UK3CB_RPK_74N", "", "", "rhs_acc_pkas", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "rhs_acc_1p78", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["UK3CB_RPK_74N", "", "", "rhs_acc_1p29", ["UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_G", "UK3CB_RPK74_60rnd_545x39_GT"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p29", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_TKA_O_U_CombatUniform_01_ADPM", "UK3CB_TKA_O_U_CombatUniform_02_ADPM", "UK3CB_TKA_O_U_CombatUniform_03_ADPM"]];
_militaryLoadoutData set ["helmets", ["UK3CB_TKA_O_H_6b27m_ADPM", "UK3CB_TKA_O_H_6b27m_ESS_ADPM"]];
_militaryLoadoutData set ["vests", ["UK3CB_TKA_O_V_6b23_ml_Oli"]];
_militaryLoadoutData set ["medVests", ["UK3CB_TKA_O_V_6b23_medic_Oli"]];
_militaryLoadoutData set ["slVests", ["UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli"]];
_militaryLoadoutData set ["glVests", ["UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli"]];
_militaryLoadoutData set ["sniVests", ["UK3CB_TKA_O_V_6b23_ml_sniper_Oli"]];
_militaryLoadoutData set ["engVests", ["UK3CB_TKA_O_V_6b23_ml_engineer_Oli"]];
_militaryLoadoutData set ["backpacks", ["rhs_sidor", "UK3CB_TKA_O_B_RIF_Tan"]];

_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74n", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p78", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk3", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "rhs_acc_dtk3", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["SMGs", ["rhs_weap_pp2000"]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;
_policeLoadoutData set ["uniforms", ["UK3CB_TKP_B_U_CombatUniform_TAN", "UK3CB_TKP_B_U_QRF_CombatUniform_TAN", "UK3CB_TKP_B_U_QRF_CombatUniform_Shortsleeve_TAN"]];
_policeLoadoutData set ["vests", ["UK3CB_TKP_B_V_TacVest_Tan"]];
_policeLoadoutData set ["helmets", ["UK3CB_TKP_B_H_Patrolcap_TAN"]];

_policeLoadoutData set ["antiInfantryGrenades", ["rhs_mag_fakel", "rhs_mag_fakels", "rhs_mag_plamyam"]];
_policeLoadoutData set ["rifles", [
["rhs_weap_ak103_1", "rhs_acc_dtk", "", "", ["rhs_10Rnd_762x39mm"], [], ""]
]];
_policeLoadoutData set ["SMGs", ["rhs_weap_pp2000"]];
_policeLoadoutData set ["sidearms", [
["rhs_weap_pya", "", "", "", [], [""], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_TKA_I_U_CombatUniform_01_OLI", "UK3CB_TKA_I_U_CombatUniform_02_OLI", "UK3CB_TKA_I_U_CombatUniform_03_OLI"]];
_militiaLoadoutData set ["vests", ["UK3CB_V_Chestrig_OLI", "V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_B_Alice_K"]];
_militiaLoadoutData set ["helmets", [
"UK3CB_TKA_I_H_Patrolcap_OLI", "UK3CB_TKA_I_H_SSh68_Oli"]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_aks74n", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", ["rhs_weap_pp2000"]];
_militiaLoadoutData set ["machineGuns", ["rhs_weap_pkm"]];
_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", ["rhs_weap_m38"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["UK3CB_TKA_O_U_CrewUniform_01_ADPM"]];
_crewLoadoutData set ["vests", ["V_TacVest_oli"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I", "UK3CB_H_Crew_Cap"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_TKA_O_U_H_Pilot_03_ADD"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["UK3CB_H_Pilot_Helmet"]];
