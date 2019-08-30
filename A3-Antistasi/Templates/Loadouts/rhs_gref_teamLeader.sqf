[//Loadout
	[//Primary Weapon
		"RHS_Weap_Mk18_Bk",									//Weapon
		"",													//Muzzle
		"RHSUSF_Acc_WMX_Bk",								//Rail
		"RHSUSF_Acc_T1_High",								//Sight
		["RHS_Mag_30Rnd_556x45_M855_PMag",30],			//Primary Magazine
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
			["H_Beret_Gen_F",1],
			["RHS_Mag_An_M8HC",1,1],
			["RHS_Mag_Mk3A2",1,1],
			["RHS_Mag_30Rnd_556x45_M855_PMag",3,30],
			["16Rnd_9x21_Mag",2,17]
		] 
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_LegStrapBag_Black_F",							//Backpack
		[//Inventory
			["RHS_Mag_30Rnd_556x45_M855_PMag",3,30],
			["16Rnd_9x21_Mag",2,17]
		]
	],

		"H_PASGT_Basic_Blue_F",								//Headgear
		"G_Balaclava_TI_Blk_F",								//Facewear

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
