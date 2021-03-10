[//Loadout
	[//Primary Weapon
		"arifle_MX_Black_F",								//Weapon
		"",													//Muzzle
		"Acc_Pointer_IR",									//Rail
		"Optic_ACO",						    			//Sight
		["30Rnd_65x39_caseless_black_mag",30],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"launch_MRAWS_sand_rail_F",													//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["MRAWS_HEAT55_F",1],													//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Secondary Weapon
		"hgun_P07_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		selectRandom										//Uniform
		["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_vest"],
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_PlateCarrier1_rgr", "V_PlateCarrier2_rgr"],
		[//Inventory
			["NVGoggles",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["30Rnd_65x39_caseless_black_mag",3,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

    [//Backpack
		"B_AssaultPack_mcamo",								//Backpack
		[//Inventory
			["MRAWS_HEAT55_F",1,1]
		]
	],

		selectRandom										//Headgear
		["H_Booniehat_mcamo", "H_MilCap_mcamo", "H_HelmetB_desert", "H_HelmetB_light_desert", "H_HelmetSpecB", "H_Cap_tan_specops_US"],
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
		["TF_ANPRC152"] call _fnc_tfarRadio,				//Radio
        "ItemCompass",										//Compass
        "ItemWatch",										//Watch
        ""													//Goggles
	]
];
