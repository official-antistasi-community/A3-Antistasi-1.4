//////////////////////////
//   Side Information   //
//////////////////////////

["name", "TKA"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "TKA"]] call _fnc_saveToTemplate;

["flag", "Flag_TKA"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_TKA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_East_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_CSAT_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_TKA_B_YAVA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_TKA_B_BRDM2_UM", "UK3CB_TKA_B_M1025", "UK3CB_TKA_B_M998_2DR", "UK3CB_TKA_B_M998_4DR"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_TKA_B_MTLB_ZU23", "UK3CB_TKA_B_Ural_Zu23", "UK3CB_TKA_B_BRDM2_HQ", "UK3CB_TKA_B_BRDM2", "UK3CB_TKA_B_LR_SF_AGS30", "UK3CB_TKA_B_LR_SF_M2", "UK3CB_TKA_B_M1025_MK19", "UK3CB_TKA_B_M1025_M2", "UK3CB_TKA_B_BRDM2_ATGM", "UK3CB_TKA_B_MaxxPro_M2", "UK3CB_TKA_B_MaxxPro_MK19"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_TKA_B_Kamaz_Closed", "UK3CB_TKA_B_Kamaz_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_TKA_B_Ural_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_TKA_B_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_TKA_B_Kamaz_Repair", "UK3CB_TKA_B_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_TKA_B_Ural_Fuel", "UK3CB_TKA_B_Kamaz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_TKA_B_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_TKA_B_BTR60", "UK3CB_TKA_B_M113_M2", "UK3CB_TKA_B_M113_M240", "UK3CB_TKA_B_M113_MK19", "UK3CB_TKA_B_M1117"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["UK3CB_TKA_B_M113_M2", "UK3CB_TKA_B_M113_M240", "UK3CB_TKA_B_M113_MK19"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_TKA_B_BMP1", "UK3CB_TKA_B_BMP2"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_TKA_B_T34"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_TKA_B_T55", "UK3CB_TKA_B_T72A", "UK3CB_TKA_B_T72B", "UK3CB_TKA_B_T72BM"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_TKA_B_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_TKA_B_L39_PYLON", "UK3CB_TKA_B_MIG21_AT", "UK3CB_TKA_B_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_TKA_B_L39_PYLON", "UK3CB_TKA_B_MIG21_AA"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_TKA_B_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_b_Mi24D_Early"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["UK3CB_TKA_B_UH1H"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_TKA_B_Bell412_Armed_dynamicLoadout", "UK3CB_TKA_B_Bell412_Armed_AT", "UK3CB_TKA_B_Mi8AMTSh", "UK3CB_TKA_B_UH1H_GUNSHIP"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_TKA_B_Mi_24P", "UK3CB_TKA_B_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_TKA_B_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_TKA_B_BM21",["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_TKA_B_Hilux_Dshkm", "UK3CB_TKA_B_Hilux_M2", "UK3CB_TKA_B_Hilux_Spg9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_TKA_B_Ural_Open", "UK3CB_TKA_B_Ural"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_TKA_B_Hilux_Closed", "UK3CB_TKA_B_Hilux_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["UK3CB_TKA_B_MTLB_PKT", "UK3CB_TKA_B_BTR40_MG"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_TKP_B_Hilux_Pkm", "UK3CB_TKP_B_Hilux_Open", "UK3CB_TKP_B_Lada_Police", "UK3CB_TKP_B_Datsun_Pickup", "UK3CB_TKP_B_Hilux_Closed"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_TKA_B_DSHKM", "UK3CB_TKA_B_KORD_high", "UK3CB_TKA_B_M240_High", "UK3CB_ANA_B_PKM_High"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_TKA_B_Kornet"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_TKA_B_Igla_AA_pod", "UK3CB_TKA_B_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_TKA_B_2b14_82mm"]] call _fnc_saveToTemplate;
["staticHowitzers", ["UK3CB_TKA_B_D30"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;


["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "3CBF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["faces", ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgn", "rhs_mag_rgo", "rhs_mag_m67", "rhs_mag_f1"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd", "rhs_mag_an_m8hc", "rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["traitorUniforms", ["rhsgref_uniform_olive"]];
_loadoutData set ["traitorVests", ["rhs_chicom_khk"]];
_loadoutData set ["traitorHats", ["H_Cap_oli", "H_Cap_grn"]];

_loadoutData set ["officerUniforms", ["UK3CB_TKA_B_U_Officer_WDL"]];
_loadoutData set ["officerVests", ["UK3CB_ADA_B_V_TacVest_WDL", "UK3CB_V_Pouch"]];
_loadoutData set ["officerHats", ["UK3CB_TKA_B_H_Beret", "UK3CB_TKA_B_H_Patrolcap_OFF_WDL"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["ATvests", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["UK3CB_B_B_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_TKA_B_H_Beret", "UK3CB_TKA_B_H_Patrolcap_OFF_WDL", "UK3CB_TKA_B_H_Patrolcap_WDL"]];
_loadoutData set ["slHat", ["UK3CB_TKA_B_H_Beret", "UK3CB_TKA_B_H_Patrolcap_OFF_WDL", "UK3CB_TKA_B_H_Patrolcap_WDL"]];
_loadoutData set ["sniHats", ["UK3CB_TKA_B_H_BoonieHat_WDL"]];

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

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "UK3CB_G_Neck_Shemag_Oli",
    "UK3CB_G_Neck_Shemag_Tan",
    "UK3CB_G_Neck_Shemag"
]];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_02_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_DES_MARPAT"]];
_sfLoadoutData set ["vests", ["UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_HEAVY_DES_MARPAT"]];
_sfLoadoutData set ["backpacks", ["UK3CB_TKA_B_B_RIF", "B_Kitbag_cbr", "B_Carryall_khk"]];
_sfLoadoutData set ["atBackpacks", ["B_Carryall_khk"]];
_sfLoadoutData set ["helmets", ["UK3CB_TKA_B_H_DES_MARPAT", "rhsusf_ach_bare", "UK3CB_TKA_I_H_Shemag_Des", "H_Bandanna_cbr"]];
_sfLoadoutData set ["sniHats", ["H_Booniehat_khk"]];

_sfLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black"]];
_sfLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_sfLoadoutData set ["rifles", [
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_M16A2", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "rhsusf_acc_aac_762sd_silencer", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m240G", "muzzle_snds_H_MG_blk_F", "", "", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "muzzle_snds_H_MG_blk_F", "", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "muzzle_snds_H_MG_blk_F", "", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "muzzle_snds_H_MG_blk_F", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "rhsusf_acc_nt4_black", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_rail", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_ACOG",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_M8541",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_premier",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "rhsusf_acc_aac_m14dcqd_silencer", "", "rhsusf_acc_LEUPOLDMK4",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier_anpvs27", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_02_DES_MARPAT", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_DES_MARPAT"]];
_eliteLoadoutData set ["vests", ["UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_HEAVY_DES_MARPAT"]];
_eliteLoadoutData set ["backpacks", ["UK3CB_TKA_B_B_RIF", "B_Kitbag_cbr", "B_Carryall_khk"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_khk"]];
_eliteLoadoutData set ["helmets", ["UK3CB_TKA_B_H_DES_MARPAT", "rhsusf_ach_bare", "UK3CB_TKA_I_H_Shemag_Des", "H_Bandanna_cbr"]];
_eliteLoadoutData set ["sniHats", ["H_Booniehat_khk"]];

_eliteLoadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_mag_an_m14_th3", "rhs_grenade_m15_mag"]];
_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_eliteLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];
_eliteLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["UK3CB_FNFAL_OSW", "", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""]
]];

_eliteLoadoutData set ["rifles", [
["UK3CB_FNFAL_OSW", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_OSW", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A2", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["UK3CB_FNFAL_OSW_GL", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_FNFAL_OSW_GL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ACOG", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk262_Stanag"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m240G", "", "", "", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "", "", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "", "", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240G", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m249_pip", "", "", "", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_RX01_NoFilter", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_saw_bipod"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_m14_rail", "", "", "rhsusf_acc_ACOG",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "", "", "rhsusf_acc_M8541",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "", "", "rhsusf_acc_premier",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""],
["rhs_weap_m14_rail", "", "", "rhsusf_acc_LEUPOLDMK4",["rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m80_Mag", "rhsusf_20Rnd_762x51_m993_Mag", "rhsusf_20Rnd_762x51_m62_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier", ["rhsusf_mag_10Rnd_STD_50BMG_M33"], [], ""],
["rhs_weap_m82a1", "", "", "rhsusf_acc_premier_anpvs27", ["rhsusf_mag_10Rnd_STD_50BMG_mk211"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["UK3CB_TKA_B_U_CombatUniform_01_WDL", "UK3CB_TKA_B_U_CombatUniform_02_WDL", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_01_WDL", "UK3CB_TKA_B_U_CombatUniform_Shortsleeve_02_WDL"]];
_militaryLoadoutData set ["vests", ["UK3CB_TKA_B_V_GA_LITE_TAN", "UK3CB_TKA_B_V_GA_LITE_WDL", "UK3CB_TKA_B_V_GA_HEAVY_TAN"]];
_militaryLoadoutData set ["backpacks", ["UK3CB_TKA_B_B_RIF"]];
_militaryLoadoutData set ["helmets", ["UK3CB_CW_US_B_LATE_H_PASGT_01_WDL", "UK3CB_CW_US_B_LATE_H_PASGT_02_WDL"]];
_militaryLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_m67", "rhs_grenade_m15_mag"]];

_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_OG7V_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_m714_White", "rhs_mag_m715_Green", "rhs_mag_m716_yellow", "rhs_mag_m713_Red", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster"], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];

_militaryLoadoutData set ["rifles", [
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16A3", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_M16_Carbine", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["UK3CB_FNFAL_PARA", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_PARA", "", "", "", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["UK3CB_FNFAL_PARA", "", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_RX01_NoFilter", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""],
["UK3CB_M16A2_UGL", "", "", "rhsusf_acc_ELCAN", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_fnmag", "", "", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51", "rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"],
["rhs_weap_m249_pip", "", "", "rhsusf_acc_ELCAN", ["rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_box", "rhsusf_200rnd_556x45_M855_mixed_box"], [], "rhsusf_acc_saw_bipod"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_l2a2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""],
["rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "", "rhsgref_acc_l1a1_anpvs2", ["rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_mag_20Rnd_762x51_m61_fnfal", "rhs_mag_20Rnd_762x51_m62_fnfal"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m993_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", ["rhsusf_weap_m9"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["UK3CB_MEE_O_U_07_B", "UK3CB_MEE_O_U_07_B"]];
_policeLoadoutData set ["vests", ["UK3CB_TKP_B_V_GA_LITE_BLK"]];
_policeLoadoutData set ["helmets", ["UK3CB_TKP_B_H_6b27m_BLK", "H_Bandanna_gry", "H_Beret_blk", "H_Cap_blk", "UK3CB_H_Shemag_blk", "UK3CB_TKP_B_H_Beret"]];
_policeLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer"], [], ""],
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red"], [], ""],
["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_RT"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_tt33"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["UK3CB_TKA_I_U_CombatUniform_01_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_02_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_03_TKA_Brush", "UK3CB_TKP_I_U_QRF_CombatUniform_BLK", "UK3CB_TKA_I_U_CombatUniform_01_OLI", "UK3CB_TKA_I_U_CombatUniform_02_OLI", "UK3CB_TKA_I_U_CombatUniform_03_OLI"]];
_militiaLoadoutData set ["vests", ["rhs_6b2_chicom", "UK3CB_TKA_I_V_6Sh92_Des", "UK3CB_TKA_I_V_6Sh92_TKA_Brush", "UK3CB_TKP_I_V_6Sh92_Tan"]];
_militiaLoadoutData set ["GLvests", ["UK3CB_TKA_I_V_6Sh92_vog_TKA_Brush", "UK3CB_TKA_I_V_6Sh92_vog_Des"]];
_militiaLoadoutData set ["SLvests", ["rhs_6b2_chicom", "UK3CB_TKA_I_V_6Sh92_Radio_TKA_Brush", "UK3CB_TKP_I_V_6Sh92_Radio_Tan"]];
_militiaLoadoutData set ["ATvests", ["rhs_6b2_chicom"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_B_Alice_K"]];
_militiaLoadoutData set ["medBackpacks", ["UK3CB_B_Largepack_Med_Des", "UK3CB_B_Largepack_Med"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_6b2"]];
_militiaLoadoutData set ["helmets", ["UK3CB_TKA_I_H_SSh68_Oli", "UK3CB_TKA_I_H_SSh68_Khk", "UK3CB_TKA_I_H_Shemag_Des", "UK3CB_H_Shemag_tan"]];
_militiaLoadoutData set ["slHat", ["UK3CB_TKA_B_H_Beret"]];
_militiaLoadoutData set ["sniHats", ["UK3CB_H_Shemag_tan", "UK3CB_TKA_I_H_Shemag_Des"]];

_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["uk3cb_ak47", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["uk3cb_ak47", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_m70b3n", "", "rhs_acc_2dpZenit", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
["rhs_weap_m70b3n", "", "rhs_acc_2dpZenit", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_m70b3n_pbg40", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_m70b3n_pbg40", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_akm", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["uk3cb_ak47", "rhs_acc_dtkakm", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_m70b3n", "", "rhs_acc_2dpZenit", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74", "rhs_acc_dtk1983", "rhs_acc_2dpZenit", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""],
["rhs_weap_m70b3n_pbg40", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_G", "UK3CB_AK47_45Rnd_Magazine_RT"], [], ""],
["UK3CB_RPK_74", "", "", "", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""],
["rhs_weap_m76", "", "", "rhs_acc_pso1m2", ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m38", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_tt33"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["vests", ["V_TacVest_khk"]];
_crewLoadoutData set ["helmets", ["UK3CB_H_Crew_Cap"]];
_crewLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_TKA_B_U_H_Pilot_DES", "UK3CB_TKA_B_U_J_Pilot_NATO", "UK3CB_TKA_O_U_J_Pilot_Digi"]];			
_pilotLoadoutData set ["vests", ["V_TacVest_oli"]];			
_pilotLoadoutData set ["helmets", ["rhsusf_hgu56p", "rhsusf_hgu56p_mask", "rhsusf_hgu56p_visor", "rhsusf_hgu56p_visor_mask"]];	
_pilotLoadoutData set ["carbines", [
["UK3CB_M16_Carbine", "", "", "", ["rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_m92", "", "", "", ["rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M67", "rhssaf_30Rnd_762x39mm_M78_tracer", "rhssaf_30Rnd_762x39_M82_api"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    if (random 1 < 0.15) then {
		[["lightHELaunchers", "lightATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["MEDvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["GLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["grenadeLaunchers"] call _fnc_setPrimary;

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["GLVests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SNIvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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


    ["carbines"] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["carbines"] call _fnc_setPrimary;
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

    ["carbines"] call _fnc_setPrimary;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
