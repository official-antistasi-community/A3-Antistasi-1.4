[//Loadout
	[//Primary Weapon
		"LMG_Zafir_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"optic_Holosight",							//Sight
		["150Rnd_762x54_Box",150],			//Primary Magazine
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

		"U_O_CombatUniform_ocamo",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		selectRandom										//Vest
		["V_TacVest_khk", "V_HarnessO_brn"],
		[//Inventory
			["NVGoggles_OPFOR",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",2,17],
			["150Rnd_762x54_Box",2,150]

		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
	"B_AssaultPack_ocamo",								//Backpack
	[//Inventory
		["150Rnd_762x54_Box",1,150]
	]
],

		selectRandom										//Headgear
		["H_Booniehat_khk", "H_MilCap_ocamo", "H_HelmetLeaderO_ocamo", "H_HelmetSpecO_ocamo", "H_HelmetO_ocamo", "H_Cap_brn_SPECOPS"],
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
