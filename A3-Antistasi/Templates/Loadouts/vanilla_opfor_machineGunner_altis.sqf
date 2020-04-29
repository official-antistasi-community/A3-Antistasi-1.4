[																					  //Loadout
	[																							//Primary Weapon
		"LMG_Zafir_F",																	//Weapon
		"",																							//Muzzle
		"Acc_Pointer_IR",																//Rail
		"optic_holosight"																//Sight
		["150rnd_762x54_Box",150],											//Primary Magazine
		[],																							//Secondary Magazine
		"Bipod_01_F_BLK"																//Bipod
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
			["150rnd_762x54_Box",1,150]
		]
		+ _aceFlashlight
		+ _aceM84
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
