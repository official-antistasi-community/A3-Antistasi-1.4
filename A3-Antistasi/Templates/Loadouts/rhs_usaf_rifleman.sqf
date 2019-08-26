private _loadout_rhs_usaf_rifleman =

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
		"RHSGREF_Uniform_OG107_ERDL",						//Uniform
		[//Inventory
			["ACE_Earplugs",1],
			["ACE_Tourniquet",1],
			["ACE_Cabletie",3],
			["ACE_SalineIV_500",1],
			["ACE_Morphine",1],
			["ACE_Epinephrine",1],
			["ACE_PackingBandage",5],
			["ACE_ElasticBandage",3],
			["ACE_Quikclot",3],
			["ACE_Chemlight_Hiblue",5]
		]
	],

	[//Vest
		"RHSGREF_ALICE_Webbing",							//Vest
		[//Inventory
			["RHSUSF_ANPVS_14",1],
			["ACE_Flashlight_XL50",1],
			["RHS_Mag_An_M8HC",2,1],
			["RHS_Mag_M67",1,1],
			["RHS_Mag_Mk84",1,1],
			["RHS_Mag_30Rnd_556x45_M855A1_Stanag",6,30],
			["RHSUSF_Mag_7x45ACP_MHP",2,7]
		]
	],

	[//Backpack
		"",													//Backpack
		[//Inventory
			[]
		]
	],

		"RHSGREF_Helmet_PASGT_ERDL_Rhino",					//Headgear
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
		"TF_RF7800STR",										//Radio
		"ItemCompass",										//Compass
		"TF_MicroDAGR",										//Watch
		""													//Goggles
	]
];
