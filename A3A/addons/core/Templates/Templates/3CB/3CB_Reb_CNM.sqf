///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "CCM"] call _fnc_saveToTemplate;

["flag", "Flag_CCM_B"] call _fnc_saveToTemplate;
["flagTexture", "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "UK3CB_MARKER_CCM_B"] call _fnc_saveToTemplate;

["vehicleBasic", "I_G_Quadbike_01_F"] call _fnc_saveToTemplate;
["vehicleLightUnarmed", "UK3CB_CCM_I_Datsun_Open"] call _fnc_saveToTemplate;
["vehicleLightArmed", "UK3CB_TKM_I_LR_M2"] call _fnc_saveToTemplate;
["vehicleTruck", "UK3CB_CCM_I_V3S_Closed"] call _fnc_saveToTemplate;
["vehicleAT", "UK3CB_I_G_Hilux_Spg9"] call _fnc_saveToTemplate;
["vehicleAA", "UK3CB_TKM_I_V3S_Zu23"] call _fnc_saveToTemplate;

["vehicleBoat", "UK3CB_I_G_Fishing_Boat_SPG9"] call _fnc_saveToTemplate;
["vehicleRepair", "UK3CB_CCM_I_V3S_Repair"] call _fnc_saveToTemplate;

["vehiclePlane", "UK3CB_CHC_I_Antonov_AN2"] call _fnc_saveToTemplate;

["vehicleCivCar", "UK3CB_C_Hilux_Open"] call _fnc_saveToTemplate;
["vehicleCivTruck", "UK3CB_TKC_C_Kamaz_Open"] call _fnc_saveToTemplate;
["vehicleCivHeli", "UK3CB_C_Bell412_Civ"] call _fnc_saveToTemplate;
["vehicleCivBoat", "C_Rubberboat"] call _fnc_saveToTemplate;

["staticMG", "UK3CB_NAP_I_DSHKM"] call _fnc_saveToTemplate;
["staticAT", "UK3CB_UN_I_SPG9"] call _fnc_saveToTemplate;
["staticAA", "UK3CB_UN_I_ZU23"] call _fnc_saveToTemplate;
["staticMortar", "rhsgref_ins_g_2b14"] call _fnc_saveToTemplate;
["staticMortarMagHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;

["mineAT", "rhs_mine_smine35_press_mag"] call _fnc_saveToTemplate;
["mineAPERS", "rhs_mine_pmn2_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhs_ec75_mag", 2], ["rhs_ec75_sand_mag", 2], ["rhs_ec200_mag", 1], ["rhs_ec200_sand_mag", 1], ["rhsusf_m112_mag", 1], ["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhs_ec75_mag", 4], ["rhs_ec75_sand_mag", 4], ["rhs_ec200_mag", 2], ["rhs_ec200_sand_mag", 2], ["rhs_ec400_mag", 1], ["rhs_ec400_sand_mag", 1],["DemoCharge_Remote_Mag", 2], ["rhsusf_m112_mag", 2], ["rhsusf_m112x4_mag", 1], ["rhs_charge_M2tet_x2_mag", 1], ["SatchelCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"UK3CB_BHP","rhs_weap_tt33",
"UK3CB_Enfield","UK3CB_Enfield_Rail",
"rhs_weap_rpg75",
"UK3CB_BHP_9_13Rnd","rhs_mag_762x25_8","UK3CB_Enfield_Mag","rhs_grenade_mkii_mag","rhs_grenade_mki_mag","rhs_mag_rdg2_black","rhs_grenade_m15_mag",
"UK3CB_CHC_C_B_MED","UK3CB_B_Bedroll_Backpack","UK3CB_TKC_C_B_Sidor_MED","UK3CB_CW_SOV_O_LATE_B_Sidor_RIF","UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF",
"UK3CB_V_CW_Chestrig","UK3CB_V_CW_Chestrig_2_Small","UK3CB_V_Belt_KHK","UK3CB_V_Belt_Rig_KHK","UK3CB_V_Belt_Rig_Lite_KHK","UK3CB_V_Pouch","UK3CB_V_Chestrig_TKA_OLI","UK3CB_V_Chestrig_2_Small_OLI","UK3CB_V_Chestrig_TKA_BRUSH","UK3CB_V_Chestrig_Lite_KHK","UK3CB_V_Chestrig_Lite_2_Small_KHK",
"rhs_acc_2dpZenit","Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UK3CB_CCM_I_U_COM_01",
    "UK3CB_NAP_I_U_Officer_Uniform_GRN",
    "UK3CB_NAP_I_U_Officer_Uniform_FLK_GRN",
    "UK3CB_NAP_I_U_Officer_Uniform_WDL_GRN",
    "UK3CB_ADE_I_U_02_B",
    "UK3CB_ADE_I_U_02_C",
    "UK3CB_ADE_I_U_02_D",
    "UK3CB_ADE_I_U_02_E",
    "UK3CB_ADE_I_U_02_F",
    "UK3CB_ADE_I_U_02_G",
    "UK3CB_ADE_I_U_02_H",
    "UK3CB_ADE_I_U_02_I",
    "UK3CB_ADE_I_U_02_J",
    "UK3CB_ADE_I_U_02_K",
    "UK3CB_ADM_I_U_Tshirt_01_TCC",
    "UK3CB_NAP_I_U_Tshirt_BLK",
    "UK3CB_NAP_I_U_Tshirt_FLK",
    "UK3CB_NAP_I_U_Tshirt_FLR"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "UK3CB_H_Beanie_02_BLK",
    "rhs_beanie",
    "H_Cap_oli_hs",
    "UK3CB_H_Ushanka_Cap_03",
    "UK3CB_H_Ushanka_Cap_01"
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
