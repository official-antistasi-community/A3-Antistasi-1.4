//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
logistics_vehicleHardpoints = [

    // ---------- Vanilla ----------
    //Bickes
    //Quadbike
    ["\A3\Soft_F\Quadbike_01\Quadbike_01_F.p3d", [
        // always 1,    location                locked seats
        [1,             [0,-0.9,-0.5],          [0]]
    ]],

    //4x4s
    //Offroad
    ["\A3\soft_f\Offroad_01\Offroad_01_unarmed_F", [
        // always 1,    location				locked seats
        [1,	    	    [-0.05,-1.3,-0.72],		[3,4]],
        [1,	    	    [-0.05,-2.3,-0.72],		[1,2]]
    ]],

        //Small Truck
    ["\A3\soft_f_gamma\van_01\Van_01_transport_F.p3d", [
        [1,             [0,-0.7475,-0.65],      [2,3,4,5]],
        [1,             [0,-1.4375,-0.65],      [6,7]],
        [1,             [0,-2.2,-0.65],         [8,9]],
        [1,             [0,-3,-0.65],           [10,11]]
        ]],

        //Van Transport
    ["\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d", [
        [1,             [0,-1.245,-0.97],       []],
        [1,             [0,-2.49,-0.97],        [9,10]]
    ]],

        //Van Cargo
    ["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d", [
        [1,             [0,0.7025,-0.97],       []],
        [1,             [0,-0.1275,-0.97],      []],
        [1,             [0,-0.9575,-0.97],      []],
        [1,             [0,-1.7875,-0.97],      []],
        [1,             [0,-2.6175,-0.97],      []]
    ]],

    //6x6s
    //Zamak Open
    ["\A3\soft_f_beta\Truck_02\Truck_02_transport_F", [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //Zamak Covered
    ["\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d", [
        [1,             [0,0.7175,-0.82],       [2,3]],
        [1,             [0,-0.1125,-0.82],      [4,5,6,7]],
        [1,             [0,-0.9425,-0.82],      [8,9]],
        [1,             [0,-1.7725,-0.82],      [10,11]],
        [1,             [0,-2.6025,-0.82],      [12,13]],
        [1,             [0,-3.4325,-0.82],      [14,15]]
    ]],

    //CSAT Tempest open
    ["\A3\Soft_F_EPC\Truck_03\Truck_03_transport_F.p3d",[
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //CSAT Tempest closed
    ["\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d", [
        [1,             [0,-0.5175,-0.4],       [1,6]],
        [1,             [0,-1.3475,-0.4],       [9,7]],
        [1,             [0,-2.1775,-0.4],       [2,8]],
        [1,             [0,-3.0075,-0.4],       [3,10,12]],
        [1,             [0,-3.8375,-0.4],       [4]],
        [1,             [0,-4.65,-0.4],         [5,11]]
    ]],

    //8x8s
    //HEMTT open
    ["\A3\soft_f_beta\Truck_01\Truck_01_transport_F.p3d",[
        // always 1    location				    locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //HEMTT covered
    ["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d",[
        // always 1    location				    locked seats
        [1,             [0,0,-0.56],            [1,8,9,16]],
        [1,             [0,-0.8,-0.56],         [2,10]],
        [1,             [0,-1.7,-0.56],         [3,11]],
        [1,             [0,-2.6,-0.56],         [4,5,12,13]],
        [1,             [0,-3.5,-0.56],         [6,14]],
        [1,             [0,-4.4,-0.56],         [7,15]]
    ]],

    //Vanilla HEMTT Flatbed
    ["a3\Soft_F_Gamma\Truck_01\Truck_01_flatbed_F.p3d",[
        [1,             [0,0.6825,-0.88],       []],
        [1,             [0,-0.1475,-0.88],      []],
        [1,             [0,-0.9775,-0.88],      []],
        [1,             [0,-1.8075,-0.88],      []],
        [1,             [0,-2.6375,-0.88],      []],
        [1,             [0,-3.4675,-0.88],      []],
        [1,             [0,-4.2975,-0.88],      []]
    ]],

    //Vanilla HEMTT Cargo
    ["a3\Soft_F_Gamma\Truck_01\Truck_01_cargo_F.p3d", [
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
    ["\A3\boat_f_gamma\Boat_Civil_01\Boat_Civil_01_F", [
        [1,             [0,-0.9425,-1.1],       [0,1]],
        [1,             [0,-1.5725,-1.1],       []]
    ]],

    //Speedboat minigun
    ["\A3\Boat_F\Boat_Armed_01\Boat_Armed_01_minigun_F.p3d", [
        [1,             [0,3.2,-2.2],           [4,5]],
        [1,             [0,2.4,-2.2],           []]
    ]],

    //Transport rubber boat
    ["\A3\boat_f\Boat_Transport_01\Boat_Transport_01_F.p3d", [
        [1,             [0,0.7575,-1.1],        [0,1,2,3]],
        [1,             [0,-0.0725,-1.1],       []]
    ]],

    //Civilian transport boat (RHIB)
    ["\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d", [
        [1,             [0,1.8575,-0.7],        [0,1]],
        [1,             [0,1.0275,-0.7],        [2,6]]
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

        // ----------   RHS   ----------
	["rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",			            [0.0, 0, 1.08],		        [0, 1, 0],				    4,      500],		        //RHS TOW launcher
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg",					            [0.35, -0.3, 1.72],	        [0, 1, 0],				    4,      200],				//RHS M2HB machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					            [0.3, -0.1, 0.03],		    [1, 0, 0],				    4,      200],		        //RHS M2HB sitting machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat",            [0, 0, 1],	                [0, -1, 0],				    4,      200],		        //RHS mk.19 GMG, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				            [0.3, -0.5, 1.65],		    [0, 1, 0],				    4,      200],		        //RHS DShKM
	["rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				            [-0.5, -0.2, 1.32],	        [1, 0, 0],				    4,      200],		        //RHS DShKM sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",	            [0.22, -0.3, 1.65],	        [0, 1, 0],				    4,      300],		        //RHS Kord
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			            [0.1, -0.3, 1.34],	        [1, 0, 0],				    4,      300],		        //RHS Kord sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			            [-0.1, 0, 1.34],		    [1, 0, 0],				    4,      300],		        //RHS NSV sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			            [0.0, 0, 1.01],			    [1, 0, 0],				    4,      500],		        //RHS kornet, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				            [-0.1, 0, 1.03], 		    [-0.96,0.25,0],	            4,      500],		        //RHS SPG-9, facing 75 degrees to the left
	["\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			            [-0.4, 0, 1.25],		    [0, -1, 0],	                4,      200],		        //RHS AGS-30 the russian GMG, facing right
	["rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod",			            [0.3, 0, 1.59],			    [0, 1, 0],				    4,      500],		        //RHS double Igla launcher
    ["\rhsafrf\addons\rhs_heavyweapons\ZU23\zu23",                              [0,0,2],                    [0,1,0],                    7,      500],               //RHS ZU-23

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
    ["\A3\Static_F_Gamma\AT_01\AT_01.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\AA_01\AA_01.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\GMG_01\GMG_01_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F_Gamma\HMG_01\HMG_01_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\static_f\Mortar_01\Mortar_01_F",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d","\A3\boat_f_gamma\Boat_Civil_01\Boat_Civil_01_F","\A3\boat_f\Boat_Transport_01\Boat_Transport_01_F.p3d","\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d"]],
    ["\A3\Static_F\HMG_02\HMG_02_high_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    ["\A3\Static_F\HMG_02\HMG_02_F.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d","\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d","\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d","\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d"]],
    //RHS
    ["rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsusf\addons\rhsusf_heavyweapons\m2_mg",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod",["\a3\Soft_F_Orange\Van_02\Van_02_vehicle_F.p3d","\a3\Soft_F_Orange\Van_02\Van_02_transport_F.p3d"]],
    ["\rhsafrf\addons\rhs_heavyweapons\ZU23\zu23", ["a3\Soft_F_Gamma\Truck_01\Truck_01_cargo_F.p3d"]]
]; 