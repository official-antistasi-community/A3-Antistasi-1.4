[//Loadout
	[//Primary Weapon
		"SMG_05_F",											//Weapon
		"Muzzle_SNDS_L",									//Muzzle
		"RHSUSF_Acc_WMX_Bk",								//Rail
		"Optic_Holosight_SMG_Blk_F",						//Sight
		["30Rnd_9x21_Mag_SMG_02",30],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Launcher
		"RHS_Weap_RPG7",									//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["RHS_RPG7_PG7V_Mag",1],							//Primary Magazine
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
			["30Rnd_9x21_Mag_SMG_02",4,30],
			["16Rnd_9x21_Mag",2,17]
		] 
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		"B_Messenger_Black_F",								//Backpack
		[//Inventory
			["RHS_RPG7_PG7V_Mag",1,1],
			["DemoCharge_Remote_Mag",2,1],
		]
		+ _aceDefusalKit
		+ _aceClacker
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
		"",													//Terminal
		["TF_PNR1000A_26"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,									//Watch
		""													//Goggles
	]
];