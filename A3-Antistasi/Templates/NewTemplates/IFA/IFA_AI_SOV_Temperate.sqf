//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Soviets"] call _fnc_saveToTemplate;
["spawnMarkerName", "Soviet Reinforcements"] call _fnc_saveToTemplate;

["flag", "LIB_FlagCarrier_SU"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "LIB_Faction_RKKA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Willys_MB","LIB_Willys_MB_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["LIB_UK_Willys_MB_M1919","LIB_Scout_M3"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["LIB_Zis5v","LIB_US6_Tent","LIB_US6_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US6_Open_Cargo","LIB_US6_Tent_Cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US_GMC_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_Zis6_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_Zis5v_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_Zis5v_Med"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_Scout_M3_FFV","LIB_SOV_M3_Halftrack"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["LIB_T34_76","LIB_T34_85","LIB_JS2_43","LIB_SU85"]] call _fnc_saveToTemplate;
["vehiclesAA", ["lib_zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["not_supported"]] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", ["not_supported"]] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["LIB_LCA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["not_supported"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["LIB_Pe2"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["LIB_P39"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["LIB_Li2"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["not_supported"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["not_supported"]] call _fnc_saveToTemplate;

["vehiclesArtillery", [["LIB_leFH18", ["LIB_20x_Shell_105L28_Gr39HlC_HE","LIB_20x_Shell_105L28_Gr38_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", ["not_supported"]] call _fnc_saveToTemplate;
["uavsPortable", ["not_supported"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["LIB_UK_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_US6_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_Willys_MB"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV_camo_sand"]] call _fnc_saveToTemplate;

["staticMGs", ["LIB_Maxim_M30_Trench"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_BM37"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_82mmHE_BM37"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "not_supported"] call _fnc_saveToTemplate;

//Bagged weapon definitions
["baggedMGs", [["LIB_Maxim_Bag", "LIB_Maxim_Bar"]]] call _fnc_saveToTemplate;
["baggedAT", [[]]] call _fnc_saveToTemplate;
["baggedAA", [[]]] call _fnc_saveToTemplate;
["baggedMortars", [["LIB_BM37_Barrel","LIB_BM37_Tripod_Deployed"]]] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["LIB_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_M3_MINE"]] call _fnc_saveToTemplate;

//PvP definitions
["playerDefaultLoadout", []] call _fnc_saveToTemplate;
["pvpLoadouts", []] call _fnc_saveToTemplate;
["pvpVehicles", []] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData setVariable ["rifles", []];
_loadoutData setVariable ["carbines", []];
_loadoutData setVariable ["grenadeLaunchers", []];
_loadoutData setVariable ["SMGs", []];
_loadoutData setVariable ["machineGuns", []];
_loadoutData setVariable ["marksmanRifles", []];
_loadoutData setVariable ["sniperRifles", []];

_loadoutData setVariable ["lightATLaunchers", [
["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData setVariable ["ATLaunchers", []];
_loadoutData setVariable ["missileATLaunchers", [
["LIB_RPzB", "", "", "",["LIB_1Rnd_RPzB"], [], ""]]];
_loadoutData setVariable ["AALaunchers", []];
_loadoutData setVariable ["sidearms", ["LIB_TT33"]];

_loadoutData setVariable ["ATMines", ["LIB_US_M1A1_ATMINE"]];
_loadoutData setVariable ["APMines", ["LIB_M3_MINE"]];
_loadoutData setVariable ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData setVariable ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData setVariable ["antiTankGrenades", ["lib_shg24x7"]];
_loadoutData setVariable ["antiInfantryGrenades", ["lib_shg24"]];
_loadoutData setVariable ["smokeGrenades", []];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData setVariable ["maps", ["ItemMap"]];
_loadoutData setVariable ["watches", ["ItemWatch"]];
_loadoutData setVariable ["compasses", ["ItemCompass"]];
_loadoutData setVariable ["radios", ["ItemRadio"]];
_loadoutData setVariable ["gpses", []];
_loadoutData setVariable ["NVGs", []];
_loadoutData setVariable ["binoculars", ["LIB_Binocular_GER"]];
_loadoutData setVariable ["rangefinder", []];

_loadoutData setVariable ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
_loadoutData setVariable ["vests", ["V_LIB_SOV_IShBrVestMG","V_LIB_SOV_RAZV_OfficerVest"]];
_loadoutData setVariable ["backpacks", ["B_LIB_SOV_RA_Rucksack"]];
_loadoutData setVariable ["longRangeRadios", []];
_loadoutData setVariable ["helmets", ["H_LIB_SOV_RA_Helmet"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData setVariable ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData setVariable ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData setVariable ["items_squadleader_extras", []];
_loadoutData setVariable ["items_rifleman_extras", []];
_loadoutData setVariable ["items_medic_extras", []];
_loadoutData setVariable ["items_grenadier_extras", []];
_loadoutData setVariable ["items_explosivesExpert_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_engineer_extras", ["Toolkit", "MineDetector"]];
_loadoutData setVariable ["items_lat_extras", []];
_loadoutData setVariable ["items_at_extras", []];
_loadoutData setVariable ["items_aa_extras", []];
_loadoutData setVariable ["items_machineGunner_extras", []];
_loadoutData setVariable ["items_marksman_extras", []];
_loadoutData setVariable ["items_sniper_extras", []];
_loadoutData setVariable ["items_police_extras", []];
_loadoutData setVariable ["items_crew_extras", []];
_loadoutData setVariable ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData setVariable ["uniforms", ["U_LIB_SOV_Razvedchik_am"]];
_sfLoadoutData setVariable ["vests", ["V_LIB_SOV_IShBrVestMG","V_LIB_SOV_IShBrVestPPShMag"]];
_sfLoadoutData setVariable ["backpacks", ["B_LIB_SOV_RA_Rucksack2_Green"]];
_sfLoadoutData setVariable ["helmets", ["H_LIB_SOV_RA_Helmet"]];
_sfLoadoutData setVariable ["binoculars", ["LIB_Binocular_GER"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData setVariable ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_sfLoadoutData setVariable ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_sfLoadoutData setVariable ["grenadeLaunchers", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_sfLoadoutData setVariable ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_sfLoadoutData setVariable ["machineGuns", [["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_sfLoadoutData setVariable ["marksmanRifles", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_sfLoadoutData setVariable ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_sfLoadoutData setVariable ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData setVariable ["uniforms", ["U_LIB_SOV_Strelok_summer"]];
_militaryLoadoutData setVariable ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militaryLoadoutData setVariable ["backpacks", ["B_LIB_SOV_RA_Rucksack"]];
_militaryLoadoutData setVariable ["helmets", ["H_LIB_SOV_RA_PrivateCap","H_LIB_SOV_RA_Helmet"]];
_militaryLoadoutData setVariable ["binoculars", ["LIB_Binocular_GER"]];

_militaryLoadoutData setVariable ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["grenadeLaunchers", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_militaryLoadoutData setVariable ["machineGuns", [["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["marksmanRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["sniperRifles", [["LIB_M9130PU", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militaryLoadoutData setVariable ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData setVariable ["uniforms", ["U_LIB_NKVD_Leutenant"]];
_policeLoadoutData setVariable ["vests", ["V_LIB_SOV_RA_OfficerVest"]];
_policeLoadoutData setVariable ["helmets", ["H_LIB_NKVD_OfficerCap"]];

_policeLoadoutData setVariable ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_policeLoadoutData setVariable ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData setVariable ["uniforms", ["U_LIB_SOV_Strelokart"]];
_militiaLoadoutData setVariable ["vests", ["V_LIB_SOV_RA_MosinBelt","V_LIB_SOV_RA_PPShBelt"]];
_militiaLoadoutData setVariable ["backpacks", ["B_LIB_SOV_RA_Rucksack"]];
_militiaLoadoutData setVariable ["helmets", ["H_LIB_SOV_RA_PrivateCap"]];

_militiaLoadoutData setVariable ["rifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData setVariable ["carbines", [["LIB_SVT_40", "", "", "", ["LIB_10Rnd_762x54"], [], ""]]];
_militiaLoadoutData setVariable ["grenadeLaunchers", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData setVariable ["SMGs", [["LIB_PPSh41_d", "", "", "", ["LIB_71Rnd_762x25"], [], ""]]];
_militiaLoadoutData setVariable ["machineGuns", [["LIB_DP28", "", "", "", ["LIB_47Rnd_762x54"], [], ""]]];
_militiaLoadoutData setVariable ["marksmanRifles", [["LIB_M9130", "", "", "", ["LIB_5Rnd_762x54"], [], ""]]];
_militiaLoadoutData setVariable ["sidearms", [["LIB_TT33", "", "", "", ["LIB_8Rnd_762x25"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData setVariable ["uniforms", ["U_LIB_SOV_Tank_ryadovoi"]];
_crewLoadoutData setVariable ["vests", ["V_LIB_SOV_RAZV_MGBelt"]];
_crewLoadoutData setVariable ["helmets", ["H_LIB_SOV_TankHelmet"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData setVariable ["uniforms", ["U_LIB_SOV_Pilot"]];
_pilotLoadoutData setVariable ["vests", ["V_LIB_SOV_RA_Belt"]];
_pilotLoadoutData setVariable ["helmets", ["H_LIB_SOV_PilotHelmet"]];


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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;
  [selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
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

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	[["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

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
	["rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["smgs"] call _fnc_setPrimary;
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

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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
	["SquadLeader", _squadLeaderTemplate],
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
