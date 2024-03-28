(["attributesVehicles"] call _fnc_getFromTemplate) append [
    ["O_Tura_Offroad_armor_lxWS", ["rebCost", 300]],
    ["O_Tura_Offroad_armor_armed_lxWS", ["rebCost", 800]],
    ["O_Tura_Offroad_armor_AT_lxWS", ["rebCost", 800]]
];

//Reaction Forces Vehicles
if (isClass (configFile >> "CfgPatches" >> "RF_Vehicles")) then {
    (["attributesVehicles"] call _fnc_getFromTemplate) append [
        ["C_Heli_EC_01A_civ_RF", ["rebCost", 8000]],
        ["C_Heli_EC_01_civ_RF", ["rebCost", 8000]],
        ["C_Heli_EC_04_rescue_RF", ["rebCost", 8000]],
        ["C_Pickup_rf", ["rebCost", 250]],
        ["C_Pickup_covered_rf", ["rebCost", 250]]
    ];
};