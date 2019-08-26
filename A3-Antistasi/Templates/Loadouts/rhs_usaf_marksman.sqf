private _loadout_rhs_usaf_marksman =
	[//Loadout
		[//Primary Weapon
			"RHS_Weap_M14EBRRI",								//Weapon
			"",													//Muzzle
			"RHSUSF_Acc_ANPEQ15A",								//Rail
			"RHSUSF_Acc_M8541_Low",								//Sight
			["RHSUSF_20Rnd_762x51_M993_Mag",20],				//Primary Magazine
			[],													//Secondary Magazine
			"RHS_Acc_Harris_Swivel"								//Bipod
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
				["ACE_Chemlight_Hiblue",5,1]
			]
		],

		[//Vest
			"RHSUSF_SPCS_OCP_Sniper",							//Vest
			[//Inventory
				["RHSUSF_ANPVS_14",1],
				["ACE_Flashlight_XL50",1],
				["ACE_Rangecard",1],
				["ACE_Kestrel4500",1],
				["RHS_Mag_An_M8HC",2,1],
				["RHS_Mag_M67",1,1],
				["RHS_Mag_Mk84",1,1],
				["RHSUSF_20Rnd_762x51_M993_Mag",5,30],
				["RHSUSF_Mag_7x45ACP_MHP",2,7]
			]
		],

		[//Backpack
			"",													//Backpack
			[//Inventory
				[]
			]
		],

			"RHSGREF_Helmet_PASGT_Woodland_Rhino",				//Headgear
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