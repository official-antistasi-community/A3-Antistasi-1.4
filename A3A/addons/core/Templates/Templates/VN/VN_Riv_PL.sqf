////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Pathet Lao"] call _fnc_saveToTemplate;
["nameLeader", "Kayhak Phomsavanh"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["vie"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_East_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["vn_o_wheeled_btr40_mg_02_pl", "vn_o_wheeled_btr40_mg_01_pl", "vn_o_wheeled_btr40_mg_03_pl", "vn_o_wheeled_z157_mg_01_pl", "vn_o_wheeled_z157_mg_02_pl"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["vn_o_wheeled_z157_01_pl", "vn_o_wheeled_z157_02_pl"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["vn_o_wheeled_btr40_01_pl"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["vn_o_wheeled_btr40_mg_01_pl", "vn_o_wheeled_btr40_mg_02_pl", "vn_o_wheeled_btr40_mg_04_pl"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["vn_o_armor_pt76a_01_pl"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["vn_o_air_mi2_01_01"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", []] call _fnc_saveToTemplate;			

["staticLowWeapons", ["vn_o_pl_static_type56rr", "vn_o_pl_static_sgm_low_02", "vn_o_pl_static_mg42_low", "vn_o_pl_static_dshkm_low_02", "vn_o_pl_static_dshkm_low_01"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_o_pl_static_mortar_type63"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "vn_mortar_type63_mag_he_x8"] call _fnc_saveToTemplate;

["handGrenadeAmmo", []] call _fnc_saveToTemplate;
["mortarAmmo", []] call _fnc_saveToTemplate;

["minefieldAT", ["vn_mine_tripwire_arty"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["vn_mine_punji_02"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["vn_mine_tripwire_f1_04_mag"]];
_loadoutData set ["APMines", ["vn_mine_punji_01_mag"]];
_loadoutData set ["lightExplosives", ["vn_mine_m112_remote_mag"]];
_loadoutData set ["heavyExplosives", ["vn_mine_satchel_remote_02_mag"]];

_loadoutData set ["antiInfantryGrenades", ["vn_rgd33_grenade_mag", "vn_type56_t_mag", "vn_rgd5_grenade_mag", "vn_t67_grenade_mag", "vn_v40_grenade_mag", "vn_rg42_grenade_mag"]];
_loadoutData set ["smokeGrenades", ["vn_rdg2_mag"]];

_loadoutData set ["facewear", [
	"vn_b_aviator", 
	"vn_o_bandana_g", 
	"vn_o_bandana_b", 
	"vn_b_bandana_a", 
	"vn_o_acc_goggles_02",
	"vn_g_spectacles_01"
]];

_loadoutData set ["headgear", [
    "vn_o_pl_cap_01_01",
    "vn_o_pl_cap_02_02",
    "vn_o_pl_cap_02_01",
    "H_Bandanna_sand",
    "H_Beret_blk"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["vn_o_item_radio_m252"]];
_loadoutData set ["binoculars", ["vn_mk21_binocs"]];

_loadoutData set ["uniforms", [
	"vn_o_uniform_pl_army_01_11",
	"vn_o_uniform_pl_army_01_12",
	"vn_o_uniform_pl_army_01_13",
	"vn_o_uniform_pl_army_01_14",
	"vn_o_uniform_pl_army_02_11",
	"vn_o_uniform_pl_army_02_12",
	"vn_o_uniform_pl_army_02_13",
	"vn_o_uniform_pl_army_02_14",
	"vn_o_uniform_pl_army_03_11",
	"vn_o_uniform_pl_army_03_12",
	"vn_o_uniform_pl_army_03_13",
	"vn_o_uniform_pl_army_03_14",
	"vn_o_uniform_pl_army_04_11",
	"vn_o_uniform_pl_army_04_12",
	"vn_o_uniform_pl_army_04_13",
	"vn_o_uniform_pl_army_04_14"
]];

_loadoutData set ["vests", ["vn_o_vest_01", "vn_o_vest_06", "vn_o_vest_03", "vn_o_vest_07", "vn_o_vest_02", "vn_o_vest_vc_02", "vn_o_vest_vc_01"]];
_loadoutData set ["atBackpacks", ["vn_o_pack_03"]];
_loadoutData set ["backpacks", ["vn_o_pack_01", "vn_o_pack_02"]];
_loadoutData set ["helmets", ["vn_o_helmet_nva_10", "vn_o_helmet_nva_09"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _eeItems = ["vn_b_item_toolkit", "vn_b_item_trapkit"];
private _mmItems = [];

if (A3A_hasACE) then {
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadleader_extras", []];
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
	["vn_m9130", "", "", "", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], "vn_b_camo_m9130"],
	["vn_m9130", "", "vn_b_m38", "", ["vn_m38_mag", "vn_m38_mag", "vn_m38_t_mag"], [], ""],
	["vn_type56", "", "", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
	["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
	["vn_sks", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
	["vn_sks", "", "vn_b_sks", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
	["vn_k98k", "", "", "", ["vn_k98k_mag", "vn_k98k_t_mag", "vn_k98k_mag"], [], ""],
	["vn_k98k", "", "vn_b_k98k", "vn_o_1_5x_k98k", ["vn_k98k_mag", "vn_k98k_t_mag", "vn_k98k_mag"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["vn_kbkg", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], [], ""],
	["vn_kbkg", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], [], ""],
	["vn_type56", "", "", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""],
	["vn_type56", "", "vn_b_type56", "", ["vn_type56_mag", "vn_type56_mag", "vn_type56_t_mag"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
	["vn_m2carbine", "", "vn_b_carbine", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
	["vn_m2carbine", "", "", "", ["vn_carbine_30_mag", "vn_carbine_30_mag", "vn_carbine_30_t_mag"], [], ""],
	["vn_izh54", "", "", "", ["vn_izh54_mag"], [], ""],
	["vn_izh54_shorty", "", "", "", ["vn_izh54_so_mag"], [], ""],
	["vn_m1897", "", "", "", ["vn_m1897_buck_mag"], [], ""],
	["vn_m1897", "", "vn_b_m1897", "", ["vn_m1897_buck_mag"], [], ""]
]];
_loadoutData set ["carbines", [
	["vn_k50m", "", "", "", ["vn_ppsh41_35_mag", "vn_ppsh41_35_mag", "vn_ppsh41_35_t_mag"], [], ""],
	["vn_f1_smg", "", "", "", ["vn_f1_smg_mag", "vn_f1_smg_mag", "vn_f1_smg_t_mag"], [], ""],
	["vn_m45", "", "", "", ["vn_m45_mag", "vn_m45_mag", "vn_m45_t_mag"], [], ""],
	["vn_pps52", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""],
	["vn_mp40", "", "", "", ["vn_mp40_mag", "vn_mp40_mag", "vn_mp40_t_mag"], [], ""],
	["vn_pps43", "", "", "", ["vn_pps_mag", "vn_pps_mag", "vn_pps_t_mag"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
	["vn_kbkg_gl", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], ["vn_20mm_f1n60_frag_mag", "vn_20mm_kgn_frag_mag", "vn_20mm_pgn60_heat_mag"], ""],
	["vn_kbkg_gl", "", "", "", ["vn_kbkg_mag", "vn_kbkg_mag", "vn_kbkg_t_mag"], ["vn_20mm_f1n60_frag_mag", "vn_20mm_dgn_wp_mag", "vn_20mm_pgn60_heat_mag"], ""],
	["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m19_wp_mag", "vn_22mm_m60_heat_mag", "vn_22mm_m22_smoke_mag"], ""],
	["vn_sks_gl", "", "", "", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], ["vn_22mm_m60_frag_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_lume_mag"], ""],
	["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""],
	["vn_m1_garand_gl", "", "", "", ["vn_m1_garand_mag", "vn_m1_garand_mag", "vn_m1_garand_t_mag"], ["vn_22mm_lume_mag", "vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], ""]
]];
_loadoutData set ["machineGuns", [
	["vn_rpd", "", "", "", ["vn_rpd_100_mag"], [], ""],
	["vn_mg42", "", "", "", ["vn_mg42_50_mag", "vn_mg42_50_mag", "vn_mg42_50_t_mag"], [], ""],
	"vn_dp28"
]];
_loadoutData set ["marksmanRifles", [
	["vn_sks", "", "", "vn_o_3x_sks", ["vn_sks_mag", "vn_sks_mag", "vn_sks_t_mag"], [], ""],
	["vn_k98k", "", "vn_b_k98k", "vn_o_1_5x_k98k", ["vn_k98k_mag", "vn_k98k_t_mag", "vn_k98k_mag"], [], "vn_b_camo_k98k"]
]];
_loadoutData set ["ATLaunchers", ["vn_rpg2"]];
_loadoutData set ["AALaunchers", ["vn_sa7"]];
_loadoutData set ["sidearms", ["vn_pm", "vn_m10", "vn_m712", "vn_m1911", "vn_izh54_p", "vn_type64"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["helmets", ["vn_o_helmet_tsh3_01", "vn_o_helmet_tsh3_02"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["helmets", ["vn_o_helmet_zsh3_01", "vn_o_helmet_zsh3_02"]];


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["binoculars"] call _fnc_addBinoculars;
};

private _mercenaryTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
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

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["binoculars"] call _fnc_addBinoculars;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["binoculars"] call _fnc_addBinoculars;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
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
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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