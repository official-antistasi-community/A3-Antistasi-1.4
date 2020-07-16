[//Loadout
	[//Primary Weapon
		"RHS_Weap_M16A4",									//Weapon
		"",													//Muzzle
		"RHSUSF_Acc_WMX_Bk",								//Rail
		selectRandom										//Sight
		["RHSUSF_Acc_CompM4", "RHSUSF_Acc_Eotech_552"],
		["RHS_Mag_30Rnd_556x45_M855A1_Stanag",30],			//Primary Magazine
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
			["RHS_Mag_30Rnd_556x45_M855A1_Stanag",6,30],
			["RHSUSF_Mag_7x45ACP_MHP",2,7]
		]
		+ _aceFlashlight
		+ _aceM84
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
		"",													//Terminal
		["TF_RF7800STR"] call _fnc_tfarRadio,				//Radio
		"ItemCompass",										//Compass
		_tfarMicroDAGRNoArray,										//Watch
		""													//Goggles
	]
];
