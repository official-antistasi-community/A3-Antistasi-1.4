[//Loadout
	[//Primary Weapon
		"RHS_Weap_M590_8Rd",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["RHSUSF_8Rnd_Slug",8],								//Primary Magazine
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
		"RHSUSF_Weap_Glock17G4",							//Weapon
		"",													//Muzzle
		"Acc_Flashlight_Pistol",							//Rail
		"",													//Sight
		["16Rnd_9x21_Mag",17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"U_B_GEN_Soldier_F",								//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_TacVest_Blk_Police",								//Vest
		[//Inventory
			["RHS_1PN138",1],
			["H_Cap_Police",1],
			["RHS_Mag_An_M8HC",1,1],
			["RHS_Mag_Mk3A2",2,1],
			["RHSUSF_8Rnd_Slug",4,8],
			["RHSUSF_8Rnd_00Buck",2,8],
			["16Rnd_9x21_Mag",2,17]
		] 
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_Messenger_Black_F",								//Backpack
		[//Inventory
			["RHS_Mag_M4009",3,1],
			["1Rnd_Smoke_Grenade_Shell",5,1],
			["1Rnd_HE_Grenade_Shell",1,1],
			[
				[//Weapon
					"RHS_Weap_M320",
					"",
					"",
					"",
					[],
					[],
					""
				],1
			]
		]
	],

		"H_PASGT_Basic_Blue_F",								//Headgear
		"G_Balaclava_Ti_Blk_F",								//Facewear

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
		"ItemGPS",											//Terminal
		["TF_PNR1000A_26"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];