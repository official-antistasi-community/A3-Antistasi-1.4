[																					//Loadout
	[																						//Primary Weapon
		"rhs_weap_m4a1_carryhandle",									//Weapon
		"",																						//Muzzle
		"rhsusf_acc_anpeq16a",												//Rail
		["rhsusf_acc_compm4"],												//Sight
		["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],			//Primary Magazine
		[],																						//Secondary Magazine
		"rhsusf_acc_kac_grip"													//Bipod
	],

	[																						//Launcher
		"",																						//Weapon
		"",																						//Muzzle
		"",																						//Rail
		"",																						//Sight
		[],																						//Primary Magazine
		[],																						//Secondary Magazine
		""																						//Bipod
	],

	[																						//Secondary Weapon
		"rhsusf_weap_m9",															//Weapon
		"",																						//Muzzle
		"",																						//Rail
		"",																						//Sight
		["rhsusf_mag_15Rnd_9x19_FMJ",15],							//Primary Magazine
		[],																						//Secondary Magazine
		""																						//Bipod
	],

	[																						//Uniform
		"RHS_Uniform_G3_M81",													//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																						//Vest
		"rhsusf_mbav_rifleman",												//Vest
		[																									//Inventory
			["RHS_Mag_An_M8HC",2,1],
			["RHS_Mag_M67",2,1],
			["rhsusf_mag_15Rnd_9x19_FMJ",2,15],
			["rhs_mag_30Rnd_556x45_Mk318_Stanag",5,30]
		]
		+ _aceFlashlight
		+ _aceM84
	],

	[																						//Backpack
	],

		"rhsusf_mich_bare_norotos_alt",						//Headgear
		"",																			  //Facewear

	[																						//Binocular
		"RHSUSF_Bino_Lerca_1200_tan",									//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[																						//Item
		"ItemMap",																		//Map
		"ItemGPS",																		//Terminal
		["TF_anprc152"] call _fnc_tfarRadio,					//Radio
		"ItemCompass",																//Compass
		_tfarMicroDAGRNoArray,												//Watch
		"RHSUSF_ANPVS_14"															//Goggles
	]
];
