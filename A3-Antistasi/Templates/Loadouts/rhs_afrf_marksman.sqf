[//Loadout
	[//Primary Weapon
		"rhs_weap_svds_npz",                    //Weapon                                                       
		"rhs_acc_tgpv",                          //Muzzle 
		"",                      //Rail
		"rhs_acc_dh520x56",                      //Sight
		["rhs_10Rnd_762x54mmR_7N1",10],                 //Primary Weapon       
		[],                                      //Secondary Magazine
		""                                       //Bipod
		],

	[//Launcher
		"",								//Weapon
		"",										//Muzzle
		"",										//Rail
		"",										//Sight
		[],										//Primary Magazine
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
		"rhs_6b23_digi_sniper",
		[
			["rhs_1PN138",1],
			["rhs_mag_9x18_8_57n181S",2,8],
			[""rhs_10Rnd_762x54mmR_7N1",6,10],
			["rhs_mag_rgn",1,1],
			["rhs_mag_rdg2_white",1,1],
			["rhs_mag_rgo",1,1]]],
	[
		"",  
		[
		[]
		
	],
	"rhs_altyn_novisor_ess",
	"rhs_balaclava",
	[],
	[
		[//Binocular
		"rhs_pdu4",										//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[//Item
		"ItemMap",
		"ItemGPS",
		["tf_fadak_1"] call _fnc_tfarRadio,
		"ItemCompass",
		"ItemWatch",
		""
	]
];
