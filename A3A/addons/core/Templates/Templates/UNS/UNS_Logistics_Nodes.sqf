A3A_logistics_vehicleHardpoints append [
    //Cars
    ["\uns_m274\uns_m274.p3d",[
        [1,             [0.13,-0.4,-0.71],      [0,1,2]]
    ]],

    //Small Trucks
    ["\uns_wheeled_w\m37b\uns_m37b1.p3d",[
        [1,             [0,-1.25,-0.82],      [1,2,6]],
        [1,             [0,-2.05,-0.82],      [3,4,5]]
    ]],

        //Trucks
    ["uns_m35\uns_M35A2",[
        [1,             [0,-0.4,-0.5],      [3,4]],
        [1,             [0,-1.2,-0.5],      [5,6,7,8]],
        [1,             [0,-2,-0.5],        [9,10]],
        [1,             [0,-2.8,-0.5],      [1,2]]
    ]],

    ["\uns_wheeled_e\ural\uns_ural.p3d",[
        [1,             [0,-0.6,0.1],      [2,3]],
        [1,             [0,-1.4,0.1],      [4,5,6,7]],
        [1,             [0,-2.2,0.1],      [8,9]],
        [1,             [0,-3,0.1],        [10,11]]
    ]],

    ["uns_wheeled_e\zil157\uns_zil157.p3d",[
        [1,             [0,0.3,1.4],       [2,11,12]],
        [1,             [0,-0.5,1.4],      [1,3,4]],
        [1,             [0,-1.3,1.4],      [5,6]],
        [1,             [0,-2.1,1.4],      [7,8]]
    ]],

    //Boats
    ["uns_boats\skiff\uns_skiff_1",[
        [1,             [0,0.6,-0.675],      [0,1]]
    ]],

    ["\UNS_sampan\UNS_sampan_fish1.P3D",[
        [1,             [0.15,3.6,-0.445],      []],
        [1,             [0.15,2.8,-0.445],      []],
        [1,             [0.15,2,-0.445],        []],
        [1,             [0.15,1.2,-0.445],      [1]],
        [1,             [0.15,0.4,-0.445],      []],
        [1,             [0.15,-0.4,-0.445],     []]
    ]],

    ["\UNS_sampan\UNS_sampan_Transport.P3D",[
        [1,             [0,3.35,-0.7],      [0]],
        [1,             [0,2.55,-0.7],      []],
        [1,             [0,1.75,-0.7],      [5]],
        [1,             [0,0.95,-0.7],      []],
        [1,             [0,0.15,-0.7],      []]
    ]],

    ["\UNS_sampan\UNS_sampan_large.P3D",[
        [1,             [0,2.3,-1.2],      []],
        [1,             [0,1.5,-1.2],      []],
        [1,             [0,0.7,-1.2],      []],
        [1,             [0,-0.1,-1.2],     []]
    ]],

    //Helicopters
    ["\uns_ch47a\uns_ch47a.p3d",[
        [1,             [0.01,3.6,-2.71],       []],
        [1,             [0.01,2.8,-2.71],       []],
        [1,             [0.01,2,-2.71],         []],
        [1,             [0.01,1.2,-2.71],       []],
        [1,             [0.01,0.4,-2.71],       []],
        [1,             [0.01,-0.4,-2.71],      []],
        [1,             [0.01,-1.2,-2.71],      []],
        [1,             [0.01,-2,-2.71],        []],
        [1,             [0.01,-2.8,-2.71],      []],
        [1,             [0.01,-3.6,-2.71],      []]
    ]],
    
    ["\uns_mi8\uns_Mi8_MT",[
        [1,             [0.01,3.6,-2.29],      []],
        [1,             [0.01,2.8,-2.29],      []],
        [1,             [0.01,2,-2.29],        []],
        [1,             [0.01,1.2,-2.29],      []],
        [1,             [0.01,0.4,-2.29],      []]
    ]],

    ["\uns_mi8\uns_Mi8_MTV",[
        [1,             [0.01,3.6,-2.29],      []],
        [1,             [0.01,2.8,-2.29],      []],
        [1,             [0.01,2,-2.29],        []],
        [1,             [0.01,1.2,-2.29],      []],
        [1,             [0.01,0.4,-2.29],      []]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["uns_dshk_high_VC" call A3A_fnc_classNameToModel,                              [0.25, -0.5, 1.64],       [0, 1, 0],                  4,                100],
    ["uns_m2_high" call A3A_fnc_classNameToModel,                                   [0.04, 0.13, 0],          [0, 1, 0],                  4,                100],
    ["uns_pk_high_VC" call A3A_fnc_classNameToModel,                                [0.04, 0, 0],             [0, 1, 0],                  4,                100],
    ["uns_m1941_82mm_mortarVC" call A3A_fnc_classNameToModel,                       [0,-0.52,0.74],           [0, 1, 0],                  3,                2000],
    ["uns_M1_81mm_mortar" call A3A_fnc_classNameToModel,                            [0.02,-0.39,0.70],        [0, 1, 0],                  3,                2000],
    ["uns_M2_60mm_mortar" call A3A_fnc_classNameToModel,                            [-0.02,-0.39,0.74],         [0, 1, 0],                  3,                1500],
    ["uns_M30_107mm_mortar" call A3A_fnc_classNameToModel,                          [0.02,-0.6,1.05],         [0, 1, 0],                  3,                3000]
];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append [
    "uns_Mi8T_VPAF" call A3A_fnc_classNameToModel
    , "uns_Mi8TV_VPAF_MG" call A3A_fnc_classNameToModel
    , "uns_M35A2"
    , "uns_nvatruck"
    , "UNS_sampan_large" call A3A_fnc_classNameToModel
    , "UNS_Sampan_Transport" call A3A_fnc_classNameToModel
    , "uns_ch47_m60_army" call A3A_fnc_classNameToModel
];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons append [
    ["uns_pk_high_VC" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck"]],
    ["uns_dshk_high_VC" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck"]],
    ["uns_m1941_82mm_mortarVC" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck", "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "UNS_sampan_fish1" call A3A_fnc_classNameToModel]],
    ["uns_m2_high" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck"]],
    ["uns_M2_60mm_mortar" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck", "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "UNS_sampan_fish1" call A3A_fnc_classNameToModel]],
    ["uns_m1941_82mm_mortarNVA" call A3A_fnc_classNameToModel,["uns_M35A2", "uns_nvatruck", "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "UNS_sampan_fish1" call A3A_fnc_classNameToModel]]
];