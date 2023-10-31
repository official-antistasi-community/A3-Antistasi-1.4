//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Empire"] call _fnc_saveToTemplate;
["spawnMarkerName", "Imperial support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_JMSLLTE_Emp_black_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa)] call _fnc_saveToTemplate; 				
["flagMarkerType", "JLTS_flag_Rep"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["JMSLLTE_B_veh_74z_imp_F"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["JMSLLTE_B_veh_v35_reb_F", "CW_Ifrit_Empire"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["CW_Ifrit_Imperial_HMG", "CW_Ifrit_Imperial_AT"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["JMSLLTE_B_veh_v35c_reb_F"]] call _fnc_saveToTemplate; 		
["vehiclesCargoTrucks", []] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["JMSLLTE_B_veh_ITTc_imp_F"]] call _fnc_saveToTemplate; 	
["vehiclesRepairTrucks", ["JMSLLTE_B_veh_ITTc_impR_F"]] call _fnc_saveToTemplate; 	
["vehiclesFuelTrucks", ["3AS_ITT_Logistic"]] call _fnc_saveToTemplate;	
["vehiclesMedical", ["3AS_ITT_Medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["JMSLLTE_B_veh_AA5_reb_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["JMSLLTE_B_veh_ITT_imp_F", "3AS_ITT"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["CW_Ifrit_Imperial_HMG", "CW_Ifrit_Imperial_AT"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["JMSLLTE_vehgr_ATST_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["JMSLLTE_vehgr_ATST_F", "JMSLLTE_veh_S1firehawke_emp_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["3AS_ATTE_Imperial","JMSLLTE_veh_S1firehawke_emp_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["3AS_RX200_Base"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 
["vehiclesGunBoats", ["442_boat_armed"]] call _fnc_saveToTemplate; 
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["JMSLLTE_TIEBomber_veh_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["JMSLLTE_TIEinterceptor_veh_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["3AS_Imperial_Transport_01"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["3AS_Patrol_LAAT_Imperial"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["JMSLLTE_veh_IDT_inf_empire"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["442_laat_empire_ab"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["442_laat_empire"]] call _fnc_saveToTemplate;


["vehiclesArtillery", ["442_rx200_arty"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["442_rx200_arty", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["3as_uas2"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["CW_Offroad_Imperial_HMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["JMSLLTE_B_veh_v35c_reb_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CW_Offroad_Imperial"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["JMSLLTE_B_veh_AA5_reb_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CW_Offroad_Imperial"]] call _fnc_saveToTemplate;

["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]] call _fnc_saveToTemplate;
["staticAT", ["3as_ParticleCannon"]] call _fnc_saveToTemplate;
["staticAA", ["AA_Turret"]] call _fnc_saveToTemplate;
["staticMortars", ["3AS_Republic_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "lsd_cis_radarDish"] call _fnc_saveToTemplate;
["vehicleSam", "3as_XX9"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;


#include "CW_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["JLTS_voice_clone"]] call _fnc_saveToTemplate;
["faces", ["lsd_gar_cloneA_head","lsd_gar_cloneB_head","lsd_gar_cloneC_head","lsd_gar_cloneD_head","lsd_gar_cloneE_head","lsd_gar_cloneF_head","lsd_gar_cloneG_head", "lsd_gar_cloneH_head"]] call _fnc_saveToTemplate;


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
_loadoutData set ["ATLaunchers", [
["ls_weapon_rps6", "", "", "", ["ls_mag_rpg_1rnd"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["SWLW_PLX1", "", "", "", ["SWLW_plx1_at_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["SWLW_PLX1_AA", "", "", "", ["SWLW_plx1_aa_mag"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["SWLW_clones_spec_breach_mag"]]; 			
_loadoutData set ["heavyExplosives", ["SWLW_clones_spec_demo_mag"]]; 			

_loadoutData set ["antiInfantryGrenades", ["3AS_ThermalDetonator", "442_impact_mag"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", ["3AS_ThrowableCharge"]]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["SWLB_comlink"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["lsd_gar_standardSPC_nvg"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["SWLB_clone_binocular"]];		//this line determines the binoculars
_loadoutData set ["Rangefinder", ["SWLB_clone_commander_binocular"]];

_loadoutData set ["traitorUniforms", ["JMSLLTE_StormTrooper_dirty_F_CombatUniform"]];
_loadoutData set ["traitorVests", ["JMSLLTE_StormtrooperHidden_armor"]];
_loadoutData set ["traitorHats", ["JMSLLTE_Stormtrooper_dirty_helmet"]];

_loadoutData set ["officerUniforms", ["JMSLLTE_StormTrooper_dirty_F_CombatUniform"]];
_loadoutData set ["officerVests", ["JMSLLTE_StormtrooperHeavy_armor"]];
_loadoutData set ["officerHats", ["JMSLLTE_Stormtrooper_dirty_helmet"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

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

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["JMSLLTE_DeathTrooper_F_CombatUniform"]];
_sfLoadoutData set ["vests", ["JMSLLTE_DeathtrooperVest_armor", "JMSLLTE_DeathtrooperCom_armor", "JMSLLTE_DeathtrooperSpec_armor"]];
_sfLoadoutData set ["backpacks", ["JMSLLTE_back_stormpack_v1", "JMSLLTE_back_stormpack_surv"]];
_sfLoadoutData set ["helmets", ["JMSLLTE_Deathtrooper_helmet"]];
_sfLoadoutData set ["sniHats", ["JMSLLTE_Deathtrooper_helmet"]];
_sfLoadoutData set ["slHat", ["JMSLLTE_Deathtrooper_helmet"]];
_sfLoadoutData set ["binoculars", ["JMSLLTE_W_TD23_white_F"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
["JMSLLTE_e11d", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["JMSLLTE_e11d", "", "jmsllte_acc_flashlight", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["JLTS_EPL2", "", "", "", ["JLTS_EPL2_mag"], ["JLTS_EPL2_mag"], ""]
]];
_sfLoadoutData set ["SMGs", [
["JMSLLTE_e11d", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["JMSLLTE_DLT19BlasterRifle", "", "", "", ["JMSLLTE_DLT19_75Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["JMSLLTE_E22", "", "", "", ["JMSLLTE_E22_60Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["JMSLLTE_E17DRifle", "", "", "", ["JMSLLTE_E17d_5Rnd_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["JMSLLTE_ec17pistol", "", "", "", ["JMSLLTE_EC17_15rnd_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["JMSLLTE_StormTrooper_dirty_F_CombatUniform"]];
_eliteLoadoutData set ["vests", ["JMSLLTE_StormtrooperHidden_armor", "JMSLLTE_StormtrooperAmmo_armor", "JMSLLTE_StormtrooperBand_armor", "JMSLLTE_StormtrooperCape_dirty_armor", "JMSLLTE_StormtrooperHolster_armor", "JMSLLTE_StormtrooperBand2_armor"]];
_eliteLoadoutData set ["glVests", ["JMSLLTE_StormtrooperAmmoP_armor"]];
_eliteLoadoutData set ["backpacks", ["JMSLLTE_back_stormpack_v1", "JMSLLTE_back_stormpack_surv", "JMSLLTE_back_stcape"]];
_eliteLoadoutData set ["atBackpacks", ["JMSLLTE_back_stormpack_surv"]];
_eliteLoadoutData set ["helmets", ["JMSLLTE_Stormtrooper_dirty_helmet"]];
_eliteLoadoutData set ["NVGs", ["lsd_gar_standardSPC_nvg"]];
_eliteLoadoutData set ["binoculars", ["SWLB_clone_commander_binocular"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["3AS_ThermalDetonator", "442_impact_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
["ls_weapon_rps6", "", "", "", ["ls_mag_rpg_1rnd"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
["SWLW_PLX1", "", "", "", ["SWLW_plx1_at_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["JMSLLTE_e11", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["JMSLLTE_e11", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["JMSLLTE_e11carb", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11carb", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["JMSLLTE_rt97cBlasterRifle", "", "", "", ["JMSLLTE_RT97C_150Rnd_Mag"], [], ""],
["JMSLLTE_DLT19BlasterRifle", "", "", "", ["JMSLLTE_DLT19_75Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["JMSLLTE_DLT19xRifle", "", "", "", ["JMSLLTE_DLT19x_10Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["JMSLLTE_E17DRifle", "", "", "", ["JMSLLTE_E17d_5Rnd_Mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["JMSLLTE_se14pistol", "", "", "", ["JMSLLTE_SE14_30rnd_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["JMSLLTE_StormTrooper_dirty_F_CombatUniform"]];
_militaryLoadoutData set ["vests", ["JMSLLTE_StormtrooperHidden_armor", "JMSLLTE_StormtrooperAmmo_armor", "JMSLLTE_StormtrooperBand_armor", "JMSLLTE_StormtrooperCape_dirty_armor", "JMSLLTE_StormtrooperHolster_armor", "JMSLLTE_StormtrooperBand2_armor"]];
_militaryLoadoutData set ["Hvests", ["JMSLLTE_StormtrooperHeavy_armor"]];
_militaryLoadoutData set ["glVests", ["JMSLLTE_StormtrooperAmmoP_armor"]];
_militaryLoadoutData set ["backpacks", ["JMSLLTE_back_stormpack_v1", "JMSLLTE_back_stormpack_surv", "JMSLLTE_back_stcape"]];
_militaryLoadoutData set ["helmets", ["JMSLLTE_Stormtrooper_dirty_helmet"]];
_militaryLoadoutData set ["sniHats", ["JMSLLTE_Stormtrooper_dirty_helmet"]];
_militaryLoadoutData set ["slHat", ["JMSLLTE_Stormtrooper_dirty_helmet"]];
_militaryLoadoutData set ["binoculars", ["SWLB_clone_binocular"]];

_militaryLoadoutData set ["rifles", [
["JMSLLTE_e11", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11", "", "jmsllte_acc_flashlight", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A_wooden", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["JMSLLTE_e11carb", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11carb", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["JMSLLTE_e11carb", "", "", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11carb", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11carb", "", "jmsllte_acc_flashlight", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e11carb", "", "jmsllte_acc_flashlight", "jmsllte_e11_bl_scope", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""],
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["JMSLLTE_rt97cBlasterRifle", "", "", "", ["JMSLLTE_RT97C_150Rnd_Mag"], [], ""],
["JMSLLTE_DLT19BlasterRifle", "", "", "", ["JMSLLTE_DLT19_75Rnd_Mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["JMSLLTE_DLT19xRifle", "", "", "", ["JMSLLTE_DLT19x_10Rnd_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["JMSLLTE_E17DRifle", "", "", "", ["JMSLLTE_E17d_5Rnd_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["JMSLLTE_se14pistol", "", "", "", ["JMSLLTE_SE14_30rnd_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["JMSLLTE_EmpOfficer_black_F_CombatUniform"]];
_policeLoadoutData set ["vests", ["JMSLLTE_Officerrank_navy_lt_armor", "JMSLLTE_Officerrank_lt_armor"]];
_policeLoadoutData set ["helmets", ["JMSLLTE_EmpOfficerCap_black_helmet"]];
_policeLoadoutData set ["smgs", [
["JMSLLTE_dh17rifle", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_60Rnd_Mag"], [], ""],
["JMSLLTE_dh17", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_30Rnd_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["JMSLLTE_se14pistol", "", "", "", ["JMSLLTE_SE14_30rnd_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["JMSLLTE_EmpTrooperArmor_army_F_CombatUniform", "JMSLLTE_EmpTrooperArmor_green_F_CombatUniform", "JMSLLTE_EmpTrooperArmor_black_F_CombatUniform"]];		//this line determines uniforms for militia loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_militiaLoadoutData set ["vests", ["JMSLLTE_TrooperBelt_armor", "JMSLLTE_TrooperCape_armor", "JMSLLTE_TrooperCapeBelt_armor", "JMSLLTE_TrooperBelt_army_armor", "JMSLLTE_TrooperPouchBelt_army_armor", "JMSLLTE_TrooperPouchBelt_armor"]];			//this line determines vests for militia loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_militiaLoadoutData set ["backpacks", ["JMSLLTE_back_crystal_v1", "JMSLLTE_back_stormpouches_v1", "JMSLLTE_back_rebsmall_imp_v1"]];		//this line determines backpacks for militia loadouts -- Example: ["B_AssaultPack_mcamo", "B_Kitbag_mcamo"] -- Array, can contain multiple assets
_militiaLoadoutData set ["helmets", ["JMSLLTE_EmpTrooper_helmet"]];		//this line determines helmets for police loadouts -- Example: ["H_HelmetB_camo", "H_HelmetB_desert"] -- Array, can contain multiple assets
_militiaLoadoutData set ["sniHats", ["JMSLLTE_EmpTrooper_helmet"]];
_militiaLoadoutData set ["slHat", ["JMSLLTE_EmpTrooper_helmet"]];

_militiaLoadoutData set ["rifles", [
["JMSLLTE_e10", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["JMSLLTE_e10", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["JMSLLTE_e10", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["JMSLLTE_e10", "", "", "", ["JMSLLTE_E11_60Rnd_Mag"], [], ""],
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["JMSLLTE_dh17", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_30Rnd_Mag"], [], ""],
["JMSLLTE_dh17", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_30Rnd_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""],
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["JMSLLTE_rt97cBlasterRifle", "", "", "", ["JMSLLTE_RT97C_150Rnd_Mag"], [], ""],
["JMSLLTE_rt97cBlasterRifle", "", "", "", ["JMSLLTE_RT97C_150Rnd_Mag"], [], ""],
["SWLW_DC15SAW", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["JMSLLTE_dlt20a", "", "", "jmsllte_a280_bl_scope", ["JMSLLTE_DLT20a_10Rnd_Mag"], [], ""],
["JMSLLTE_dlt20a", "", "", "jmsllte_a280c_bl_scope", ["JMSLLTE_DLT20a_10Rnd_Mag"], [], ""],
["JMSLLTE_dlt20a", "", "", "jmsllte_a300_bl_scope", ["JMSLLTE_DLT20a_10Rnd_Mag"], [], ""],
["JMSLLTE_dlt20a", "", "", "", ["JMSLLTE_DLT20a_10Rnd_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["JMSLLTE_DLT19xRifle", "", "", "", ["JMSLLTE_DLT19x_10Rnd_Mag"], [], ""],
["SWLW_DC15X_wooden", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["JMSLLTE_se14pistol", "", "", "", ["JMSLLTE_SE14_30rnd_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["JMSLLTE_EmpNavyCrew_black_F_CombatUniform"]];			//this line determines uniforms for vehicle crew loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_crewLoadoutData set ["vests", ["JMSLLTE_StormtrooperHidden_armor"]];				//this line determines vests for vehicle crew loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_crewLoadoutData set ["helmets", ["JMSLLTE_EmpOfficerCap_black_helmet"]];
_crewLoadoutData set ["carbines", [
["JMSLLTE_dh17", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_30Rnd_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["JMSLLTE_EmpTiePilot_black_F_CombatUniform"]];			//this line determines uniforms for pilot loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_pilotLoadoutData set ["vests", ["JMSLLTE_TIEpilot_vest_armor"]];			//this line determines vests for pilot loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_pilotLoadoutData set ["helmets", ["JMSLLTE_EmpTiePilot_helmet"]];	
_pilotLoadoutData set ["carbines", [
["JMSLLTE_dh17", "", "", "jmsllte_dh17_holo_scope", ["JMSLLTE_DH17_30Rnd_Mag"], [], ""]
]];





/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
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
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
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
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;