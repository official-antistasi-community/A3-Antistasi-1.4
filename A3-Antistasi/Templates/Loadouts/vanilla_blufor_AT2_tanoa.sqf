[																					  //Loadout
	[																							//Primary Weapon
		"arifle_MX_khk_F",															//Weapon
		"",																							//Muzzle
		"Acc_Pointer_IR",																//Rail
		"optic_Holosight_khk_F",												//Sight
		["30Rnd_65x39_caseless_khaki_mag",30],					//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																						  //Launcher
		"",																							//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		[],																							//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Secondary Weapon
		"hgun_Pistol_heavy_01_F",												//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		["11Rnd_45ACP_Mag",11],													//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Uniform
		"U_B_T_Soldier_SL_F",														//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																							//Vest
		"V_PlateCarrier2_TNA_F",												//Vest
		[																										//Inventory
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["11Rnd_45ACP_Mag",1,11],
			["30Rnd_65x39_caseless_khaki_mag",4,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[																							//Backpack
		"B_AssaultPack_tna_F",													//Backpack
		[																										//Inventory
			["MRAWS_HEAT_F",2,1]
		]
	],

		"H_HelmetB_TNA_F",													//Headgear
		"",																					//Facewear

	[																							//Binocular
		"Binocular",																		//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[																							//Item
		"ItemMap",																			//Map
		"",																							//Terminal
		["TF_ANPRC152"] call _fnc_tfarRadio,						//Radio
		"ItemCompass",																	//Compass
		"ItemWatch",																		//Watch
		"NVGoggles_tna_F"																//Goggles
	]
];
