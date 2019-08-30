[//Loadout
	[//Primary Weapon
		"RHS_Weap_M4A1_M203S",								//Weapon
		"",													//Muzzle
		"RHSUSF_Acc_WMX_Bk",								//Rail
		selectRandom										//Sight
		["RHSUSF_Acc_CompM4", "RHSUSF_Acc_Eotech_552"],
		["RHS_Mag_30Rnd_556x45_M855A1_Stanag",30],			//Primary Magazine
		["RHS_Mag_M441_HE",1],								//Secondary Magazine
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
		"RHSUSF_SPCS_OCP_Grenadier",
		[//Inventory
			["RHSUSF_ANPVS_14",1],
			["RHS_Mag_An_M8HC",2,1],
			["RHS_Mag_M67",2,1],
			["RHS_Mag_Mk84",1,1],
			["RHS_Mag_30Rnd_556x45_M855A1_Stanag",4,30],
			["RHSUSF_Mag_7x45ACP_MHP",2,7],
			["RHS_Mag_M441_HE",6,1],
			["RHS_Mag_M714_White",4,1]
		] + _aceFlashlight
	],

	[//Backpack
	],

		"rhsusf_mich_bare_norotos_headset",				//Headgear
		SelectRandom 										//Facewear
		["RHSUSF_Shemagh_Grn", "RHSUSF_Shemagh2_Grn", "RHSUSF_Shemagh_Gogg_Grn", "RHSUSF_Shemagh2_Gogg_Grn", "RHSUSF_Oakley_Goggles_Blk"],

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
		"",													//Terminal
		["TF_RF7800STR"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];