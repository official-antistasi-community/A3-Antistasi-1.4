[																					  //Loadout
	[																							//Primary Weapon
		"srifle_DMR_07_ghex_F",													//Weapon
		"",																							//Muzzle
		"Acc_Pointer_IR",																//Rail
		"optic_SOS",																		//Sight
		["20Rnd_650x39_Cased_Mag_F",20],								//Primary Magazine
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
		"hgun_Rook40_F",																//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		["16Rnd_9x21_Mag", 17],													//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Uniform

		"U_O_T_Soldier_F",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																							//Vest
		"V_HarnessO_ghex_F",														//Vest
		[																										//Inventory
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",1,17],
			["20Rnd_650x39_Cased_Mag_F",4,20]
		]
		+ _aceFlashlight
		+ _aceM84
		+ _aceRangecard
	],

	[																							//Backpack
		[																								//Backpack
		[]																									//Inventory
		]
	],
																								//Headgear
		["H_HelmetSpecO_ghex_F"],
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
		["tf_fadak"] call _fnc_tfarRadio,								//Radio
		"ItemCompass",																	//Compass
		"ItemWatch",																		//Watch
		"NVGoggles_OPFOR"																//Goggles
	]
];
