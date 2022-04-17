///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "NAPA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehicleBasic", "I_G_Quadbike_01_F"] call _fnc_saveToTemplate;
["vehicleLightUnarmed", "rhsgref_cdf_reg_uaz_open"] call _fnc_saveToTemplate;
["vehicleLightArmed", "rhsgref_nat_uaz_dshkm"] call _fnc_saveToTemplate;
["vehicleTruck", "rhsgref_cdf_zil131"] call _fnc_saveToTemplate;
["vehicleAT", "rhsgref_nat_uaz_spg9"] call _fnc_saveToTemplate;
["vehicleAA", "rhsgref_nat_ural_Zu23"] call _fnc_saveToTemplate;

["vehicleBoat", "I_C_Boat_Transport_02_F"] call _fnc_saveToTemplate;
["vehicleRepair", "rhsgref_cdf_gaz66_repair"] call _fnc_saveToTemplate;

["vehiclePlane", "RHS_AN2"] call _fnc_saveToTemplate;

["vehicleCivCar", "C_Offroad_01_F"] call _fnc_saveToTemplate;
["vehicleCivTruck", "RHS_Ural_Open_Civ_03"] call _fnc_saveToTemplate;
["vehicleCivHeli", "RHS_Mi8t_civilian"] call _fnc_saveToTemplate;
["vehicleCivBoat", "C_Rubberboat"] call _fnc_saveToTemplate;

["staticMG", "rhsgref_ins_DSHKM"] call _fnc_saveToTemplate;
["staticAT", "rhsgref_nat_SPG9"] call _fnc_saveToTemplate;
["staticAA", "rhsgref_nat_ZU23"] call _fnc_saveToTemplate;
["staticMortar", "rhsgref_nat_2b14"] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["mineAT", "rhs_mag_mine_ptm1"] call _fnc_saveToTemplate;
["mineAPERS", "rhs_mine_ozm72_b_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"rhs_weap_type94_new","rhs_weap_tt33","rhs_weap_Izh18","rhs_weap_kar98k",
"rhs_weap_rpg75",
"rhs_mag_6x8mm_mhp","rhs_mag_762x25_8","rhsgref_1Rnd_00Buck","rhsgref_1Rnd_Slug","rhsgref_5Rnd_792x57_kar98k","rhs_grenade_mkii_mag","rhs_grenade_mki_mag","rhs_mag_rdg2_black","rhs_grenade_m15_mag",
"B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_green_F","B_FieldPack_khk","B_FieldPack_oli",
"rhsgref_chestrig","rhsgref_chicom","rhs_vydra_3m","rhs_vest_pistol_holster","rhs_vest_commander","rhs_6sh46","rhsgref_alice_webbing",
"rhs_acc_2dpZenit","Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "rhsgref_uniform_alpenflage",
    "rhsgref_uniform_flecktarn",
    "rhsgref_uniform_flecktarn_full",
    "rhsgref_uniform_tigerstripe",
    "rhsgref_uniform_woodland",
    "rhsgref_uniform_woodland_olive",
    "rhsgref_uniform_olive",
    "rhsgref_uniform_altis_lizard",
    "rhsgref_uniform_altis_lizard_olive",
    "rhsgref_uniform_dpm",
    "rhsgref_uniform_dpm_olive",
    "rhsgref_uniform_3color_desert",
    "rhsgref_uniform_gorka_1_f",
    "rhsgref_uniform_TLA_1",
    "rhsgref_uniform_TLA_2",
    "rhs_insurgent_uniform_1",
    "rhs_insurgent_uniform_2",
    "rhs_insurgent_uniform_3",
    "rhs_insurgent_uniform_4",
    "rhs_insurgent_uniform_5",
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F",
    "U_I_L_Uniform_01_deserter_F"
];

private _dlcUniforms = [];

if (allowDLCEnoch) then {_dlcUniforms append [
    "U_I_L_Uniform_01_camo_F"
];
};

if (allowDLCExpansion) then {_dlcUniforms append [
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_5_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Camo_F"
];
};


["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_oli",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_Shemag_olive_hs",
    "H_Bandanna_gry",
    "H_Bandanna_khk_hs",
    "H_Bandanna_sgg",
    "H_Bandanna_camo"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03",
"WhiteHead_05","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10",
"WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16",
"WhiteHead_17","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["RHS_Male01CZ","RHS_Male02CZ","RHS_Male03CZ","RHS_Male04CZ","RHS_Male05CZ"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
