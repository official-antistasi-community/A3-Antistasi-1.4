///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", ""] call _fnc_saveToTemplate;                         //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION

["flag", ""] call _fnc_saveToTemplate;                         //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", ""] call _fnc_saveToTemplate;                 //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", ""] call _fnc_saveToTemplate;             //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

["vehicleBasic", ""] call _fnc_saveToTemplate;             //this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- String, can only use one
["vehicleLightUnarmed", ""] call _fnc_saveToTemplate;         //this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- String, can only use one
["vehicleLightArmed", ""] call _fnc_saveToTemplate;         //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F"]] -- String, can only use one
["vehicleTruck", ""] call _fnc_saveToTemplate;             //this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F","B_Truck_01_covered_F"]] -- String, can only use one
["vehicleAT", ""] call _fnc_saveToTemplate;         //this line determines AT vehicle -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F","B_Truck_01_covered_F"]] -- String, can only use one
["vehicleAA", ""] call _fnc_saveToTemplate;         //this line determines AA vehicle -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F","B_Truck_01_covered_F"]] -- String, can only use one

["vehicleBoat", ""] call _fnc_saveToTemplate;     //this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- String, can only use one
["vehicleRepair", ""] call _fnc_saveToTemplate;             //this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- String, can only use one

["vehiclePlane", ""] call _fnc_saveToTemplate;         //this line determines CAS planes -- Example: ["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] -- String, can only use one
["vehicleHeli", ""] call _fnc_saveToTemplate;         //this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- String, can only use one

["vehicleCivCar", ""] call _fnc_saveToTemplate;
["vehicleCivTruck", ""] call _fnc_saveToTemplate;
["vehicleCivHeli", ""] call _fnc_saveToTemplate;
["vehicleCivBoat", ""] call _fnc_saveToTemplate;

["staticMG", ""] call _fnc_saveToTemplate;                     //this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- String, can only use one
["staticAT", ""] call _fnc_saveToTemplate;                     //this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- String, can only use one
["staticAA", ""] call _fnc_saveToTemplate;                     //this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- String, can only use one
["staticMortar", ""] call _fnc_saveToTemplate;                 //this line determines static mortars -- Example: ["staticMortar", ["B_Mortar_01_F"]] -- String, can only use one
["staticMortarMagHE", ""] call _fnc_saveToTemplate;
["staticMortarMagSmoke", ""] call _fnc_saveToTemplate;

["mineAT", ""] call _fnc_saveToTemplate;                 //this line determines AT mines needed for spawning in minefields -- Example: ["minefieldAT", ["ATMine_Range_Mag"]] -- String, can only use one
["mineAPERS", ""] call _fnc_saveToTemplate;             //this line determines APERS mines needed for spawning in minefields -- Example: ["minefieldAPERS", ["APERSMine_Range_Mag"]] -- String, can only use one

["breachingExplosivesAPC", []] call _fnc_saveToTemplate;            //this line determines explosives needed for breaching APCs -- Example: ["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] -- Array, can use Multiple
["breachingExplosivesTank", []] call _fnc_saveToTemplate;           //this line determines explosives needed for breaching Tanks -- Example: [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] -- Array, can use Multiple

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "tf_anprc155"};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "TFAR_anprc155"};

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [];          //Uniforms given to Normal Rebels

private _dlcUniforms = [];          //Uniforms given if DLCs are enabled, only given to the Arsenal not Rebels

if (allowDLCEnoch) then {_dlcUniforms append [];
};

if (allowDLCExpansion) then {_dlcUniforms append [];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", []] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

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

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

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
