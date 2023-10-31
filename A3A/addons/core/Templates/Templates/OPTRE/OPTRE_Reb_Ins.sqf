///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Insurrection"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_insurrection"] call _fnc_saveToTemplate;

/* OVERWRITES */
// ["vehicleMedicalBox", [""]] call _fnc_saveToTemplate;
// ["vehicleLightSource", "Land_LampShabby_F"] call _fnc_saveToTemplate;
// ["vehicleFuelDrum", ["Land_OPTRE_barrel_hydrogen", 150]] call _fnc_saveToTemplate; // bugged
// ["vehicleFuelTank", ["B_Slingload_01_Fuel_F", 1000]] call _fnc_saveToTemplate;
// ["vehicleRepairStation", ["Land_RepairDepot_01_green_F", 5000]] call _fnc_saveToTemplate;
// ["vehicleAmmoStation", ["Box_IND_AmmoVeh_F", 5000]] call _fnc_saveToTemplate;
// ["vehicleHealthStation", ["Land_MedicalTent_01_MTP_closed_F", 75]] call _fnc_saveToTemplate;
/* OVERWRITES */

["vehiclesBasic", ["OPTRE_M274_ATV_Ins"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_M12_FAV_ins"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV_ins"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["OPTRE_m1015_mule_ins"]] call _fnc_saveToTemplate;
["vehiclesAT", ["OPTRE_M12A1_LRV_ins"]] call _fnc_saveToTemplate;
private _vehicleAA = [];

["vehiclesBoat", ["optre_catfish_ins_mg_f"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["OPTRE_Pelican_unarmed_ins"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["OPTRE_M12_CIV", "OPTRE_Genet"];
["vehiclesCivTruck", ["C_Van_01_transport_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["OPTRE_ins_falcon_unarmed"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["optre_catfish_ins_unarmed_f"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_Gauss"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;

["blackMarketStock", [
    ["OPTRE_Static_M247H_Shielded_Tripod", 3000, "STATICMG", {tierWar > 3}],
    ["OPTRE_Static_M41", 4500, "STATICMG", {tierWar > 4}],

    ["OPTRE_M914_RV", 1750, "CAR", {true}],
    ["OPTRE_M813_TT", 2050, "CAR", {true}],
    ["OPTRE_M12_FAV_APC", 2500, "CAR", {true}],

    ["OPTRE_M808S", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["OPTRE_M313_UNSC", 50000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["OPTRE_YSS_1000_A_VTOL", 40000, "PLANE", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"OPTRE_M45", "OPTRE_6Rnd_8Gauge_Pellets",
"OPTRE_M6G",
"OPTRE_M6C",
"OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","MiniGrenade","SmokeShell",
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"B_FieldPack_blk","B_AssaultPack_blk","B_Kitbag_rgr",
"V_SmershVest_01_F","V_BandollierB_rgr","V_Chestrig_oli",
"Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["OPTRE_ANPRC_521_URF","OPTRE_ANPRC_515"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "OPTRE_Ins_URF_Combat_Uniform",
    "OPTRE_Ins_ER_jacket_od_surplus",
    "OPTRE_Ins_ER_jacket_surgeon1",
    "OPTRE_Ins_ER_jacket_surgeon2",
    "OPTRE_Ins_ER_jacket_surplus_OD",
    "OPTRE_Ins_ER_jacket_surplus_brown",
    "OPTRE_Ins_ER_jacket_surplus_redshirt",
    "OPTRE_Ins_ER_rolled_surplus_crimson",
    "OPTRE_Ins_ER_rolled_surplus_black"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_tan",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_ShemagOpen_tan",
    "H_Shemag_olive_hs",
    "OPTRE_Cap_FinalDawn",
    "OPTRE_h_PatrolCap_Green",
    "OPTRE_UNSC_Watchcap"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
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