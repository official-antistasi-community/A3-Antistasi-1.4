////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Duty"] call _fnc_saveToTemplate;
["nameLeader", "Captain Tachenko"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"RussianHead_1", 
	"RussianHead_2", 
	"RussianHead_3", 
	"RussianHead_4", 
	"RussianHead_5", 
	"WhiteHead_29", 
	"WhiteHead_30"
]] call _fnc_saveToTemplate;
["voices", ["Male01POL", "Male02POL", "Male03POL", "Male01RUS", "Male02RUS", "Male03RUS"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["RHS_Ural_Open_MSV_01", "RHS_Ural_MSV_01"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["I_G_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["rhs_btr60_msv", "rhsgref_BRDM2_msv"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["rhs_t72ba_tv", "rhs_t80"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["RHS_MELB_AH6M"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["rhs_pchela1t_vvs"]] call _fnc_saveToTemplate;			

["staticLowWeapons", [
	"rhsgref_ins_g_DSHKM_mini_TriPod", 
	"rhsgref_ins_g_DSHKM", 
	"rhsgref_ins_g_DSHKM_mini_TriPod", 
	"rhsgref_ins_g_DSHKM", 
	"rhsgref_ins_g_AGS30_TriPod", 
	"rhsgref_ins_g_SPG9", 
	"rhsgref_ins_g_SPG9M"
]] call _fnc_saveToTemplate;
["staticMortars", ["rhsgref_ins_g_2b14"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellRed"]];

_loadoutData set ["facewear", [
	"rhs_scarf",
	"SE_Respirator",
	"SE_PPM88",
	"SCE_G_CN2F"
]];

_loadoutData set ["fullmask", [
	"SE_GP21",
	"SE_GP7",
	"CAU_G_CBRN_m04_hoodless"
]];

_loadoutData set ["headgear", [
    "armst_Hood_band_2",
    "armst_Hood_mid_dolg2",
	"armst_Hood_closed_dolg2"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhsusf_ANPVS_15"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["rhsusf_bino_lerca_1200_black"]];

_loadoutData set ["uniforms", [
	"SCE_Duty_1",
	"SCE_Duty_2",
	"SE_Assault_Fatigues_Duty"
]];

_loadoutData set ["offuniforms", ["SE_Assault_Fatigues_Duty"]];
_loadoutData set ["offvests", ["SCE_V_SEVA_Duty"]];
_loadoutData set ["offhelmets", ["SCE_H_SEVA_Duty"]];
_loadoutData set ["offfacewear", ["SCE_G_SEVA_HELMET_VISOR"]];
_loadoutData set ["offbackpacks", ["SCE_B_SEVA_Duty"]];
_loadoutData set ["vests", ["SCE_V_SEVA_Duty"]];
_loadoutData set ["heavyVests", ["SCE_Exo2G_Duty_1"]];
_loadoutData set ["atBackpacks", ["rhs_rpg_6b3"]];
_loadoutData set ["backpacks", ["SE_Explorer_Backpack"]];
_loadoutData set ["helmets", ["armst_Hood_full_dolg1", "armst_Hood_mid_dolg1"]];
_loadoutData set ["heavyHelmets", ["SCE_Exo_Helmet_Duty"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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

_loadoutData set ["rifles", [
    ["rhs_weap_ak74n", "rhs_acc_dtk", "", "rhs_acc_1p78", ["rhs_30Rnd_545x39_7N10_AK"], [], ""],
	["rhs_weap_akmn", "rhs_acc_dtkakm", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_762x39mm_bakelite"], [], ""],
	["rhs_weap_ak105_npz", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_loadoutData set ["tunedRifles", [
    ["rhs_weap_asval_grip", "", "", "rhs_acc_okas", ["rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_asval_npz", "", "", "rhs_acc_1p87", ["rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_ak103_1_npz", "rhs_acc_dtk", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
    ["rhs_weap_pm63", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_polymer"], [], ""],
    ["rhs_weap_ak74n_2_npz", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N6M_Plum_AK"], [], ""]
]];
_loadoutData set ["carbines", [
    ["rhs_weap_aks74un", "rhs_acc_pgs64_74un", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n21_44"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "rhs_acc_pkas", ["rhs_30Rnd_762x39mm_bakelite"], ["rhs_VOG25", "rhs_VG40OP_red"], ""],
	["rhs_weap_aks74n_gp25", "rhs_acc_dtk", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6M_AK"], ["rhs_VOG25", "rhs_VG40OP_red"], ""]
]];
_loadoutData set ["machineGuns", [
    ["rhs_weap_pkp", "", "", "rhs_acc_1p78", ["rhs_100Rnd_762x54mmR"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["rhs_weap_rpg26", "rhs_weap_rshg2"]];
_loadoutData set ["ATLaunchers", [
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VM_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_loadoutData set ["lightHELaunchers", ["hs_weap_rpg26"]];
_loadoutData set ["AALaunchers", [
["rhs_weap_igla", "", "", "",["rhs_mag_9k38_rocket"], [], ""]
]];
_loadoutData set ["sidearms", [
["rhs_weap_pya", "", "", "", ["rhs_mag_9x19_17"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SE_Assault_Fatigues_duty"]];
_crewLoadoutData set ["vests", ["SCE_Sunrise_Duty"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4_ess_bala"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SE_Assault_Fatigues_duty"]];
_pilotLoadoutData set ["vests", ["SCE_Sunrise_Duty"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a"]];

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################
// ^ Watch me

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	["offhelmets"] call _fnc_setHelmet;
	["offfacewear"] call _fnc_setFacewear;
	["offuniforms"] call _fnc_setUniform;
	["offvests"] call _fnc_setVest;
	["offbackpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	if (random 100 < 60) then {
		["heavyHelmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
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

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
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

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["ATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 4] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
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

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		["fullmask"] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		["facewear"] call _fnc_setFacewear;
	};
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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
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

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	["offhelmets"] call _fnc_setHelmet;
	["offfacewear"] call _fnc_setFacewear;
	["offuniforms"] call _fnc_setUniform;
	["offvests"] call _fnc_setVest;
	["offbackpacks"] call _fnc_setBackpack;

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

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;