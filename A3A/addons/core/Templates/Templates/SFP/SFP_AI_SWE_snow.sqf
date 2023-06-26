//////////////////////////
//   Side Information   //
//////////////////////////

["name", "SvAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "SvAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "sfp_flagcarrier_sweden"] call _fnc_saveToTemplate;
["flagTexture", "\sfp_config\data\flag_sweden_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "sfp_marker_sweden"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["B_T_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["sfp_tgb16"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["sfp_tgb16_ksp58","sfp_tgb16_rws"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["sfp_bv206_winter"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["sfp_tgb20", "sfp_tgb13_ksp58","I_E_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["I_E_Truck_02_Ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["I_E_Truck_02_Box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["I_E_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["sfp_tgb1314","I_E_Truck_02_Medical_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["sfp_pbv302_snow","sfp_pbv302_mounted_snow","CUP_B_MTLB_pk_Winter_CDF"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["sfp_patgb360","CUP_I_BMP1_TK_GUE"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", ["sfp_strf90c_snow"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesTanks", ["sfp_strv122","sfp_strv122b","sfp_strv121_snow","sfp_ikv91_snow"]] call _fnc_saveToTemplate;
["vehiclesAA", ["sfp_lvkv90c_snow"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["sfp_gruppbat"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["sfp_strb90","sfp_strb90_rws"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["sfp_pbv302_mounted", "sfp_pbv302","CUP_O_MTLB_pk_Green_RU"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["sfp_jas39"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["sfp_jas39_cap"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["sfp_tp84_2015","sfp_s100b" ]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_B_AW159_Unarmed_GB", "sfp_hkp9", "sfp_hkp9_sog", "CUP_B_AW159_Unarmed_GB", "CUP_B_AW159_Unarmed_GB"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["CUP_B_Merlin_HC3A_Armed_GB", "CUP_B_Merlin_HC3A_Armed_GB","sfp_hkp16","sfp_hkp16_ffv"]] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
//hkp9 rb55 is ATGM only, AW159 is a stand in for AW109, used as an attack helicopter here in lieu of anything more fitting
["vehiclesHelisLightAttack", ["sfp_hkp9_rb55","CUP_B_AW159_GB"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["CUP_B_AW159_GB"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["sfp_fh77","sfp_grkpbv90120"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["sfp_fh77",["32Rnd_155mm_Mo_shells"]],["sfp_grkpbv90120",["sfp_2Rnd_120mm_Mo_shells"]]]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["sfp_tgb16_ksp58_mp"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["sfp_tgb20"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["sfp_tgb16"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["sfp_police_suv", "sfp_police_offroad"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["sfp_rbs55","sfp_rbs56"]] call _fnc_saveToTemplate;
["staticAA", ["sfp_rbs70","sfp_rbs70","sfp_rbs97"]] call _fnc_saveToTemplate; //RBS97 may or may not be a bit too strong, but it only has 3 missiles, will be able to compensate for a subpar vehiclesAA
["staticMortars", ["sfp_grk84"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08",
"WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13",
"WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18",
"WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_GB_BAF","CUP_D_Male02_GB_BAF","CUP_D_Male03_GB_BAF","CUP_D_Male04_GB_BAF","CUP_D_Male05_GB_BAF"]] call _fnc_saveToTemplate;
//SpecialForces, Militia, Police Faces and Voices, these are Optional if there is no reason to Include them, leave them out.
["sfFaces", ["sfp_face01_camo","sfp_face02_camo"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", ["sfp_pskott86"]];
_loadoutData set ["ATLaunchers", ["sfp_grg86"]];
_loadoutData set ["missileATLaunchers", ["sfp_rb57"]];
_loadoutData set ["AALaunchers", ["sfp_rbs69"]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["sfp_handgrenade_shgr56"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["hvBackpacks", []];
_loadoutData set ["slBackpacks", ["sfp_stridssack2000_ra_ksk12"]];
_loadoutData set ["medBackpacks", ["sfp_backpack_sjvv9"]];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["hats", ["sfp_m90w_cap_alt_grp","sfp_m90w_cap_grp"]];

_loadoutData set ["facewear", ["G_Bandanna_oli", "CUP_G_ESS_KHK_Facewrap_White", "CUP_G_PMC_Facewrap_Winter_Glasses_Ember"]];
_loadoutData set ["medicFacewear", ["sfp_armband_medic","sfp_armband_medic_white"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["sfp_m90s_uniform"]];
_sfLoadoutData set ["vests", ["V_Chestrig_khk"]];
_sfLoadoutData set ["backpacks", ["sfp_backpack_stridssack08"]];
_sfLoadoutData set ["hvBackpacks", ["sfp_backpack_stridssack2000"]];
_sfLoadoutData set ["helmets", ["sfp_m90s_helmet"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
["sfp_ak5c_blk", "muzzle_snds_M", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5c_blk", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5c", "muzzle_snds_M", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5c", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["sfp_ak5dmk2", "muzzle_snds_M", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5dmk2", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_g36c", "muzzle_snds_M", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_g36"], [], ""],
["sfp_g36c", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_g36"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["sfp_ak5c_m203_blk", "muzzle_snds_M", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""],
["sfp_ak5c_m203", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["sfp_mp5_rail", "muzzle_snds_L", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5"], [], ""],
["sfp_cbj_ms", "sfp_muzzle_snds_cbj", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_650x25mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["sfp_ksp90b", "", "", "sfp_optic_aimpoint", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp58B2", "muzzle_snds_H_MG_blk_F", "", "sfp_optic_3x_aimpoint", ["sfp_50Rnd_762x51_ksp58"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["sfp_ak4d", "muzzle_snds_B", "", "optic_KHS_blk", ["sfp_20Rnd_762x51_ak4"], [], "bipod_01_F_blk"],
["sfp_ak5c_blk", "muzzle_snds_M", "acc_pointer_IR", "sfp_optic_3x_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""],
["sfp_psg90_camo", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""],
["sfp_ag90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_10Rnd_127x99_ag90"], [], ""]
]];
_sfLoadoutData set ["sidearms", [["sfp_p88", "muzzle_snds_L", "sfp_tlr2", "", ["sfp_17Rnd_9x19_Mag"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["sfp_m90s_uniform"]];
_militaryLoadoutData set ["vests", ["sfp_kroppsskydd12"]];
_militaryLoadoutData set ["backpacks", ["sfp_backpack_stridssack08"]];
_militaryLoadoutData set ["hvBackpacks", ["sfp_backpack_stridssack2000"]];
_militaryLoadoutData set ["helmets", ["sfp_m90s_helmet"]];

_militaryLoadoutData set ["rifles", [
["sfp_ak5c", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""],
["sfp_ak5c_alt", "", "acc_pointer_IR", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["sfp_ak5dmk2", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["sfp_ak5c_m203", "", "", "sfp_optic_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", ["sfp_kpistm45b", 
["sfp_mp5_rail", "", "", "sfp_optic_aimpoint_t1", ["sfp_30Rnd_9mm_mp5"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [
["sfp_ksp90b", "", "", "sfp_optic_aimpoint", ["sfp_200Rnd_556x45_ksp90"], [], ""],
["sfp_ksp58B2", "", "", "sfp_optic_3x_aimpoint", ["sfp_50Rnd_762x51_ksp58"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["sfp_ak4d", "", "", "optic_KHS_blk", ["sfp_20Rnd_762x51_ak4"], [], "bipod_01_F_blk"],
["sfp_ak5c_alt", "", "acc_pointer_IR", "sfp_optic_3x_aimpoint", ["sfp_30Rnd_556x45_Stanag_plastic"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""],
["sfp_ag90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_10Rnd_127x99_ag90"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [["sfp_p88", "", "sfp_tlr2", "", ["sfp_17Rnd_9x19_Mag"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["sfp_police_uniform_modern_reflective","sfp_police_uniform_modern"]];
_policeLoadoutData set ["vests", ["sfp_police_belt","sfp_police_tacVest"]];
_policeLoadoutData set ["helmets", ["sfp_police_hat"]];

_policeLoadoutData set ["SMGs", ["sfp_mp5"]];
_policeLoadoutData set ["shotguns", ["sfp_remington870", "sfp_remington870_chrome","sfp_remington870_wood_chrome","sfp_remington870_wood_blue"]];
_policeLoadoutData set ["sidearms", [["sfp_p226", "", "sfp_tlr2", "", ["sfp_15Rnd_9x19_Mag"], [], ""]]];


////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["sfp_m90s_uniform_ws", "sfp_m90s_uniform_sw"]];
_militiaLoadoutData set ["vests", ["sfp_stridsvast2000","sfp_stridssele"]];
_militiaLoadoutData set ["glVests", ["sfp_stridsbalte_304k_gl"]];
_militiaLoadoutData set ["mgVests", ["sfp_stridsvast2000_mg"]];
_militiaLoadoutData set ["backpacks", ["sfp_backpack_lk35"]];
_militiaLoadoutData set ["helmets", ["sfp_m90s_helmet"]];

_militiaLoadoutData set ["ATLaunchers", ["sfp_grg48"]];

_militiaLoadoutData set ["rifles", [
["sfp_ak4b", "", "", "sfp_optic_aimpoint", ["sfp_20Rnd_762x51_ak4"], [], ""],
["sfp_ak4c", "", "", "sfp_optic_aimpoint", ["sfp_20Rnd_762x51_ak4"], [], ""]
]];
_militiaLoadoutData set ["carbines", ["sfp_ak5d"]];
_militiaLoadoutData set ["grenadeLaunchers", [
["sfp_ak4b_m203", "", "", "sfp_optic_aimpoint", ["sfp_20Rnd_762x51_ak4"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""],
["sfp_ak5_m203", "", "", "", ["sfp_30Rnd_556x45_Stanag_plastic"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", ["sfp_kpistm45", "sfp_kpistm45b"]];
_militiaLoadoutData set ["machineGuns", ["sfp_ksp58"]];
_militiaLoadoutData set ["marksmanRifles", [
["sfp_ak4", "", "", "sfp_optic_hensoldt_4x", ["sfp_20Rnd_762x51_ak4"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["sfp_psg90_base", "", "", "sfp_optic_kikarsikte90b_10x", ["sfp_9Rnd_762x51_psg90"], [], ""]
]];
_militiaLoadoutData set ["sidearms", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["sfp_m90p_uniform"]];
_crewLoadoutData set ["vests", ["sfp_kroppsskydd12_crew"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["sfp_m87_flying_suit"]];
_pilotLoadoutData set ["vests", ["sfp_kroppsskydd12_crew"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	[["hats", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["slBackpacks"] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["medicFacewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["medBackpacks"] call _fnc_setBackpack;
	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[["hvBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[["hvBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["lightATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[["hvBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[["hvBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

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
    ["facewear"] call _fnc_setFacewear;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
	[["hvBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
	[["hats", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
	
	[["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["shotguns", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
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
private _pilotTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
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
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _pilotTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
