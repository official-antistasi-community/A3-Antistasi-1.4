private _loadout_vanilla_blufor_medic =

[//Loadout
	[//Primary Weapon
		"ARifle_SPAR_01_KHK_F",								//Weapon
		"",													//Muzzle
		"",													//Rail
		"Optic_Holosight_KHK_F",							//Sight
		["30Rnd_556x45_Stanag_Red",30],						//Primary Magazine
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
		"HGun_P07_KHK_F",									//Weapon
		"",													//Muzzle
		"",													//Rail
		"",													//Sight
		["16Rnd_9x21_Mag", 17],								//Primary Magazine
		[],													//Secondary Magazine
		""													//Bipod
	],

	[//Uniform
		selectRandom										//Uniform
		["U_B_T_Soldier_F", "U_B_T_Soldier_AR_F", "U_B_T_Soldier_SL_F"],
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
		selectRandom										//Vest
		["V_PlateCarrier1_TNA_F", "V_PlateCarrier2_TNA_F"],
		[//Inventory
			["NVGoggles_OpFor",1],
			["ACE_Flashlight_XL50",1],
			["ACE_SurgicalKit",1],
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["ACE_M84",2,1],
			["16Rnd_9x21_Mag",2,17],
			["30Rnd_556x45_Stanag_Red",4,30]
		]
	],

	[//Backpack
		"B_AssaultPack_TNA_F",								//Backpack
		[//Inventory
			["ADV_ACECPR_AED", 1],
			["ACE_PackingBandage", 15],
			["ACE_ElasticBandage", 10],
			["ACE_QuikClot", 10],
			["ACE_Morphine", 3],
			["ACE_Epinephrine", 3],
			["ACE_PlasmaIV_250", 5],
			["ACE_SalineIV_500", 3],
			["ACE_BloodIV", 1],
			["ACE_PersonalAidKit", 1],
			["ACE_Tourniquet", 3]
		]
	],

		selectRandom										//Headgear
		["H_BoonieHat_TNA_F", "H_MilCap_TNA_F", "H_HelmetB_Light_TNA_F", "H_HelmetB_TNA_F", "H_HelmetB_Enh_TNA_F"],
		"",													//Facewear

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
		"ItemGPS",											//Terminal
		"TF_RF7800STR",										//Radio
		"ItemCompass",										//Compass
		"TF_MicroDAGR",										//Watch
		""													//Goggles
	]
];
