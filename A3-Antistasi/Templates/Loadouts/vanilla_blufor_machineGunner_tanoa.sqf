[																					  //Loadout
	[																							//Primary Weapon
		"arifle_SPAR_02_khk_F",													//Weapon
		"",																							//Muzzle
		"Acc_Pointer_IR",																//Rail
		"optic_Holosight_khk_F",												//Sight
		["150Rnd_556x45_Drum_Green_Mag_F",150],					//Primary Magazine
		[],																							//Secondary Magazine
		"bipod_01_f_khk"																//Bipod
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
			["150Rnd_556x45_Drum_Green_Mag_F",1,150]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[																							//Backpack
		[																								//Backpack
		[]																									//Inventory
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
