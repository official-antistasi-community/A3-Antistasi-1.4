///////////////////////////
//   Rebel Information   //
///////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Ecologists"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_stalker_ecologists"] call _fnc_saveToTemplate;

["vehiclesBasic", ["rhsgref_cdf_b_reg_uaz_open"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["rhsgref_cdf_b_reg_uaz_dshkm"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["rhsgref_cdf_b_zil131"]] call _fnc_saveToTemplate;
["vehiclesAT", ["rhsgref_cdf_b_reg_uaz_spg9"]] call _fnc_saveToTemplate;
//["vehiclesAA", ["rhs_gaz66_zu23_msv"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["I_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["RHS_AN2_B"]] call _fnc_saveToTemplate;
//["vehiclesCivPlane", [""]] call _fnc_saveToTemplate;
//["vehiclesMedical", ["C_Van_02_medevac_F"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["RHS_Mi8t_civilian"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;
// ["vehiclesCivCar", []] call _fnc_saveToTemplate;
// ["vehiclesCivTruck", []] call _fnc_saveToTemplate;
// ["vehiclesCivHeli", []] call _fnc_saveToTemplate;
// ["vehiclesCivBoat", []] call _fnc_saveToTemplate;

["staticMGs", ["rhsgref_ins_DSHKM"]] call _fnc_saveToTemplate;
["staticAT", ["rhsgref_ins_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["rhsgref_ins_ZU23"]] call _fnc_saveToTemplate;

["staticMortars", ["rhsgref_ins_2b14"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["rhsusf_m112_mag", 1],["rhsusf_m112x4_mag", 1],["DemoCharge_Remote_Mag", 1],["rhsusf_tm100_mag", 1],["rhssaf_tm200_mag", 1],["rhssaf_tm500_mag", 1],["rhs_ec200_sand_mag", 1],["rhs_ec200_mag", 1],["rhs_ec400_sand_mag", 1],["rhs_ec400_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["rhsusf_m112_mag", 3],["rhsusf_m112x4_mag", 1],["DemoCharge_Remote_Mag", 2],["rhsusf_tm100_mag", 3],["rhssaf_tm200_mag", 2],["rhssaf_tm500_mag", 1],["rhs_ec200_sand_mag", 2],["rhs_ec200_mag", 2],["rhs_ec400_sand_mag", 1],["rhs_ec400_mag", 1]]] call _fnc_saveToTemplate; //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

#include "STALKER_Reb_Vehicle_Attributes_RHS.sqf"

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["rhs_bmp2e_msv", 9000, "APC", {tierWar > 3 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["rhs_t72ba_tv", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
  
    ["rhs_zsu234_aa", 10000, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["RHS_Mi8AMT_vvsc", 25000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "rhs_weap_m4_carryhandle", "rhs_weap_savz58v",
    "rhs_mag_20Rnd_556x45_M855_Stanag", "rhs_30Rnd_762x39mm_Savz58",
    "rhsusf_weap_m1911a1", "rhsusf_mag_7x45acp_MHP",
    ["rhs_weap_m72a7", 10],
    ["IEDUrbanSmall_Remote_Mag", 5], ["IEDLandSmall_Remote_Mag", 5],
    "rhs_mag_m67", "SmokeShell",
    "SE_Combat_Vest",
    "SE_Alice_Backpack", "SE_Hunting_Backpack", "SE_Explorer_Backpack",
    "Binocular"
];

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