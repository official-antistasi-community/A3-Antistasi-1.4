//////////////////////////
//   Side Information   //
//////////////////////////

["name", "LDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "LDF"]] call _fnc_saveToTemplate;

["flag", "Flag_Enoch_F"] call _fnc_saveToTemplate;
["flagTexture", "\a3\Data_F_Enoch\Flags\flag_Enoch_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Enoch"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_EAF_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_EAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["UK3CB_LDF_B_Quadbike", "UK3CB_LDF_B_M1030"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_LDF_B_Tigr", "UK3CB_LDF_B_M1151", "UK3CB_LDF_B_BRDM2_UM"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_LDF_B_Tigr_STS", "UK3CB_LDF_B_BRDM2_HQ", "UK3CB_LDF_B_BRDM2_ATGM", "UK3CB_LDF_B_BRDM2", "UK3CB_LDF_B_M1151_GPK_M2", "UK3CB_LDF_B_M1151_GPK_MK19", "UK3CB_LDF_B_M1151_GPK_PKM", "UK3CB_LDF_B_M1151_OGPK_M2", "UK3CB_LDF_B_M1151_OGPK_MK19"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_LDF_B_T810_Open", "UK3CB_LDF_B_T810_Closed", "UK3CB_LDF_B_T810_Open_PKM", "UK3CB_LDF_B_T810_Closed_PKM"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_LDF_B_T810_Recovery"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_LDF_B_T810_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_LDF_B_T810_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_LDF_B_T810_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_LDF_B_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_LDF_B_MTLB_PKT", "UK3CB_LDF_B_MTLB_ZU23"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["UK3CB_LDF_B_MTLB_PKT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_LDF_B_BMP1", "UK3CB_LDF_B_BMP2", "UK3CB_LDF_B_BMP2K", "UK3CB_LDF_B_Marshall", "UK3CB_LDF_B_Marshall_Camo"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_LDF_B_T72A"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_LDF_B_Leopard", "UK3CB_LDF_B_T72BB", "UK3CB_LDF_B_T72BB"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_LDF_B_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["rhsgref_hidf_assault_boat", "rhsgref_hidf_rhib"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_MDF_B_RHIB_Gunboat"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["UK3CB_LDF_B_MIG21_AT", "UK3CB_LDF_B_L39_PYLON", "UK3CB_LDF_B_Su25SM_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_LDF_B_MIG21_AA", "UK3CB_LDF_B_MIG29SM", "UK3CB_LDF_B_L39_PYLON", "UK3CB_LDF_B_MIG29S"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_LDF_B_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["UK3CB_LDF_B_Mi8", "UK3CB_LDF_B_Mi8", "UK3CB_LDF_B_Mi8", "UK3CB_LDF_B_Mi_24V"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["UK3CB_LDF_B_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_LDF_B_Mi8AMTSh"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_LDF_B_Mi_24P", "UK3CB_LDF_B_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_LDF_B_2S1", "UK3CB_LDF_B_RM70", "UK3CB_LDF_B_RM70_MG", "UK3CB_LDF_B_T810_MLRS"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_LDF_B_2S1", ["rhs_mag_3of56_35"]],
["UK3CB_LDF_B_RM70", ["uk3cb_40nd_mag_122mm_rockets"]],
["UK3CB_LDF_B_RM70_MG", ["rhs_mag_40Rnd_122mm_rockets"]],
["UK3CB_LDF_B_T810_MLRS", ["rhs_mag_40Rnd_122mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_LDF_B_M1025_M2", "UK3CB_LDF_B_M1025_M2", "UK3CB_LDF_B_M1025_M2", "UK3CB_LDF_B_M1025_TOW", "UK3CB_LDF_B_M1151_GPK_PKM", "UK3CB_LDF_B_M1151_GPK_PKM"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_KDF_B_Gaz66_Open", "UK3CB_KDF_B_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_KDF_B_BTR40", "UK3CB_LDF_B_M1025", "UK3CB_LDF_B_M1025"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["UK3CB_KDF_B_BTR60", "UK3CB_KDF_B_BTR70", "UK3CB_KDF_B_BTR40_MG"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_LFR_B_LR_Open", "UK3CB_LFR_B_LR_Closed", "UK3CB_LFR_B_Landcruiser", "UK3CB_LFR_B_Pickup"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_LDF_B_DSHKM", "UK3CB_LDF_B_M2_TriPod", "UK3CB_LDF_B_PKM_High"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_LDF_B_Kornet", "UK3CB_LDF_B_TOW_TriPod"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_LDF_B_RBS70", "UK3CB_LDF_B_ZU23", "UK3CB_LDF_B_Igla_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_LDF_B_M252"]] call _fnc_saveToTemplate;
["staticHowitzers", ["UK3CB_LDF_B_D30"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

["animations", [
    ["UK3CB_LDF_B_Leopard", ["HideTurret", 0.3, "HideHull", 0.3, "showCamonetHull", 0.3, "showCamonetTurret", 0.3]],
    ["UK3CB_KDF_B_BTR60", ["wheel_2_unhide",1]],
    ["UK3CB_KDF_B_BTR70", ["wheel_1_unhide",1]]
]] call _fnc_saveToTemplate;

["variants", [
    ["B_Radar_System_01_F", ["Olive",1]],
    ["B_SAM_System_03_F", ["Olive",1]]
]] call _fnc_saveToTemplate;

#include "3CBF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;
["faces", [
    "LivonianHead_1", "LivonianHead_2", "LivonianHead_3", "LivonianHead_4",
    "LivonianHead_5", "LivonianHead_6", "LivonianHead_7", "LivonianHead_8",
    "LivonianHead_9", "LivonianHead_10",
    "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04",
    "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10", "WhiteHead_11",
    "WhiteHead_13", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18",
    "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"
]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_m67", "rhs_grenade_m15_mag", "rhs_grenade_mkii_mag"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_an_m8hc"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_an_m8hc", "rhs_mag_m18_green", "rhs_mag_m18_purple", "rhs_mag_m18_red", "rhs_mag_m18_yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["traitorUniforms", ["U_I_L_Uniform_01_camo_F"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["H_Beret_blk"]];

_loadoutData set ["officerUniforms", ["U_I_E_Uniform_01_officer_F"]];
_loadoutData set ["officerVests", ["UK3CB_LDF_B_V_TacVest_GEO", "V_BandollierB_oli"]];
_loadoutData set ["officerHats", ["H_Beret_EAF_01_F", "H_MilCap_eaf"]];

_loadoutData set ["uniforms", ["UK3CB_LDF_B_U_CombatUniform_GEO", "U_I_E_Uniform_01_shortsleeve_F", "U_I_E_Uniform_01_tanktop_F", "U_I_L_Uniform_01_deserter_F"]];
_loadoutData set ["slUniforms", ["UK3CB_LDF_B_U_CombatUniform_GEO", "U_I_E_Uniform_01_sweater_F"]];
_loadoutData set ["ATvests", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["B_AssaultPack_rgr", "UK3CB_B_TacticalPack_Oli", "B_Kitbag_rgr", "B_AssaultPack_eaf_F"]];
_loadoutData set ["atBackpacks", ["B_Carryall_eaf_F", "B_Carryall_green_F", "B_Carryall_oli", "UK3CB_B_TacticalPack_Oli", "B_Kitbag_sgg"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_eaf_F"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_Beret_EAF_01_F", "H_MilCap_eaf"]];
_loadoutData set ["sniHats", ["H_Booniehat_eaf", "UK3CB_H_Woolhat_GRN"]];

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
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack"
]];
_loadoutData set ["goggles", ["rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_ylw", "rhsusf_oakley_goggles_blk"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_CombatUniform_Shortsleeve_WDL_01", "UK3CB_LDF_B_U_CombatUniform_WDL_01"]];
_sfLoadoutData set ["vests", ["UK3CB_LDF_B_V_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_OLI"]];
_sfLoadoutData set ["MEDvests", ["UK3CB_LDF_B_V_MD_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MD_Vest_KKZ10_OLI"]];
_sfLoadoutData set ["GLvests", ["UK3CB_LDF_B_V_GREN_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_GREN_Vest_KKZ10_GEO"]];
_sfLoadoutData set ["SLvests", ["UK3CB_LDF_B_V_SL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_SL_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_TL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_TL_Vest_KKZ10_OLI"]];
_sfLoadoutData set ["SNIvests", ["UK3CB_LDF_B_V_MK_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MK_Vest_KKZ10_OLI"]];
_sfLoadoutData set ["MGvests", ["UK3CB_LDF_B_V_MG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MG_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_OLI"]];
_sfLoadoutData set ["helmets", ["UK3CB_LDF_B_H_UHB13_Headset_GEO", "UK3CB_LDF_B_H_UHB13_GEO"]];
_sfLoadoutData set ["helmets", ["UK3CB_LDF_B_H_MHB15_GEO", "UK3CB_LDF_B_H_MHB15_OLI", "UK3CB_LDF_B_H_MHB15_EarProtectors_GEO", "UK3CB_LDF_B_H_MHB15_Headset_GEO", "H_Bandanna_khk_hs", "H_Watchcap_camo"]];
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
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["UGL_FlareCIR_F", "rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_EOTECH", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Crew", "rhsusf_acc_rotex5_grey", "rhsusf_acc_wmx_bk", "", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "rhsusf_acc_rotex5_grey", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "rhsusf_acc_rotex5_grey", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "rhsusf_acc_rotex5_grey", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["SMGs", [
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_compm4", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_eotech_xps3", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_g33_xps3", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["uk3cb_auga2_para_blk", "uk3cb_muzzle_snds_a6aug", "", "rhsusf_acc_g33_T1", ["UK3CB_AUG_25Rnd_9x19mm_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_compm4", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_xps3", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""],
["UK3CB_MP5SD5", "", "", "rhsusf_acc_g33_T1", ["UK3CB_MP5_30Rnd_9x19_Magazine"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ELCAN", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_MDO", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""],
["rhs_weap_m240B", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_762x51_m61_ap", "rhsusf_100Rnd_762x51_m62_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_LEUPOLDMK4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "rhsusf_acc_rotex5_grey", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "uk3cb_muzzle_snds_g3", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_anpvs27", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_m8541", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "rhsusf_acc_M2010S_sa", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["UK3CB_CZ75", "rhsusf_acc_omega9k", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""],
["UK3CB_USP", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_CombatUniform_Shortsleeve_WDL_01", "UK3CB_LDF_B_U_CombatUniform_WDL_01"]];
_eliteLoadoutData set ["vests", ["UK3CB_LDF_B_V_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_OLI"]];
_eliteLoadoutData set ["MEDvests", ["UK3CB_LDF_B_V_MD_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MD_Vest_KKZ10_OLI"]];
_eliteLoadoutData set ["GLvests", ["UK3CB_LDF_B_V_GREN_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_GREN_Vest_KKZ10_GEO"]];
_eliteLoadoutData set ["SLvests", ["UK3CB_LDF_B_V_SL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_SL_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_TL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_TL_Vest_KKZ10_OLI"]];
_eliteLoadoutData set ["SNIvests", ["UK3CB_LDF_B_V_MK_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MK_Vest_KKZ10_OLI"]];
_eliteLoadoutData set ["MGvests", ["UK3CB_LDF_B_V_MG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MG_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_OLI"]];
_eliteLoadoutData set ["helmets", ["UK3CB_LDF_B_H_UHB13_Headset_GEO", "UK3CB_LDF_B_H_UHB13_GEO"]];

_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_M136", "rhs_weap_M136_hp"]];
_eliteLoadoutData set ["lightHELaunchers", ["rhs_weap_M136_hedp"]];
_eliteLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230a", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""]
]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d145", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_EOTECH", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["uk3cb_auga3_blk", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_eotech_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_hk416d10", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["rhs_weap_hk416d10", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_kac_grip"],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_g33_xps3_tan", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "", "rhsusf_acc_anpeq15_bk", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["uk3cb_auga3_gl_blk", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_T1", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M441_HE", "rhs_mag_M397_HET", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_S", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_g33_xps3", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["rhs_weap_m249_light_L", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG_RMR", ["rhsusf_100Rnd_556x45_M995_soft_pouch"], [], "rhsusf_acc_kac_grip_saw_bipod"],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ELCAN", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_MDO", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_su230_mrds", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_g33_xps3", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""],
["UK3CB_MG3_KWS_B", "", "rhsusf_acc_anpeq15A", "rhsusf_acc_ACOG_RMR", ["UK3CB_MG3_250rnd_762x51_GT", "UK3CB_MG3_250rnd_762x51_GM"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["UK3CB_ACR_Rifle_Long", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_LEUPOLDMK4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_su230a_mrds", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "rhsusf_acc_anpeq16a", "rhsusf_acc_ACOG_RMR", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_M8541", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_PSG1A1_RIS", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_G3_20rnd_762x51"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010_sa", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_premier_anpvs27", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_m8541", [], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_sa", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_LEUPOLDMK4_2", [], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_FMJ"], [], ""],
["UK3CB_CZ75", "", "", "", ["UK3CB_CZ75_9_20Rnd"], [], ""],
["UK3CB_USP", "", "acc_flashlight_pistol", "", ["UK3CB_USP_9_15Rnd"], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", ["UK3CB_LDF_B_V_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_OLI"]];
_militaryLoadoutData set ["MEDvests", ["UK3CB_LDF_B_V_MD_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MD_Vest_KKZ10_OLI"]];
_militaryLoadoutData set ["GLvests", ["UK3CB_LDF_B_V_GREN_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_GREN_Vest_KKZ10_GEO"]];
_militaryLoadoutData set ["SLvests", ["UK3CB_LDF_B_V_SL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_SL_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_TL_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_TL_Vest_KKZ10_OLI"]];
_militaryLoadoutData set ["SNIvests", ["UK3CB_LDF_B_V_MK_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MK_Vest_KKZ10_OLI"]];
_militaryLoadoutData set ["MGvests", ["UK3CB_LDF_B_V_MG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_MG_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_GEO", "UK3CB_LDF_B_V_LMG_Vest_KKZ10_OLI"]];
_militaryLoadoutData set ["helmets", ["UK3CB_LDF_B_H_HB97_GEO", "UK3CB_LDF_B_H_HB97_ESS_GEO", "UK3CB_LDF_B_H_HB97_ESS_Cover_GEO"]];
_militaryLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_m72a7"]];
_militaryLoadoutData set ["lightHELaunchers",  [
    ["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HE"], [], ""],
    ["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HE"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEAT"], [], ""],
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP"], [], ""],
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HEDP", "rhs_mag_maaws_HEDP"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M583A1_white", "rhs_mag_M585_white_cluster", "rhs_mag_m713_Red", "rhs_mag_m714_White"], ""]
]];

_militaryLoadoutData set ["rifles", [
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_eotech_552", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_eotech_552", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_RX01", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Crew", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["UK3CB_ACR_Carbine", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "rhsusf_acc_eotech_552", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "rhsusf_acc_RX01", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""],
["uk3cb_auga2_carb_blk", "", "", "rhsusf_acc_compm4", ["UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine", "UK3CB_AUG_30Rnd_556x45_Magazine_G", "UK3CB_AUG_30Rnd_556x45_Magazine_GT"], [], ""]
]];
_militaryLoadoutData set ["SMGs", ["uk3cb_auga1_para_blk"]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_eotech_552", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_RX01", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""],
["UK3CB_ACR_Carbine_UGL", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_compm4", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], ["rhs_mag_M441_HE", "rhs_mag_M441_HE", "rhs_mag_M433_HEDP", "rhs_mag_m714_White"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_MG3_Railed", "", "", "", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_GM", "UK3CB_MG3_100rnd_762x51_GT"], [], ""],
["UK3CB_MG3_Railed", "", "", "rhsusf_acc_ELCAN", ["UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51", "UK3CB_MG3_100rnd_762x51_GM", "UK3CB_MG3_100rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], "rhsusf_acc_harris_bipod"],
["UK3CB_ACR_Rifle_Long", "", "rhsusf_acc_wmx_bk", "rhsusf_acc_ACOG", ["UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45", "UK3CB_ACR_30rnd_556x45_G", "UK3CB_ACR_30rnd_556x45_GT"], [], "rhsusf_acc_harris_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_PSG1A1", "", "", "uk3cb_optic_accupoint_g3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_PSG1A1", "", "", "uk3cb_optic_accupoint_g3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_PSG1A1", "", "", "uk3cb_optic_accupoint_g3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_PSG1A1", "", "", "uk3cb_optic_PVS4_G3", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_G", "UK3CB_G3_20rnd_762x51_GT"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["UK3CB_USP", "UK3CB_CZ75"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", [
    "UK3CB_LFR_B_U_RANGER_01", 
    "UK3CB_LFR_B_U_RANGER_02", 
    "UK3CB_LFR_B_U_RANGER_03", 
    "UK3CB_LFR_B_U_RANGER_04", 
    "UK3CB_LFR_B_U_RANGER_05",
    "UK3CB_LFR_B_U_RANGER_06",
    "UK3CB_LFR_B_U_RANGER_07",
    "UK3CB_LFR_B_U_Officer_01", 
    "UK3CB_LFR_B_U_Officer_02", 
    "UK3CB_LFR_B_U_Officer_03", 
    "UK3CB_LFR_B_U_Officer_04"
]];
_policeLoadoutData set ["vests", ["V_Pocketed_olive_F", "UK3CB_LFR_B_V_TacVest_OLI"]];
_policeLoadoutData set ["helmets", ["H_Booniehat_khk", "H_Cap_oli", "UK3CB_LFR_B_H_CAP_OLI"]];
_policeLoadoutData set ["policeWeapons", [
["UK3CB_CZ550", "", "", "uk3cb_optic_sro", ["UK3CB_CZ550_5rnd_Mag", "UK3CB_CZ550_5rnd_Mag", "UK3CB_CZ550_5rnd_Mag_RT"], [], ""],
["UK3CB_Sten", "", "", "", ["UK3CB_Sten_34Rnd_Magazine", "UK3CB_Sten_34Rnd_Magazine", "UK3CB_Sten_34Rnd_Magazine_RT"], [], ""],
["rhs_weap_kar98k", "", "", "", ["rhsgref_5Rnd_792x57_kar98k"], [], ""],
["rhs_weap_Izh18", "", "", "", ["rhsgref_1Rnd_Slug", "rhsgref_1Rnd_00Buck"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", "UK3CB_BHP"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["vests", ["UK3CB_LDF_B_V_TacVest_GEO", "V_TacVest_oli", "rhsgref_chestrig", "V_BandollierB_oli"]];
_militiaLoadoutData set ["helmets", ["H_Bandanna_khk", "H_Bandanna_khk", "UK3CB_H_Woolhat_GRN", "UK3CB_LDF_B_H_HB97_GEO"]];
_militiaLoadoutData set ["longRangeRadios", ["UK3CB_B_I_Radio_Backpack"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_m80"]];
_militiaLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["UK3CB_HK33KA1", "", "", "uk3cb_optic_STANAGZF_G3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2", "", "", "uk3cb_optic_STANAGZF_G3", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["rhs_weap_m21a_pr_pbg40", "", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red"], ""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_m21a", "", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["rhs_weap_m21a", "", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["UK3CB_HK33KA1", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""],
["UK3CB_HK33KA2", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["UK3CB_MP5K", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5K_PDW", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""],
["UK3CB_MP5A4", "", "", "", ["UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine", "UK3CB_MP5_30Rnd_9x19_Magazine_GT"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_m21s", "", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], [], ""],
["UK3CB_HK33KA3", "", "", "", ["UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45", "UK3CB_HK33_30rnd_556x45_G", "UK3CB_HK33_30rnd_556x45_GT"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_m21a_pbg40", "", "", "", ["rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21", "rhsgref_30rnd_556x45_m21_t"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_MG3", "", "", "", ["UK3CB_MG3_50rnd_762x51", "UK3CB_MG3_50rnd_762x51", "UK3CB_MG3_50rnd_762x51_GT"], [], ""],
["UK3CB_UKM2000P", "", "", "", ["UK3CB_UKM_100rnd_762x51", "UK3CB_UKM_100rnd_762x51_G", "UK3CB_UKM_100rnd_762x51_GT"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_G3SG1", "", "", "uk3cb_optic_ZFSG1", ["UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51", "UK3CB_G3_20rnd_762x51_GT"], [], ""],
["UK3CB_SVD_OLD_NPZ", "", "", "optic_MRCO", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_m40a5", "", "", "rhsusf_acc_LEUPOLDMK4", [], [], ""],
["rhs_weap_m40a5", "", "", "rhsusf_acc_M8541", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];
_militiaLoadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_militiaLoadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];


//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_CombatUniform_GEO", "U_I_E_Uniform_01_shortsleeve_F"]];	
_crewLoadoutData set ["vests", ["V_TacVest_oli", "V_BandollierB_oli"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I", "H_Tank_eaf_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_LDF_B_U_H_Pilot_GEO", "U_I_E_Uniform_01_coveralls_F"]];			
_pilotLoadoutData set ["vests", ["UK3CB_V_Pilot_Vest"]];			
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I_E", "H_CrewHelmetHeli_I_E"]];	

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["SLvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
        ["backpacks"] call _fnc_setBackpack;
		["launcher", 2] call _fnc_addMagazines;
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
    ["backpacks"] call _fnc_setBackpack;

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


    ["policeWeapons"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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
