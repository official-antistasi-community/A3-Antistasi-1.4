//The list of hardpoints for vehicles
/*
the last element is the list of seats to disable for specific node

Points are laid out at follows: Type, location, locked seats
[0/1 = hardpoint/crate, [ L/R, F/B, U/D], [#,#,#,#]]
*/
jnl_vehicleHardpoints = [

// ---------- Vanilla ----------
//4x4s
//Offroad
  ["\A3\soft_f\Offroad_01\Offroad_01_unarmed_F", [
    //type, location				locked seats
    [0,		[-0.04,-1.7,-0.72],		[1,2,3,4]],		//weapon node
    [1,		[-0.04,-1.7,-0.72],		[1,2,3,4]]		//cargo node
  ]],

//Small Truck
  ["\A3\soft_f_gamma\van_01\Van_01_transport_F.p3d", [
    [0,		[0,-1.60422,-0.63],			[2,3,4,5,6,7,8,9]],
    [1,		[0,-1.06937,-0.63],			[2,3,4,5]],
    [1,		[0,-2.61185,-0.63],			[6,7,8,9,10,11]]
  ]],

//6x6s
//Zamak Open
  ["\A3\soft_f_beta\Truck_02\Truck_02_transport_F", [
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,0,-0.81],					[2,3,4,5,6,7,8]],
    [1,		[0,-2.1,-0.81],					[9,10,11,12,13]]
  ]],

//Zamak Covered
	["\A3\soft_f_beta\Truck_02\Truck_02_covered_F.p3d", [
	    [1,		[0,0,-0.81],					[2,3,4,5,6,7,8]],
		[1,		[0,-2.1,-0.81],					[9,10,11,12,13]]
	]],

//CSAT Tempest open
	["\A3\Soft_F_EPC\Truck_03\Truck_03_transport_F.p3d",[
		[1,	[0.0,-0.9,-0.4],		[1,7,6,9]],
		[1,	[0.0,-2.5,-0.4],		[2,3,8,12]],
		[1,	[0.0,-4.1,-0.4],			[4,5,11,10]]
	]],

//CSAT Tempest closed
	["\A3\Soft_F_EPC\Truck_03\Truck_03_covered_F.p3d",[
    [1,	[0.0,-0.9,-0.4],		[1,7,6,9]],
    [1,	[0.0,-2.5,-0.4],		[2,3,8,12]],
    [1,	[0.0,-4.1,-0.4],		[4,5,11,10]]
	]],

//8x8s
//HEMTT open
  ["\A3\soft_f_beta\Truck_01\Truck_01_transport_F.p3d",[
    [1,[0,-0.222656,-0.5],[3,4,10,11,2]],
    [1,[0,-2.16602,-0.5],[1,16,8,9]],
    [1,[0,-4.11816,-0.5],[5,6,12,13,15,7]]
  ]],

//HEMMT closed
  ["\A3\soft_f_beta\Truck_01\Truck_01_covered_F.p3d",[
    [1,[0,-0.224609,-0.5],[1,16,8,9,2]],
    [1,[0,-2.16016,-0.5],[3,4,10,11]],
    [1,[0,-4.10547,-0.5],[5,6,12,13,15]]
  ]],

//Vanilla HEMTT Flatbed
  ["a3\Soft_F_Gamma\Truck_01\Truck_01_flatbed_F.p3d",[
      [0,[0.0,-0.29,-0.79],[]],
      [0,[0.0,-2.97,-0.79],[]],
      [1,[0.0,0,-0.8],[]],
      [1,[0.0,-1.75,-0.8],[]],
      [1,[0.0,-3.5,-0.8],[]]
  ]],

//Vanilla HEMTT Cargo
  ["a3\Soft_F_Gamma\Truck_01\Truck_01_cargo_F.p3d",[
      [0,[0.0,-0.29,-0.51],[]],
      [0,[0.0,-2.97,-0.51],[]],
      [1,[0.0,0.5,-0.51],[]],
      [1,[0.0,-1.25,-0.51],[]],
      [1,[0.0,-2.97,-0.51],[]]
  ]],

//Boats
//Motorboat civilian
  ["\A3\boat_f_gamma\Boat_Civil_01\Boat_Civil_01_F", [
    [1,		[0,-1.697,-0.874],	[]]
  ]],

//Speedboat minigun
  ["\A3\Boat_F\Boat_Armed_01\Boat_Armed_01_minigun_F.p3d", [
    [1,		[0,2.63701,-2.16123],	[]]
  ]],

//Transport rubber boat
  ["\A3\boat_f\Boat_Transport_01\Boat_Transport_01_F.p3d", [
    [1,		[0,0.0189972,-1.04965],	[]]
  ]],

//Civilian transport boat
  ["\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d", [
    [1, [0,1.233,-0.72029],			[]]
  ]],

//Tanoa boat
  ["\A3\Boat_F_Exp\Boat_Transport_02\Boat_Transport_02_F.p3d",[
      [1,[-0.0615234,0.492443,0.322869],[5,6,2]]
  ]],

// ---------- RHS ----------
//Urals
//Ural Open
  ["\rhsafrf\addons\rhs_a2port_car\Ural\Ural_open.p3d",[
    [1,         [0,-0.3,-0.2],    [12,3,13,4,5,2]  ],
    [1,         [0,-2.2,-0.2],    [6,7,8,9,11,10]  ]
  ]],

//Ural Open 2
  ["\rhsafrf\addons\rhs_a2port_car\Ural\Ural_open2.p3d",[
    [1,         [0,-0.3,-0.2],    [12,3,13,4,5,2]  ],
    [1,         [0,-2.2,-0.2],    [6,7,8,9,11,10]  ]
  ]],

//Ural Closed
  ["rhsafrf\addons\rhs_a2port_car\Ural\Ural.p3d", [
    [1,         [0,-0.3,-0.2],    [12,3,13,4,5,2]  ],
    [1,         [0,-2.2,-0.2],    [6,7,8,9,11,10]  ]
  ]],

//Kamazs
  ["rhsafrf\addons\rhs_kamaz\rhs_kamaz5350", [
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,0,-0.81],					[2,3,4,5,6,7,8]],
    [1,		[0,-2.1,-0.81],					[9,10,11,12,13]]
  ]],

//Zils
//Zil 131
["rhsafrf\addons\rhs_zil131\rhs_zil131", [
  [1, [0,-0.1,-0.45], [10,11,2,3,4,5]],
  [1, [0,-1.8,-0.45], [6,7,8,9]]
]],

//Gaz
  ["\rhsafrf\addons\rhs_gaz66\rhs_gaz66.p3d", [
    [0,		[0,-0.88974,-0.610707],		[]], //Weapon node
    [1,		[0,-0.135376,-0.610707],	[12,3,1,4,5,2]], //Cargo node
    [1,		[0,-1.73634,-0.610707],		[6,7,8,9,11,10]]
  ]],

//USAF 4x4 Trucks
  ["\rhsusf\addons\rhsusf_fmtv\M1078A1P2",[
  [1,[0.0,0.0,-0.48],[12,3,13,4,5,2]],
  [1,[0.0,-1.8,-0.48],[6,7,8,9,11,10]]//
  ]],

//USAF Truck "rhsusf_M1078A1P2_B_WD_fmtv_usarmy" and "rhsusf_M1078A1P2_B_WD_open_fmtv_usarmy"
  ["\rhsusf\addons\rhsusf_fmtv\M1078A1P2_B",[
  [1,[-0.00732422,0.0195313,-0.487986],[12,3,13,4,5,2]],
  [1,[0.0366211,-1.80859,-0.435032],[6,7,8,9,11,10]]
  ]],

//USAF 6x6 Trucks
  ["\rhsusf\addons\rhsusf_fmtv\M1083A1P2",[
    [1,[0.0,0.0,-0.45], [12,3,13,4,5,2]],
    [1,[0.0,-1.8,-0.45], [6,7,8,9,11,10]]
  ]],

// ---------- IFA ----------
//GMC
  ["\WW2\Assets_m\Vehicles\Trucks_m\IF_Gmc353Truck.p3d",[
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,0.374054,-0.0936584],					[2,3,4,5,6,7,8]]
  ]],

//Opel Blitz
  ["\WW2\Assets_m\Vehicles\Trucks_m\IF_Opelblitz.p3d",[
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,-0.275879,-0.105191],					[2,3,4,5,6,7,8]]
  ]],

//Opel Blitz Covered
  ["\WW2\Assets_m\Vehicles\Trucks_m\IF_Opelblitz_Tent.p3d",[
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,-0.275391,-0.105209],					[2,3,4,5,6,7,8]]
  ]],

//Us6
  ["\WW2\Assets_m\Vehicles\Trucks_m\IF_Us6.p3d",[
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,-0.829102,0.173984],					[2,3,4,5,6,7,8]]
  ]],

//Zis
  ["\WW2\Assets_m\Vehicles\Trucks_m\IF_Zis5v.p3d",[
    [0,		[-0.000671387,-1.31882,-0.81],	[2,3,4,5,6,7,8,9,10,11,12,13]],
    [1,		[0,-0.657227,-0.817673],					[2,3,4,5,6,7,8]]
  ]],

// ---------- 3CB ----------
//MAN Trucks
//4x4s
//Flatbed
  ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_man\uk3cb_man_4x4_cargo.p3d",[
    [1,[-0.00610352,2.5175781,-1.254599],[]],
    [1,[0.0383301,0.51055,-1.254599],[]]
  ]],

//6x6s
//Flatbed
  ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_man\uk3cb_man_6x6_cargo.p3d",[
    [1,[-0.00610352,4.5175781,-1.254599],[]],
    [1,[-0.00610352,2.5175781,-1.254599],[]],
    [1,[0.0383301,0.51055,-1.254599],[]]
  ]],

//v3s
//Recovery
["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_v3s\uk3cb_v3s_recovery.p3d",[
//TYPE, [left/right,   for/aft,  up/down], seat disabler
    [1,[-0.00610352,-0.5175781,-0.504599],[]],
    [1,[0.0383301,-2.51055,-0.504599],[]]
]],

//Closed
["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_v3s\uk3cb_v3s_transport.p3d",[
//TYPE, [left/right,   for/aft,  up/down], seat disabler
    [1,[-0.00610352,-0.5175781,-0.504599],[10,3,11,4,5,2]],
    [1,[0.0383301,-2.51055,-0.504599],[6,7,8,9,12,13]]
]],

//Open
["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\wheeled\UK3CB_Factions_Vehicles_v3s\uk3cb_v3s_open.p3d",[
//TYPE, [left/right,   for/aft,  up/down], seat disabler
    [1,[-0.00610352,-0.5175781,-0.504599],[10,3,11,4,5,2]],
    [1,[0.0383301,-2.51055,-0.504599],[6,7,8,9,12,13]]
]]

//Other Recovery Trucks

//Boats

// ---------- MODNAME ----------

];

//lock seats when cargo is added
jnl_vehicleLockedSeats = [
	["\A3\soft_f\Offroad_01\Offroad_01_unarmed_F",[1,2,3,4]],
	["\A3\soft_f_gamma\van_01\Van_01_transport_F.p3d",[]],
	["\A3\soft_f_beta\Truck_02\Truck_02_transport_F",[2,3,4,5,6,7,8,9,10,11,12,13]]
];

//The list of static weapons that can be attached to a certain vehicle
jnl_allowedWeapons = [
	//Offroad
	["\A3\soft_f\Offroad_01\Offroad_01_unarmed_F", [
		"\A3\Static_F_Gamma\AT_01\AT_01.p3d",							//AT titan, facing to the right
		"\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					//Static GMG
		"\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					//Static HMG
		"rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",				//RHS TOW launcher
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg",						//RHS M2HB machinegun
		"\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				//RHS DShKM
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",		//RHS Kord
		"\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			//RHS kornet, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				//RHS SPG-9, facing 75 degrees to the left
		"rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod"				//RHS double Igla launcher
	]],
	//Boxer truck
	["\A3\soft_f_gamma\van_01\Van_01_transport_F.p3d", [
		"\A3\Static_F_Gamma\AT_01\AT_01.p3d",							//AT titan, facing to the right
		"\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					//Static GMG
		"\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					//Static HMG
		"rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",				//RHS TOW launcher
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg",						//RHS M2HB machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					//RHS M2HB sitting machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat", //RHS mk.19 GMG, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				//RHS DShKM
		"rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				//RHS DShKM sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",		//RHS Kord
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			//RHS Kord sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			//RHS NSV sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			//RHS kornet, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				//RHS SPG-9, facing 75 degrees to the left
		"\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			//RHS AGS-30 the russian GMG, facing to the right
		"rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod"				//RHS double Igla launcher
	]],
	//Zamak
	["\A3\soft_f_beta\Truck_02\Truck_02_transport_F", [
		"\A3\Static_F_Gamma\AT_01\AT_01.p3d",							//AT titan, facing to the right
		"\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					//Static GMG
		"\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					//Static HMG
		"rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",				//RHS TOW launcher
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg",						//RHS M2HB machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					//RHS M2HB sitting machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat", //RHS mk.19 GMG, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				//RHS DShKM
		"rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				//RHS DShKM sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",		//RHS Kord
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			//RHS Kord sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			//RHS NSV sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			//RHS kornet, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				//RHS SPG-9, facing 75 degrees to the left
		"\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			//RHS AGS-30 the russian GMG, facing to the right
		"rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod"				//RHS double Igla launcher
	]],
	//RHS Gaz-66 truck
	["\rhsafrf\addons\rhs_gaz66\rhs_gaz66.p3d", [
		"\A3\Static_F_Gamma\AT_01\AT_01.p3d",							//AT titan, facing to the right
		"\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					//Static GMG
		"\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					//Static HMG
		"rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",				//RHS TOW launcher
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg",						//RHS M2HB machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					//RHS M2HB sitting machinegun
		"\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat", //RHS mk.19 GMG, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				//RHS DShKM
		"rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				//RHS DShKM sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",		//RHS Kord
		"\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			//RHS Kord sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			//RHS NSV sitting, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			//RHS kornet, facing to the right
		"\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				//RHS SPG-9, facing 75 degrees to the left
		"\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			//RHS AGS-30 the russian GMG, facing to the right
		"rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod"				//RHS double Igla launcher
	]]
];

//The list of offsets for static weapons. To attach a weapon to a vehicle you get the hardpoint position and add the attachment offset to it, then pass this to attachTo command.
//Each element is: [model name, offset, vectorDir]
jnl_attachmentOffset = [

	//weapons														//location				//rotation				//type 	//discription
	["\A3\Static_F_Gamma\AT_01\AT_01.p3d",							[-0.5, 0.0, 1.05],		[1, 0, 0],				0],		//AT titan, facing to the right
	["\A3\Static_F_Gamma\GMG_01\GMG_01_high_F.p3d",					[0.2, -0.3, 1.7],		[0, 1, 0],				0],		//Static GMG
	["\A3\Static_F_Gamma\HMG_01\HMG_01_high_F.p3d",					[0.2, -0.3, 1.7],		[0, 1, 0],				0],		//Static HMG
	["rhsusf\addons\rhsusf_heavyweapons\TOW\TOW_static",			[0.0, -0.3, 1.1],		[0, 1, 0],				0],		//RHS TOW launcher
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg",					[0.35, -0.35, 1.7],		[0, 1, 0],				0],		//RHS M2HB machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\m2_mg2",					[0.3, -0.2, -0.03],		[1, 0, 0],				0],		//RHS M2HB sitting machinegun
	["\rhsusf\addons\rhsusf_heavyweapons\Mk19_minitripod\mk19_stat",[-0.4, -0.25, 0.95],	[1, 0, 0],				0],		//RHS mk.19 GMG, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg",				[0.3, -0.3, 1.7],		[0, 1, 0],				0],		//RHS DShKM
	["rhsafrf\addons\rhs_heavyweapons\DShKM\DShKM_mg2",				[-0.25, -0.25, 1.3],	[1, 0, 0],				0],		//RHS DShKM sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\KORD_6u16sp",	[0.22, -0.42, 1.65],	[0, 1, 0],				0],		//RHS Kord
	["\rhsafrf\addons\rhs_heavyweapons\mg\bis_kord\kord",			[0.05, -0.2, 1.3],		[1, 0, 0],				0],		//RHS Kord sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\mg\rhs_nsv_tripod",			[0, -0.2, 1.25],		[1, 0, 0],				0],		//RHS NSV sitting, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\kornet\kornet.p3d",			[0.0, 0, 0.5],			[1, 0, 0],				0],		//RHS kornet, facing to the right
	["\rhsafrf\addons\rhs_heavyweapons\spg9\spg9.p3d",				[-0.5, 0, 0.00], 		[-0.965926,0.258819,0],	0],		//RHS SPG-9, facing 75 degrees to the left
	["\rhsafrf\addons\rhs_heavyweapons\AGS30\AGS_static",			[-0.3, 0, 1.20],		[0.939693,-0.34202,0],	0],		//RHS AGS-30 the russian GMG, facing right
	["rhsafrf\addons\rhs_heavyweapons\igla\igla_AA_pod",			[0.3, 0, 1.50],			[0, 1, 0],				0],		//RHS double Igla launcher

	//medium size crate												//location				//rotation				//type 	//discription
	["A3\Weapons_F\Ammoboxes\AmmoVeh_F",							[0,0,0.85],				[1,0,0],				1],		//Vehicle ammo create
	["\A3\Props_F_Orange\Humanitarian\Supplies\PaperBox_01_open_boxes_F.p3d", [0,0,0.85],	[1,0,0],				1], 	//Stef test supplybox
	["\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_medium_F.p3d", [0,0,0.85],			[1,0,0],				1], 	//Stef test Devin crate1
	["\A3\Weapons_F\Ammoboxes\Proxy_UsBasicAmmoBox.p3d",			[0,0,0.85],				[1,0,0],				1], 	//Stef test Devin crate2
	["\A3\Weapons_F\Ammoboxes\Proxy_UsBasicExplosives.p3d",			[0,0,0.85],				[1,0,0],				1], 	//Stef test Devin crate3
	["\A3\Weapons_F\Ammoboxes\Supplydrop.p3d",						[0, 0, 0.95],			[1,0,0],				1],		//Ammodrop crate
	["\A3\Soft_F\Quadbike_01\Quadbike_01_F.p3d",					[0, 0, 1.4],			[0,1,0],				1],		//Quadbike
	["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_GER_Ammo.p3d",			[0,0,0.85],				[1,0,0],				1],		//ifa ammo
	["\WW2\Assets_m\Weapons\Ammoboxes_m\IF_SU_Ammo.p3d",			[0,0,0.85],				[1,0,0],				1]		//ifa ammo
];


//todo replace with real items that are avalable
jng_staticWeaponList = [];
_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");
{
	_simulation = gettext (_x >> "simulation");
	if(tolower _simulation isEqualTo "tankx")then{
		if !(getnumber (_x >> "maxspeed") > 0) then {
			jng_staticWeaponList pushBack configName _x;;
		};
	};
} foreach ("isclass _x && {getnumber (_x >> 'scope') == 2} && {gettext (_x >> 'crew') != _defaultCrew}" configclasses (configfile >> "cfgvehicles"));

jnl_initCompleted = true;
