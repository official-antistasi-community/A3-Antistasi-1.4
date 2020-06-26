[//Loadout
	[//Primary Weapon
		"ARifle_SPAR_01_KHK_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"Optic_Holosight_KHK_F",							//Sight
		["30Rnd_556x45_Stanag_Red",30],						//Primary Magazine
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
		"HGun_P07_KHK_F",									//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		selectRandom										//Uniform
		["U_B_T_Soldier_F", "U_B_T_Soldier_AR_F", "U_B_T_Soldier_SL_F"],
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_PlateCarrier1_TNA_F", "V_PlateCarrier2_TNA_F"],
		[//Inventory
			["NVGoggles_tna_F",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["30Rnd_556x45_Stanag_Red",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_AssaultPack_TNA_F",								//Backpack
		[] + _medicSupplies
	],

		selectRandom										//Headgear
		["H_BoonieHat_TNA_F", "H_MilCap_TNA_F", "H_HelmetB_Light_TNA_F", "H_HelmetB_TNA_F", "H_HelmetB_Enh_TNA_F"],
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
