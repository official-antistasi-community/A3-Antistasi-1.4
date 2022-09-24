//////////////////////////
//   Side Information   //
//////////////////////////

["name", "BAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "BAF support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMT", "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMT", "UK3CB_BAF_LandRover_Soft_FFR_Green_B_DPMT"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["UK3CB_BAF_Husky_Passenger_GMG_Green_DPMW", "UK3CB_BAF_Husky_Passenger_GPMG_Green_DPMW", "UK3CB_BAF_Husky_Passenger_HMG_Green_DPMW", "UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B_DPMW", "UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B_DPMW", "UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMW", "UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW", "UK3CB_BAF_Panther_GPMG_Green_A_DPMW"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["UK3CB_BAF_MAN_HX60_Transport_Green_DPMW", "UK3CB_BAF_MAN_HX58_Transport_Green_DPMW"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["UK3CB_BAF_MAN_HX60_Cargo_Green_A_DPMT", "UK3CB_BAF_MAN_HX58_Cargo_Green_A_DPMT"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["rhsusf_M977A4_AMMO_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["UK3CB_BAF_MAN_HX60_Repair_Green_DPMW", "UK3CB_BAF_MAN_HX58_Repair_Green_DPMW"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["UK3CB_BAF_MAN_HX60_Fuel_Green_DPMW", "UK3CB_BAF_MAN_HX58_Fuel_Green_DPMW"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["UK3CB_BAF_LandRover_Amb_FFR_Green_A_DPMW"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["UK3CB_BAF_Coyote_Passenger_L134A1_W_DPMW", "UK3CB_BAF_Coyote_Passenger_L111A1_W_DPMW", "UK3CB_BAF_Coyote_Passenger_L111A1_W_DPMW"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["UK3CB_BAF_FV432_Mk3_GPMG_Green_DPMW", "UK3CB_BAF_FV432_Mk3_RWS_Green_DPMW", "UK3CB_BAF_Warrior_A3_W_MTP", "UK3CB_BAF_Warrior_A3_W_Camo_MTP"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["UK3CB_BAF_Warrior_A3_W_MTP", "UK3CB_BAF_Warrior_A3_W_Cage_MTP", "UK3CB_BAF_Warrior_A3_W_Cage_Camo_MTP", "UK3CB_BAF_Warrior_A3_W_Camo_MTP"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["rhsusf_m1a1fep_wd","rhsusf_m1a1aimwd_usarmy","rhsusf_m1a1aim_tuski_wd","rhsusf_m1a2sep1wd_usarmy","rhsusf_m1a2sep1tuskiiwd_usarmy","rhsusf_m1a2sep2wd_usarmy"]] call _fnc_saveToTemplate;
["vehiclesAA", ["RHS_M6_wd"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["UK3CB_BAF_RHIB_HMG_DPMW", "UK3CB_BAF_RHIB_GPMG_DPMW"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["RHS_A10"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["rhsusf_f22"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["UK3CB_BAF_Hercules_C3_DPMW", "UK3CB_BAF_Hercules_C4_DPMW"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["UK3CB_BAF_Wildcat_AH1_TRN_8A_DPMW_RM"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["UK3CB_BAF_Merlin_HC3_CSAR_DPMW_RM", "UK3CB_BAF_Merlin_HC3_18_GPMG_DPMW_RM", "UK3CB_BAF_Chinook_HC1_DPMW"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["UK3CB_BAF_Wildcat_AH1_CAS_6A_DPMW_RM", "UK3CB_BAF_Wildcat_AH1_CAS_8A"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["UK3CB_BAF_Apache_AH1_CAS_DPMW_RM", "UK3CB_BAF_Apache_AH1_DPMW_RM"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["rhsusf_m109_usarmy"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhsusf_m109_usarmy", ["rhs_mag_155mm_m795_28"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["UK3CB_BAF_MQ9_Reaper_DPMW"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B_DPMT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["UK3CB_BAF_MAN_HX60_Transport_Green_DPMT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["UK3CB_BAF_LandRover_Soft_FFR_Green_B_DPMT"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["UK3CB_BAF_LandRover_Snatch_FFR_Police_A"]] call _fnc_saveToTemplate;

["staticMGs", ["RHS_M2StaticMG_WD"]] call _fnc_saveToTemplate;
["staticAT", ["RHS_TOW_TriPod_WD"]] call _fnc_saveToTemplate;
["staticAA", ["RHS_Stinger_AA_pod_WD"]] call _fnc_saveToTemplate;
["staticMortars", ["RHS_M252_WD"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["rhsusf_mine_M19"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhsusf_mine_m14"]] call _fnc_saveToTemplate;

#include "3CBBAF_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
"WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
"rhs_weap_fim92"
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_M19_mag"]];
_loadoutData set ["APMines", ["rhsusf_mine_m14_mag"]];
_loadoutData set ["lightExplosives", ["rhsusf_m112_mag", "DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["rhsusf_m112x4_mag", "SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["UK3CB_BAF_SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["UK3CB_BAF_SmokeShellRed", "UK3CB_BAF_SmokeShellGreen", "UK3CB_BAF_SmokeShellYellow", "UK3CB_BAF_SmokeShellPurple", "UK3CB_BAF_SmokeShellBlue", "UK3CB_BAF_SmokeShellOrange"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];

_loadoutData set ["NVGs", ["rhsusf_ANPVS_14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];	
_loadoutData set ["slVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["engBackpacks", []];
_loadoutData set ["expBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["UK3CB_BAF_H_Beret_RW"]];
_loadoutData set ["sniHats", ["UK3CB_BAF_H_Boonie_DPMW", "UK3CB_BAF_H_Boonie_DPMW_PRR"]];

_loadoutData set ["glasses", ["rhs_googles_black", "rhs_googles_clear", "G_Tactical_Clear", "G_Tactical_Black", "G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["rhsusf_oakley_goggles_ylw", "rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_blk"]];

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

//TODO - ACE overrides for misc essentials, medical and engineer gear
//TODO - TFAR overrides for radios

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["UK3CB_BAF_U_CombatUniform_MTP_RM", "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM", "UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"]];
_sfLoadoutData set ["NVGs", ["UK3CB_BAF_HMNVS"]];
_sfLoadoutData set ["vests", ["UK3CB_BAF_V_Osprey_Rifleman_A", "UK3CB_BAF_V_Osprey_Rifleman_B", "UK3CB_BAF_V_Osprey_Rifleman_C", "UK3CB_BAF_V_Osprey_Rifleman_D"]];
_sfLoadoutData set ["slVests", ["UK3CB_BAF_V_Osprey_SL_A", "UK3CB_BAF_V_Osprey_SL_B", "UK3CB_BAF_V_Osprey_SL_C", "UK3CB_BAF_V_Osprey_SL_D"]];
_sfLoadoutData set ["medVests", ["UK3CB_BAF_V_Osprey_Medic_A", "UK3CB_BAF_V_Osprey_Medic_B", "UK3CB_BAF_V_Osprey_Medic_C", "UK3CB_BAF_V_Osprey_Medic_D"]];
_sfLoadoutData set ["glVests", ["UK3CB_BAF_V_Osprey_Grenadier_A", "UK3CB_BAF_V_Osprey_Grenadier_B"]];
_sfLoadoutData set ["mgVests", ["UK3CB_BAF_V_Osprey_MG_A", "UK3CB_BAF_V_Osprey_MG_B"]];
_sfLoadoutData set ["sniVests", ["UK3CB_BAF_V_Osprey_Marksman_A"]];
_sfLoadoutData set ["backpacks", ["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C", "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D", "UK3CB_BAF_B_Kitbag_MTP"]];
_sfLoadoutData set ["aaBackpacks", ["UK3CB_BAF_B_Carryall_MTP"]];
_sfLoadoutData set ["medBackpacks", ["UK3CB_BAF_B_Bergen_MTP_Medic_L_A", "UK3CB_BAF_B_Bergen_MTP_Medic_L_B", "UK3CB_BAF_B_Bergen_MTP_Medic_H_A", "UK3CB_BAF_B_Bergen_MTP_Medic_H_B"]];
_sfLoadoutData set ["engBackpacks", ["UK3CB_BAF_B_Bergen_MTP_Engineer_L_A", "UK3CB_BAF_B_Bergen_MTP_Engineer_H_A"]];
_sfLoadoutData set ["expBackpacks", ["UK3CB_BAF_B_Bergen_MTP_Sapper_L_A", "UK3CB_BAF_B_Bergen_MTP_Sapper_H_A"]];
_sfLoadoutData set ["helmets", ["UK3CB_BAF_H_Mk7_Camo_A", "UK3CB_BAF_H_Mk7_Camo_B", "UK3CB_BAF_H_Mk7_Camo_C", "UK3CB_BAF_H_Mk7_Camo_ESS_D"]];
_sfLoadoutData set ["slHat", ["UK3CB_BAF_H_Beret_SAS", "UK3CB_BAF_H_Beret_SAS_PRR", "UK3CB_BAF_H_Beret_SAS_PRR_Over"]];
_sfLoadoutData set ["sniHats", ["UK3CB_BAF_H_Boonie_MTP", "UK3CB_BAF_H_Boonie_MTP_PRR"]];
_sfLoadoutData set ["binoculars", ["UK3CB_BAF_Soflam_Laserdesignator"]];

_sfLoadoutData set ["slRifles", [
["UK3CB_BAF_L85A3", "UK3CB_BAF_Silencer_L85", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L85A3", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L85A3", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L119A1", "UK3CB_BAF_Silencer_L85", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_Silencer_L85", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L119A1_UKUGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L119A1_UKUGL", "UK3CB_BAF_Silencer_L85", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L119A1_UKUGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["UK3CB_BAF_L85A3", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_552_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_afg_t"],
["UK3CB_BAF_L85A3", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_afg_t"],
["UK3CB_BAF_L119A1", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_552_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L119A1_UKUGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L119A1_UKUGL", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["carbines", [
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_xps3", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1_CQB", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1_CQB", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L119A1_CQB", "UK3CB_BAF_Silencer_L85", "", "rhsusf_acc_eotech_xps3", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["UK3CB_BAF_L129A1", "UK3CB_BAF_Silencer_L115A3", "", "UK3CB_BAF_TA648_308", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "UK3CB_BAF_Silencer_L115A3", "", "rhsusf_acc_M8541", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "UK3CB_BAF_Silencer_L115A3", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "UK3CB_BAF_Silencer_L115A3", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["UK3CB_BAF_L115A3_BL", "UK3CB_BAF_Silencer_L115A3", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL", "UK3CB_BAF_Silencer_L115A3", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL_Ghillie", "UK3CB_BAF_Silencer_L115A3", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL_Ghillie", "UK3CB_BAF_Silencer_L115A3", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L118A1_Covert_BL", "", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_762_L42A1_10Rnd", "UK3CB_BAF_762_L42A1_10Rnd", "UK3CB_BAF_762_L42A1_10Rnd_T"], [], ""],
["UK3CB_BAF_L118A1_Covert_BL", "", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_762_L42A1_10Rnd", "UK3CB_BAF_762_L42A1_10Rnd", "UK3CB_BAF_762_L42A1_10Rnd_T"], [], ""],
["UK3CB_BAF_L135A1", "", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_127_10Rnd"], [], ""],
["UK3CB_BAF_L135A1", "", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_127_10Rnd"], [], ""],
["UK3CB_BAF_L135A1", "", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_127_10Rnd_AP"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["UK3CB_BAF_L131A1", "rhsusf_acc_omega9k", "UK3CB_BAF_Laser_L131A1", "", ["UK3CB_BAF_9_17Rnd"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
"UK3CB_BAF_NLAW_Launcher",
"UK3CB_BAF_AT4_CS_AT_Launcher",
"UK3CB_BAF_AT4_CS_AP_Launcher"
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["UK3CB_BAF_U_CombatUniform_DPMW", "UK3CB_BAF_U_CombatUniform_DPMW_ShortSleeve"]];
_militaryLoadoutData set ["vests", ["UK3CB_BAF_V_Osprey_DPMW7"]];
_militaryLoadoutData set ["slVests", ["UK3CB_BAF_V_Osprey_DPMW2"]];
_militaryLoadoutData set ["medVests", ["UK3CB_BAF_V_Osprey_DPMW8", "UK3CB_BAF_V_Osprey_DPMW9"]];
_militaryLoadoutData set ["glVests", ["UK3CB_BAF_V_Osprey_DPMW3"]];
_militaryLoadoutData set ["backpacks", ["UK3CB_BAF_B_Kitbag_DPMW", "UK3CB_BAF_B_Bergen_DPMW_Rifleman_A",
"UK3CB_BAF_B_Bergen_DPMW_Rifleman_B"]];
_militaryLoadoutData set ["aaBackpacks", ["UK3CB_BAF_B_Carryall_DPMW"]];
_militaryLoadoutData set ["helmets", ["UK3CB_BAF_H_Mk6_DPMW_D", "UK3CB_BAF_H_Mk6_DPMW_F", "UK3CB_BAF_H_Mk6_DPMW_B", "UK3CB_BAF_H_Mk6_DPMW_A"]];
_militaryLoadoutData set ["binoculars", ["UK3CB_BAF_Soflam_Laserdesignator"]];

_militaryLoadoutData set ["slRifles", [
["UK3CB_BAF_L85A3", "", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L85A3", "", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L85A3", "", "", "rhsusf_acc_ACOG_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_grippod_t"],
["UK3CB_BAF_L85A3_UGL", "", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "", "", "rhsusf_acc_ACOG_RMR", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "", "", "rhsusf_acc_ACOG_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "rhs_mag_M397_HET", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
["UK3CB_BAF_L85A3", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_afg_t"],
["UK3CB_BAF_L85A3", "UK3CB_BAF_SFFH", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], "UK3CB_underbarrel_acc_afg_t"]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552_d", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""],
["UK3CB_BAF_L85A3_UGL", "UK3CB_BAF_SFFH", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["carbines", [
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_xps3", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L22A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_compm4", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110A2RIS", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd", "UK3CB_BAF_556_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "RKSL_optic_LDS", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "rhsusf_acc_eotech_552", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""],
["UK3CB_BAF_L110_762", "UK3CB_BAF_SFFH", "", "rhsusf_acc_ELCAN", ["UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd", "UK3CB_BAF_762_200Rnd_T"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["UK3CB_BAF_L129A1", "", "", "UK3CB_BAF_TA648_308", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "", "", "rhsusf_acc_M8541", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"],
["UK3CB_BAF_L129A1", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd", "UK3CB_BAF_762_L42A1_20Rnd_T"], [], "UK3CB_underbarrel_acc_bipod"]
]];
_militaryLoadoutData set ["sniperRifles", [
["UK3CB_BAF_L115A3_BL", "", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL", "", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL_Ghillie", "", "", "RKSL_optic_PMII_525", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""],
["UK3CB_BAF_L115A3_BL_Ghillie", "", "", "RKSL_optic_PMII_312", ["UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd", "UK3CB_BAF_338_5Rnd_Tracer"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["UK3CB_BAF_L105A2", "", "", "", ["UK3CB_BAF_9_15Rnd"], [], ""],
["UK3CB_BAF_L117A2", "", "", "", ["UK3CB_BAF_9_15Rnd"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
"UK3CB_BAF_NLAW_Launcher",
"UK3CB_BAF_AT4_CS_AT_Launcher",
"UK3CB_BAF_AT4_CS_AP_Launcher"
]];
_militaryLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "rhs_optic_maaws", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
_militaryLoadoutData set ["missileATLaunchers", [
["UK3CB_BAF_Javelin_Launcher", "", "", "", ["UK3CB_BAF_Javelin_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];		//this line determines uniforms for police loadouts -- Example: ["U_B_GEN_Commander_F"] -- Array, can contain multiple assets
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];			//this line determines vests for police loadouts -- Example: ["V_TacVest_gen_F"] -- Array, can contain multiple assets
_policeLoadoutData set ["helmets", ["H_Cap_police"]];			//this line determines helmets for police loadouts -- Example: ["H_Beret_gen_F"] -- Array, can contain multiple assets

_policeLoadoutData set ["shotGuns", [
["UK3CB_BAF_L128A1", "", "", "rhsusf_acc_eotech_xps3", ["UK3CB_BAF_12G_Pellets", "UK3CB_BAF_12G_Slugs"], [], ""],
["UK3CB_BAF_L128A1", "", "", "rhsusf_acc_T1_high", ["UK3CB_BAF_12G_Pellets", "UK3CB_BAF_12G_Slugs"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["UK3CB_BAF_L91A1", "", "", "rhsusf_acc_T1_high", [], [], ""],
["UK3CB_BAF_L91A1", "", "", "rhsusf_acc_eotech_xps3", [], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["UK3CB_BAF_L105A2", "", "", "", ["UK3CB_BAF_9_15Rnd"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["UK3CB_BAF_U_Smock_DPMW"]];
_militiaLoadoutData set ["vests", ["UK3CB_BAF_V_PLCE_Webbing_DPMW"]];
_militiaLoadoutData set ["backpacks", ["UK3CB_BAF_B_Kitbag_OLI", "UK3CB_BAF_B_Carryall_OLI", "UK3CB_BAF_B_Bergen_OLI_Rifleman_A", "UK3CB_BAF_B_Bergen_OLI_Rifleman_B"]];
_militiaLoadoutData set ["helmets", ["UK3CB_BAF_H_Wool_Hat"]];

_militiaLoadoutData set ["slRifles", [
["UK3CB_BAF_L85A2", "UK3CB_BAF_SFFH", "", "UK3CB_BAF_SUSAT", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""],
["UK3CB_BAF_L85A2_UGL", "UK3CB_BAF_SFFH", "", "UK3CB_BAF_SUSAT", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["rifles", [
["UK3CB_BAF_L85A2", "UK3CB_BAF_SFFH", "", "", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["UK3CB_BAF_L85A2_UGL", "UK3CB_BAF_SFFH", "", "", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", "UK3CB_BAF_1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["carbines", [
["UK3CB_BAF_L22", "", "", "", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["UK3CB_BAF_L7A2", "", "", "", ["UK3CB_BAF_762_100Rnd"], ["UK3CB_BAF_762_100Rnd", "UK3CB_BAF_762_100Rnd_T"], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["UK3CB_BAF_L86A3", "UK3CB_BAF_SFFH", "UK3CB_BAF_LLM_IR_Black", "UK3CB_BAF_SUSAT", ["UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_556_30Rnd_T"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["UK3CB_BAF_L9A1", "", "", "", ["UK3CB_BAF_9_13Rnd"], [], ""]
]];

_militiaLoadoutData set ["lightATLaunchers", [
["rhs_weap_m72a7"]
]];
_militiaLoadoutData set ["ATLaunchers", [
["rhs_weap_maaws", "", "", "", ["rhs_mag_maaws_HEAT", "rhs_mag_maaws_HE", "rhs_mag_maaws_HEDP"], [], ""]
]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////
//The following lines are determining the loadout of the vehicle crew
private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData;
_crewLoadoutData merge _loadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["UK3CB_BAF_U_CombatUniform_DPMW"]];
_crewLoadoutData set ["vests", ["UK3CB_BAF_V_Osprey_DPMW1"]];
_crewLoadoutData set ["helmets", ["UK3CB_BAF_H_CrewHelmet_B"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _loadoutData;
_pilotLoadoutData set ["uniforms", ["UK3CB_BAF_U_HeliPilotCoveralls_RAF"]];
_pilotLoadoutData set ["vests", ["UK3CB_BAF_V_Pilot_DPMW"]];
_pilotLoadoutData set ["helmets", ["UK3CB_BAF_H_PilotHelmetHeli_A"]];
