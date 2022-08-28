//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "CDF support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_CUP_CDF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_UAZ_Unarmed_CDF", "CUP_B_UAZ_Open_CDF"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_UAZ_AGS30_CDF", "CUP_B_UAZ_MG_CDF", "CUP_B_UAZ_METIS_CDF", "CUP_B_UAZ_SPG9_CDF", "CUP_B_UAZ_AA_CDF"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CUP_B_Kamaz_CDF", "CUP_B_Ural_CDF", "CUP_B_Kamaz_Open_CDF"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CUP_B_Kamaz_Open_CDF"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CUP_B_Kamaz_Reammo_CDF", "CUP_B_Ural_Reammo_CDF"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CUP_B_Kamaz_Repair_CDF", "CUP_B_Ural_Repair_CDF"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CUP_B_Kamaz_Refuel_CDF", "CUP_B_Ural_Refuel_CDF"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_S1203_Ambulance_CDF", "CUP_B_BMP2_AMB_CDF"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CUP_B_BRDM2_CDF", "CUP_B_BRDM2_ATGM_CDF", "CUP_B_BRDM2_HQ_CDF", "CUP_B_BTR60_CDF", "CUP_B_BTR80_CDF", "CUP_B_BTR80A_CDF", "CUP_B_MTLB_pk_CDF", "CUP_B_BMP2_CDF"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_T72_CDF"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_B_ZSU23_CDF", "CUP_B_ZSU23_Afghan_CDF", "CUP_B_Ural_ZU23_CDF"]] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_Su25_Dyn_CDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_SU34_CDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_Mi17_CDF"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_B_MI6T_CDF"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_Mi24_D_Dynamic_CDF"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_BM21_CDF", "CUP_B_D30_CDF"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["CUP_B_BM21_CDF", ["CUP_40Rnd_GRAD_HE"]],
    ["CUP_B_D30_CDF", ["CUP_30Rnd_122mmHE_D30_M", "CUP_30Rnd_122mmWP_D30_M"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_B_UAZ_MG_ACR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CUP_B_T810_Unarmed_CZ_WDL"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CUP_B_LR_Transport_CZ_W"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_DSHKM_CDF"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_SPG9_CDF"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_Igla_AA_pod_CDF"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_2b14_82mm_CDF"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;

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
    ["CUP_launch_RPG18", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [""], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", ["CUP_U_B_CDF_FST_1", "CUP_U_B_CDF_MNT_1", "CUP_U_B_CDF_MNT_2"]];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CUP_H_CDF_OfficerCap_MNT"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk"]];

_loadoutData set ["glasses", ["CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drk", "CUP_G_Oakleys_Embr", "CUP_G_TK_RoundGlasses_gold", "CUP_G_TK_RoundGlasses", "CUP_G_PMC_RadioHeadset_Glasses", "CUP_G_PMC_RadioHeadset_Glasses_Ember"]];
_loadoutData set ["goggles", ["CUP_G_ESS_BLK_Dark", "CUP_G_ESS_BLK_Ember", "CUP_G_ESS_CBR", "CUP_G_ESS_KHK_Dark"]];

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
_sfLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Patrol"]];
_sfLoadoutData set ["mgVests", ["CUP_V_JPC_weapons_rngr"]];
_sfLoadoutData set ["medVests", ["CUP_V_JPC_medical_rngr"]];
_sfLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_OD_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_khk", "B_FieldPack_khk"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Black", "CUP_H_OpsCore_Spray", "CUP_H_CDF_H_PASGT_FST"]];
_sfLoadoutData set ["slHat", ["CUP_H_CDF_OfficerCap_FST"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_AK74", "CUP_muzzle_TGPA", "", "CUP_optic_PSO_1_1_open", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "CUP_muzzle_TGPA", "", "CUP_optic_PSO_1_1_open", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "CUP_muzzle_TGPA", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74", "CUP_muzzle_TGPA", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74", "CUP_muzzle_TGPA", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_AK74", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
    ["CUP_arifle_AKS", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_AKS74U", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74U", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK74_GL", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AKS74_GL", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AKM_GL", "CUP_muzzle_snds_KZRZP_AK762", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_arifle_AKS74U", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74U", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_PKM_B50_vfg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"], [], ""],
    ["CUP_arifle_RPK74M", "CUP_muzzle_TGPA", "", "CUP_optic_1p63", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""],
    ["CUP_arifle_RPK74M", "CUP_muzzle_TGPA", "", "CUP_optic_Kobra", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_1_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "CUP_SVD_camo_g", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""],
    ["CUP_launch_M136", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_MakarovSD_M"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["slUniforms", ["CUP_U_B_CDF_FST_2"]];
_militaryLoadoutData set ["vests", ["CUP_V_CDF_6B3_1_Green"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_CDF_6B3_3_Green"]];
_militaryLoadoutData set ["slVests", ["CUP_V_CDF_6B3_5_FST"]];
_militaryLoadoutData set ["glVests", ["CUP_V_CDF_6B3_4_FST"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "CUP_O_RUS_Patrol_bag_Green"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militaryLoadoutData set ["helmets", ["CUP_H_CDF_H_PASGT_FST"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_AK74", "", "", "CUP_optic_PSO_1_1_open", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "", "", "CUP_optic_PSO_1_1_open", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
]];


_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_AK74", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AK74M", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS74", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
    ["CUP_arifle_AKS", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK74_GL", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AKS74_GL", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""],
    ["CUP_arifle_AKM_GL", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]

]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_PKM_B50_vfg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M"], [], ""],
    ["CUP_arifle_RPK74M", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_Makarov_M"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["CUP_U_C_Policeman_01"]];
_policeLoadoutData set ["vests", ["CUP_V_C_Police_Holster"]];
_policeLoadoutData set ["helmets", ["CUP_H_C_Policecap_01"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_Makarov_M"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["vests", ["CUP_V_CDF_6B3_1_Green"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_CDF_6B3_5_FST"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_rgr"]];
_militiaLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militiaLoadoutData set ["helmets", ["CUP_H_CDF_H_PASGT_FST"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_AK74", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_AK74_GL", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74M", "", "", "", ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Makarov", "", "", "", ["CUP_8Rnd_9x18_Makarov_M"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_B_CDF_FST_1"]];
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", ["CUP_H_RUS_TSH_4_Brown"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_CDF_FST_1"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["CUP_H_RUS_ZSH_Shield_Down"]];


