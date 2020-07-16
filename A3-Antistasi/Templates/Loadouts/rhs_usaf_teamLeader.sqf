[//Loadout
	[//Primary Weapon
		"RHS_Weap_M4A1",									//Weapon
		"",													//Muzzle
		"RHSUSF_Acc_ANPEQ15A",								//Rail
		selectRandom										//Sight
		["RHSUSF_Acc_Acog", "rhsusf_acc_g33_xps3","rhsusf_acc_g33_T1"],
		["RHS_Mag_30Rnd_556x45_M855A1_Stanag",30],			//Primary Magazine
		[],													//Secondary Magazine
		"RHSUSF_Acc_Grip3"									//Bipod
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
		"RHSUSF_Weap_M1911A1",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["RHSUSF_Mag_7x45ACP_MHP",7],						//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		"RHS_Uniform_G3_M81",								//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"RHSUSF_SPCS_OCP_SquadLeader",						//Vest
		[//Inventory
			["RHSUSF_ANPVS_14",1],
			["RHS_Mag_An_M8HC",2,1],
			["RHS_Mag_M67",1,1],
			["RHSUSF_Mag_7x45ACP_MHP",2,7],
			["RHS_Mag_30Rnd_556x45_M855A1_Stanag",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[//Backpack
		([hasTFAR, "TF_RT1523G_RHS", "RHSUSF_Assault_EagleAIII_OCP"] call _fnc_modItemNoArray),
		[//Inventory
			["SmokeshellBlue",3,1],
			["SmokeshellRed",3,1],
			["SmokeshellYellow",3,1]
		]
	],

		"rhsusf_mich_bare_norotos_headset",				//Headgear
		SelectRandom 										//Facewear
		["RHSUSF_Shemagh_Grn", "RHSUSF_Shemagh2_Grn", "RHSUSF_Shemagh_Gogg_Grn", "RHSUSF_Shemagh2_Gogg_Grn", "RHSUSF_Oakley_Goggles_Blk"],

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
		["TF_RF7800STR"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];
