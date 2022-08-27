//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ADA"] call _fnc_saveToTemplate;
["spawnMarkerName", "ADA Support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_ADC"] call _fnc_saveToTemplate;
["flagTexture", "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_ADC"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["UK3CB_ADA_I_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_ADA_I_SUV_Armoured", "UK3CB_ADA_I_Van_Transport", "UK3CB_ADA_I_Offroad", "UK3CB_ADA_I_LR_Open",
"UK3CB_ADA_I_LR_Closed", "UK3CB_ADA_I_Hilux_Open", "UK3CB_ADA_I_Hilux_Closed", "UK3CB_ADA_I_Datsun_Pickup", "UK3CB_ADA_I_BTR40"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_ADA_I_LR_SF_M2", "UK3CB_ADA_I_LR_SF_AGS30", "UK3CB_ADA_I_LR_M2", "UK3CB_ADA_I_Hilux_Pkm",
"UK3CB_ADA_I_Hilux_Dshkm", "UK3CB_ADA_I_Datsun_Pickup_PKM", "UK3CB_ADA_I_BRDM2_HQ", "UK3CB_ADA_I_BTR40_MG"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_ADA_I_Ural_Open", "UK3CB_ADA_I_Ural"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_ADA_I_Ural_Recovery", "UK3CB_ADA_I_V3S_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_ADA_I_Ural_Ammo", "UK3CB_ADA_I_V3S_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_ADA_I_Ural_Repair", "UK3CB_ADA_I_V3S_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_ADA_I_Ural_Fuel", "UK3CB_ADA_I_Van_Fuel", "UK3CB_ADA_I_V3S_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_ADA_I_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_ADA_I_BMP1", "UK3CB_ADA_I_BMP2", "UK3CB_ADA_I_BTR60", "UK3CB_ADA_I_BTR70", "UK3CB_ADA_I_BTR80", "UK3CB_ADA_I_BTR80a",
"UK3CB_ADA_I_M113_M2", "UK3CB_ADA_I_M113_MK19"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_ADA_I_T72A", "UK3CB_ADA_I_T72B", "UK3CB_ADA_I_T72BM", "UK3CB_ADA_I_T55"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_ADA_I_ZsuTank", "UK3CB_ADA_I_Ural_Zu23"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UK3CB_TKA_B_RHIB"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_TKA_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["UK3CB_ADA_I_BTR80a", "UK3CB_ADA_I_BMP2", "UK3CB_ADA_I_BTR70"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_ADA_I_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_ADA_I_L39_PYLON"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_ADA_I_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_ADA_I_UH1H", "UK3CB_ADA_I_UH1H_M240"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_ADA_I_UH1H", "UK3CB_ADA_I_UH1H_M240", "UK3CB_ADA_I_Mi8AMT", "UK3CB_ADA_I_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_ADA_I_UH1H_GUNSHIP", "UK3CB_ADA_I_Mi8AMTSh", "UK3CB_ADA_I_Mi_24P", "UK3CB_ADA_I_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_ADA_I_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_ADA_I_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["UK3CB_ADR_I_LR_M2", "UK3CB_ADR_B_Offroad_M2", "UK3CB_ADR_B_LR_SPG9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_ADR_I_V3S_Open", "UK3CB_ADR_I_V3S_Closed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_ADR_I_LR_Closed", "UK3CB_ADR_I_LR_Open", "UK3CB_ADR_I_Hilux_Open", "UK3CB_ADR_I_Datsun_Pickup", "UK3CB_ADR_B_Offroad"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_ADP_I_Van_Transport"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_ADA_I_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_ADA_I_Igla_AA_pod", "UK3CB_TKA_O_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_D"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
"rhs_weap_m72a7", "rhs_weap_rpg18", "rhs_weap_rpg26"
]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_type69_airburst_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_TBG7V_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", ["UK3CB_Blowpipe"]];
_loadoutData set ["sidearms", [
"UK3CB_BHP", "rhsusf_weap_m1911a1"]];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag", "SLAMDirectionalMine_Wire_Mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
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
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", ["UK3CB_V_Chestrig_Tan"]];
_loadoutData set ["backpacks", ["UK3CB_B_Alice_K", "B_Carryall_cbr", "B_Kitbag_cbr"]];
_loadoutData set ["engBackpacks", ["UK3CB_TKA_O_B_ENG_Tan"]];
_loadoutData set ["medBackpacks", ["UK3CB_B_Backpack_Med"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["Medhelmets", []];
_loadoutData set ["slHat", ["UK3CB_ADA_B_H_Off_Beret"]];
_loadoutData set ["sniHats", []];

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
_sfLoadoutData set ["uniforms", ["UK3CB_ADA_B_U_SF_CombatUniform_01_TTC", "UK3CB_ADA_B_U_SF_CombatUniform_03_TTC", "UK3CB_ADA_B_U_SF_CombatUniform_04_TTC"]];
_sfLoadoutData set ["helmets", ["rhsusf_ach_bare_tan", "rhsusf_ach_bare_tan_ess", "rhsusf_ach_bare_tan_headset", "rhsusf_ach_bare_tan_headset_ess"]];
_sfLoadoutData set ["sniHats", ["UK3CB_ADA_B_H_BoonieHat_TTC"]];
_sfLoadoutData set ["vests", ["UK3CB_ANP_B_V_GA_LITE_TAN"]];
_sfLoadoutData set ["Hvests", ["UK3CB_ANP_B_V_GA_HEAVY_TAN"]];
_sfLoadoutData set ["backpacks", ["B_Kitbag_cbr", "UK3CB_B_Backpack_Pocket"]];
_sfLoadoutData set ["slBackpacks", ["UK3CB_B_I_Backpack_Radio_Chem"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_cbr"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_su230_mrds", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["UK3CB_G3A3V_RIS", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_grip1"],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_ACOG_RMR", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_su230_mrds", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];

_sfLoadoutData set ["rifles", [
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_g33_xps3", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_rotex5_grey", "", "rhsusf_acc_compm4", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["UK3CB_G3A3V_RIS", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_grip1"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_ak74mr", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhs_30Rnd_545x39_7N22_AK"], [], "rhsusf_acc_grip1"]
]];
_sfLoadoutData set ["carbines", [
["UK3CB_HK33KA2_RIS", "uk3cb_muzzle_snds_HK33", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], [], ""],
["UK3CB_HK33KA2_RIS", "uk3cb_muzzle_snds_HK33", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk4short", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N22_AK"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_G3KA4_GL", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "uk3cb_muzzle_snds_g3", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk4short", "rhs_acc_perst1ik_ris", "rhsusf_acc_compm4", ["rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25_npz", "rhs_acc_pbs1", "", "rhsusf_acc_g33_xps3", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25_npz", "rhs_acc_pbs1", "", "rhsusf_acc_compm4", ["rhs_30Rnd_762x39mm_89"], ["rhs_VOG25", "rhs_VOG25", "rhs_VG40TB", "rhs_VG40OP_white"], ""]
]];
_sfLoadoutData set ["SMGs", [
["UK3CB_MP5SD5", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_T1", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["UK3CB_MG3_250rnd_762x51", "UK3CB_MG3_250rnd_762x51_R"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["UK3CB_MG3_250rnd_762x51", "UK3CB_MG3_250rnd_762x51_R"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["UK3CB_MG3_250rnd_762x51", "UK3CB_MG3_250rnd_762x51_R"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p29", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_su230", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3SG1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_G3SG1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_premier_mrds", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_m14ebrri", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_mrds", ["rhsusf_20Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m40a5", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"],
["rhs_weap_svdp", "rhs_acc_tgpv2", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp_npz", "rhs_acc_tgpv2", "", "rhs_acc_dh520x56", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""],
["UK3CB_BHP", "rhsusf_acc_omega9k", "", "", ["UK3CB_BHP_9_13Rnd"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_ADA_B_U_CombatUniform_01_DPP", "UK3CB_ADA_B_U_CombatUniform_DPP_OLI"]];
_militaryLoadoutData set ["slUniforms", ["UK3CB_ADA_B_U_Officer_Uniform_01_DPP"]];
_militaryLoadoutData set ["helmets", ["UK3CB_TKA_O_H_6b27m_Tan", "UK3CB_TKA_O_H_6b27m_ESS_Tan"]];
_militaryLoadoutData set ["sniHats", ["H_Booniehat_tan"]];
_militaryLoadoutData set ["slBackpacks", ["UK3CB_B_I_Alice_Radio_Backpack"]];
_militaryLoadoutData set ["vests", ["UK3CB_ANP_B_V_GA_LITE_TAN"]];
_militaryLoadoutData set ["Hvests", ["UK3CB_ANP_B_V_GA_HEAVY_TAN"]];

_militaryLoadoutData set ["binoculars", ["Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p29", [], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p78", [], [], ""]
]];

_militaryLoadoutData set ["rifles", [
["UK3CB_M16A3", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_compm4", ["UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_R", "UK3CB_M16_30rnd_556x45_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["UK3CB_G3A3V_RIS", "", "", "rhsusf_acc_compm4", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_pkas", [], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_1p63", [], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_pkas", [], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "rhs_acc_perst1ik", "rhs_acc_1p63", [], [], ""],
"UK3CB_FNFAL_PARA", "UK3CB_FNFAL_PARA"
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_RT"], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_perst1ik", "rhs_acc_pkas", [], [], ""],
["rhs_weap_aks74n_2", "rhs_acc_dtk1983", "rhs_acc_perst1ik", "rhs_acc_1p63", [], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_G3KA4_GL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_RT"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_ak5", "", "rhs_acc_pkas", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_ak5", "", "rhs_acc_1p63", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5A2", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_mixed_box"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["UK3CB_MG3_250rnd_762x51", "UK3CB_MG3_250rnd_762x51_R"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["UK3CB_MG3_250rnd_762x51", "UK3CB_MG3_250rnd_762x51_R"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "rhsusf_acc_ARDEC_M240", "", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m80a1epr", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p29", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_M14DMR_Railed", "", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_M14_20rnd_762x51"], [], ""],
["UK3CB_M14DMR_Railed", "", "", "rhsusf_acc_ACOG", ["UK3CB_M14_20rnd_762x51"], [], ""],
["UK3CB_M14DMR_Railed", "", "", "rhsusf_acc_ACOG", ["UK3CB_M14_20rnd_762x51"], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""],
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;
_policeLoadoutData set ["uniforms", ["UK3CB_ADP_B_U_QRF_CombatUniform_GRY"]];
_policeLoadoutData set ["vests", ["UK3CB_TKP_B_V_TacVest_Tan"]];
_policeLoadoutData set ["helmets", ["UK3CB_ADP_B_H_Beret"]];
_policeLoadoutData set ["shotGuns", [
["rhs_weap_M590_8RD", "", "", "", ["rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug"], [], ""],
["rhs_weap_M590_5RD", "", "", "", ["rhsusf_5Rnd_00Buck", "rhsusf_5Rnd_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["UK3CB_MP5A2", "", "uk3cb_acc_surefiregrip", "", [], [], ""],
["UK3CB_HK33KA2_RIS", "", "rhsusf_acc_M952V", "", [], [], ""],
["rhs_weap_ak74n", "", "rhs_acc_2dpzenit", "", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["UK3CB_BHP", "", "", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["UK3CB_ADR_B_U_CombatUniform_CC_KHK", "UK3CB_ADR_B_U_CombatUniform_01_CC"]];
_militiaLoadoutData set ["vests", ["UK3CB_ADA_B_V_TacVest_CC", "UK3CB_V_Chestrig_Tan"]];
_militiaLoadoutData set ["helmets", ["H_Bandanna_sand", "H_Cap_tan"]];
_militiaLoadoutData set ["slBackpacks", ["UK3CB_B_I_Radio_Backpack"]];
_militiaLoadoutData set ["sniHats", ["UK3CB_ADA_B_H_BoonieHat_CC"]];

_militiaLoadoutData set ["rifles", [
"UK3CB_M16A1", "UK3CB_M16A2", "rhs_weap_ak74n", "rhs_weap_akmn"
]];
_militiaLoadoutData set ["carbines", [
"UK3CB_M16_Carbine"
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akmn_gp25", "", "", "", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""],
["rhs_weap_ak74n_gp25", "", "", "", [], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["SMGs", ["UK3CB_MP5A2"]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_fnmag", "", "", "", ["rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51", "rhsusf_50Rnd_762x51_m62_tracer"], [], ""],
"rhs_weap_pkm"
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_FNFAL_FULL", "", "", "uk3cb_optic_SUIT_FNFAL", ["UK3CB_FNFAL_20rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["UK3CB_FNFAL_FULL", "", "", "uk3cb_optic_SUIT_FNFAL", ["UK3CB_FNFAL_20rnd_762x51"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData; // touch and shit breaks
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess_bala", "rhs_tsh4_ess", "rhs_tsh4"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_ADA_B_U_H_Pilot_Uniform_01_DES"]];
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["UK3CB_H_Pilot_Helmet"]];
