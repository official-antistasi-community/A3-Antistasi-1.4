/*
This file covers:
  vehicle hardpoints, for loading loot boxes, Weapon and such.
  Offsets for the statics/crates/anything else you want to make loadable onto vehicles.
  weapon defines

*/

// To make it easier to navigate, it is a good idea to keep the lines for similar vehicles together. 
// Usually, we list 4 wheeled vehicles, then 6 wheeled, then 8 wheeled, then boats. 
// It is also good to keep multiple versions of the same vehicle together, such as covered and open versions of the same truck.
A3A_logistics_vehicleHardpoints append [
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_u1300l\gm_u1300l_container_civ",[
		[1,		[0,-0.4,-0.7],		[1,2,3,4,5]],
		[1,		[0,-1.2,-0.7],		[6,7]],
		[1,		[0,-2,-0.7],		[8,9,10,11]]
	]],

	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural375d\gm_ural375d_cargo.p3d",[
		[1,		[0,0.1,-0.7],		[1,2,3,4]],
		[1,		[0,-0.7,-0.7],		[5,6]],
		[1,		[0,-1.5,-0.7],		[7,8,9,10]],
		[1,		[0,-2.3,-0.7],		[11,12,13,14]]
	]],

	["\CUP\WheeledVehicles\CUP_WheeledVehicles_Pickup\CUP_Pickup.p3d",[
		[1,		[0,-1.8,-0.7],		[1,2]]
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
    ]],

	["\cwr3\expansions\cwr3_expansion_uk\vehicles\fv620\cwr3_alvis_stalwart_transport.p3d",[
		[1,		[-0.1,0.8,-0.3],		[0,1]],
		[1,		[-0.1,0,-0.3],			[2,3]],
		[1,		[-0.1,-0.8,-0.3],		[4,5,6,7]],
		[1,		[-0.1,-1.6,-0.3],		[8,9]]
	]],

	["\CUP\WheeledVehicles\CUP_WheeledVehicles_MTVR\CUP_MTVR.p3d",[
        [1,         [0,0.1,-0.42],           [10,11]],
        [1,         [0,-0.7,-0.42],          [8,9]],
        [1,         [0,-1.5,-0.42],          [6,7]],
        [1,         [0,-2.3,-0.42],          [4,5]],
        [1,         [0,-3.1,-0.42],          [2,3]]
    ]],

	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container",[
		[1,		[-0.05,0.6,-0.8],		[]],
		[1,		[-0.05,-0.2,-0.8],		[]],
		[1,		[-0.05,-1,-0.8],		[]],
		[1,		[-0.05,-1.8,-0.8],		[]],
		[1,		[-0.05,-2.6,-0.8],		[]],
		[1,		[-0.05,-3.4,-0.8],		[]]
	]],

	["\cwr3\vehicles\cwr3_m939\cwr3_m939_empty.p3d",[
		[1,		[0,0.1,-0.5],		[]],
		[1,		[0,-0.7,-0.5],		[]],
		[1,		[0,-1.5,-0.5],		[]],
		[1,		[0,-2.3,-0.5],		[]],
		[1,		[0,-3.1,-0.5],		[]],
		[1,		[0,-3.9,-0.5],		[]]
	]],

	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_u1300l\gm_u1300l_container",[
		[1,		[0,-0.2,-1.2],		[1,2,3]],
		[1,		[0,-1,-1.2],		[4,5]],
		[1,		[0,-1.8,-1.2],		[6,7,8,9]],
		[1,		[0,-2.6,-1.2],		[0,10]]
	]],

	["vn\wheeled_f_vietnam\m54\vn_wheeled_m54_01.p3d",[
		[1,		[0,-0.6,-0.55],		[0,1,2,3]],
		[1,		[0,-1.4,-0.55],		[4,5]],
		[1,		[0,-2.2,-0.55],		[6,7]],
		[1,		[0,-3,-0.55],		[8,9]]
	]]
];

/*
	This section is for defining the offsets for statics, crates and any other item you might want to load onto a vehicle.
	This is usually separated into 3 sections; Weapons, Crates and Other.
	The first 2 are self explanatory, the 3rd is for things like quadbikes, as they can be loaded onto vehicles if they are initialised properly.
	This is filled by listing the model path, the coordinate offset(for tweaking it so that its base is centered on the node), and any angle offset it needs (in case the weapon should be facing any other direction than forward by default.),
	finally you list the node size that the entry should use from 1 to x, for reference a crate usually is either 1 or 2, and a static is 2 or 4, but it can be any size you want EXCEPT 0 or negative numbers!!!!
	in addition if your defining offsets for weapons youd want to add in one more entry after size that of recoil, this is how much newtonian force is applied to the vehicle when you fire the static
*/

A3A_logistics_attachmentOffset append [

];

/*
    Next up is to add all covered or closed vehicles to this next section, this is needed to prevent statics being loaded inside of closed vehicles or covered vehicle, where they become usless, and it quite franckly looks silly.
    can be by classname or model
*/
A3A_logistics_coveredVehicles append [
	"\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural375d\gm_ural375d_cargo.p3d",
	"\CUP\WheeledVehicles\CUP_WheeledVehicles_MTVR\CUP_MTVR.p3d",
	"vn\wheeled_f_vietnam\m54\vn_wheeled_m54_01.p3d"
];

/*
    Finally you need to declare weapons that you have added here, this is done with arrays consisting of pairs of the model of the weapon, and an array of all vehicle models the weapon is not allowed on.
    This blacklisted vehicles already include closed and covered vehicles so you don't have to add those
*/
A3A_logistics_weapons append [

];