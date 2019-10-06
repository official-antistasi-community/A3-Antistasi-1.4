[//Loadout
	[//Primary Weapon
		"RHS_Weap_Mk17_STD",									//Weapon
		"",													//Muzzle
		"RHSUSF_Acc_Anpeq15a",								//Rail
		selectRandom										//Sight
		["RHSUSF_Acc_Acog", "RHSUSF_Acc_Eotech_552"],
		["RHS_Mag_20Rnd_SCAR_762x51_m61_AP",20],			//Primary Magazine
		[],													//Secondary Magazine
		"RHSUSF_Acc_Grip3"									//Bipod
	],

	[//Launcher
		"RHS_Weap_M136_HEDP",								//Weapon
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
		"RHS_Uniform_G3_M81",						//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[//Vest
		"RHSUSF_SPCS_OCP_rifleman_alt",							//Vest
		[//Inventory
			["RHSUSF_ANPVS_14",1],
			["RHS_Mag_An_M8HC",2,1],
			["RHS_Mag_M67",1,1],
			["RHS_Mag_Mk84",1,1],
			["RHS_Mag_20Rnd_SCAR_762x51_m61_AP",6,20],
			["RHSUSF_Mag_7x45ACP_MHP",2,7]
		]
		+ _aceFlashlight
	],

	//Backpack
	[],

		"rhsusf_mich_bare_norotos_headset",					//Headgear
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
		"itemGPS",											//Terminal
		["TF_RF7800STR"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];
