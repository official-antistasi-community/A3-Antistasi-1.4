//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints = [
/*
    //Bikes
    //Quadbike
    ["C_Quadbike_01_F" call A3A_fnc_classNameToModel, [
        // always 1,    location                locked seats
        [1,             [0,-0.9,-0.453],          [0]]
    ]],
*/
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset = [
/*
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["B_static_AT_F" call A3A_fnc_classNameToModel,                             [-0.5, 0.0, 0.99],          [1, 0, 0],                  2,      250]               //AT titan, facing to the right
*/
];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles = [
/*
    "C_Van_02_vehicle_F" call A3A_fnc_classNameToModel
*/
];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons = [
/*
    //vanilla
    ["B_Mortar_01_F" call A3A_fnc_classNameToModel,["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]],
*/
];
