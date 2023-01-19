Private _ReddnTanks = [];
Private _CUPVehicles = [];
Private _BWA3Vehicles = [];
_BWA3Vehicles = [
    //Puma IFV 30mm with Spike LR ATGMs
    ["BWA3_Puma_Tropen", ["cost", 180], ["threat", 250]],
    ["BWA3_Puma_Fleck", ["cost", 180], ["threat", 250]],
    //Tiger with 450rnd 30mm Cannon
    ["BWA3_Tiger_RMK_FZ", ["cost", 200]], //0 PARS (AT) 4 Stinger (AA) 38 Hydra
    ["BWA3_Tiger_RMK_Heavy", ["cost", 350]], //8 PARS (AT) 0 Stinger (AA) 38 Hydra
    ["BWA3_Tiger_RMK_PARS", ["cost", 350]], //8 PARS (AT) 4 Stinger (AA) 0 Hydra
    ["BWA3_Tiger_RMK_Universal", ["cost", 250]], //2 PARS (AT) 4 Stinger (AA) 19 Hydra
    //Tiger with Gunpod, Fixed 400rnd .50
    ["BWA3_Tiger_Gunpod_FZ", ["cost", 125]], //0 PARS (AT) 4 Stinger (AA) 19 Hydra
    ["BWA3_Tiger_Gunpod_Heavy", ["cost", 150]], //4 PARS (AT) 0 Stinger (AA) 38 Hydra
    ["BWA3_Tiger_Gunpod_PARS", ["cost", 150]] //4 PARS (AT) 4 Stinger (AA) 19 Hydra
];
if (isClass (configFile >> "cfgPatches" >> "CUP_AirVehicles_Core")) then {
_CUPVehicles = [
    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    //Borrowed CUP Vehicles
    ["CUP_B_nM1097_AVENGER_USA_DES", ["cost", 70]],
    ["CUP_B_nM1097_AVENGER_USA_WDL", ["cost", 70]],
    ["CUP_B_M163_Vulcan_USA", ["cost", 100]],
    ["CUP_I_M163_Vulcan_RACS", ["cost", 100]]
]};
if (isClass (configfile >> "CfgPatches" >> "Redd_Marder_1A5")) then {
_ReddnTanks = [
    //Redd n Tanks Vehicles
    //Marder IFV 20mm Autocannon with Milan ATGMs
    ["Redd_Marder_1A5_Tropentarn", ["cost", 150], ["threat", 200]],
    ["Redd_Marder_1A5_Flecktarn", ["cost", 150], ["threat", 200]],
    ["Redd_Marder_1A5_Wintertarn", ["cost", 150], ["threat", 200]],
    //Gepard 35mm Autocannon
    ["Redd_Tank_Gepard_1A2_Tropentarn", ["cost", 150]],
    ["Redd_Tank_Gepard_1A2_Flecktarn", ["cost", 150]],
    ["Redd_Tank_Gepard_1A2_Wintertarn", ["cost", 150]]
]};
["attributesVehicles", (_ReddnTanks + _CUPVehicles + _BWA3Vehicles)] call _fnc_saveToTemplate;