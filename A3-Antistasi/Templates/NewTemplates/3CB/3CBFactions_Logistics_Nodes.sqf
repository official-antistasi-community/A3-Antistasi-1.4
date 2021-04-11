//JNL mounting nodes for cargo and statics.
//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    // Datsun civ variant, TODO: redo for 3 crates maybeeee?
    ["UK3CB_C_Datsun_Open" call A3A_fnc_classNameToModel, [
        [1,               [0,-0.5,-0.83],     [2,3]],
        [1,               [0,-1.5,-0.83],     [0,2,3,4,5,6]]
    ]],

    // Datsun non civ variant, TODO: redo for 3 crates maybeeee?
    ["UK3CB_B_G_Datsun_Pickup" call A3A_fnc_classNameToModel, [
        [1,               [0,-0.6,-1.2],      [3,4]], // 2 is cab passenger
        [1,               [0,-1.3,-1.2],      [5,6]] // 0,1 is backmost ffv, didn't need block after all, juuuuust nuff space
    ]],

    // Hilux
    ["UK3CB_C_Hilux_Open" call A3A_fnc_classNameToModel, [
        [1,               [-0.05,-0.5,-0.66],     [5]],
        [1,               [-0.05,-1.6,-0.66],     [3,4,6]]
    ]],

    // M939 open
    ["UK3CB_B_M939_Open_HIDF" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.5],           [1,10]],
        [1,             [0,-0.6,-0.5],          [2,3]],
        [1,             [0,-1.4,-0.5],          [4,5]],
        [1,             [0,-2.2,-0.5],          [6,7]],
        [1,             [0,-3.0,-0.5],          [8,9]],
        [1,             [0,-3.8,-0.5],          [11,12]]
    ]],

    // M939 closed
    ["UK3CB_B_M939_Closed_HIDF" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.5],           [1,10]],
        [1,             [0,-0.6,-0.5],          [2,3]],
        [1,             [0,-1.4,-0.5],          [4,5]],
        [1,             [0,-2.2,-0.5],          [6,7]],
        [1,             [0,-3.0,-0.5],          [8,9]],
        [1,             [0,-3.8,-0.5],          [11,12]]
    ]],

    // M939 guntruck
    ["UK3CB_B_M939_Guntruck_HIDF" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-1.3],           [0,9]],
        [1,             [0,-0.6,-1.3],          [1,2]],
        [1,             [0,-1.4,-1.3],          [3,4]],
        [1,             [0,-2.2,-1.3],          [5,6]],
        [1,             [0,-3.0,-1.3],          [7,8]],
        [1,             [0,-3.8,-1.3],          [10,11]]
    ]],

    // M939 recovery
    ["UK3CB_B_M939_Recovery_HIDF" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.5],           []],
        [1,             [0,-0.6,-0.5],          []],
        [1,             [0,-1.4,-0.5],          []],
        [1,             [0,-2.2,-0.5],          []],
        [1,             [0,-3.0,-0.5],          []],
        [1,             [0,-3.8,-0.5],          []]
    ]],

    // MTVR Open
    ["UK3CB_B_MTVR_Open_WDL" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.83],          [0,1]],
        [1,             [0,-0.6,-0.83],         [2,3]],
        [1,             [0,-1.4,-0.83],         [4,5]],
        [1,             [0,-2.2,-0.83],         [6,7]],
        [1,             [0,-3.0,-0.83],         [9,10]]
    ]],

    // MTVR Covered
    ["UK3CB_B_MTVR_Closed_WDL" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.83],          [0,1]],
        [1,             [0,-0.6,-0.83],         [2,3]],
        [1,             [0,-1.4,-0.83],         [4,5]],
        [1,             [0,-2.2,-0.83],         [6,7]],
        [1,             [0,-3.0,-0.83],         [9,10]]
    ]],

    // MTVR Recovery
    ["UK3CB_B_MTVR_Recovery_WDL" call A3A_fnc_classNameToModel,[
        [1,             [0,0.2,-0.8],           []],
        [1,             [0,-0.6,-0.8],          []],
        [1,             [0,-1.4,-0.8],          []],
        [1,             [0,-2.2,-0.8],          []],
        [1,             [0,-3.0,-0.8],          []],
        [1,             [0,-3.8,-0.8],          []]
    ]],

    // V3S, Recovery
    ["UK3CB_C_V3S_Recovery" call A3A_fnc_classNameToModel,[
        [1,             [0,0.8,-0.65],          []],
        [1,             [0,0.0,-0.65],          []],
        [1,             [0,-0.8,-0.65],         []],
        [1,             [0,-1.6,-0.65],         []],
        [1,             [0,-2.4,-0.65],         []],
        [1,             [0,-3.2,-0.65],         []]
    ]],

    // V3S, Open
    ["UK3CB_C_V3S_Open" call A3A_fnc_classNameToModel,[
        [1,             [0,0.3,-0.75],          [9,10]],
        [1,             [0,-0.5,-0.75],         [1,2,3,4]],
        [1,             [0,-1.3,-0.75],         [3,4,5,6]],
        [1,             [0,-2.1,-0.75],         [5,6,7,8]],
        [1,             [0,-2.9,-0.75],         [11,12]]
    ]],

    // V3S, Closed
    ["UK3CB_C_V3S_Closed" call A3A_fnc_classNameToModel,[
        [1,             [0,0.3,-0.75],          [9,10]],
        [1,             [0,-0.5,-0.75],         [1,2,3,4]],
        [1,             [0,-1.3,-0.75],         [3,4,5,6]],
        [1,             [0,-2.1,-0.75],         [5,6,7,8]],
        [1,             [0,-2.9,-0.75],         [11,12]]
    ]],

    // Ural, Recovery
    ["UK3CB_C_Ural_Recovery" call A3A_fnc_classNameToModel,[
        [1,             [0,0,-0.58],            []],
        [1,             [0,-0.8,-0.58],         []],
        [1,             [0,-1.6,-0.58],         []],
        [1,             [0,-2.4,-0.58],         []],
        [1,             [0,-3.2,-0.58],         []],
        [1,             [0,-4.0,-0.58],         []]
    ]],
        // 3CB Fishing Boat
    ["UK3CB_CCM_I_Fishing_Boat" call A3A_fnc_classNameToModel,[
        [1,             [0,-2.6,-4.28],          [2,0]],
        [1,             [0,-3.4,-4.28],          []],
        [1,             [0,-4.2,-4.28],          [5]],
        [1,             [0,-5,-4.28],            [1,4,3]]
    ]],
        // 3CB Fishing Boat
    ["UK3CB_CCM_I_Fishing_Boat_VIV_FFV" call A3A_fnc_classNameToModel,[
        [1,             [0,-2.6,-4.28],          []],
        [1,             [0,-3.4,-4.28],          []],
        [1,             [0,-4.2,-4.28],          []],
        [1,             [0,-5,-4.28],            []]
    ]],
        // 3CB Fishing Boat ZU23 Rear
    ["UK3CB_CHD_I_Fishing_Boat_Zu23" call A3A_fnc_classNameToModel,[
        [1,             [0,6.1,-3.24],          []]
    ]],
        // 3CB Fishing Boat ZU23 Front
    ["UK3CB_CHD_I_Fishing_Boat_Zu23_front" call A3A_fnc_classNameToModel,[
        [1,             [0,-2.6,-4.28],          [2,0]],
        [1,             [0,-3.4,-4.28],          []],
        [1,             [0,-4.2,-4.28],          [5]],
        [1,             [0,-5,-4.28],            [1,4,3]]
    ]],
        // 3CB Wooden Boat
    ["UK3CB_CHC_C_Small_Boat_Wood" call A3A_fnc_classNameToModel,[
        [1,             [0,1.1,-0.62],          [1]],
        [1,             [0,0.3,-0.62],          [0,2]]
    ]],
        // Small boat
    ["UK3CB_CHC_C_Small_Boat_Closed" call A3A_fnc_classNameToModel,[
        [1,             [0,-0.7,-1],            [4,5]]
    ]],
        // Small boat
    ["UK3CB_CHC_C_Small_Boat_Open" call A3A_fnc_classNameToModel,[
        [1,             [0,-0.7,-1],            [4,5]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append ["UK3CB_B_M939_Closed_HIDF", "UK3CB_B_MTVR_Closed_WDL", "UK3CB_C_V3S_Closed"];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array don't add it to the blacklist in this array.
A3A_logistics_weapons append [];
