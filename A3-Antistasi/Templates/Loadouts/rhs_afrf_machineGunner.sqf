[//Loadout
	[//Primary Weapon
		"rhs_weap_pkp",                    //Weapon                                                       
		"",                          //Muzzle 
		"",                      //Rail
		"rhs_acc_pkas",                      //Sight
		["rhs_100Rnd_762x54mmR_7N13",100],                 //Primary Weapon       
		[],                                      //Secondary Magazine
		""                                       //Bipod
		],

	[//Launcher
		"rhs_weap_rpg7",								//Weapon
		"",										//Muzzle
		"",										//Rail
		"",										//Sight
		["rhs_rpg7_PG7VL_mag",1],										//Primary Magazine
		[],										//Secondary Magazine
		""										//Bipod
	],

	[//Secondary Weapon
		"rhs_weap_pb_6p9",									//Weapon
		"rhs_acc_6p9_suppressor",									//Muzzle
		"",													//Rail
		"",													//Sight
		["rhs_mag_9x18_8_57n181S",8],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	[],
	[],
	[
		"rhs_uniform_vfv_flora",
		[] + _basicMedicalSupplies + _basicMiscItems
	],
	[
		"rhs_6b23_6sh116_flora",
		[
			["rhs_1PN138",1],
			["rhs_mag_9x18_8_57n181S",2,8],
			["rhs_100Rnd_762x54mmR_7N13",1,100],
			["rhs_mag_rgn",1,1],
			["rhs_mag_rdg2_white",1,1],
			["rhs_mag_rgo",1,1]]],
	[
		"rhs_sidor_",  
		[
		["rhs_100Rnd_762x54mmR_7N13",2,100]
		
	],
	"rhs_altyn_novisor_ess",
	"rhs_balaclava",
	[],
	[
		"ItemMap",
		"ItemGPS",
		["tf_fadak_1"] call _fnc_tfarRadio,
		"ItemCompass",
		"ItemWatch",
		""
	]
];
