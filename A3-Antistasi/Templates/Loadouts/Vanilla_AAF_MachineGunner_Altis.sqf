[//Loadout
			[//Primary Weapon
			"LMG_Mk200_F",								//Weapon
			"",													//Muzzle
			"",													//Rail
			"optic_Holosight",							//Sight
			["200Rnd_65x39_cased_Box",200],			//Primary Magazine
			[],													//Secondary Magazine
			"Bipod_01_F_BLK"									//Bipod
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
			"hgun_Pistol_heavy_01_F",									//Weapon
			"muzzle_snds_acp",									//Muzzle
			"acc_flashlight_pistol",													//Rail
			"optic_MRD",													//Sight
			["11Rnd_45ACP_Mag", 11],								//Primary Magazine
			[],													//Secondary Magazine
			""													//Bipod
			],

			[//Uniform
			selectRandom										//Uniform
			["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"],
			[] + _basicMedicalSupplies + _basicMiscItems
			],

			[//Vest
			selectRandom										//Vest
			["V_PlateCarrierIA1_dgtl", "V_PlateCarrierIA2_dgtl"],
			[//Inventory
			["NVGoggles_INDEP",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["11Rnd_45ACP_Mag",1,11],
			["200Rnd_65x39_cased_Box",2,200],
			[]
			]
			+ _aceFlashlight
			+ _aceM84
			],

			[],

			selectRandom										//Headgear
			["H_Booniehat_dgtl", "H_MilCap_dgtl", "H_HelmetIA", "H_Cap_blk_Raven"],
			"",													//Facewear

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
			"ItemGPS",											//Terminal
			["tf_anprc148jem"] call _fnc_tfarRadio,				//Radio
			"ItemCompass",										//Compass
			"ItemWatch",										//Watch
			""													//Goggles
			]
	];
