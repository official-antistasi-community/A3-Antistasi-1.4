/*
    Author: [Håkon]
    [Description]
        Defines all vehicle nodes, cargo node, weapon data, blacklist etc. for use with Antistasi logistics system.

        Note: needs to be run on every client for logistic functions to function on said client

    Arguments:
    0. <Nil>

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: call A3A_fnc_logistics_initNodes;
*/
_classNameToModel = {
    params ["_className"];
    private _cfg = (configFile >> "CfgVehicles");
    if !( isClass (_cfg >> _className) ) exitWith {"N/A"}; //ensure its never misstaken for anything if invalid class
    getText (_cfg >> _className >> "model");
};

//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints = [

    // ---------- Vanilla ----------
    //Bikes
    //Quadbike
    ["C_Quadbike_01_F" call _classNameToModel, [
        // always 1,    location                locked seats
        [1,             [0,-0.9,-0.5],          [0]]
    ]],

    //4x4s
    //Offroad
    ["C_Offroad_01_F" call _classNameToModel, [
        // always 1,    location                locked seats
        [1,             [-0.05,-1.3,-0.72],     [3,4]],
        [1,             [-0.05,-2.3,-0.72],     [1,2]]
    ]],

        //Small Truck
    ["C_Van_01_transport_F" call _classNameToModel, [
        [1,             [0,-0.7475,-0.65],      [2,3,4,5]],
        [1,             [0,-1.4375,-0.65],      [6,7]],
        [1,             [0,-2.2,-0.65],         [8,9]],
        [1,             [0,-3,-0.65],           [10,11]]
        ]],

        //Van Transport
    ["C_Van_02_transport_F" call _classNameToModel, [
        [1,             [0,-1.245,-0.97],       []],
        [1,             [0,-2.49,-0.97],        [9,10]]
    ]],

        //Van Cargo
    ["C_Van_02_vehicle_F" call _classNameToModel, [
        [1,             [0,0.7025,-0.97],       []],
        [1,             [0,-0.1275,-0.97],      []],
        [1,             [0,-0.9575,-0.97],      []],
        [1,             [0,-1.7875,-0.97],      []],
        [1,             [0,-2.6175,-0.97],      []]
    ]],

    //6x6s
    //Zamak Open
    ["O_Truck_02_transport_F" call _classNameToModel, [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //Zamak Covered
    ["O_Truck_02_covered_F" call _classNameToModel, [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //CSAT Tempest open
    ["O_Truck_03_transport_F" call _classNameToModel,[
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //CSAT Tempest closed
    ["O_Truck_03_covered_F" call _classNameToModel, [
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //8x8s
    //HEMTT open
    ["B_Truck_01_transport_F" call _classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //HEMTT covered
    ["B_Truck_01_covered_F" call _classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //Vanilla HEMTT Flatbed
    ["B_Truck_01_flatbed_F" call _classNameToModel,[
        [1,             [0,0.6825,-0.88],       []],
        [1,             [0,-0.1475,-0.88],      []],
        [1,             [0,-0.9775,-0.88],      []],
        [1,             [0,-1.8075,-0.88],      []],
        [1,             [0,-2.6375,-0.88],      []],
        [1,             [0,-3.4675,-0.88],      []],
        [1,             [0,-4.2975,-0.88],      []]
    ]],

    //Vanilla HEMTT Cargo
    ["B_Truck_01_cargo_F" call _classNameToModel, [
        [1,             [0,1,-0.6],             []],
        [1,             [0,0.2,-0.6],           []],
        [1,             [0,-0.6,-0.6],          []],
        [1,             [0,-1.4,-0.6],          []],
        [1,             [0,-2.2,-0.6],          []],
        [1,             [0,-3,-0.6],            []],
        [1,             [0,-3.8,-0.6],          []]
    ]],

    //Boats
    //Motorboat civilian
    ["C_Boat_Civil_01_F" call _classNameToModel, [
        [1,             [0,-0.9425,-1.1],       [0,1]],
        [1,             [0,-1.5725,-1.1],       []]
    ]],

    //Speedboat minigun
    ["B_Boat_Armed_01_minigun_F" call _classNameToModel, [
        [1,             [0,3.2,-2.2],           [4,5]],
        [1,             [0,2.4,-2.2],           []]
    ]],

    //Transport rubber boat
    ["B_Boat_Transport_01_F" call _classNameToModel, [
        [1,             [0,0.7575,-1.1],        [0,1,2,3]],
        [1,             [0,-0.0725,-1.1],       []]
    ]],

    //Civilian transport boat (RHIB)
    ["C_Boat_Transport_02_F" call _classNameToModel, [
        [1,             [0,1.8575,-0.7],        [0,1]],
        [1,             [0,1.0275,-0.7],        [2,6]]
    ]],

    // ---------- RHS ----------
    //Urals
    //Ural Open
    ["RHS_Ural_Open_Civ_01" call _classNameToModel, [
        [1,             [0,0.14,-0.25],         [12,13]],
        [1,             [0,-0.66,-0.25],        [2,3,4,5]],
        [1,             [0,-1.4,-0.25],         [6,7]],
        [1,             [0,-2.2,-0.25],         [8,9]],
        [1,             [0,-3,-0.25],           [10,11]]
    ]],

    //Ural Closed
    ["rhsgref_nat_ural_work" call _classNameToModel, [
        [1,             [0,0.14,-0.25],         [12,13]],
        [1,             [0,-0.66,-0.25],        [2,3,4,5]],
        [1,             [0,-1.4,-0.25],         [6,7]],
        [1,             [0,-2.2,-0.25],         [8,9]],
        [1,             [0,-3,-0.25],           [10,11]]
    ]],

    //Ural Open 2
    ["RHS_Ural_Open_MSV_01" call _classNameToModel, [
        [1,             [0,0.55,-0.25],         [3,12,13]],
        [1,             [0,-0.25,-0.25],        [2,4,5]],
        [1,             [0,-1,-0.25],           [6,7]],
        [1,             [0,-1.8,-0.25],         [8,9]],
        [1,             [0,-2.6,-0.25],         [10,11]]
    ]],

    //Kamazs covered
    ["rhs_kamaz5350" call _classNameToModel, [
        [1,             [0.1,1,-1.02],          [2,3,4]],
        [1,             [0.1,0.2,-1.02],        [5,6,7]],
        [1,             [0.1,-0.6,-1.02],       [8,9]],
        [1,             [0.1,-1.4,-1.02],       [10,11]],
        [1,             [0.1,-2.2,-1.02],       [12,13]],
        [1,             [0.1,-3,-1.02],         [14,15]]
    ]],

    //Zils covered
    ["rhs_zil131_base" call _classNameToModel, [
        [1,             [0,0.4,-0.63],          [3,10,11]],
        [1,             [0,-0.4,-0.63],         [2,4,5]],
        [1,             [0,-1.2,-0.63],         [6,7]],
        [1,             [0,-2,-0.63],           [8,9]]
    ]],

    //Gaz covered
    ["rhs_gaz66_vmf" call _classNameToModel, [
        [1,             [-0.05,0.6,-0.63],      [1,3,10,12]],
        [1,             [-0.05,-0.2,-0.63],     [2,4,5]],
        [1,             [-0.05,-1,-0.63],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.63],     [8,11]]
    ]],

    //USAF 4x4 Trucks
    //Standard (covered)
    ["rhsusf_M1078A1P2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-0.51],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.51],     [2,4,5]],
        [1,             [-0.05,-1,-0.51],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.51],     [8]],
        [1,             [-0.05,-2.6,-0.51],     [10,11]]
    ]],

    //uparmoured
    ["rhsusf_M1078A1P2_B_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-0.51],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.51],     [2,4,5]],
        [1,             [-0.05,-1,-0.51],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.51],     [8]],
        [1,             [-0.05,-2.6,-0.51],     [10,11]]
    ]],

    //uparmoured - armed
    ["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-1.2],       [2,12,13]],
        [1,             [-0.05,-0.2,-1.2],      [1,3,4]],
        [1,             [-0.05,-1,-1.2],        [5,6]],
        [1,             [-0.05,-1.8,-1.2],      [7,8]],
        [1,             [-0.05,-2.6,-1.2],      [10,11]]
    ]],

    //USAF 6x6 Trucks
    //Standard
    ["rhsusf_M1083A1P2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-0.52],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.52],     [2,4,5]],
        [1,             [-0.05,-1,-0.52],       [6,7]],
        [1,             [-0.05,-1.8,-0.52],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.52],     [10,11,14]]
    ]],

    //uparmoured
    ["rhsusf_M1083A1P2_B_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-0.52],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.52],     [2,4,5]],
        [1,             [-0.05,-1,-0.52],       [6,7]],
        [1,             [-0.05,-1.8,-0.52],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.52],     [10,11,14]]
    ]],

    //Armed
    ["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [-0.05,0.6,-1.2],       [2,11,12]],
        [1,             [-0.05,-0.2,-1.2],      [1,3,4]],
        [1,             [-0.05,-1,-1.2],        [5,6]],
        [1,             [-0.05,-1.8,-1.2],      [7,8,14]],
        [1,             [-0.05,-2.6,-1.2],      [9,10,13]]
    ]],

    //standard crane
    ["rhsusf_M1084A1P2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [0,1.05,-0.4],          []],
        [1,             [0,0.3,-0.4],           []],
        [1,             [0,-0.45,-0.4],         []],
        [1,             [0,-1.1,-0.4],          []],
        [1,             [0,-1.95,-0.4],         []],
        [1,             [0,-2.7,-0.4],          []]
    ]],

    //uparmoured crane
    ["rhsusf_M1084A1P2_B_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [0,1.05,-0.4],          []],
        [1,             [0,0.3,-0.4],           []],
        [1,             [0,-0.45,-0.4],         []],
        [1,             [0,-1.1,-0.4],          []],
        [1,             [0,-1.95,-0.4],         []],
        [1,             [0,-2.7,-0.4],          []]
    ]],

    //Armed crane
    ["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy" call _classNameToModel, [
        [1,             [0,1.05,-1.1],          []],
        [1,             [0,0.3,-1.1],           []],
        [1,             [0,-0.45,-1.1],         []],
        [1,             [0,-1.1,-1.1],          []],
        [1,             [0,-1.95,-1.1],         []],
        [1,             [0,-2.7,-1.1],          []]
    ]],

    //SOCOM Stripped
    ["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom" call _classNameToModel, [
        [1,             [0,1,-1.1],             []],
        [1,             [0,0.25,-1.1],          []],
        [1,             [0,-0.5,-1.1],          []],
        [1,             [0,-1.15,-1.1],         []],
        [1,             [0,-2,-1.1],            []],
        [1,             [0,-2.75,-1.1],         []]
    ]],

    //SOCOM MRAP
    ["rhsusf_M1239_socom_d" call _classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //Soccom Mrap M2
    ["rhsusf_M1239_M2_socom_d" call _classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //Soccom Mrap MK19
    ["rhsusf_M1239_MK19_socom_d" call _classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //USAF 8x8 Trucks
    //Standard
    ["rhsusf_M977A4_usarmy_wd" call _classNameToModel, [
        [1,             [0,1,-0.1],             []],
        [1,             [0,0.2,-0.1],           []],
        [1,             [0,-0.7,-0.1],          []],
        [1,             [0,-1.5,-0.1],          []],
        [1,             [0,-2.2,-0.1],          []],
        [1,             [0,-3,-0.1],            []],
        [1,             [0,-3.8,-0.1],          []]
    ]],

    //uparmoured
    ["rhsusf_M977A4_BKIT_usarmy_wd" call _classNameToModel, [
        [1,             [0,0.8,-0.1],           []],
        [1,             [0,0,-0.1],             []],
        [1,             [0,-0.7,-0.1],          []],
        [1,             [0,-1.5,-0.1],          []],
        [1,             [0,-2.3,-0.1],          []],
        [1,             [0,-3.1,-0.1],          []],
        [1,             [0,-3.9,-0.1],          []]
    ]],

    //Armed
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd" call _classNameToModel, [
        [1,             [0,0.8,-0.85],          []],
        [1,             [0,0,-0.85],            []],
        [1,             [0,-0.7,-0.85],         []],
        [1,             [0,-1.5,-0.85],         []],
        [1,             [0,-2.3,-0.85],         []],
        [1,             [0,-3.1,-0.85],         []],
        [1,             [0,-3.9,-0.85],         []]
    ]],

    //Humvee 2D
    //Covered
    ["rhsusf_m998_w_2dr" call _classNameToModel, [
        [1,             [0,-0.6,-0.97],         [1,2,4,5]],
        [1,             [0,-1.4,-0.97],         [3,6]]
    ]],

    // ---------- 3CB ----------

    // Datsun civ variant, TODO: redo for 3 crates maybeeee?
    ["UK3CB_C_Datsun_Open" call _classNameToModel, [
        [1,             [0,-0.5,-0.83],     [2,3]],
        [1,             [0,-1.5,-0.83],     [0,2,3,4,5,6]]
    ]],

    // Datsun non civ variant, TODO: redo for 3 crates maybeeee?
    ["UK3CB_B_G_Datsun_Pickup" call _classNameToModel, [
        [1,             [0,-0.6,-1.2],      [3,4]], // 2 is cab passenger
        [1,             [0,-1.3,-1.2],      [5,6]] // 0,1 is backmost ffv, didn't need block after all, juuuuust nuff space
    ]],

    // Hilux
    ["UK3CB_C_Hilux_Open" call _classNameToModel, [
        [1,             [-0.05,-0.5,-0.66],     [5]],
        [1,             [-0.05,-1.6,-0.66],     [3,4,6]]
    ]],

    // M939 open
    ["UK3CB_B_M939_Open_HIDF" call _classNameToModel,[
        [1,             [0,0.2,-0.5],           [1,10]],
        [1,             [0,-0.6,-0.5],          [2,3]],
        [1,             [0,-1.4,-0.5],          [4,5]],
        [1,             [0,-2.2,-0.5],          [6,7]],
        [1,             [0,-3.0,-0.5],          [8,9]],
        [1,             [0,-3.8,-0.5],          [11,12]]
    ]],

    // M939 closed
    ["UK3CB_B_M939_Closed_HIDF" call _classNameToModel,[
        [1,             [0,0.2,-0.5],           [1,10]],
        [1,             [0,-0.6,-0.5],          [2,3]],
        [1,             [0,-1.4,-0.5],          [4,5]],
        [1,             [0,-2.2,-0.5],          [6,7]],
        [1,             [0,-3.0,-0.5],          [8,9]],
        [1,             [0,-3.8,-0.5],          [11,12]]
    ]],

    // M939 guntruck
    ["UK3CB_B_M939_Guntruck_HIDF" call _classNameToModel,[
        [1,             [0,0.2,-1.3],           [0,9]],
        [1,             [0,-0.6,-1.3],          [1,2]],
        [1,             [0,-1.4,-1.3],          [3,4]],
        [1,             [0,-2.2,-1.3],          [5,6]],
        [1,             [0,-3.0,-1.3],          [7,8]],
        [1,             [0,-3.8,-1.3],          [10,11]]
    ]],

    // M939 recovery
    ["UK3CB_B_M939_Recovery_HIDF" call _classNameToModel,[
        [1,             [0,0.2,-0.5],           []],
        [1,             [0,-0.6,-0.5],          []],
        [1,             [0,-1.4,-0.5],          []],
        [1,             [0,-2.2,-0.5],          []],
        [1,             [0,-3.0,-0.5],          []],
        [1,             [0,-3.8,-0.5],          []]
    ]],

    // Coyote P GMG
    ["UK3CB_BAF_Coyote_Passenger_L134A1_D" call _classNameToModel,[
        [1,             [0.05,-1.6,-1.75],      [2,3,4,5,6,7]], // Both nodes block all seats here because 2 nodes blocking
        [1,             [0.05,-2.4,-1.75],      [2,3,4,5,6,7]]  // 2 common seats but not all didn't work for some reason
    ]],

    // Coyote P HMG
    ["UK3CB_BAF_Coyote_Passenger_L111A1_D2" call _classNameToModel,[
        [1,             [0.05,-1.6,-1.75],      [2,3,4,5,6,7]], // Same deal as above here
        [1,             [0.05,-2.4,-1.75],      [2,3,4,5,6,7]]
    ]],

    // Didn't redo the Husky because it was disabled in the old JNL, might work now tho, didn't test yet

    // MTVR Open
    ["UK3CB_B_MTVR_Open_WDL" call _classNameToModel,[
        [1,             [0,0.2,-0.83],          [0,1]],
        [1,             [0,-0.6,-0.83],         [2,3]],
        [1,             [0,-1.4,-0.83],         [4,5]],
        [1,             [0,-2.2,-0.83],         [6,7]],
        [1,             [0,-3.0,-0.83],         [9,10]]
    ]],

    // MTVR Covered
    ["UK3CB_B_MTVR_Closed_WDL" call _classNameToModel,[
        [1,             [0,0.2,-0.83],          [0,1]],
        [1,             [0,-0.6,-0.83],         [2,3]],
        [1,             [0,-1.4,-0.83],         [4,5]],
        [1,             [0,-2.2,-0.83],         [6,7]],
        [1,             [0,-3.0,-0.83],         [9,10]]
    ]],

    // MTVR Recovery
    ["UK3CB_B_MTVR_Recovery_WDL" call _classNameToModel,[
        [1,             [0,0.2,-0.8],           []],
        [1,             [0,-0.6,-0.8],          []],
        [1,             [0,-1.4,-0.8],          []],
        [1,             [0,-2.2,-0.8],          []],
        [1,             [0,-3.0,-0.8],          []],
        [1,             [0,-3.8,-0.8],          []]
    ]],

    // MAN Truck, 4x4 Flatbed
    ["UK3CB_BAF_MAN_HX60_Cargo_Green_A" call _classNameToModel,[
        [1,             [0,3.3,-1.25],          []],
        [1,             [0,2.5,-1.25],          []],
        [1,             [0,1.7,-1.25],          []],
        [1,             [0,0.9,-1.25],          []],
        [1,             [0,0.1,-1.25],          []],
        [1,             [0,-0.7,-1.25],         []]
    ]],

    // MAN Truck, 6x6 Flatbed
    ["UK3CB_BAF_MAN_HX58_Cargo_Green_A" call _classNameToModel,[
        [1,             [0,4.8,-1.25],          []],
        [1,             [0,4.0,-1.25],          []],
        [1,             [0,3.2,-1.25],          []],
        [1,             [0,2.4,-1.25],          []],
        [1,             [0,1.6,-1.25],          []],
        [1,             [0,0.8,-1.25],          []],
        [1,             [0,0.0,-1.25],          []],
        [1,             [0,-0.8,-1.25],         []]
    ]],

    // V3S, Recovery
    ["UK3CB_C_V3S_Recovery" call _classNameToModel,[
        [1,             [0,0.8,-0.65],          []],
        [1,             [0,0.0,-0.65],          []],
        [1,             [0,-0.8,-0.65],         []],
        [1,             [0,-1.6,-0.65],         []],
        [1,             [0,-2.4,-0.65],         []],
        [1,             [0,-3.2,-0.65],         []]
    ]],

    // V3S, Open
    ["UK3CB_C_V3S_Open" call _classNameToModel,[
        [1,             [0,0.3,-0.75],          [9,10]],
        [1,             [0,-0.5,-0.75],         [1,2,3,4]],
        [1,             [0,-1.3,-0.75],         [3,4,5,6]],
        [1,             [0,-2.1,-0.75],         [5,6,7,8]],
        [1,             [0,-2.9,-0.75],         [11,12]]
    ]],

    // V3S, Closed
    ["UK3CB_C_V3S_Closed" call _classNameToModel,[
        [1,             [0,0.3,-0.75],          [9,10]],
        [1,             [0,-0.5,-0.75],         [1,2,3,4]],
        [1,             [0,-1.3,-0.75],         [3,4,5,6]],
        [1,             [0,-2.1,-0.75],         [5,6,7,8]],
        [1,             [0,-2.9,-0.75],         [11,12]]
    ]],

    // Ural, Recovery
    ["UK3CB_C_Ural_Recovery" call _classNameToModel,[
        [1,             [0,0,-0.58],            []],
        [1,             [0,-0.8,-0.58],         []],
        [1,             [0,-1.6,-0.58],         []],
        [1,             [0,-2.4,-0.58],         []],
        [1,             [0,-3.2,-0.58],         []],
        [1,             [0,-4.0,-0.58],         []]
    ]]

    // ---------- MODNAME ----------

];

//Each element is: [model name, offset, vectorDir, nodes used, recoil(weapons only)]
A3A_logistics_attachmentOffset = [

    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
        // ---------- Vanilla ----------
    ["B_static_AT_F" call _classNameToModel,                                    [-0.5, 0.0, 1.05],          [1, 0, 0],                  2,      500],               //AT titan, facing to the right
    ["B_static_AA_F" call _classNameToModel,                                    [-0.5, 0.0, 1.05],          [1, 0, 0],                  2,      500],               //AA titan, facing to the right
    ["B_GMG_01_high_F" call _classNameToModel,                                  [0.2, -0.4, 1.7],           [0, 1, 0],                  2,      200],               //Static GMG High
    ["B_HMG_01_high_F" call _classNameToModel,                                  [0.2, -0.4, 1.7],           [0, 1, 0],                  2,      200],               //Static HMG High
    ["B_GMG_01_F" call _classNameToModel,                                       [0, 0, 1.19],               [0, -1, 0],                 4,      200],               //Static GMG
    ["B_HMG_01_F" call _classNameToModel,                                       [0, 0, 1.19],               [0, -1, 0],                 4,      200],               //Static HMG
    ["B_Mortar_01_F" call _classNameToModel,                                    [-0.1,-0.5,0.79],           [0, 1, 0],                  2,      6000],              //Mortar
    ["B_HMG_02_high_F" call _classNameToModel,                                  [0.2, -0.5, 1.7],           [0, 1, 0],                  4,      200],               //M2 High
    ["B_HMG_02_F" call _classNameToModel,                                       [-0.2, 0, 1.3],             [0, -1, 0],                 4,      200],               //M2

        // ----------   RHS   ----------                                                                                                        //RHS vehicles are heavier than vanilla
    ["RHS_TOW_TriPod_D" call _classNameToModel,                                 [0.0, 0, 1.08],             [0, 1, 0],                  4,      500],               //RHS TOW launcher
    ["RHS_M2StaticMG_D" call _classNameToModel,                                 [0.35, -0.3, 1.72],         [0, 1, 0],                  4,      200],               //RHS M2HB machinegun
    ["RHS_M2StaticMG_MiniTripod_D" call _classNameToModel,                      [0.3, -0.1, 0.03],          [1, 0, 0],                  4,      200],               //RHS M2HB sitting machinegun
    ["RHS_MK19_TriPod_D" call _classNameToModel,                                [0, 0, 1],                  [0, -1, 0],                 4,      200],               //RHS mk.19 GMG, facing to the right
    ["rhs_DSHKM_ins" call _classNameToModel,                                    [0.3, -0.5, 1.65],          [0, 1, 0],                  4,      200],               //RHS DShKM
    ["rhs_DSHKM_Mini_TriPod_ins" call _classNameToModel,                        [-0.5, -0.2, 1.32],         [1, 0, 0],                  4,      200],               //RHS DShKM sitting, facing to the right
    ["rhs_KORD_high_MSV" call _classNameToModel,                                [0.22, -0.3, 1.65],         [0, 1, 0],                  4,      300],               //RHS Kord
    ["rhs_KORD_MSV" call _classNameToModel,                                     [0.1, -0.3, 1.34],          [1, 0, 0],                  4,      300],               //RHS Kord sitting, facing to the right
    ["RHS_NSV_TriPod_MSV" call _classNameToModel,                               [-0.1, 0, 1.34],            [1, 0, 0],                  4,      300],               //RHS NSV sitting, facing to the right
    ["rhs_Kornet_9M133_2_msv" call _classNameToModel,                           [0.0, 0, 1.01],             [1, 0, 0],                  4,      500],               //RHS kornet, facing to the right
    ["rhs_SPG9_INS" call _classNameToModel,                                     [-0.1, 0, 1.03],            [-0.96,0.25,0],             4,      500],               //RHS SPG-9, facing 75 degrees to the left
    ["RHS_AGS30_TriPod_MSV" call _classNameToModel,                             [-0.4, 0, 1.25],            [0, -1, 0],                 4,      200],               //RHS AGS-30 the russian GMG, facing right
    ["rhs_Igla_AA_pod_msv" call _classNameToModel,                              [0.3, 0, 1.59],             [0, 1, 0],                  4,      500],               //RHS double Igla launcher
    ["RHS_ZU23_MSV" call _classNameToModel,                                     [0,0,2],                    [0,1,0],                    7,      500],               //RHS ZU-23 //no rhs vehicle can fit it :D
    ["rhsgref_ins_2b14" call _classNameToModel,                                 [0, -0.55, 0.8],            [0, 1, 0],                  2,      6000],              //RHS Podnos Mortar
    ["RHS_M252_USMC_WD" call _classNameToModel,                                 [0, -0.45, 1.22],           [0, 1, 0],                  2,      6000],              //RHS M252

    //medium size crate                                                       //location                  //rotation                  //size                        //description
    ["Box_NATO_AmmoVeh_F" call _classNameToModel,                               [0,0,0.85],                 [1,0,0],                    2],                         //Vehicle ammo create
    ["Land_PaperBox_01_open_boxes_F" call _classNameToModel,                    [0,0,0.85],                 [1,0,0],                    2],                         //Stef test supplybox
    ["Land_FoodSacks_01_cargo_brown_F" call _classNameToModel,                  [0,0,0.85],                 [1,0,0],                    2],                         //New city supplies crate
    ["Land_PlasticCase_01_medium_F" call _classNameToModel,                     [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate1
    ["Box_Syndicate_Ammo_F" call _classNameToModel,                             [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate2
    ["Box_IED_Exp_F" call _classNameToModel,                                    [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate3
    ["B_supplyCrate_F" call _classNameToModel,                                  [0, 0, 0.95],               [1,0,0],                    2],                         //Ammodrop crate
    ["C_Quadbike_01_F" call _classNameToModel,                                  [0, 0, 1.4],                [0,1,0],                    2],                         //Quadbike
    ["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_GER_Ammo.p3d",                       [0,0,0.85],                 [1,0,0],                    2],                         //ifa ammo
    ["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_SU_Ammo.p3d",                        [0,0,0.85],                 [1,0,0],                    2],                         //ifa ammo

    //small size crate                                                        //location                  //rotation                  //size                        //description
    ["Box_NATO_Equip_F" call _classNameToModel,                                 [0,0,0.44],                 [1,0,0],                    1],                         //Equipment box
    ["Box_NATO_Wps_F" call _classNameToModel,                                   [0,0,0.22],                 [0,0,0],                    1]                          //surrender crates
];

//elements are [Weapon model, [vehicles weapon is not allowed on]]
A3A_logistics_weapons = [
    //vanilla
    ["B_static_AT_F" call _classNameToModel,[]],
    ["B_static_AA_F" call _classNameToModel,[]],
    ["B_GMG_01_high_F" call _classNameToModel,[]],
    ["B_HMG_01_high_F" call _classNameToModel,[]],
    ["B_GMG_01_F" call _classNameToModel,[]],
    ["B_HMG_01_F" call _classNameToModel,[]],
    ["B_Mortar_01_F" call _classNameToModel,["C_Boat_Civil_01_F" call _classNameToModel, "B_Boat_Transport_01_F" call _classNameToModel, "C_Boat_Transport_02_F" call _classNameToModel]],
    ["B_HMG_02_high_F" call _classNameToModel,[]],
    ["B_HMG_02_F" call _classNameToModel,[]],
    //RHS
    ["RHS_TOW_TriPod_D" call _classNameToModel,[]],
    ["RHS_M2StaticMG_D" call _classNameToModel,[]],
    ["RHS_M2StaticMG_MiniTripod_D" call _classNameToModel,[]],
    ["RHS_MK19_TriPod_D" call _classNameToModel,[]],
    ["rhs_DSHKM_ins" call _classNameToModel,[]],
    ["rhs_DSHKM_Mini_TriPod_ins" call _classNameToModel,[]],
    ["rhs_KORD_high_MSV" call _classNameToModel,[]],
    ["rhs_KORD_MSV" call _classNameToModel,[]],
    ["RHS_NSV_TriPod_MSV" call _classNameToModel,[]],
    ["rhs_Kornet_9M133_2_msv" call _classNameToModel,[]],
    ["rhs_SPG9_INS" call _classNameToModel,[]],
    ["RHS_AGS30_TriPod_MSV" call _classNameToModel,[]],
    ["rhs_Igla_AA_pod_msv" call _classNameToModel,[]],
    ["RHS_ZU23_MSV" call _classNameToModel, ["rhsusf_M977A4_usarmy_wd" call _classNameToModel, "rhsusf_M977A4_BKIT_usarmy_wd" call _classNameToModel, "rhsusf_M977A4_BKIT_M2_usarmy_wd" call _classNameToModel]],
    ["rhsgref_ins_2b14" call _classNameToModel, ["C_Boat_Civil_01_F" call _classNameToModel, "B_Boat_Transport_01_F" call _classNameToModel, "C_Boat_Transport_02_F" call _classNameToModel]],
    ["RHS_M252_USMC_WD" call _classNameToModel, ["C_Boat_Civil_01_F" call _classNameToModel, "B_Boat_Transport_01_F" call _classNameToModel, "C_Boat_Transport_02_F" call _classNameToModel]]
];

//coverd vehicles
A3A_logistics_coveredVehicles = ["C_Van_02_vehicle_F", "C_Van_02_transport_F", "B_Truck_01_covered_F", "O_Truck_03_covered_F", "I_Truck_02_covered_F",
"rhsgref_nat_ural_work", "rhs_kamaz5350", "rhs_zil131_base", "rhs_gaz66_vmf", "rhsusf_M1078A1P2_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", "rhsusf_M1083A1P2_WD_fmtv_usarmy",
"UK3CB_B_M939_Closed_HIDF", "UK3CB_B_MTVR_Closed_WDL", "UK3CB_C_V3S_Closed"];
{
    private _blackList = (_x#1);
    {
        private _model = _x call _classNameToModel;
        if !(_model isEqualTo "") then {_blackList pushBack _model};
    } forEach A3A_logistics_coveredVehicles;
} forEach A3A_logistics_weapons;
nil
