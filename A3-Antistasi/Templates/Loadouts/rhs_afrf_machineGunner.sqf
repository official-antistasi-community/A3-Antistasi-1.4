[//Loadout
	[//Primary Weapon
		"rhs_weap_pkp",								//Weapon
		"",													//Muzzle
		"",													//Rail										
		["rhs_acc_pkas"],                                //Sight
		["rhs_100Rnd_762x54mmR_7N13",100],					//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		[],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"rhs_weap_pb_6p9",								//Weapon
		"rhs_acc_6p9_suppressor",													//Muzzle
		"",													//Rail
		"",													//Sight
		["rhs_mag_9x18_8_57n181S",8],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"rhs_uniform_vdv_flora",								//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"rhs_6b23_6sh116_flora",						//Vest
		[//Inventory
			["rhs_1PN138",1],
			["rhs_mag_9x18_8_57n181S",2,8],
			["rhs_100Rnd_762x54mmR_7N13",1,100],
			["rhs_mag_rgn",1,1],
			["rhs_mag_rdg2_white",1,1],
			["rhs_mag_rgo",1,1]
		]
		+ _aceFlashlight
	],

	[//Backpack
		"rhs_sidor",						//Backpack
		[//Inventory
			["rhs_100Rnd_762x54mmR_7N13",2,100]
		]
		+ _aceClacker
	],

		"rhs_altyn_novisor_ess",				//Headgear 										
		["rhs_balaclava"],                                     //Facewear

	[//Binocular
		"Binocular",										//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[//Item
		"ItemMap",											//Map
		"ItemGPS",													//Terminal
		["tf_fadak_1"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];
