		[//Loadout
		[//Primary Weapon
		"rhs_weap_ak103_zenitco01",				//Weapon
		"rhs_acc_dtk3",											//Muzzel
		"rhs_acc_perst3_2dp_light_h",									//Rail
		"",																	//Sight
		["rhs_30Rnd_762x39mm_polymer",30],	//Primary Magazine
		[],										//Secondary Magazine
		"rhsusf_acc_rvg_blk" 	//Grip

		],

		[//Launcher
		"rhs_weap_rpg26",									//Weapon
		"",																//Muzzle
		"",																//Rail
		"",																//Sight
		["rhs_rpg26_mag",1],							//Primary Magazine
		[],																//Secondary Magazine
		""																//Bipod
		],

		[//Secondary Weapon
		"rhs_weap_pb_6p9",								//Weapon
		"rhs_acc_6p9_suppressor",					//Muzzle
		"",																//Rail
		"",																//Sight
		["rhs_mag_9x18_8_57n181S",8],			//Primary Magazine
		[],																//Secondary Magazine
		""																//Bipod
		],

		[//Uniform
		"rhs_uniform_gorka_r_g",					//Uniform
		[//Inventory
		 + _basicMedicalSupplies
		 + _basicMiscItems
		]
		],

		[//Vest
		"rhs_6b23_6sh116_od",
		[//Inventory
		["rhs_mag_9x18_8_57n181S",1,8],
		["rhs_30Rnd_762x39mm_polymer",4,30],
		["rhs_mag_rdg2_white",1,1],
		["rhs_mag_rgo",1,1]
		+ _aceM84
		+	_aceFlashlight
		]
		],

		[//Backpack
		"rhs_rpg_empty",						//Backpack
		[//Inventory
		["rhs_rpg7_PG7VR_mag",1,1]
		]

		],

		"rhs_altyn",				//Headgear
		"",         //Facewear

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
		"",													//Terminal
		["tf_pnr1000a"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		"rhs_1PN138"													//Goggles
		]
		];
