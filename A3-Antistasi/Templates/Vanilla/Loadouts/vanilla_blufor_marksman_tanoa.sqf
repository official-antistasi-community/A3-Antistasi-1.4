[//Loadout
	[//Primary Weapon
		"ARifle_SPAR_03_KHK_F",								//Weapon
		"",									//Muzzle
		"Acc_Pointer_IR",									//Rail
		"Optic_AMS_KHK",									//Sight
		["20Rnd_762x51_Mag",20],							//Primary Magazine
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
		"HGun_P07_KHK_F",									//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"U_B_T_Sniper_F",									//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_PlateCarrier1_TNA_F",										//Vest
		[//Inventory
			["NVGoggles_tna_F",1],
			["SmokeShell",3,1],
			["16Rnd_9x21_Mag",2,17],
			["20Rnd_762x51_Mag",4,20]
		]
		+ _aceFlashlight
		+ _aceKestrel
		+ _aceRangecard
		+ _aceM84
	],

	[],

		"",													//Headgear
		"G_Balaclava_Oli",									//Facewear

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
