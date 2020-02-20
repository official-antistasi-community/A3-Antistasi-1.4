[//Loadout
	[//Primary Weapon
		"arifle_Katiba_C_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["30Rnd_65x39_caseless_green",30],						//Primary Magazine
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
		"hgun_Rook40_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"U_O_CombatUniform_ocamo",									//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_TacVest_khk",										//Vest
		[//Inventory
		["NVGoggles_OPFOR",1],
		["SmokeShell",2,1],
		["HandGrenade",1,1],
		["16Rnd_9x21_Mag",2,17],
		["30Rnd_65x39_caseless_green",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_AssaultPack_ocamo",								//Backpack
		[] + _medicSupplies
	],

		selectRandom										//Headgear
		["H_Booniehat_khk", "H_MilCap_ocamo", "H_HelmetLeaderO_ocamo", "H_HelmetSpecO_ocamo", "H_HelmetO_ocamo", "H_Cap_brn_SPECOPS"],
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
