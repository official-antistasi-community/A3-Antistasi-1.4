//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Republic"] call _fnc_saveToTemplate;
["spawnMarkerName", "Republic support corridor"] call _fnc_saveToTemplate;

["flag", "ls_flag_republic"] call _fnc_saveToTemplate;
["flagTexture", "\LS_statics_props\flags\data\flag_republic.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "JLTS_flag_Rep"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["3AS_Barc"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["CW_Ifrit"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["3AS_BarcSideCar", "CW_Ifrit_HMG", "CW_Offroad_AT", "3AS_Barc"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate; 		
["vehiclesCargoTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["442_argon_ammo"]] call _fnc_saveToTemplate; 	
["vehiclesRepairTrucks", ["442_argon_repair"]] call _fnc_saveToTemplate; 	
["vehiclesFuelTrucks", ["442_argon_fuel"]] call _fnc_saveToTemplate;	
["vehiclesMedical", ["442_argon_medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["3AS_RTT", "3AS_RTT_Wheeled"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["CW_Ifrit_HMG", "CW_Offroad_AT"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["3as_saber_super", "3as_saber_m1G"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["3as_saber_super", "3as_saber_m1G"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["3as_ATAP_base","3AS_ATTE_Base","3AS_ATTE_TCW"]] call _fnc_saveToTemplate;
["vehiclesAA", ["3AS_RX200_Base"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 
["vehiclesGunBoats", ["442_boat_armed"]] call _fnc_saveToTemplate; 
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["3AS_BTLB_Bomber"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["3as_Z95_Republic"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["3AS_Republic_Transport_01"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["3AS_Patrol_LAAT_Republic"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["3as_LAAT_Mk2", "3as_LAAT_Mk2", "3as_LAAT_Mk2", "3AS_Nuclass"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["3as_LAAT_Mk1"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["3as_LAAT_Mk1"]] call _fnc_saveToTemplate;


["vehiclesArtillery", ["442_rx200_arty"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["442_rx200_arty", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["3as_uas2"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["CW_Offroad_HMG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CW_Offroad_Rep"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["3AS_RTT_Wheeled"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["CW_Offroad_Rep"]] call _fnc_saveToTemplate;

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

_loadoutData set ["traitorUniforms", ["SWLB_clone_uniform"]];
_loadoutData set ["traitorVests", ["SWLB_clone_basic_armor"]];
_loadoutData set ["traitorHats", ["SWLB_clone_P2_helmet"]];

_loadoutData set ["officerUniforms", ["SWLB_clone_uniform"]];
_loadoutData set ["officerVests", ["SWLB_clone_assault_armor"]];
_loadoutData set ["officerHats", ["SWLB_clone_P2_helmet"]];

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
_loadoutData set ["items_squadLeaderJedi_extras", ["Force_tir_2"]];
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
_sfLoadoutData set ["jediUniform", ["lsd_gar_bodyGloveLegArmor_uniform"]];
_sfLoadoutData set ["jediVest", ["SWLB_CEE_Rancor_Havoc_Vest", "SWLB_clone_501stCommander_armor"]];
_sfLoadoutData set ["jediHat", ["SWLB_P2_SpecOps_501st_Helmet"]];

_sfLoadoutData set ["jediSidearm", [
["WBK_lightsaber1_jedi", "", "", "", [], [], ""],
["WBK_lightsaber1_purple", "", "", "", [], [], ""],
["WBK_lightsaber1_green", "", "", "", [], [], ""]
]];

_sfLoadoutData set ["uniforms", ["SWLB_clone_commando_uniform_k1"]];
_sfLoadoutData set ["vests", ["SWLB_clone_commando_basic_armor_k1", "SWLB_clone_commando_eod_armor_k1", "SWLB_clone_commando_tech_armor_k1", "SWLB_clone_commando_sniper_armor_k1"]];
_sfLoadoutData set ["backpacks", ["SWLB_clone_commando_backpack_k2", "SWLB_clone_commando_backpack_k2_eod", "SWLB_clone_commando_backpack_k2_tech", "SWLB_clone_commando_backpack_k2_rto"]];
_sfLoadoutData set ["helmets", ["SWLB_clone_commando_helmet_k1"]];
_sfLoadoutData set ["sniHats", ["SWLB_clone_commando_helmet_k1"]];
_sfLoadoutData set ["slHat", ["SWLB_clone_commando_helmet_k1"]];
_sfLoadoutData set ["binoculars", ["SWLB_clone_commander_binocular"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SWLW_DC17M", "swlw_attachment_dc17m_at", "", "", ["SWLW_DC17M_Blaster_Mag"], ["SWLW_DC17M_AT_Mag"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SWLW_Z6", "", "", "", ["SWLW_Z6_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_sniper", "", "swlw_attachment_scope_dc17m_sniper", ["SWLW_DC17M_Sniper_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_sniper", "", "swlw_attachment_scope_dc17m_sniper", ["SWLW_DC17M_Sniper_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["SWLW_DC15SA", "", "", "", ["SWLW_DC15SA_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SWLB_clone_uniform"]];
_eliteLoadoutData set ["vests", ["SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_kama_armor", "SWLB_clone_assault_armor", "SWLB_CEE_Engineer_Vest"]];
_eliteLoadoutData set ["glVests", ["SWLB_clone_grenadier_armor"]];
_eliteLoadoutData set ["backpacks", ["SWLB_clone_backpack", "SWLB_clone_backpack_heavy", "SWLB_clone_backpack_medic", "SWLB_clone_backpack_RTO"]];
_eliteLoadoutData set ["atBackpacks", ["SWLB_clone_backpack_heavy"]];
_eliteLoadoutData set ["helmets", ["SWLB_clone_P2_helmet"]];
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
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A_wooden", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A_wooden", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["SWLW_DC15SAW", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["SWLW_DC15SAW_wooden", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["SWLW_Z6", "", "", "", ["SWLW_Z6_mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["SWLW_DC15BR", "", "", "", ["SWLW_DC15BR_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15X", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["SWLW_DC15X", "", "", "", ["SWLW_DC15X_mag"], [], ""],
["SWLW_DC15X_wooden", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["SWLW_DC17", "", "", "", ["SWLW_DC17_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["SWLB_clone_uniform"]];
_militaryLoadoutData set ["vests", ["SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_medic_armor", "SWLB_clone_kama_armor", "SWLB_clone_assault_armor", "SWLB_CEE_Engineer_Vest"]];
_militaryLoadoutData set ["Hvests", ["SWLB_clone_officer_armor", "SWLB_clone_commander_armor"]];
_militaryLoadoutData set ["glVests", ["SWLB_clone_grenadier_armor"]];
_militaryLoadoutData set ["backpacks", ["SWLB_clone_backpack", "SWLB_clone_backpack_heavy", "SWLB_clone_backpack_medic", "SWLB_clone_backpack_RTO"]];
_militaryLoadoutData set ["helmets", ["SWLB_clone_P2_helmet"]];
_militaryLoadoutData set ["sniHats", ["SWLB_clone_P2_helmet"]];
_militaryLoadoutData set ["slHat", ["SWLB_clone_P2_helmet"]];
_militaryLoadoutData set ["binoculars", ["SWLB_clone_binocular"]];

_militaryLoadoutData set ["rifles", [
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A_wooden", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""],
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["SWLW_DC15SAW", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["SWLW_DC15SAW_wooden", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["SWLW_Z6", "", "", "", ["SWLW_Z6_mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["SWLW_DC15BR", "", "", "", ["SWLW_DC15BR_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15X", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["SWLW_DC15X", "", "", "", ["SWLW_DC15X_mag"], [], ""],
["SWLW_DC15X_wooden", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["SWLW_DC17", "", "", "", ["SWLW_DC17_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["SWLB_clone_CGTrooper_Uniform"]];
_policeLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];
_policeLoadoutData set ["helmets", ["SWLB_clone_CGTrooper_helmet"]];
_policeLoadoutData set ["smgs", [
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["SWLW_DC17", "", "", "", ["SWLW_DC17_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["SWLB_clone_uniform", "SWLB_clone_uniform"]];		//this line determines uniforms for militia loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_militiaLoadoutData set ["vests", ["SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_basic_armor", "SWLB_clone_medic_armor", "SWLB_clone_grenadier_armor", "SWLB_clone_kama_armor", "SWLB_clone_assault_armor", "SWLB_CEE_Engineer_Vest"]];			//this line determines vests for militia loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_militiaLoadoutData set ["backpacks", ["SWLB_clone_backpack", "SWLB_clone_backpack_heavy", "SWLB_clone_backpack_RTO"]];		//this line determines backpacks for militia loadouts -- Example: ["B_AssaultPack_mcamo", "B_Kitbag_mcamo"] -- Array, can contain multiple assets
_militiaLoadoutData set ["helmets", ["SWLB_clone_P1_helmet"]];		//this line determines helmets for police loadouts -- Example: ["H_HelmetB_camo", "H_HelmetB_desert"] -- Array, can contain multiple assets
_militiaLoadoutData set ["sniHats", ["SWLB_clone_P1_helmet"]];
_militiaLoadoutData set ["slHat", ["SWLB_clone_P1_helmet"]];

_militiaLoadoutData set ["rifles", [
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""],
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SWLW_DC15SAW", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SWLW_DC15X_wooden", "", "", "", ["SWLW_DC15X_mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["SWLW_DC17", "", "", "", ["SWLW_DC17_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["SWLB_clone_uniform"]];			//this line determines uniforms for vehicle crew loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_crewLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];				//this line determines vests for vehicle crew loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_crewLoadoutData set ["helmets", ["SWLB_clone_P2_helmet", "SWLB_clone_P1_helmet"]];
_crewLoadoutData set ["carbines", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SWLB_clone_uniform"]];			//this line determines uniforms for pilot loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_pilotLoadoutData set ["vests", ["SWLB_clone_basic_armor"]];			//this line determines vests for pilot loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_pilotLoadoutData set ["helmets", ["SWLB_P1_Pilot_Helmet", "SWLB_clone_pilot_P2_helmet"]];	
_pilotLoadoutData set ["carbines", [
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
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

private _squadLeaderTemplateJedi = {
    ["jediHat"] call _fnc_setHelmet;
    ["jediVest"] call _fnc_setVest;
    ["jediUniform"] call _fnc_setUniform;

    ["jediSidearm"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeaderJedi_extras"] call _fnc_addItemSet;
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
    ["SquadLeader", _squadLeaderTemplateJedi, [["baseClass", "B_soldier_Melee_SW", false]], [_prefix]],
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
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;