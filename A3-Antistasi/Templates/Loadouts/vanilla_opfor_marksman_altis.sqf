[																					  //Loadout
	[																							//Primary Weapon
		"srifle_DMR_01_F",														//Weapon
		"",																							//Muzzle
		"Acc_Pointer_IR",																//Rail
		"optic_dms",																		//Sight
		["10Rnd_762x54_Mag",10],												//Primary Magazine
		[],																							//Secondary Magazine
		"bipod_02_F_hex"																//Bipod
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

		"U_O_SpecopsUniform_ocamo",
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																							//Vest
		"V_TacVest_khk",																//Vest
		[																										//Inventory
			["SmokeShell",2,1],
			["HandGrenade",1,1],
			["16Rnd_9x21_Mag",1,17],
			["10Rnd_762x54_Mag",9,10]
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
		"H_HelmetSpecO_ocamo",
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
