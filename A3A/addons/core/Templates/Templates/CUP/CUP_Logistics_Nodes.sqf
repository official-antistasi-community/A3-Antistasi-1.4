/*
This file covers:
  vehicle hardpoints, for loading loot boxes, Weapon and such.
  Offsets for the statics/crates/anything else you want to make loadable onto vehicles.
  weapon defines

*/
A3A_logistics_vehicleHardpoints append [
/*  	["modelpath", [
    [1, [0,0,0], [1,2,3,4]],//This line would assign a cargo node at 0,0,0 on the model, and block seats 1-4 when in use.
    [1, [0,0,0], [1,2,3,4]]//This line would assign a cargo node at 0,0,0 on the model, and block seats 1-4 when in use.
      ]],*/
      
    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_v3s\cup_v3s_open.p3d",[
        [1,         [0,0.6,-0.53],           [10,11]],
        [1,         [0,-0.2,-0.53],          [9]],
        [1,         [0,-1,-0.53],            [7,8]],
        [1,         [0,-1.8,-0.53],          [5,6]],
        [1,         [0,-2.6,-0.53],          [3,4,12,13]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_v3s\cup_v3s_transport.p3d",[
        [1,         [0,0.6,-0.63],           [10,11]],
        [1,         [0,-0.2,-0.63],          [9]],
        [1,         [0,-1,-0.63],            [7,8]],
        [1,         [0,-1.8,-0.63],          [5,6]],
        [1,         [0,-2.6,-0.63],          [3,4,12,13]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Ural\cup_Ural_open2.p3d",[
        [1,         [0,0.3,-0.495],           [2,3]],
        [1,         [0,-0.5,-0.495],          [4,5]],
        [1,         [0,-1.3,-0.495],          [6,7]],
        [1,         [0,-2.1,-0.495],          [8,9]],
        [1,         [0,-2.9,-0.495],          [10,11,12,13]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Ural\cup_Ural.p3d",[
        [1,         [0,0.3,-0.49],           [2,3]],
        [1,         [0,-0.5,-0.49],          [4,5]],
        [1,         [0,-1.3,-0.49],          [6,7]],
        [1,         [0,-2.1,-0.49],          [8,9]],
        [1,         [0,-2.9,-0.49],          [10,11,12,13]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_MTVR\CUP_MTVR.p3d",[
        [1,         [0,0.1,-0.42],           [10,11]],
        [1,         [0,-0.7,-0.42],          [8,9]],
        [1,         [0,-1.5,-0.42],          [6,7]],
        [1,         [0,-2.3,-0.42],          [4,5]],
        [1,         [0,-3.1,-0.42],          [2,3]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_T810\CUP_t810_vp2.p3d",[
        [1,         [-0,0.5,-1.3],          [9,10]],
        [1,         [-0,-0.3,-1.3],         [7,8]],
        [1,         [-0,-1.1,-1.3],         [2,6]],
        [1,         [-0,-1.9,-1.3],         [1,3]],
        [1,         [-0,-2.7,-1.3],         [4,5]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_T810\CUP_t810_v.p3d",[
        [1,         [-0,0.5,-0.58],          [9,10]],
        [1,         [-0,-0.3,-0.58],         [7,8]],
        [1,         [-0,-1.1,-0.58],         [2,6]],
        [1,         [-0,-1.9,-0.58],         [1,3]],
        [1,         [-0,-2.7,-0.58],         [4,5]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_UpHMMWV\CUP_M1152.p3d",[
        [1,         [0,-0.8,-1.575],          []],
        [1,         [0,-1.6,-1.575],          []]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_NewM998\model\CUP_nM1038.p3d",[
        [1,         [-0.15,-0.5,-1.07],        [3,5,6]],
        [1,         [-0.15,-1.3,-1.07],        [0,1,4]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Pickup\CUP_Pickup.p3d",[
        [1,         [0,-1,-0.84],          [0]],
        [1,         [0,-1.8,-0.84],        [1,2]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_unarmed",[
        [1,         [-0.05,-0.9,-0.71],         [3,4]],
        [1,         [-0.05,-1.7,-0.71],         [1,2]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Hilux\hiluxV2_armored_unarmed",[
        [1,         [-0.05,-0.95,-0.71],         [3,4]],
        [1,         [-0.05,-1.75,-0.71],         [1,2]]
    ]],

    ["\CUP\WheeledVehicles\CUP_WheeledVehicles_Datsun\CUP_datsun_civil.p3d",[
        [1,         [0,-0.8,-1.17],     [1,2]],
        [1,         [0,-1.6,-1.17],     [0]]
    ]]


];//To make it easier to navigate, it is a good idea to keep the lines for similar vehicles together. Usually, we list 4 wheeled vehicles, then 6 wheeled, then 8 wheeled, then boats. It is also good to keep multiple versions of the same vehicle together, such as covered and open versions of the same truck.




/*The last section is for defining the offsets for statics, crates and any other item you might want to load onto a vehicle.
  This is usually separated into 3 sections; Weapons, Crates and Other.
  The first 2 are self explanatory, the 3rd is for things like quadbikes, as they can be loaded onto vehicles if they are initialised properly.
  This is filled by listing the model path, the coordinate offset(for tweaking it so that its base is centered on the node), and any angle offset it needs (in case the weapon should be facing any other direction than forward by default.),
  finally you list the node size that the entry should use from 1 to x, for reference a crate usually is either 1 or 2, and a static is 2 or 4, but it can be any size you want EXCEPT 0 or negative numbers!!!!
  in addition if your defining offsets for weapons youd want to add in one more entry after size that of recoil, this is how much newtonian force is applied to the vehicle when you fire the static
*/
A3A_logistics_attachmentOffset append [
//model                                                                     //offset  //rotation            //size //recoil (if weapon)
["\CUP\Weapons\CUP_Weapons_StaticWeapons\DShKM\CUP_DShKM_mg.p3d", 			[0.25,-1,1.62],         [0,0,0],        4, 	        100],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\KORD\CUP_KORD_6u16sp.p3d", 		[0.05,-0.3,0.97],       [0,0,0],        4, 	        200],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\ZU23\CUP_zu23.p3d",				[-0.11,0,1.93],         [0,0,0],        7, 	        1000],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\SPG9\CUP_spg9.p3d", 				[0.04,0,0],             [-3,0.25,0],    4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\M2\CUP_m2_mg.p3d", 				[0.399,-0.4,1.04],      [0,0,0],        4, 	        100],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\IglaPod\CUP_igla_AA_pod.p3d", 		[0.35,-0,1.56],         [0,0,0],        4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\FIM92Pod\CUP_FIM92_AA_Pod.p3d", 	[0.04,-0.1,1.64],       [0,0,0],        4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\M252\CUP_81Mortar.p3d", 			[0.02,-0.25,0.69],      [0,0,0],        2, 	        2000],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\TOW\CUP_TOW_static.p3d", 			[0.03,-0.1,1.05],       [0,0,0],        4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\Kornet\CUP_Kornet.p3d", 			[-0.13,-0.15,0.744],    [0,0,0],        4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\Podnos\CUP_podnos_2b14_82mm.p3d", 	[-0.03,-0.1,0.74],      [0,0,0],        2, 	        2000],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\M2\CUP_L111A1_mg.p3d", 			[0.398,-0.2,1.01],      [0,0,0],        4, 	        100],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\Metis\CUP_metis.p3d", 				[-0,-0.15,1.01],        [-3,0.25,0],    4, 	        250],
["\CUP\Weapons\CUP_Weapons_StaticWeapons\RBS70\CUP_RBS70.p3d", 				[0.12,-0.15,1.35],      [0,0,0],        4, 	        250]
];

/*
    Next up is to add all covered or closed vehicles to this next section, this is needed to prevent statics being loaded inside of closed vehicles or covered vehicle, where they become usless, and it quite franckly looks silly.
    can be by classname or model
*/
A3A_logistics_coveredVehicles append [
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_MTVR\CUP_MTVR.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_Ural\cup_Ural.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_v3s\cup_v3s_transport.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_T810\CUP_t810_vp2.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_T810\CUP_t810_v.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_NewM998\model\CUP_nM1038.p3d",
    "\CUP\WheeledVehicles\CUP_WheeledVehicles_Datsun\CUP_datsun_civil.p3d"    //Covered and Normal Variant use the same model
];

/*
    Finally you need to declair weapons that you have added here, this is done with arrays consisting of pairs of the model of the weapon, and an array of all vehicle models the weapon is not allowed on.
    This blacklisted vehicles already include closed and covered vehicles so you don't have to add those
*/
A3A_logistics_weapons append [
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\DShKM\CUP_DShKM_mg.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\KORD\CUP_KORD_6u16sp.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\ZU23\CUP_zu23.p3d",	[]],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\SPG9\CUP_spg9.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\M2\CUP_m2_mg.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\IglaPod\CUP_igla_AA_pod.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\FIM92Pod\CUP_FIM92_AA_Pod.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\M252\CUP_81Mortar.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\TOW\CUP_TOW_static.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\Kornet\CUP_Kornet.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\Podnos\CUP_podnos_2b14_82mm.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\M2\CUP_L111A1_mg.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\Metis\CUP_metis.p3d", []],
    ["\CUP\Weapons\CUP_Weapons_StaticWeapons\RBS70\CUP_RBS70.p3d", []]
];
//That covers everything, you should make you file by replacing values in an already complete file rather than using this as the active files will have the proper commenting there already. Using this one would leave a tonne of unnecessary comments in the file.
