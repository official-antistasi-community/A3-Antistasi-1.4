[//Loadout
	[//Primary Weapon
		"RHS_Weap_M24SWS",									//Weapon
		"",													//Muzzle
		"",													//Rail
		"RHSUSF_Acc_LeupoldMk4",							//Sight
		["RHSUSF_5Rnd_762x51_M993_Mag",5],					//Primary Magazine
		[],													//Secondary Magazine
		"RHSUSF_Acc_Harris_Swivel"							//Bipod
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
		"RHSUSF_Acc_Omega9K",								//Muzzle
		"Acc_Flashlight_Pistol",							//Rail
		"",													//Sight
		["16Rnd_9x21_Mag",17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"U_B_Gen_Soldier_F",								//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"V_TacVest_Blk_Police",								//Vest
		[//Inventory
			["RHS_1PN138",1],
			["H_Cap_Police",1],
			["RHS_Mag_An_M8HC",2,1],
			["RHSUSF_5Rnd_762x51_M993_Mag",5,5],
			["16Rnd_9x21_Mag",2,17]
		]
		+ _aceFlashlight
		+ _aceM84
		+ _aceRangecard
	],

	[],

	"H_PASGT_Basic_Blue_F",									//Headgear
	"G_Balaclava_TI_Blk_F",									//Facewear

	[//Binocular
		"RHSUSF_Bino_Lerca_1200_Black",						//Binocular
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
