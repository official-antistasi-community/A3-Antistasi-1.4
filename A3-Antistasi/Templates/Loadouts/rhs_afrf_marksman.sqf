[//Loadout
	[//Primary Weapon
		"rhs_weap_svds_npz",								//Weapon
		"rhs_acc_tgpv",													//Muzzle
		"",								//Rail
		"rhs_acc_dh520x56",								//Sight
		["rhs_10Rnd_762x54mmR_7N1",10],				//Primary Magazine
		[],													//Secondary Magazine
		""								//Bipod
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
		"rhs_6b23_digi_sniper",							//Vest
		[//Inventory
			["rhs_1PN138",1],
			["rhs_mag_rgo",2,1],
			["rhs_mag_rdg2_white",1,1],
			["rhs_mag_rgn",1,1],
			["rhs_10Rnd_762x54mmR_7N1",6,10],
			["rhs_mag_9x18_8_57n181S",2,8]
		]
		+ _aceFlashlight
		+ _aceKestrel
		+ _aceRangecard
	],

	[//Backpack
	],

		"rhs_altyn_novisor_ess",				//Headgear
		["rhs_balaclava"],   //Facewear
											
	[//Binocular
		"rhs_pdu4",							//Binocular
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
