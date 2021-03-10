[//Loadout
	[//Primary Weapon
		"srifle_DMR_01_F",								//Weapon
		"",									//Muzzle
		"acc_pointer_IR",									//Rail
		"optic_SOS",									//Sight
		["10Rnd_762x54_Mag",10],							//Primary Magazine
		[],													//Secondary Magazine
		"bipod_02_F_blk"									//Bipod
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
		"U_O_R_Gorka_01_camo_F",									//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_TacVest_oli",										//Vest
		[//Inventory
			["NVGoggles_OPFOR",1],
			["SmokeShell",3,1],
			["16Rnd_9x21_Mag",2,17],
			["10Rnd_762x54_Mag",8,10]
		]
		+ _aceFlashlight
		+ _aceKestrel
		+ _aceRangecard
		+ _aceM84
	],

	[],

		"",													//Headgear
		"",									//Facewear

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
