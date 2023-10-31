///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Replika"] call _fnc_saveToTemplate; 						

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "sc_props\data\flags\flag_ac_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SC_flag_AC"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_G_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SCEXT_Dingo_AC"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SC_Ferret_AC"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["SCEXT_Gator_Flatbed_Trans_AC"]] call _fnc_saveToTemplate;
["vehiclesAT", ["SCEXT_Grizzly_AC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SCEXT_Gator_APC_AC"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["SC_EXT_Vampire_AR"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["SSV_Vehicle_Android_Ifrit"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["SC_Gator_FB_AC"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["SC_EXT_Comanche_V_AR"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F", "I_G_HMG_02_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["I_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["I_G_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["SSV_Vehicle_Android_APC_Ruined", 9000, "APC", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["SCEXT_Gator_APC_AR", 12500, "APC", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],

    ["SSV_Vehicle_Android_Tank_Ruined", 15000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["SCEXT_Grizzly_AR", 20000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["SC_EXT_Rhino_AR", 21000, "TANK", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    
    ["SC_Ferret_AA_AR", 10000, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["SC_Fixed_Bomber_01", 40000, "PLANE", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],

    ["SC_EXT_Wyvern_AR", 15000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["SC_VTOL_X41A_AR", 25000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["SC_ProwerClassCorvette_Helo", 50000, "HELI", {tierWar > 5 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "SC_Rifle_Ghoul", "RD_45Rnd_45HP_Mag",
    "SC_Pistol_SSP9", "SC_15Rnd_45HP_Mag",
    "MiniGrenade", "HandGrenade",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "SC_MDFBackpack_Black", "B_AssaultPack_blk",
    "Binocular",
    "V_Chestrig_blk","V_BandollierB_blk"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "SSV_Uniform_Android_Military_Ruined"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "SSV_Helmet_Android_Pilot_Ruined",
    "SSV_Helmet_Android_Miner_Ruined"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENGVR","Male01PERVR","Male01GREVR"]] call _fnc_saveToTemplate;
["faces", ["SSV_android_face_01","SSV_android_face_02","SSV_android_face_03","hal_synth_face_01"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];
_loadoutData set ["facemask", ["SSV_Mask_Android_Bushi_Ruined", "SSV_Mask_Android_Shogun_Ruined", "SSV_Mask_Android_Bewildered_Ruined"]];

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
