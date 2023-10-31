//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CIS"] call _fnc_saveToTemplate;
["spawnMarkerName", "CIS Support Corridor"] call _fnc_saveToTemplate;

["flag", "ls_flag_cis"] call _fnc_saveToTemplate;
["flagTexture", "\LS_statics_props\flags\data\flag_cis.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "JLTS_Flag_CIS"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["lsd_car_ast"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["CW_Ifrit_CIS"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["CW_Ifrit_CIS_HMG", "CW_Offroad_CIS_AT", "lsd_car_ast"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["442_argon_covered_cis", "442_argon_transport_cis"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["442_argon_covered_cis", "442_argon_transport_cis"]] call _fnc_saveToTemplate; 	
["vehiclesAmmoTrucks", ["442_argon_ammo_cis"]] call _fnc_saveToTemplate; 
["vehiclesRepairTrucks", ["442_argon_repair_cis"]] call _fnc_saveToTemplate; 	
["vehiclesFuelTrucks", ["442_argon_fuel_cis"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["442_argon_medical_cis"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAirborne", ["CW_Ifrit_CIS_HMG", "CW_Offroad_CIS_AT"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["3as_SAC_Trade"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["3AS_AAT_CIS"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["3AS_n99"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["3AS_AAT_CIS", "3AS_GAT", "3AS_n99"]] call _fnc_saveToTemplate;
["vehiclesAA", ["3AS_GAT_Light"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["442_boat_armed"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["3as_Tri_Fighter_dynamicLoadout"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["3as_Tri_Fighter_dynamicLoadout"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["3AS_Civilian_Transport_01"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["3AS_Patrol_LAAT_Police"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["3AS_HMP_Transport"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["3AS_HMP_Gunship"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["3AS_HMP_Gunship"]] call _fnc_saveToTemplate; 	

["vehiclesArtillery", ["3AS_Hailfire_Rocket"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["3AS_Hailfire_Rocket", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["lsd_ground_agtRaptor"]] call _fnc_saveToTemplate;
["uavsPortable", ["3as_CIS_ScavDroid"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["CW_Offroad_CIS_HMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["442_argon_covered_cis", "442_argon_transport_cis"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CW_Offroad_CIS"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["3as_SAC_Trade"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CW_Offroad_CIS"]] call _fnc_saveToTemplate;

["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]] call _fnc_saveToTemplate;
["staticAT", ["3as_ParticleCannon"]] call _fnc_saveToTemplate;
["staticAA", ["AA_Turret"]] call _fnc_saveToTemplate;
["staticMortars", ["3AS_CIS_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "lsd_cis_radarDish"] call _fnc_saveToTemplate;
["vehicleSam", "3as_FlakCannon"] call _fnc_saveToTemplate;

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

["voices", ["lsd_voice_B1BattleDroid"]] call _fnc_saveToTemplate;
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
["SWLW_E60R", "", "", "", ["SWLW_e60r_at_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["SWLW_E60R_AA", "", "", "", ["SWLW_e60r_aa_mag"], [], ""]
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
_loadoutData set ["radios", ["SWLB_comlink_droid"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["JLTS_NVG_droid_chip_1"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["JLTS_DroidBinocular"]];		//this line determines the binoculars
_loadoutData set ["Rangefinder", ["JLTS_DroidBinocular"]];

_loadoutData set ["traitorUniforms", ["3AS_U_CIS_Light_Armor"]];
_loadoutData set ["traitorVests", ["3AS_CIS_Grenadier_Vest"]];
_loadoutData set ["traitorHats", ["3as_CIS_Light_helmet"]];

_loadoutData set ["officerUniforms", ["3AS_U_CIS_TS"]];
_loadoutData set ["officerVests", ["SWLB_clone_basic_armor"]];
_loadoutData set ["officerHats", [""]];

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
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries", "CW_DroidParts"];
private _eeItems = ["ToolKit", "MineDetector", "CW_DroidParts"];
private _mmItems = ["CW_DroidParts"];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", ["CW_DroidParts"]];
_loadoutData set ["items_medic_extras", ["CW_DroidParts"]];
_loadoutData set ["items_grenadier_extras", ["CW_DroidParts"]];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", ["CW_DroidParts"]];
_loadoutData set ["items_at_extras", ["CW_DroidParts"]];
_loadoutData set ["items_aa_extras", ["CW_DroidParts"]];
_loadoutData set ["items_machineGunner_extras", ["CW_DroidParts"]];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", ["CW_DroidParts"]];
_loadoutData set ["items_crew_extras", ["CW_DroidParts"]];
_loadoutData set ["items_unarmed_extras", ["CW_DroidParts"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["lsd_cis_bxDroid_uniform"]];
_sfLoadoutData set ["vests", ["ls_cis_bxCommando_vest"]];
_sfLoadoutData set ["backpacks", ["lsd_cis_antennaGeonosis_backpack"]];
_sfLoadoutData set ["helmets", []];
_sfLoadoutData set ["binoculars", ["JLTS_DroidBinocular"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["SWLW_ACPR", "", "", "", ["SWLW_acpr_mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SWLW_GL", "", "", "", ["SWLW_mag_40mm_1rnd"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
["SWLW_ACPA", "", "", "", ["SWLW_acpa_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SWLW_E5C", "", "", "", ["SWLW_E5C_mag"], [], ""],
["SWLW_LS150", "", "", "", ["SWLW_LS150_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["SWLW_RG4D", "", "", "", ["SWLW_RG4D_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["ls_cis_b1droid_uniform"]];
_eliteLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_eliteLoadoutData set ["glVests", ["SWLB_clone_basic_armor"]];
_eliteLoadoutData set ["backpacks", ["lsd_cis_standard_backpack"]];
_eliteLoadoutData set ["atBackpacks", ["lsd_cis_standard_backpack"]];
_eliteLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_eliteLoadoutData set ["NVGs", ["JLTS_NVG_droid_chip_1"]];
_eliteLoadoutData set ["binoculars", ["JLTS_DroidBinocular"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["3AS_ThermalDetonator", "442_impact_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
["ls_weapon_rps6", "", "", "", ["ls_mag_rpg_1rnd"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
["SWLW_E60R", "", "", "", ["SWLW_e60r_at_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["SWLW_ACPR", "", "", "", ["SWLW_acpr_mag"], [], ""],
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["SWLW_GL", "", "", "", ["SWLW_mag_40mm_1rnd"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["SWLW_GL", "", "", "", ["SWLW_mag_40mm_1rnd"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["SWLW_E5C", "", "", "", ["SWLW_E5C_mag"], [], ""],
["SWLW_LS150", "", "", "", ["SWLW_LS150_mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""],
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["SWLW_RG4D", "", "", "", ["SWLW_RG4D_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["ls_cis_b1droid_uniform"]];
_militaryLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_militaryLoadoutData set ["glVests", ["SWLB_clone_basic_armor"]];
_militaryLoadoutData set ["Hvests", ["SWLB_clone_basic_armor"]];
_militaryLoadoutData set ["backpacks", ["lsd_cis_standard_backpack"]];
_militaryLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_militaryLoadoutData set ["slHat", ["lsd_cis_oomOfficer_helmet"]];
_militaryLoadoutData set ["binoculars", ["JLTS_DroidBinocular"]];

_militaryLoadoutData set ["rifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["SWLW_ACPR", "", "", "", ["SWLW_acpr_mag"], [], ""],
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["SWLW_GL", "", "", "", ["SWLW_mag_40mm_1rnd"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SWLW_ACPA", "", "", "", ["SWLW_acpa_Mag"], [], ""],
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["SWLW_E5C", "", "", "", ["SWLW_E5C_mag"], [], ""],
["SWLW_LS150", "", "", "", ["SWLW_LS150_mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""],
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["JLTS_E5S", "", "", "", ["JLTS_E5S_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["SWLW_RG4D", "", "", "", ["SWLW_RG4D_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["lsd_cis_oomSecurity_uniform"]];
_policeLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_policeLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_policeLoadoutData set ["smgs", [
["SWLW_ACPR", "", "", "", ["SWLW_acpr_mag"], [], ""],
["SWLW_ACPA", "", "", "", ["SWLW_acpa_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["SWLW_RG4D", "", "", "", ["SWLW_RG4D_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["ls_cis_b1droid_uniform"]];
_militiaLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_militiaLoadoutData set ["backpacks", ["lsd_cis_standard_backpack"]];
_militiaLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_militiaLoadoutData set ["slHat", ["lsd_cis_oomOfficer_helmet"]];

_militiaLoadoutData set ["rifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SWLW_GL", "", "", "", ["SWLW_mag_40mm_1rnd"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SWLW_ACPR", "", "", "", ["SWLW_acpr_mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SWLW_E5C", "", "", "", ["SWLW_E5C_mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SWLW_sniper", "", "", "swlw_sniper_scope", ["SWLW_sniper_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["SWLW_RG4D", "", "", "", ["SWLW_RG4D_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["lsd_cis_oomCrew_uniform"]];			
_crewLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];				
_crewLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_crewLoadoutData set ["carbines", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["lsd_cis_oomPilot_uniform"]];
_pilotLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_pilotLoadoutData set ["helmets", ["ls_cis_b1_helmet"]];
_pilotLoadoutData set ["carbines", [
["SWLW_E5", "", "", "", ["SWLW_E5_Mag"], [], ""]
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
	["SquadLeader", _squadLeaderTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Rifleman", _riflemanTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Radioman", _radiomanTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Medic", _medicTemplate, [["medic", true], ["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true], ["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], ["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Grenadier", _grenadierTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["LAT", _latTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["AT", _atTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["AA", _aaTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Marksman", _marksmanTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]],
	["Sniper", _sniperTemplate, [["baseClass", "WBK_BX_Assasin_1", false]], [_prefix]]
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
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate, [["baseClass", "3AS_CIS_TS_F", true]]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;