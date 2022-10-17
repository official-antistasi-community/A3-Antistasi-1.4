// WIP will come soon
A3A_logistics_vehicleHardpoints append [ 
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_u1300l\gm_u1300l_container",
		[
			[1,	[0,-0.15,-1.2],		[1,2,3]],
			[1,	[0,-0.95,-1.2],		[4,5,6,7]],
			[1,	[0,-1.75,-1.2],		[8,9,11]],
			[1,	[0,-2.55,-1.2],		[0,10]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo",
		[
			[1,	[0,1.7,-0.3],		[]],
			[1,	[0,0.9,-0.3],		[]],
			[1,	[0,0.0999999,-0.3],	[]],
			[1,	[0,-0.7,-0.3],		[]],
			[1,	[0,-1.5,-0.3],		[]],
			[1,	[0,-2.3,-0.3],		[]],
			[1,	[0,-3.1,-0.3],		[]],
			[1,	[0,-3.9,-0.3],		[]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container",
		[
			[1,	[0,0.6,-0.85],		[2,3]],
			[1,	[0,-0.2,-0.85],		[4,5]],
			[1,	[0,-1,-0.85],		[6,7]],
			[1,	[0,-1.8,-0.85],		[8,9]],
			[1,	[0,-2.6,-0.85],		[10,11,12]],
			[1,	[0,-3.4,-0.85],		[0 ]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container",
		[
			[1,	[0,0.85,-0.85],		[]],
			[1,	[0,0.05,-0.85],		[]],
			[1,	[0,-0.75,-0.85],	[]],
			[1,	[0,-1.55,-0.85],	[]],
			[1,	[0,-2.35,-0.85],	[]],
			[1,	[0,-3.15,-0.85],	[]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_u1300l\gm_u1300l_container_civ",
		[
			[1,	[0,-0.2,-0.85],		[1,2,3]],
			[1,	[0,-1,-0.85],		[4,5,6,7]],
			[1,	[0,-1.8,-0.85],		[8,9,11]],
			[1,	[0,-2.6,-0.85],		[0,10]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural4320\gm_ural4320_cargo.p3d",
		[
			[1,	[0,-0.2,-0.75],		[1,2,3]],
			[1,	[0,-1,-0.75],		[4,5,6]],
			[1,	[0,-1.8,-0.75],		[7,8,9]],
			[1,	[0,-2.6,-0.75],		[10,11,12]],
			[1,	[0,-3.4,-0.75],		[13,14]]
		]
	],
	["\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural375d\gm_ural375d_cargo.p3d",
		[
			[1,	[0,0.1,-0.75],		[1,2,3,4]],
			[1,	[0,-0.7,-0.75],		[5,6]],
			[1,	[0,-1.5,-0.75],		[7,8,9,10]],
			[1,	[0,-2.3,-0.75],		[11,12]]
		]
	]
];

//model           //offset        //rotation  //size  //recoil (if weapon)
A3A_logistics_attachmentOffset append [
	["\gm\gm_weapons\gm_machineguns\gm_mg3\gm_mg3_aatripod",			[0, -1, 1.45],      [0,0,0],    3,      100],
	["\gm\gm_weapons\gm_machineguns\gm_dshkm\gm_dshkm_aatripod",     	[0, -1, 1.7],      	[0,0,0], 	3,      100],
	["\gm\gm_weapons\gm_launchers\gm_milan\gm_milan_launcher_tripod",	[0, 0, 1.15],     	[0,-1,0],	4,      200],
	["\gm\gm_weapons\gm_launchers\gm_spg9\gm_spg9_tripod",				[0, 0, 1.0],      	[0,-1,0], 	4,      200],
	["\gm\gm_weapons\gm_launchers\gm_fagot\gm_fagot_launcher_tripod",	[0, 0.5, 1.175],   	[0,-1,0], 	4,      200]
];

A3A_logistics_coveredVehicles append [
    "\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural375d\gm_ural375d_cargo.p3d",
	"\gm\gm_vehicles\gm_land\gm_wheeled\gm_ural4320\gm_ural4320_cargo.p3d"
];

A3A_logistics_weapons append [
    ["\gm\gm_weapons\gm_machineguns\gm_mg3\gm_mg3_aatripod", 
		[]
	],
	["\gm\gm_weapons\gm_machineguns\gm_dshkm\gm_dshkm_aatripod", 
		[]
	],
    ["\gm\gm_weapons\gm_launchers\gm_milan\gm_milan_launcher_tripod", 
		[
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container", 
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container",
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"
		]
	],
	["\gm\gm_weapons\gm_launchers\gm_spg9\gm_spg9_tripod", 
		[
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container", 
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container",
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"
		]
	],
	["\gm\gm_weapons\gm_launchers\gm_fagot\gm_fagot_launcher_tripod", 
		[
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_452_container", 
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_451_container",
			"\gm\gm_vehicles\gm_land\gm_wheeled\gm_kat1\gm_kat1_454_cargo"
		]
	]
];