[//Loadout
			[//Primary Weapon
			"arifle_Mk20C_F",								//Weapon
			"",													//Muzzle
			"",													//Rail
			"optic_Holosight",							//Sight
			["30Rnd_556x45_Stanag",30],						//Primary Magazine
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
			["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"], //No Ghillies.
			[] + _basicMedicalSupplies + _basicMiscItems
			],

			[//Vest
			selectRandom										//Vest
			["V_PlateCarrierIA1_dgtl", "V_PlateCarrierIA2_dgtl"],
			[//Inventory
			["NVGoggles_INDEP",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["11Rnd_45ACP_Mag",2,11],
			["30Rnd_556x45_Stanag",4,30]
			]
			+ _aceFlashlight
			+ _aceM84
			],

			[//Backpack
			"B_AssaultPack_dgtl",								//Backpack
			[] + _medicSupplies
			],

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
