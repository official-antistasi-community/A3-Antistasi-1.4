//////////////////////////
//   Side Information   //
//////////////////////////

//ENTER ONLY ONE OPTION IN EVERYTHING WITHIN THIS BLOCK

["name", "ADF"] call _fnc_saveToTemplate;
["spawnMarkerName", "ADF support corridor"] call _fnc_saveToTemplate;

["flag", "flag_Australia_F"] call _fnc_saveToTemplate;
["flagTexture", "a3_atlas\data_f_atlas\flags\flag_australia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Australia"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

//Nearly everything below this line is an Array, which can contain multiple assets

["vehiclesBasic", ["B_A_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["Atlas_B_A_MRAP_03_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["Atlas_B_A_MRAP_03_hmg_F", "Atlas_B_A_MRAP_03_gmg_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["Atlas_B_A_Truck_01_covered_F", "Atlas_B_A_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["Atlas_B_A_Truck_01_cargo_F", "Atlas_B_A_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["Atlas_B_A_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["Atlas_B_A_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["Atlas_B_A_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["Atlas_B_A_Truck_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["Atlas_B_A_APC_Wheeled_01_cannon_v2_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["Atlas_B_A_MBT_03_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["B_T_APC_Tracked_01_AA_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs, SO IT DOES NOTHING
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs, SO IT DOES NOTHING

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["Atlas_B_A_Plane_Fighter_05_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["Atlas_B_A_Plane_Fighter_05_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["Atlas_B_A_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["Atlas_B_A_Heli_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["Atlas_B_A_Heli_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Atlas_B_A_Heli_Attack_03_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_T_MBT_01_arty_F"]] call _fnc_saveToTemplate;
//new magazines storing methode, all vehicle magazines should be defined here in format [Vehicle class, [magazines]]
["magazines", createHashMapFromArray [
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities.
["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Atlas_B_A_Truck_01_covered_F", "Atlas_B_A_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["B_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			// ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		// ENTER ONLY ONE OPTION

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightATLaunchers", [
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_green_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", [
["launch_I_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


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

//Basically all the clothing which the units use.
//don't fill these lines - this is only to set the variables.
_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

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
_sfLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_aucamo_trp", "Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp"]];
_sfLoadoutData set ["vests", ["V_PlateCarrier1_aucamo_trp_F", "V_TacVest_grn"]];
_sfLoadoutData set ["Hvests", ["V_PlateCarrier2_aucamo_trp_F"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_aucamo_F", "B_Carryall_aucamo", "B_Kitbag_aucamo_F"]];
_sfLoadoutData set ["helmets", ["H_HelmetHBK_aucamo_tropic_chops_F", "H_HelmetHBK_aucamo_tropic_ear_F", "H_Booniehat_aucamo_hs_F", "H_Cap_aucamo"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_01_khk_F"]];

_sfLoadoutData set ["rifles", [
["arifle_AUG_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["arifle_AUG_C_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["arifle_AUG_GL_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "muzzle_snds_L", "", "optic_Holosight_smg_blk_F", [], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["LMG_03_snd_F", "muzzle_snds_M", "acc_pointer_IR", "optic_Holosight", [], [], ""],
["LMG_03_snd_F", "muzzle_snds_M", "acc_pointer_IR", "optic_MRCO", [], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_cbr_F", "muzzle_snds_B", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["hgun_P07_F", "muzzle_snds_L", "", "", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_aucamo_trp", "Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp"]];
_militaryLoadoutData set ["vests", ["V_PlateCarrier1_aucamo_trp_F"]];
_militaryLoadoutData set ["Hvests", ["V_PlateCarrier2_aucamo_trp_F"]];
_militaryLoadoutData set ["glVests", ["V_PlateCarrierGL_aucamo_trp_F"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_aucamo_F", "B_Carryall_aucamo", "B_Kitbag_aucamo_F"]];
_militaryLoadoutData set ["helmets", ["H_HelmetHBK_aucamo_tropic_F", "H_HelmetHBK_aucamo_tropic_headset_F"]];
_militaryLoadoutData set ["binoculars", ["Laserdesignator_01_khk_F"]];

_militaryLoadoutData set ["rifles", [
["arifle_AUG_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["arifle_AUG_C_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""],
["arifle_AUG_C_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["arifle_AUG_GL_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["arifle_AUG_GL_F", "", "acc_pointer_IR", "optic_ACO_grn", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["shotGuns", [
["sgun_M4_F", "", "", "optic_Aco_smg", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "", "", "optic_Holosight_smg_blk_F", [], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_Holosight", [], [], ""],
["LMG_03_snd_F", "", "acc_pointer_IR", "optic_MRCO", [], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["srifle_EBR_cbr_F", "", "acc_pointer_IR", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_cbr_F", "", "acc_pointer_IR", "optic_AMS", [], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["hgun_P07_F", "", "", "", [], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];
_policeLoadoutData set ["shotGuns", [
["sgun_M4_F", "", "acc_flashlight_pistol", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "", "", "optic_Holosight_smg_blk_F", [], [], ""],
["hgun_PDW2000_F", "", "", "optic_Aco_grn_smg", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["hgun_ACPC2_black_F"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_aucamo_trp", "Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_rgr", "V_PlateCarrier1_aucamo_trp_F"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_aucamo_F"]];
_militiaLoadoutData set ["helmets", ["H_HelmetHBK_aucamo_tropic_F", "H_MilCap_aucamo", "H_Bandanna_tna_hs_F"]];

_militiaLoadoutData set ["rifles", [
["arifle_AUG_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["arifle_AUG_C_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["arifle_AUG_GL_F", "", "acc_flashlight", "", ["30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_F", "30Rnd_556x45_AUG_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["hgun_PDW2000_F", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["LMG_03_snd_F", "", "acc_flashlight", "", [], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["srifle_EBR_cbr_F", "", "acc_flashlight", "optic_MRCO", [], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sniperRifles", [
["srifle_LRR_F", "", "", "optic_SOS", [], [], ""],
["srifle_LRR_F", "", "", "optic_LRPS", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["hgun_ACPC2_black_F"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////
//The following lines are determining the loadout of the vehicle crew
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp"]];
_crewLoadoutData set ["vests", ["V_PlateCarrier1_aucamo_trp_F"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_B"]];

//The following lines are determining the loadout of the pilots
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_pilotLoadoutData set ["uniforms", ["Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp"]];
_pilotLoadoutData set ["vests", ["V_TacVest_grn"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_B_A", "H_PilotHelmetHeli_B_A"]];

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
	[["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
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

private _marksmanTemplate = {
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


	[selectRandom ["shotGuns", "SMGs"]] call _fnc_setPrimary;
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
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
