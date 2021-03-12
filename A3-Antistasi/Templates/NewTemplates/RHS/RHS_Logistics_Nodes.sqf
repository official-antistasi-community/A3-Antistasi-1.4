//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    //Urals
    //Ural Open
    ["RHS_Ural_Open_Civ_01" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.25],         [12,13]],
        [1,             [0,-0.66,-0.25],        [2,3,4,5]],
        [1,             [0,-1.4,-0.25],         [6,7]],
        [1,             [0,-2.2,-0.25],         [8,9]],
        [1,             [0,-3,-0.25],           [10,11]]
    ]],

    //Ural Closed
    ["rhsgref_nat_ural_work" call A3A_fnc_classNameToModel, [
        [1,             [0,0.14,-0.25],         [12,13]],
        [1,             [0,-0.66,-0.25],        [2,3,4,5]],
        [1,             [0,-1.4,-0.25],         [6,7]],
        [1,             [0,-2.2,-0.25],         [8,9]],
        [1,             [0,-3,-0.25],           [10,11]]
    ]],

    //Ural Open 2
    ["RHS_Ural_Open_MSV_01" call A3A_fnc_classNameToModel, [
        [1,             [0,0.55,-0.25],         [3,12,13]],
        [1,             [0,-0.25,-0.25],        [2,4,5]],
        [1,             [0,-1,-0.25],           [6,7]],
        [1,             [0,-1.8,-0.25],         [8,9]],
        [1,             [0,-2.6,-0.25],         [10,11]]
    ]],

    //Kamazs covered
    ["rhs_kamaz5350" call A3A_fnc_classNameToModel, [
        [1,             [0.1,1,-1.02],          [2,3,4]],
        [1,             [0.1,0.2,-1.02],        [5,6,7]],
        [1,             [0.1,-0.6,-1.02],       [8,9]],
        [1,             [0.1,-1.4,-1.02],       [10,11]],
        [1,             [0.1,-2.2,-1.02],       [12,13]],
        [1,             [0.1,-3,-1.02],         [14,15]]
    ]],

    //Zils covered
    ["rhs_zil131_base" call A3A_fnc_classNameToModel, [
        [1,             [0,0.4,-0.63],          [3,10,11]],
        [1,             [0,-0.4,-0.63],         [2,4,5]],
        [1,             [0,-1.2,-0.63],         [6,7]],
        [1,             [0,-2,-0.63],           [8,9]]
    ]],

    //Gaz covered
    ["rhs_gaz66_vmf" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.63],      [1,3,10,12]],
        [1,             [-0.05,-0.2,-0.63],     [2,4,5]],
        [1,             [-0.05,-1,-0.63],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.63],     [8,11]]
    ]],

    //USAF 4x4 Trucks
    //Standard (covered)
    ["rhsusf_M1078A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.51],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.51],     [2,4,5]],
        [1,             [-0.05,-1,-0.51],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.51],     [8]],
        [1,             [-0.05,-2.6,-0.51],     [10,11]]
    ]],

    //uparmoured
    ["rhsusf_M1078A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.51],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.51],     [2,4,5]],
        [1,             [-0.05,-1,-0.51],       [6,7,9]],
        [1,             [-0.05,-1.8,-0.51],     [8]],
        [1,             [-0.05,-2.6,-0.51],     [10,11]]
    ]],

    //uparmoured - armed
    ["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-1.2],       [2,12,13]],
        [1,             [-0.05,-0.2,-1.2],      [1,3,4]],
        [1,             [-0.05,-1,-1.2],        [5,6]],
        [1,             [-0.05,-1.8,-1.2],      [7,8]],
        [1,             [-0.05,-2.6,-1.2],      [10,11]]
    ]],

    //USAF 6x6 Trucks
    //Standard
    ["rhsusf_M1083A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.52],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.52],     [2,4,5]],
        [1,             [-0.05,-1,-0.52],       [6,7]],
        [1,             [-0.05,-1.8,-0.52],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.52],     [10,11,14]]
    ]],

    //uparmoured
    ["rhsusf_M1083A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-0.52],      [3,12,13]],
        [1,             [-0.05,-0.2,-0.52],     [2,4,5]],
        [1,             [-0.05,-1,-0.52],       [6,7]],
        [1,             [-0.05,-1.8,-0.52],     [8,9,15]],
        [1,             [-0.05,-2.6,-0.52],     [10,11,14]]
    ]],

    //Armed
    ["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [-0.05,0.6,-1.2],       [2,11,12]],
        [1,             [-0.05,-0.2,-1.2],      [1,3,4]],
        [1,             [-0.05,-1,-1.2],        [5,6]],
        [1,             [-0.05,-1.8,-1.2],      [7,8,14]],
        [1,             [-0.05,-2.6,-1.2],      [9,10,13]]
    ]],

    //standard crane
    ["rhsusf_M1084A1P2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-0.4],          []],
        [1,             [0,0.3,-0.4],           []],
        [1,             [0,-0.45,-0.4],         []],
        [1,             [0,-1.1,-0.4],          []],
        [1,             [0,-1.95,-0.4],         []],
        [1,             [0,-2.7,-0.4],          []]
    ]],

    //uparmoured crane
    ["rhsusf_M1084A1P2_B_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-0.4],          []],
        [1,             [0,0.3,-0.4],           []],
        [1,             [0,-0.45,-0.4],         []],
        [1,             [0,-1.1,-0.4],          []],
        [1,             [0,-1.95,-0.4],         []],
        [1,             [0,-2.7,-0.4],          []]
    ]],

    //Armed crane
    ["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy" call A3A_fnc_classNameToModel, [
        [1,             [0,1.05,-1.1],          []],
        [1,             [0,0.3,-1.1],           []],
        [1,             [0,-0.45,-1.1],         []],
        [1,             [0,-1.1,-1.1],          []],
        [1,             [0,-1.95,-1.1],         []],
        [1,             [0,-2.7,-1.1],          []]
    ]],

    //SOCOM Stripped
    ["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom" call A3A_fnc_classNameToModel, [
        [1,             [0,1,-1.1],             []],
        [1,             [0,0.25,-1.1],          []],
        [1,             [0,-0.5,-1.1],          []],
        [1,             [0,-1.15,-1.1],         []],
        [1,             [0,-2,-1.1],            []],
        [1,             [0,-2.75,-1.1],         []]
    ]],

    //SOCOM MRAP
    ["rhsusf_M1239_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //Soccom Mrap M2
    ["rhsusf_M1239_M2_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //Soccom Mrap MK19
    ["rhsusf_M1239_MK19_socom_d" call A3A_fnc_classNameToModel, [
        [1,             [0,-1.3,-1.2],          []],
        [1,             [0,-2.1,-1.2],          []],
        [1,             [0,-2.9,-1.2],          []],
        [1,             [0,-3.7,-1.2],          []]
    ]],
    //USAF 8x8 Trucks
    //Standard
    ["rhsusf_M977A4_usarmy_wd" call A3A_fnc_classNameToModel, [
        [1,             [0,1,-0.1],             []],
        [1,             [0,0.2,-0.1],           []],
        [1,             [0,-0.7,-0.1],          []],
        [1,             [0,-1.5,-0.1],          []],
        [1,             [0,-2.2,-0.1],          []],
        [1,             [0,-3,-0.1],            []],
        [1,             [0,-3.8,-0.1],          []]
    ]],

    //uparmoured
    ["rhsusf_M977A4_BKIT_usarmy_wd" call A3A_fnc_classNameToModel, [
        [1,             [0,0.8,-0.1],           []],
        [1,             [0,0,-0.1],             []],
        [1,             [0,-0.7,-0.1],          []],
        [1,             [0,-1.5,-0.1],          []],
        [1,             [0,-2.3,-0.1],          []],
        [1,             [0,-3.1,-0.1],          []],
        [1,             [0,-3.9,-0.1],          []]
    ]],

    //Armed
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd" call A3A_fnc_classNameToModel, [
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
    ["rhsusf_m998_w_2dr" call A3A_fnc_classNameToModel, [
        [1,             [0,-0.6,-0.97],         [1,2,4,5]],
        [1,             [0,-1.4,-0.97],         [3,6]]
    ]]
];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [
    //weapons                                                                 //location                  //rotation                  //size    //recoil            //description
    ["RHS_TOW_TriPod_D" call A3A_fnc_classNameToModel,                          [0.0, 0, 1.08],             [0, 1, 0],                  4,      250],               //RHS TOW launcher
    ["RHS_M2StaticMG_D" call A3A_fnc_classNameToModel,                          [0.35, -0.3, 1.72],         [0, 1, 0],                  4,      100],               //RHS M2HB machinegun
    ["RHS_M2StaticMG_MiniTripod_D" call A3A_fnc_classNameToModel,               [0.3, -0.1, 0.03],          [1, 0, 0],                  4,      100],               //RHS M2HB sitting machinegun
    ["RHS_MK19_TriPod_D" call A3A_fnc_classNameToModel,                         [0, 0, 1],                  [0, -1, 0],                 4,      100],               //RHS mk.19 GMG, facing to the right
    ["rhs_DSHKM_ins" call A3A_fnc_classNameToModel,                             [0.3, -0.5, 1.65],          [0, 1, 0],                  4,      100],               //RHS DShKM
    ["rhs_DSHKM_Mini_TriPod_ins" call A3A_fnc_classNameToModel,                 [-0.5, -0.2, 1.32],         [1, 0, 0],                  4,      100],               //RHS DShKM sitting, facing to the right
    ["rhs_KORD_high_MSV" call A3A_fnc_classNameToModel,                         [0.22, -0.3, 1.65],         [0, 1, 0],                  4,      150],               //RHS Kord
    ["rhs_KORD_MSV" call A3A_fnc_classNameToModel,                              [0.1, -0.3, 1.34],          [1, 0, 0],                  4,      150],               //RHS Kord sitting, facing to the right
    ["RHS_NSV_TriPod_MSV" call A3A_fnc_classNameToModel,                        [-0.1, 0, 1.34],            [1, 0, 0],                  4,      150],               //RHS NSV sitting, facing to the right
    ["rhs_Kornet_9M133_2_msv" call A3A_fnc_classNameToModel,                    [0.0, 0, 1.01],             [1, 0, 0],                  4,      250],               //RHS kornet, facing to the right
    ["rhs_SPG9_INS" call A3A_fnc_classNameToModel,                              [-0.1, 0, 1.03],            [-0.96,0.25,0],             4,      250],               //RHS SPG-9, facing 75 degrees to the left
    ["RHS_AGS30_TriPod_MSV" call A3A_fnc_classNameToModel,                      [-0.4, 0, 1.25],            [0, -1, 0],                 4,      100],               //RHS AGS-30 the russian GMG, facing right
    ["rhs_Igla_AA_pod_msv" call A3A_fnc_classNameToModel,                       [0.3, 0, 1.59],             [0, 1, 0],                  4,      250],               //RHS double Igla launcher
    ["RHS_ZU23_MSV" call A3A_fnc_classNameToModel,                              [0,0,2],                    [0,1,0],                    7,      250],               //RHS ZU-23 //no rhs vehicle can fit it :D
    ["rhsgref_ins_2b14" call A3A_fnc_classNameToModel,                          [0, -0.55, 0.8],            [0, 1, 0],                  2,      2000],              //RHS Podnos Mortar
    ["RHS_M252_USMC_WD" call A3A_fnc_classNameToModel,                          [0, -0.45, 1.22],           [0, 1, 0],                  2,      2000]               //RHS M252
//Crates

//Other

];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append ["rhsgref_nat_ural_work", "rhs_kamaz5350", "rhs_zil131_base", "rhs_gaz66_vmf", "rhsusf_M1078A1P2_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", "rhsusf_M1083A1P2_WD_fmtv_usarmy"];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons append [
    ["RHS_TOW_TriPod_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_M2StaticMG_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_M2StaticMG_MiniTripod_D" call A3A_fnc_classNameToModel,[]],
    ["RHS_MK19_TriPod_D" call A3A_fnc_classNameToModel,[]],
    ["rhs_DSHKM_ins" call A3A_fnc_classNameToModel,[]],
    ["rhs_DSHKM_Mini_TriPod_ins" call A3A_fnc_classNameToModel,[]],
    ["rhs_KORD_high_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_KORD_MSV" call A3A_fnc_classNameToModel,[]],
    ["RHS_NSV_TriPod_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_Kornet_9M133_2_msv" call A3A_fnc_classNameToModel,[]],
    ["rhs_SPG9_INS" call A3A_fnc_classNameToModel,[]],
    ["RHS_AGS30_TriPod_MSV" call A3A_fnc_classNameToModel,[]],
    ["rhs_Igla_AA_pod_msv" call A3A_fnc_classNameToModel,[]],
    ["RHS_ZU23_MSV" call A3A_fnc_classNameToModel, ["rhsusf_M977A4_usarmy_wd" call A3A_fnc_classNameToModel, "rhsusf_M977A4_BKIT_usarmy_wd" call A3A_fnc_classNameToModel, "rhsusf_M977A4_BKIT_M2_usarmy_wd" call A3A_fnc_classNameToModel]],
    ["rhsgref_ins_2b14" call A3A_fnc_classNameToModel, ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]],
    ["RHS_M252_USMC_WD" call A3A_fnc_classNameToModel, ["C_Boat_Civil_01_F" call A3A_fnc_classNameToModel, "B_Boat_Transport_01_F" call A3A_fnc_classNameToModel, "C_Boat_Transport_02_F" call A3A_fnc_classNameToModel]]
];
