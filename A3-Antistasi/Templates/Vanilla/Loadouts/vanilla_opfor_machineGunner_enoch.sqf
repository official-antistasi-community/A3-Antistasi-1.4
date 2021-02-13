[//Loadout
	[//Primary Weapon
		"arifle_RPK12_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["75rnd_762x39_AK12_Mag_F",75],			//Primary Magazine
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
		"hgun_Rook40_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform

		"U_O_R_Gorka_01_camo_F",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_TacVest_oli", "V_Chestrig_oli"],
		[//Inventory
			["NVGoggles_OPFOR",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["75rnd_762x39_AK12_Mag_F",4,75]

		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
	"B_FieldPack_taiga_F",								//Backpack
	[//Inventory
		["150Rnd_762x54_Box",2,75]
	]
],

		selectRandom										//Headgear
		["H_Booniehat_taiga", "H_MilCap_taiga", "H_HelmetLeaderO_ocamo", "H_HelmetAggressor_cover_taiga_F","H_HelmetAggressor_F"],
		"",													//Facewear

	[//Binocular
		"",													//Binocular
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
		["tf_fadak"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		"ItemWatch",										//Watch
		""													//Goggles
	]
];
