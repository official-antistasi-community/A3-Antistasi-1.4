//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Scion Empire"] call _fnc_saveToTemplate;
["spawnMarkerName", "Scion Support Tunnel"] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "sc_props\data\flags\flag_se_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SC_flag_SE"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["SC_Ferret_AR"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SCEXT_Dingo_AR"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SCEXT_Dingo_A_AR", "SC_Ferret_AA_AR"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SC_Gator_TO_AR", "SC_Gator_TC_AR"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SC_Gator_FB_AR", "SCEXT_Gator_Flatbed_Trans_AR"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SCEXT_Gator_Crate_AR"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SCEXT_Gator_Logistics_AR"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SCEXT_Gator_Crate_AR"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SC_Gator_TC_AR"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SC_SaurusAPC_Unarmed_SE"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["SC_SE_IFV"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SC_SE_IFV", "SC_SaurusAPC_SE"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesLightTanks",  ["SC_EXT_Ant_SE", "SC_EXT_Scorpion"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SC_Mantis", "SC_EXT_Rhino_AR"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SC_SaurusAPC_AA_SE"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["O_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SCR_TF3Fighter_SE"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SCR_TF3Fighter_SE"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SC_VTOL_X42_SE"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["SC_VTOL_X42S_AR", "SC_EXT_Comanche_AR", "SC_EXT_Comanche_V_AR"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["SC_EXT_Comanche_V_AR"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["SC_VTOL_X41A_AR"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["SC_EXT_Wyvern_AR"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SCEXT_Gator_ArtyGun_AR"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SCEXT_Gator_ArtyGun_AR", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["O_T_UAV_04_CAS_F", "O_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["SCEXT_Dingo_A_AR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SC_Gator_FB_AR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SC_SaurusAPC_Unarmed_SE"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SC_SaurusAPC_SE"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SCEXT_Gator_Flatbed_Trans_AR"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F", "B_HMG_01_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "Scion_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male01PER","Male02PER","Male03PER"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
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
_loadoutData set ["AALaunchers", ["SC_MPML"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["SC_IG3"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGogglesB_blk_F"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["SC_Uniform_Black"]];
_loadoutData set ["traitorVests", ["SC_Vest_WD_Basic_Urban"]];
_loadoutData set ["traitorHats", ["SC_Beret_AR"]];

_loadoutData set ["officerUniforms", ["SC_Uniform_Short_Black"]];
_loadoutData set ["officerVests", ["SC_Vest_WD_Light_Guard"]];
_loadoutData set ["officerHats", ["SC_Beret_AR_v2"]];

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
_loadoutData set ["aaBackpacks", ["SC_WarbotRocketRack"]];
_loadoutData set ["longRangeRadios", ["SC_Backpack_WD_Urban_SL"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["SC_Helmet_RN_Urban"]];
_loadoutData set ["sniHats", ["SC_MDF_Pathfinder_Helmet"]];

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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["SC_Warbot_Uniform"]];
_sfLoadoutData set ["vests", ["SC_Vest_Warbot"]];
_sfLoadoutData set ["GLvests", ["SC_WarfighterVest"]];
_sfLoadoutData set ["backpacks", ["SC_WarbotJumppack"]];
_sfLoadoutData set ["helmets", ["SC_Gen2WarbotHead_NoFS", "SC_Gen2WarbotHead"]];
_sfLoadoutData set ["sniHats", ["SC_EliminatorHead"]];

_sfLoadoutData set ["binoculars", ["Rangefinder"]];
_sfLoadoutData set ["lightATLaunchers", ["SC_MPML"]];
_sfLoadoutData set ["lightHELaunchers", ["SC_MPML"]];
_sfLoadoutData set ["ATLaunchers", [
["SC_MPML", "", "", "sc_mpml_scope", ["SC_MPML_M_AT", "SC_MPML_M_HE"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
["SC_Rifle_ARG47", "", "", "sc_x11", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""]
]];
_sfLoadoutData set ["rifles", [
["SC_Rifle_ARG88M", "", "", "sc_t1", ["SC_10Rnd_HCShrapnel_Mag_Cyan"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["SC_Rifle_ARG88", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SC_Rifle_SpecterM1_GL", "", "", "", ["SC_30Rnd_65x39mm_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SC_Rifle_PKMP", "", "", "sc_tso55", ["SC_200Rnd_338_Mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["SC_Rifle_AR12", "", "", "sc_tso55", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["SC_Rifle_SSR55", "", "", "sc_tso55", ["SC_5Rnd_50HV_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["SC_Pistol_SSP9", "sc_ssp9_silencer", "", "sc_reflex_c_blue", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SC_Uniform_Gloves_Black"]];
_eliteLoadoutData set ["vests", ["SC_Vest_WP_Heavy_Urban"]];
_eliteLoadoutData set ["SLvests", ["SC_MDF_Heavy_Black"]];
_eliteLoadoutData set ["GLvests", ["SC_Vest_WP_Heavy_Urban"]];
_eliteLoadoutData set ["backpacks", ["SC_EnforcerRucksack"]];
_eliteLoadoutData set ["expBackpacks", ["SC_EnforcerRucksack"]];
_eliteLoadoutData set ["atBackpacks", []];
_eliteLoadoutData set ["helmets", ["SC_Helmet_WP_Urban", "SC_Helmet_RN_Urban"]];

_eliteLoadoutData set ["lightATLaunchers", ["SC_MPML"]];
_eliteLoadoutData set ["lightHELaunchers", ["SC_MPML"]];
_eliteLoadoutData set ["ATLaunchers", [
["SC_MPML", "", "", "sc_mpml_scope", ["SC_MPML_M_AT", "SC_MPML_M_HE"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["SC_Rifle_ARG47", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["WRS_Weapon_AUG", "", "", "", ["WRS_Ar1_Magazine"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""],
["WRS_Weapon_AR", "", "", "", ["WRS_Ar_Magazine"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["SC_Rifle_ARG88", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["SC_Rifle_AR12C", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["SC_Rifle_SpecterM1_GL", "", "", "", ["SC_30Rnd_65x39mm_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
["WRS_Weapon_ShockGun", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["SC_Rifle_PKMP", "", "", "", ["SC_200Rnd_338_Mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["SC_Rifle_SSR55", "", "", "sc_tso55", ["SC_5Rnd_50HV_Mag"], [], ""],
["WRS_Weapon_Sniper_Bolt", "", "", "optic_lrps", ["WRS_Boomslang_Magazine"], [], ""],
["WRS_Weapon_Sniper", "", "", "optic_dms", ["WRS_Sniper_Magazine"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""],
["SC_Pistol_SSP9", "", "", "", ["SC_15Rnd_45HP_Mag"], [], ""]
]];

_eliteLoadoutData set ["SMGs", ["WRS_Weapon_AR_2"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SC_Uniform_Gloves_Black", "SC_Undersuit_Black"]];
_militaryLoadoutData set ["vests", ["SC_Vest_WP_Light_Urban", "SC_Vest_WD_Light_Urban"]];
_militaryLoadoutData set ["SLvests", ["SC_Vest_WP_Heavy_Urban"]];
_militaryLoadoutData set ["GLvests", ["SC_Vest_WP_Medium_Urban"]];
_militaryLoadoutData set ["backpacks", ["SC_Backpack_WP_Urban"]];
_militaryLoadoutData set ["expBackpacks", ["SC_Backpack_WP_Urban"]];
_militaryLoadoutData set ["atBackpacks", ["SC_WarbotRocketRack"]];
_militaryLoadoutData set ["helmets", ["SC_Helmet_WP_Urban", "SC_Helmet_RN_Urban"]];

_militaryLoadoutData set ["lightATLaunchers", ["SC_MPML"]];
_militaryLoadoutData set ["lightHELaunchers", ["SC_MPML"]];
_militaryLoadoutData set ["ATLaunchers", [
["SC_MPML", "", "", "sc_mpml_scope", ["SC_MPML_M_AT", "SC_MPML_M_HE"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["SC_Rifle_ARG47", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["WRS_Weapon_AUG", "", "", "", ["WRS_Ar1_Magazine"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""],
["WRS_Weapon_AR", "", "", "", ["WRS_Ar_Magazine"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["SC_Rifle_ARG88", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["SC_Rifle_AR12C", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["SC_Rifle_SpecterM1_GL", "", "", "", ["SC_30Rnd_65x39mm_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["SC_Rifle_PKMP", "", "", "", ["SC_200Rnd_338_Mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["SC_Rifle_SSR55", "", "", "sc_tso55", ["SC_5Rnd_50HV_Mag"], [], ""],
["WRS_Weapon_Sniper_Bolt", "", "", "optic_lrps", ["WRS_Boomslang_Magazine"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

_militaryLoadoutData set ["SMGs", ["WRS_Weapon_AR_2"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["SC_Uniform_Gloves_Black"]];
_policeLoadoutData set ["vests", ["SC_Vest_WP_Medium_Guard", "SC_Vest_WP_Light_Guard"]];
_policeLoadoutData set ["helmets", ["SC_Beret_SE"]];
_policeLoadoutData set ["SMGs", [
["WRS_Weapon_AR_2", "", "", "optic_hamr", ["WRS_Ar2_Magazine"], [], ""],
["SC_Rifle_AR12C", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["WRS_Weapon_Revolver"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["SC_Uniform_Gloves_Black"]];
_militiaLoadoutData set ["vests", ["SC_Vest_WP_Light_Urban"]];
_militiaLoadoutData set ["ATvests", ["SC_Vest_WP_Medium_Urban"]];
_militiaLoadoutData set ["GLvests", ["SC_Vest_WP_Medium_Urban"]];
_militiaLoadoutData set ["SLvests", ["SC_Vest_WP_Heavy_Urban"]];
_militiaLoadoutData set ["MGvests", ["SC_Vest_WP_Medium_Urban"]];
_militiaLoadoutData set ["backpacks", ["SC_Backpack_WP_Urban"]];
_militiaLoadoutData set ["medBackpacks", ["SC_PTC"]];
_militiaLoadoutData set ["atBackpacks", ["SC_WarbotRocketRack"]];
_militiaLoadoutData set ["helmets", ["SC_ConscriptHelmet_Urban", "SC_ConscriptHelmet3_Urban"]];
_militiaLoadoutData set ["slHat", []];
_militiaLoadoutData set ["sniHats", []];

_militiaLoadoutData set ["lightATLaunchers", ["SC_MPML"]];
_militiaLoadoutData set ["ATLaunchers", [
["SC_MPML", "", "", "sc_mpml_scope", ["SC_MPML_M_AT", "SC_MPML_M_HE"], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
["SC_Rifle_ARG47", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["WRS_Weapon_AUG", "", "", "", ["WRS_Ar1_Magazine"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""],
["WRS_Weapon_AR", "", "", "", ["WRS_Ar_Magazine"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SC_Rifle_ARG88", "", "", "", ["SC_30Rnd_Shrapnel_Mag_Cyan"], [], ""],
["SC_Rifle_AR12C", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""],
["WRS_Weapon_AR_2", "", "", "", ["WRS_Ar2_Magazine"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SC_Rifle_SpecterM1_GL", "", "", "", ["SC_30Rnd_65x39mm_Mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SC_Rifle_PKMP", "", "", "", ["SC_200Rnd_338_Mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SC_Rifle_AR12", "", "", "", ["SC_35Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SC_Rifle_SSR55", "", "", "sc_tso55", ["SC_5Rnd_50HV_Mag"], [], ""],
["WRS_Weapon_Sniper_Bolt", "", "", "optic_lrps", ["WRS_Boomslang_Magazine"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["SC_Pistol_SSP9", "", "", "sc_reflex_c_blue", [], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["SC_Undersuit_Black"]];
_crewLoadoutData set ["vests", ["SC_Vest_WP_Light_Urban", "SC_Vest_WP_Medium_Urban"]];
_crewLoadoutData set ["helmets", ["SC_Helmet_WP_Urban"]];
_crewLoadoutData set ["carbines", [
["WRS_Weapon_AR_2", "", "", "", ["WRS_Ar2_Magazine"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SC_Undersuit_Black"]];			
_pilotLoadoutData set ["vests", ["SC_Vest_WP_Light_Urban"]];			
_pilotLoadoutData set ["helmets", ["SC_Helmet_GRI_Black"]];
_pilotLoadoutData set ["carbines", [
["WRS_Weapon_AR_2", "", "", "", ["WRS_Ar2_Magazine"], [], ""]
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
