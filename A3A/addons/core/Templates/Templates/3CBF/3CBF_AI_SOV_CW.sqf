//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Red Army"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "Red Army"]] call _fnc_saveToTemplate;

["flag", "Flag_CW_SOV"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_CW_SOV\Flag\cw_sov_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_Marker_CW_SOV"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "rhs_7ya37_1_single"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type


["vehiclesBasic", ["UK3CB_NFA_O_YAVA"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_CW_SOV_O_EARLY_BRDM2_UM", "UK3CB_ARD_O_GAZ_Vodnik"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_CW_SOV_O_LATE_BTR40_MG", "UK3CB_ARD_O_GAZ_Vodnik_Cannon", "UK3CB_ARD_O_GAZ_Vodnik_KVPT", "UK3CB_CW_SOV_O_LATE_BRDM2", "UK3CB_CW_SOV_O_LATE_BRDM2_ATGM", "UK3CB_CW_SOV_O_LATE_Gaz66_ZU23", "UK3CB_CW_SOV_O_LATE_Ural_Zu23", "UK3CB_CW_SOV_O_LATE_UAZ_AGS30"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_CW_SOV_O_EARLY_Ural", "UK3CB_CW_SOV_O_EARLY_Ural_Open", "UK3CB_CW_SOV_O_EARLY_VDV_Kraz255_Open", "UK3CB_CW_SOV_O_EARLY_Gaz66_Open", "UK3CB_CW_SOV_O_EARLY_Gaz66_Covered"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Open_Flatbed", "UK3CB_CW_SOV_O_EARLY_Ural_Recovery", "UK3CB_CW_SOV_O_EARLY_Kraz255_Flatbed"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Ammo", "UK3CB_CW_SOV_O_EARLY_Ural_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Repair", "UK3CB_CW_SOV_O_EARLY_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_CW_SOV_O_EARLY_Kraz255_Fuel", "UK3CB_CW_SOV_O_EARLY_Ural_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_CW_SOV_O_EARLY_Gaz66_Med"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_CW_SOV_O_LATE_BTR80a", "UK3CB_CW_SOV_O_LATE_BTR80", "UK3CB_CW_SOV_O_LATE_BTR70", "UK3CB_CW_SOV_O_LATE_BMD1"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["UK3CB_CW_SOV_O_LATE_BMD1P", "UK3CB_CW_SOV_O_LATE_BMD2", "UK3CB_CW_SOV_O_LATE_BMD1"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_CW_SOV_O_LATE_BMP2", "UK3CB_CW_SOV_O_LATE_BMP1", "rhs_bmp3_msv"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["UK3CB_CW_SOV_O_LATE_T55"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["UK3CB_CW_SOV_O_LATE_T72A", "UK3CB_CW_SOV_O_LATE_T72B", "UK3CB_CW_SOV_O_LATE_T72BM", "UK3CB_CW_SOV_O_LATE_T72BA", "UK3CB_CW_SOV_O_LATE_T72BB", "UK3CB_CW_SOV_O_LATE_T72BC", "UK3CB_CW_SOV_O_LATE_T80", "UK3CB_CW_SOV_O_LATE_T80A", "UK3CB_CW_SOV_O_LATE_T80B", "UK3CB_CW_SOV_O_LATE_T80BV", "UK3CB_CW_SOV_O_LATE_T80U", "UK3CB_CW_SOV_O_LATE_T80BVK"]] call _fnc_saveToTemplate;
["vehiclesAA", ["UK3CB_CW_SOV_O_LATE_2S6_Tunguska", "UK3CB_CW_SOV_O_LATE_ZsuTank", "UK3CB_CW_SOV_O_LATE_ZsuTank", "UK3CB_CW_SOV_O_LATE_ZsuTank"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", ["UK3CB_CCM_O_Fishing_Boat_Zu23_front"]] call _fnc_saveToTemplate; 

["vehiclesPlanesCAS", ["UK3CB_CW_SOV_O_LATE_Su25SM_CAS", "UK3CB_CW_SOV_O_LATE_Su25SM_CAS", "UK3CB_CW_SOV_O_LATE_Su25SM_CAS", "UK3CB_CW_SOV_O_LATE_MIG21_AT"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["UK3CB_CW_SOV_O_LATE_MIG29S", "UK3CB_CW_SOV_O_LATE_MIG29S", "UK3CB_CW_SOV_O_LATE_MIG29SM", "UK3CB_CW_SOV_O_LATE_MIG21_AA"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_ADA_O_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", [
    "UK3CB_CW_SOV_O_LATE_Mi8", "UK3CB_CW_SOV_O_LATE_Mi8", 
    "UK3CB_CW_SOV_O_LATE_Mi8AMT","UK3CB_CW_SOV_O_LATE_Mi8AMT",
    "UK3CB_CW_SOV_O_LATE_Mi_24V"
]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["UK3CB_CW_SOV_O_LATE_Mi8AMT"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["RHS_Mi8MTV3_vvs"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_CW_SOV_O_LATE_Mi_24P", "UK3CB_CW_SOV_O_LATE_Mi_24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["UK3CB_CW_SOV_O_LATE_2S1", "UK3CB_CW_SOV_O_LATE_2S3", "UK3CB_CW_SOV_O_LATE_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["UK3CB_CW_SOV_O_LATE_2S1", ["rhs_mag_3of56_10"]],
["UK3CB_CW_SOV_O_LATE_2S3",["rhs_mag_HE_2a33", "rhs_mag_WP_2a33"]],
["UK3CB_CW_SOV_O_LATE_BM21", ["rhs_mag_m21of_1"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["rhs_pchela1t_vvsc"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_CW_SOV_O_LATE_UAZ_MG", "UK3CB_CW_SOV_O_LATE_UAZ_MG", "UK3CB_CW_SOV_O_LATE_UAZ_MG", "UK3CB_CW_SOV_O_LATE_UAZ_SPG9"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_CW_SOV_O_LATE_Zil131_Open", "UK3CB_CW_SOV_O_LATE_Zil131_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_CW_SOV_O_LATE_UAZ_Open", "UK3CB_CW_SOV_O_LATE_UAZ_Closed", "UK3CB_CW_SOV_O_LATE_BTR40"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["UK3CB_CW_SOV_O_LATE_MTLB_PKT", "UK3CB_CW_SOV_O_LATE_BTR60"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_CPD_O_Lada", "UK3CB_CPD_O_GAZ_Vodnik", "UK3CB_CPD_O_Gaz24", "UK3CB_CPD_O_UAZ_Closed"]] call _fnc_saveToTemplate;

["staticMGs", ["UK3CB_CW_SOV_O_Late_PKM_High", "UK3CB_CW_SOV_O_Late_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["UK3CB_CW_SOV_O_Late_SPG9", "UK3CB_CW_SOV_O_Late_Metis"]] call _fnc_saveToTemplate;
["staticAA", ["UK3CB_CW_SOV_O_Late_VDV_ZU23", "UK3CB_CW_SOV_O_Late_Igla_AA_pod"]] call _fnc_saveToTemplate;
["staticMortars", ["UK3CB_CW_SOV_O_Late_2b14_82mm"]] call _fnc_saveToTemplate;
["staticHowitzers", ["UK3CB_CW_SOV_O_Late_D30"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;


["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_pmn2"]] call _fnc_saveToTemplate;

#include "RHS_Vehicle_Attributes.sqf"

["variants", [
    ["UK3CB_ARD_O_GAZ_Vodnik", ["Russian",1]],
    ["UK3CB_ARD_O_GAZ_Vodnik_Cannon", ["Russian",1]],
    ["UK3CB_ARD_O_GAZ_Vodnik_KVPT", ["Russian",1]]
]] call _fnc_saveToTemplate;

//UK3CB_CW_SOV_O_Insignia_VDV
//UK3CB_CW_SOV_O_Insignia_Army

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01RUS","Male02RUS","Male03RUS","RHS_Male01RUS", "RHS_Male02RUS", "RHS_Male03RUS", "RHS_Male04RUS", "RHS_Male05RUS"]] call _fnc_saveToTemplate;
["faces", [
    "RussianHead_1", "RussianHead_2", "RussianHead_3", "RussianHead_4", "RussianHead_5", 
    "WhiteHead_29", "WhiteHead_30", 
	"LivonianHead_1", "LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9","LivonianHead_10",
    "AsianHead_A3_03", "AsianHead_A3_06", "Mavros", "Smith_v2", "Mason_v2", "Oakes_v2",
    "RHS_GreekHead_A3_08", "RHS_GreekHead_A3_09", "RHS_LivonianHead_1", "RHS_LivonianHead_10", "RHS_LivonianHead_2", "RHS_LivonianHead_3", "RHS_LivonianHead_4", "RHS_LivonianHead_5", "RHS_LivonianHead_6", "RHS_LivonianHead_7", "RHS_RussianHead_1", "RHS_WhiteHead_01", "RHS_WhiteHead_04", "RHS_WhiteHead_05", "RHS_WhiteHead_06", "RHS_WhiteHead_07", "RHS_WhiteHead_08", "RHS_WhiteHead_09", "RHS_WhiteHead_10", "RHS_WhiteHead_11", "RHS_WhiteHead_14", "RHS_WhiteHead_15", "RHS_WhiteHead_16", "RHS_WhiteHead_25", "RHS_WhiteHead_27", "RHS_WhiteHead_28", "RHS_WhiteHead_32"
]] call _fnc_saveToTemplate; 

["insignia", ["UK3CB_CW_SOV_O_Insignia_Army", "", ""]] call _fnc_saveToTemplate;
["sfInsignia", ["UK3CB_CW_SOV_O_Insignia_VDV", "UK3CB_CW_SOV_O_Insignia_Army", "", ""]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["AALaunchers", ["rhs_weap_igla"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mag_mine_ptm1", "rhs_mine_tm62m_mag"]];
_loadoutData set ["APMines", ["rhs_mine_ozm72_a_mag", "rhs_mine_ozm72_b_mag", "rhs_mine_ozm72_c_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"]];
_loadoutData set ["lightExplosives", ["rhs_ec200_mag"]];
_loadoutData set ["heavyExplosives", ["rhs_ec400_mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1", "rhs_mag_rgo", "rhs_mag_rgn"]];
_loadoutData set ["smokeGrenades", ["rhs_mag_rdg2_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhs_mag_nspd"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["NVGs", ["UK3CB_ANPVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhs_pdu4"]];

_loadoutData set ["traitorUniforms", ["rhs_uniform_afghanka", "rhs_uniform_afghanka_grey", "rhs_uniform_afghanka_spetsodezhda"]];
_loadoutData set ["traitorVests", ["rhs_6sh92_vsr", "rhs_6sh92_vsr_radio"]];
_loadoutData set ["traitorHats", ["H_Cap_tan", "H_Bandanna_cbr", "H_Cap_headphones"]];

_loadoutData set ["officerUniforms", ["UK3CB_CW_SOV_O_Late_U_OFFICER_Uniform_01_KHK", "UK3CB_CW_SOV_O_Late_U_OFFICER_Uniform_02_KHK", "UK3CB_CW_SOV_O_Early_U_OFFICER_Uniform_01_KHK"]];
_loadoutData set ["officerVests", ["rhs_vest_commander", "rhs_gear_OFF", "rhs_vest_pistol_holster"]];
_loadoutData set ["officerHats", ["UK3CB_CW_SOV_O_LATE_H_Officer_Cap", "UK3CB_CW_SOV_O_EARLY_H_Officer_Cap"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["ATvests", []];
_loadoutData set ["MGvests", []];
_loadoutData set ["MEDvests", []];
_loadoutData set ["SLvests", []];
_loadoutData set ["SNIvests", []];
_loadoutData set ["GLvests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["expBackpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["rhs_r148"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", ["rhs_beanie_green"]];

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
    "rhs_scarf"
]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Late_U_Spetsnaz_Uniform_Gorka_01_KLMK", "rhs_uniform_gorka_1_b", "rhs_uniform_gorka_1_a", "rhs_uniform_gorka_r_g", "rhs_uniform_gorka_r_y"]];
_sfLoadoutData set ["vests", ["rhs_lifchik", "rhs_lifchik_light", "rhs_6b5_spetsodezhda"]];
_sfLoadoutData set ["GLvests", ["rhs_lifchik_vog", "rhs_lifchik_vog", "rhs_6b5_spetsodezhda"]];
_sfLoadoutData set ["backpacks", ["rhs_rd54"]];
_sfLoadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_sfLoadoutData set ["helmets", ["rhs_beanie_green", "rhs_altyn_novisor", "rhs_altyn_visordown", "rhs_gssh18"]];
_sfLoadoutData set ["sniHats", ["rhs_beanie_green", "rhs_altyn_novisor", "rhs_altyn_visordown", "rhs_gssh18"]];
_sfLoadoutData set ["slHat", ["rhs_beanie_green", "rhs_altyn_novisor", "rhs_altyn_visordown", "rhs_gssh18"]];

_sfLoadoutData set ["binoculars", ["rhs_pdu4"]];
_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VS_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_pso1m2", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1pn93_1", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "rhs_acc_perst1ik", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "rhs_acc_perst1ik", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "rhs_acc_perst1ik", "rhs_acc_pso1m2", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "rhs_acc_perst1ik", "rhs_acc_1pn93_1", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];

_sfLoadoutData set ["rifles", [
["rhs_weap_akm", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akm", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_akms", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_pbs1", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""],
["rhs_weap_asval", "", "", "", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_akm_gp25", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40MD"], ""],
["rhs_weap_akm_gp25", "rhs_acc_pbs1", "", "", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40MD"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40MD"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_pbs1", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_U", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25P", "rhs_VG40TB", "rhs_VG40MD"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1p63", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1pn93_1", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_pbs1", "", "rhs_acc_1p78", ["rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm", "rhs_75Rnd_762x39mm_tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_1pn93_1", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_vss", "", "", "rhs_acc_pso1m21", ["rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP6"], [], ""],
["rhs_weap_vss", "", "", "rhs_acc_pso1m21", ["rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP5", "rhs_10rnd_9x39mm_SP6"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_wd", "rhs_acc_tgpv", "", "rhs_acc_1pn93_1", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["rhs_uniform_afghanka_vsr_1", "rhs_uniform_afghanka_vsr_2", "rhs_uniform_afghanka_winter_vsr", "rhs_uniform_afghanka_winter_vsr_2"]];
_eliteLoadoutData set ["vests", ["rhs_6b5", "rhs_6b5_rifleman"]];
_eliteLoadoutData set ["SLvests", ["rhs_6b5", "rhs_6b5_rifleman", "rhs_6b5_officer"]];
_eliteLoadoutData set ["SNIvests", ["rhs_6b5_sniper"]];
_eliteLoadoutData set ["backpacks", ["rhs_rd54_vest_flora2"]];
_eliteLoadoutData set ["atBackpacks", ["rhs_rpg_empty"]];
_eliteLoadoutData set ["helmets", ["rhs_6b7_1m", "rhs_6b7_1m_olive"]];
_eliteLoadoutData set ["slHat", ["rhs_altyn_novisor", "rhs_altyn_visordown", "rhs_altyn"]];

_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_eliteLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_eliteLoadoutData set ["rifles", [
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_svds", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_1pn93_1",["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", [], [], "rhs_acc_harris_swivel"]
]];
_eliteLoadoutData set ["sidearms", ["rhs_weap_pya", "rhs_weap_6p53"]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["rhs_uniform_afghanka_ttsko", "rhs_uniform_afghanka_ttsko_2", "rhs_uniform_afghanka_boots_ttsko", "rhs_uniform_afghanka_winter_ttsko", "rhs_uniform_afghanka_winter_boots_ttsko"]];
_militaryLoadoutData set ["vests", ["rhs_6b3", "rhs_6b3_AK", "rhs_6b3_AK_3", "rhs_6b5_ttsko"]];
_militaryLoadoutData set ["SLvests", ["rhs_6b3_off", "rhs_6b3_holster", "rhs_6b5_officer_ttsko"]];
_militaryLoadoutData set ["SNIvests", ["rhs_6b3", "rhs_6b3_AK_2", "rhs_6b5_sniper_ttsko"]];
_militaryLoadoutData set ["GLvests", ["rhs_6b3_VOG", "rhs_6b3_VOG_2", "rhs_6b5_ttsko"]];
_militaryLoadoutData set ["backpacks", ["rhs_rd54_vest", "rhs_sidor"]];
_militaryLoadoutData set ["atBackpacks", ["rhs_rpg_6b3"]];
_militaryLoadoutData set ["helmets", ["rhs_ssh60", "rhs_ssh60", "rhs_ssh68_2", "rhs_ssh68_2",  "rhs_stsh81_butan",  "rhs_stsh81_butan", "rhs_fieldcap_m88_ttsko", "rhs_fieldcap_m88_ttsko_back"]];
_militaryLoadoutData set ["slHat", ["rhs_fieldcap_m88_ttsko"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VL_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_TBG7V_mag", "rhs_rpg7_TBG7V_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_1pn93_2", ["rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_PG7VL_mag"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_pso1m2", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_militaryLoadoutData set ["rifles", [
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_camo", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74m_fullplum", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""],
["rhs_weap_ak74m_fullplum_gp25", "rhs_acc_dtk1983", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25P", "rhs_GDM40"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "rhs_acc_1p29", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtkrpk", "", "rhs_acc_1pn34", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_7BZ3",  "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_7BZ3",  "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_7BZ3",  "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkm", "", "", "",["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_7N13", "rhs_100Rnd_762x54mmR_7BZ3",  "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["UK3CB_SVD_OLD", "", "", "rhs_acc_1pn34", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militaryLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["rhs_uniform_afghanka_moldovan_ttsko_blue"]];
_policeLoadoutData set ["vests", ["rhs_suspender_AK8_chestrig", "rhs_suspender_AK", "rhs_suspender_AK4", "rhs_suspender_SKS"]];
_policeLoadoutData set ["helmets", ["rhs_fieldcap_m88_moldovan_ttsko_blue_back", "rhs_fieldcap_m88_moldovan_ttsko_blue"]];
_policeLoadoutData set ["SMGs", [
["uk3cb_sks_02", "", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["uk3cb_sks_01", "", "", "", ["uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks", "uk3cb_10rnd_magazine_sks_GT"], [], ""],
["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["rhs_uniform_afghanka_boots", "rhs_uniform_afghanka", "rhs_uniform_afghanka_winter", "rhs_uniform_afghanka_winter_boots"]];
_militiaLoadoutData set ["vests", ["rhs_belt_AK", "rhs_belt_AK_back", "rhs_6b2_AK"]];
_militiaLoadoutData set ["ATvests", ["rhs_6b2_AK"]];
_militiaLoadoutData set ["GLvests", ["rhs_belt_AK_GL", "rhs_6b2_AK"]];
_militiaLoadoutData set ["MGvests", ["rhs_belt_RPK", "rhs_6b2_RPK"]];
_militiaLoadoutData set ["SNIvests", ["rhs_6b2_SVD", "rhs_belt_svd"]];
_militiaLoadoutData set ["backpacks", ["rhs_rd54"]];
_militiaLoadoutData set ["medBackpacks", ["rhs_medic_bag"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_6b2"]];
_militiaLoadoutData set ["helmets", ["rhs_fieldcap_early", "rhs_fieldcap_m88", "rhs_fieldcap_m88_back", "rhs_ushanka", "rhs_ssh60", "rhs_ssh68_2", "rhs_ssh60", "rhs_ssh68_2"]];
_militiaLoadoutData set ["slHat", ["rhs_fieldcap_m88", "rhs_pilotka"]];
_militiaLoadoutData set ["sniHats", ["rhs_beanie_green"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18"]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7V_mag", "rhs_rpg7_PG7VM_mag"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74n", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_2", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_ak74n_2", "rhs_acc_dtk1983", "", "rhs_acc_1p29", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_1p29", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red", "rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red", "rhs_GDM40"], ""]
]];

_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_ak74_2", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74_2", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], [], ""],
["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhs_30Rnd_545x39_AK_plum_green"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm", "rhs_30Rnd_762x39mm_tracer"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25", "rhs_GRD40_White"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_RPK", "", "", "", ["UK3CB_AK47_45Rnd_Magazine", "UK3CB_AK47_45Rnd_Magazine", "UK3CB_AK47_45Rnd_Magazine_GT"], [], ""],
["UK3CB_RPK_74", "", "", "", ["rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_SVD_OLD", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", ["rhs_weap_m38"]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm"]];
_militiaLoadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_f1"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_LATE_U_Crew_Uniform_01_TTSKO"]];
_crewLoadoutData set ["vests", ["rhs_6b2", "rhs_6b2_holster"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4"]];
_crewLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_CW_SOV_O_Early_U_H_Pilot_Uniform_01_KHK", "UK3CB_CW_SOV_O_LATE_U_H_Pilot_Uniform_01_TTSKO"]];			
_pilotLoadoutData set ["vests", ["rhs_6b2", "rhs_6b2_holster"]];			
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike", "rhs_zsh7a_mike_alt", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    if (random 1 < 0.15) then {
		[selectRandom ["lightHELaunchers", "lightATLaunchers"]] call _fnc_setLauncher;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
    [["GLVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["expBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
    [["ATvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["lightATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 4, "glasses", 0.75]] call _fnc_setFacewear;
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
