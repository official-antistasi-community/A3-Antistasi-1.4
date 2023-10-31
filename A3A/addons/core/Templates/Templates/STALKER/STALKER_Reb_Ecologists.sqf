///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Ecologists"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_ecologists"] call _fnc_saveToTemplate;

["vehiclesBasic", ["CUP_C_TT650_RU"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_I_Datsun_4seat"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_I_Datsun_PK"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["CUP_C_Ural_Open_Civ_03"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_I_Hilux_SPG9_NAPA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA", "CUP_I_Hilux_igla_NAPA"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["I_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CUP_C_DC3_CIV"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["CUP_C_CESSNA_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_O_GAZ_Vodnik_MedEvac_RU"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["CUP_O_Hilux_unarmed_CR_CIV_Tan"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_Ural_Civ_01"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_Mi17_Civilian_RU"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;
// ["vehiclesCivCar", []] call _fnc_saveToTemplate;
// ["vehiclesCivTruck", []] call _fnc_saveToTemplate;
// ["vehiclesCivHeli", []] call _fnc_saveToTemplate;
// ["vehiclesCivBoat", []] call _fnc_saveToTemplate;

["staticMGs", ["CUP_I_DSHKM_NAPA"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_I_SPG9_NAPA"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

#include "STALKER_Reb_Vehicle_Attributes.sqf"

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["CUP_B_BMP2_CDF", 9000, "APC", {tierWar > 3 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["CUP_B_T72_CDF", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
  
    ["CUP_B_ZSU23_CDF", 10000, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["CUP_O_Mi8_RU", 25000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_arifle_L85A2", "CUP_smg_MP5A5",
    "CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_9x19_MP5",
    "CUP_hgun_Phantom", "CUP_18Rnd_9x19_Phantom",
    ["CUP_launch_RPG18", 10],
    ["IEDUrbanSmall_Remote_Mag", 5], ["IEDLandSmall_Remote_Mag", 5],
    "CUP_HandGrenade_RGD5", "SmokeShell",
    "SE_Eastern_Chest_Rig_Brown", "CUP_V_O_SLA_M23_1_BRN", "CUP_V_O_SLA_M23_1_OD",
    "SE_Satchel_Bag", "SE_Hunting_Backpack", "SE_SEVA_Visor",
    "Binocular"
];

if (["diwako_anomalies"] call A3U_fnc_hasAddon) then {_initialRebelEquipment append ["anomalydetector"]};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "TFAR_anprc155";
    _initialRebelEquipment pushBack "TFAR_anprc155_coyote";
};

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "SE_SEVA_Ecologists_Green",
    "SE_SEVA_Ecologists_Orange"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "SE_Ushanka"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["RussianHead_1","RussianHead_2","RussianHead_3"]] call _fnc_saveToTemplate;
["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];
_loadoutData set ["facewear", ["SE_SEVA_Visor", "CAU_G_CBRN_s10_blk"]];

_loadoutData set ["sluniforms", ["SE_SEVA_Ecologists_Orange"]];
_loadoutData set ["slfacewear", ["SE_SEVA_Visor"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["sluniforms"] call _fnc_setUniform;
    ["slfacewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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