[//Loadout
	[//Primary Weapon
		"arifle_CTAR_ghex_F",								//Weapon
		"",													//Muzzle
		"Acc_Pointer_IR",									//Rail
		"optic_Holosight_khk_F",						    			//Sight
		["30Rnd_580x42_Mag_F",30],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"launch_RPG32_F",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["RPG32_F",1],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"hgun_Rook40_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform

		"U_O_T_Soldier_F",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_TacVest_oli",										//Vest
		[//Inventory
			["NVGoggles_OPFOR",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["30Rnd_580x42_Mag_F",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

    [//Backpack
		"B_FieldPack_ghex_F",								//Backpack
		[//Inventory
			["RPG32_F",1,1]
		]
	],

		selectRandom										//Headgear
		["H_Booniehat_oli", "H_MilCap_ghex_F", "H_HelmetLeaderO_ghex_F", "H_HelmetSpecO_ghex_F", "H_HelmetO_ghex_F"],
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
		["tf_fadak"] call _fnc_tfarRadio,				//Radio
        "ItemCompass",										//Compass
        "ItemWatch",										//Watch
        ""													//Goggles
	]
];
