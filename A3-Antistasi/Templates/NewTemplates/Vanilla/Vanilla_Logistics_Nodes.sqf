//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints = [
    //Bikes
    //Quadbike
    ["C_Quadbike_01_F" call A3A_fnc_classNameToModel, [
        // always 1,    location                locked seats
        [1,             [0,-0.9,-0.5],          [0]]
    ]],

    //4x4s
    //Offroad
    ["C_Offroad_01_F" call A3A_fnc_classNameToModel, [
        // always 1,    location                locked seats
        [1,             [-0.05,-1.3,-0.72],     [3,4]],
        [1,             [-0.05,-2.3,-0.72],     [1,2]]
    ]],

        //Small Truck
    ["C_Van_01_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.7475,-0.65],      [2,3,4,5]],
        [1,             [0,-1.4375,-0.65],      [6,7]],
        [1,             [0,-2.2,-0.65],         [8,9]],
        [1,             [0,-3,-0.65],           [10,11]]
        ]],

        //Van Transport
    ["C_Van_02_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.245,-0.97],       []],
        [1,             [0,-2.49,-0.97],        [9,10]]
    ]],

        //Van Cargo
    ["C_Van_02_vehicle_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7025,-0.97],       []],
        [1,             [0,-0.1275,-0.97],      []],
        [1,             [0,-0.9575,-0.97],      []],
        [1,             [0,-1.7875,-0.97],      []],
        [1,             [0,-2.6175,-0.97],      []]
    ]],

    //6x6s
    //Zamak Open
    ["O_Truck_02_transport_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //Zamak Covered
    ["O_Truck_02_covered_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //CSAT Tempest open
    ["O_Truck_03_transport_F" call A3A_fnc_classNameToModel,[
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //CSAT Tempest closed
    ["O_Truck_03_covered_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //8x8s
    //HEMTT open
    ["B_Truck_01_transport_F" call A3A_fnc_classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //HEMTT covered
    ["B_Truck_01_covered_F" call A3A_fnc_classNameToModel,[
        // always 1    location                 locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //Vanilla HEMTT Flatbed
    ["B_Truck_01_flatbed_F" call A3A_fnc_classNameToModel,[
        [1,             [0,0.6825,-0.88],       []],
        [1,             [0,-0.1475,-0.88],      []],
        [1,             [0,-0.9775,-0.88],      []],
        [1,             [0,-1.8075,-0.88],      []],
        [1,             [0,-2.6375,-0.88],      []],
        [1,             [0,-3.4675,-0.88],      []],
        [1,             [0,-4.2975,-0.88],      []]
    ]],

    //Vanilla HEMTT Cargo
    ["B_Truck_01_cargo_F" call A3A_fnc_classNameToModel, [
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
    ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.9425,-1.1],       [0,1]],
        [1,             [0,-1.5725,-1.1],       []]
    ]],

    //Speedboat minigun
    ["B_Boat_Armed_01_minigun_F" call A3A_fnc_classNameToModel, [
        [1,             [0,3.2,-2.2],           [4,5]],
        [1,             [0,2.4,-2.2],           []]
    ]],

    //Transport rubber boat
    ["B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, [
        [1,             [0,0.7575,-1.1],        [0,1,2,3]],
        [1,             [0,-0.0725,-1.1],       []]
    ]],

    //Civilian transport boat (RHIB)
    ["C_Boat_Transport_02_F" call A3A_fnc_classNameToModel, [
        [1,             [0,1.8575,-0.7],        [0,1]],
        [1,             [0,1.0275,-0.7],        [2,6]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset = [
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["B_static_AT_F" call A3A_fnc_classNameToModel,                             [-0.5, 0.0, 1.05],          [1, 0, 0],                  2,      250],               //AT titan, facing to the right
    ["B_static_AA_F" call A3A_fnc_classNameToModel,                             [-0.5, 0.0, 1.05],          [1, 0, 0],                  2,      250],               //AA titan, facing to the right
    ["B_GMG_01_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.4, 1.7],           [0, 1, 0],                  2,      100],               //Static GMG High
    ["B_HMG_01_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.4, 1.7],           [0, 1, 0],                  2,      100],               //Static HMG High
    ["B_GMG_01_F" call A3A_fnc_classNameToModel,                                [0, 0, 1.19],               [0, -1, 0],                 4,      100],               //Static GMG
    ["B_HMG_01_F" call A3A_fnc_classNameToModel,                                [0, 0, 1.19],               [0, -1, 0],                 4,      100],               //Static HMG
    ["B_Mortar_01_F" call A3A_fnc_classNameToModel,                             [-0.1,-0.5,0.79],           [0, 1, 0],                  2,      2000],              //Mortar
    ["B_HMG_02_high_F" call A3A_fnc_classNameToModel,                           [0.2, -0.5, 1.7],           [0, 1, 0],                  4,      100],               //M2 High
    ["B_HMG_02_F" call A3A_fnc_classNameToModel,                                [-0.2, 0, 1.3],             [0, -1, 0],                 4,      100],               //M2

    //medium sized crates
    ["Box_NATO_AmmoVeh_F" call A3A_fnc_classNameToModel,                        [0,0,0.85],                 [1,0,0],                    2],                         //Vehicle ammo create
    ["Land_PaperBox_01_open_boxes_F" call A3A_fnc_classNameToModel,             [0,0,0.85],                 [1,0,0],                    2],                         //Stef test supplybox
    ["Land_FoodSacks_01_cargo_brown_F" call A3A_fnc_classNameToModel,           [0,0,0.85],                 [1,0,0],                    2],                         //New city supplies crate
    ["Land_PlasticCase_01_medium_F" call A3A_fnc_classNameToModel,              [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate1
    ["Box_Syndicate_Ammo_F" call A3A_fnc_classNameToModel,                      [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate2
    ["Box_IED_Exp_F" call A3A_fnc_classNameToModel,                             [0,0,0.85],                 [1,0,0],                    2],                         //Stef test Devin crate3
    ["B_supplyCrate_F" call A3A_fnc_classNameToModel,                           [0, 0, 0.95],               [1,0,0],                    2],                         //Ammodrop crate
    ["C_Quadbike_01_F" call A3A_fnc_classNameToModel,                           [0, 0, 1.4],                [0,1,0],                    2],                         //Quadbike

    //small sized crates                                                      //location                  //rotation                  //size                        //description
    ["Box_NATO_Equip_F" call A3A_fnc_classNameToModel,                          [0,0,0.44],                 [1,0,0],                    1],                         //Equipment box
    ["Box_NATO_Wps_F" call A3A_fnc_classNameToModel,                            [0,0,0.22],                 [0,0,0],                    1]                          //surrender crates
];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles = ["C_Van_02_vehicle_F", "C_Van_02_transport_F", "B_Truck_01_covered_F", "O_Truck_03_covered_F", "I_Truck_02_covered_F"];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons = [
    //vanilla
    ["B_static_AT_F" call A3A_fnc_classNameToModel,[]],
    ["B_static_AA_F" call A3A_fnc_classNameToModel,[]],
    ["B_GMG_01_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_01_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_GMG_01_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_01_F" call A3A_fnc_classNameToModel,[]],
    ["B_Mortar_01_F" call A3A_fnc_classNameToModel,["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]],
    ["B_HMG_02_high_F" call A3A_fnc_classNameToModel,[]],
    ["B_HMG_02_F" call A3A_fnc_classNameToModel,[]]
];
