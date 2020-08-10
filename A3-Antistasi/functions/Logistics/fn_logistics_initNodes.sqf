_classNameToModel = {
    params ["_className"];
    getText (configFile >> "CfgVehicles" >> _className >> "model");
};

//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
logistics_vehicleHardpoints = [

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
        // always 1,    location				locked seats
        [1,	    	    [-0.05,-1.3,-0.72],		[3,4]],
        [1,	    	    [-0.05,-2.3,-0.72],		[1,2]]
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
        // always 1    location				    locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //HEMTT covered
    ["B_Truck_01_covered_F" call _classNameToModel,[
        // always 1    location				    locked seats
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
    ]]

    // ---------- MODNAME ----------

];

//Each element is: [model name, offset, vectorDir, nodes used, recoil(weapons only)]
logistics_attachmentOffset = [

    //weapons														          //location				  //rotation				  //size 	//recoil            //description
        // ---------- Vanilla ----------
	["\A3\Static_F_Gamma\AT_01\AT_01.p3d",							            [-0.5, 0.0, 1.05],		    [1, 0, 0],				    2,      500],               //AT titan, facing to the right
    ["\A3\Static_F_Gamma\AA_01\AA_01.p3d",							            [-0.5, 0.0, 1.05],		    [1, 0, 0],				    2,      500],               //AA titan, facing to the right
	["\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					            [0.2, -0.4, 1.7],		    [0, 1, 0],				    2,      200],               //Static GMG High
	["\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					            [0.2, -0.4, 1.7],		    [0, 1, 0],				    2,      200],		        //Static HMG High
    ["\A3\Static_F_Gamma\GMG_01\GMG_01_F.p3d",					                [0, 0, 1.19],		        [0, -1, 0],				    4,      200],               //Static GMG
	["\A3\Static_F_Gamma\HMG_01\HMG_01_F.p3d",					                [0, 0, 1.19],		        [0, -1, 0],				    4,      200],		        //Static HMG
    ["\A3\static_f\Mortar_01\Mortar_01_F",                                      [-0.1,-0.5,0.79],           [0, 1, 0],                  2,      6000],              //Mortar
    ["\A3\Static_F\HMG_02\HMG_02_high_F.p3d",                                   [0.2, -0.5, 1.7],           [0, 1, 0],                  4,      200],               //M2 High
    ["\A3\Static_F\HMG_02\HMG_02_F.p3d",                                        [-0.2, 0, 1.3],             [0, -1, 0],                 4,      200],               //M2

        // ----------   RHS   ----------                                                                                                        //RHS vehicles are heavier than vanilla
	["rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",			            [0.0, 0, 1.08],		        [0, 1, 0],				    4,      2000],		        //RHS TOW launcher
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg",					            [0.35, -0.3, 1.72],	        [0, 1, 0],				    4,      800],				//RHS M2HB machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					            [0.3, -0.1, 0.03],		    [1, 0, 0],				    4,      800],		        //RHS M2HB sitting machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat",            [0, 0, 1],	                [0, -1, 0],				    4,      800],		        //RHS mk.19 GMG, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				            [0.3, -0.5, 1.65],		    [0, 1, 0],				    4,      800],		        //RHS DShKM
	["rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				            [-0.5, -0.2, 1.32],	        [1, 0, 0],				    4,      800],		        //RHS DShKM sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",	            [0.22, -0.3, 1.65],	        [0, 1, 0],				    4,      1000],		        //RHS Kord
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			            [0.1, -0.3, 1.34],	        [1, 0, 0],				    4,      1000],		        //RHS Kord sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			            [-0.1, 0, 1.34],		    [1, 0, 0],				    4,      1000],		        //RHS NSV sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			            [0.0, 0, 1.01],			    [1, 0, 0],				    4,      2000],		        //RHS kornet, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				            [-0.1, 0, 1.03], 		    [-0.96,0.25,0],	            4,      2000],		        //RHS SPG-9, facing 75 degrees to the left
	["\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			            [-0.4, 0, 1.25],		    [0, -1, 0],	                4,      800],		        //RHS AGS-30 the russian GMG, facing right
	["rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod",			            [0.3, 0, 1.59],			    [0, 1, 0],				    4,      2000],		        //RHS double Igla launcher
    ["\rhsafrf\addons\rhs_heavyweapons\ZU23\zu23",                              [0,0,2],                    [0,1,0],                    7,      2000],               //RHS ZU-23 //no rhs vehicle can fit it :D

    //medium size crate											              //location			      //rotation		          //size 	                    //description
    ["A3\Weapons_F\Ammoboxes\AmmoVeh_F",							            [0,0,0.85],			    	[1,0,0],		    		2],		                    //Vehicle ammo create
    ["\A3\Props_F_Orange\Humanitarian\Supplies\PaperBox_01_open_boxes_F.p3d",   [0,0,0.85],	                [1,0,0],			    	2],		                    //Stef test supplybox
    ["\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_medium_F.p3d",         [0,0,0.85],		        	[1,0,0],			    	2],		                    //Stef test Devin crate1
    ["\A3\Weapons_F\Ammoboxes\Proxy_UsBasicAmmoBox.p3d",			            [0,0,0.85],				    [1,0,0],		    		2],		                    //Stef test Devin crate2
    ["\A3\Weapons_F\Ammoboxes\Proxy_UsBasicExplosives.p3d",			            [0,0,0.85],			    	[1,0,0],		    		2],		                    //Stef test Devin crate3
    ["\A3\Weapons_F\Ammoboxes\Supplydrop.p3d",						            [0, 0, 0.95],		    	[1,0,0],			    	2],		                    //Ammodrop crate
    ["\A3\Soft_F\Quadbike_01\Quadbike_01_F.p3d",				            	[0, 0, 1.4],		    	[0,1,0],			    	2],		                    //Quadbike
    ["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_GER_Ammo.p3d",			            [0,0,0.85],			    	[1,0,0],		    		2],		                    //ifa ammo
    ["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_SU_Ammo.p3d",			            [0,0,0.85],			    	[1,0,0],			    	2],		                    //ifa ammo

    //small size crate										                  //location				  //rotation			      //size 	                    //description
    ["\A3\Supplies_F_Exp\Ammoboxes\Equipment_Box_F.p3d",						[0,0,0.44],			    	[1,0,0],			    	1],		                    //Equipment box
    ["\A3\weapons_F\AmmoBoxes\WpnsBox_F",							            [0,0,0.22],				    [0,0,0],			    	1]		                    //surrender crates
];

//elements are [Weapon model, [vehicles weapon is not allowed on]]
logistics_weapons = [
    //vanilla
    ["\A3\Static_F_Gamma\AT_01\AT_01.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\AA_01\AA_01.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\GMG_01\GMG_01_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\HMG_01\HMG_01_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\static_f\Mortar_01\Mortar_01_F",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d","\A3\boat_f_gamma\Boat_Civil_01\Boat_Civil_01_F","\A3\boat_f\Boat_Transport_01\Boat_Transport_01_F.p3d","\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d"]],
    ["\A3\Static_F\HMG_02\HMG_02_high_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F\HMG_02\HMG_02_F.p3d",["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    //RHS
    ["rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",[]],
    ["\rhsusf\addons\rhsusf_heavyweapons\m2_mg",[]],
    ["\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",[]],
    ["\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",[]],
    ["rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",[]],
    ["rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod",[]],
    ["\rhsafrf\addons\rhs_heavyweapons\ZU23\zu23", ["rhsusf_M977A4_usarmy_wd" call _classNameToModel, "rhsusf_M977A4_BKIT_usarmy_wd" call _classNameToModel, "rhsusf_M977A4_BKIT_M2_usarmy_wd" call _classNameToModel]]
]; 

//coverd vehicles
_coveredVehicles = ["C_Van_02_vehicle_F","C_Van_02_transport_F","rhsgref_nat_ural_work", "rhs_kamaz5350", "rhs_zil131_base", "rhs_gaz66_vmf", "rhsusf_M1078A1P2_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_WD_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", "rhsusf_M1083A1P2_WD_fmtv_usarmy"];
{
    private _blackList = (_x#1);
    {
        private _model = _x call _classNameToModel;
        if !(_model isEqualTo "") then {_blackList pushBack _model};      
    } forEach _coveredVehicles;   
} forEach logistics_weapons;