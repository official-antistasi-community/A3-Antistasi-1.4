[																					//Loadout
	[																						//Primary Weapon
		"rhs_weap_m4a1_carryhandle",									//Weapon
		"",																						//Muzzle
		"rhsusf_acc_anpeq16a",												//Rail
		"RHSUSF_Acc_CompM4",												//Sight
		["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],			//Primary Magazine
		[],																						//Secondary Magazine
		"rhsusf_acc_kac_grip"													//Bipod
	],

	[																						//Launcher
		"RHS_Weap_MAAWS",															//Weapon
		"",																						//Muzzle
			"",																					//Rail
		"",																						//Sight
		["RHS_Mag_MAAWS_HEAT",1],											//Primary Magazine
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
			["RHS_Mag_M67",1,1],
			["rhsusf_mag_15Rnd_9x19_FMJ",2,15],
			["rhs_mag_30Rnd_556x45_M855A1_Stanag",4,30]
		]
		+	_aceFlashlight
		+ _aceClacker
		+ _aceM84
	],

	[																						//Backpack
		"rhsusf_falconii",														//Backpack
		[																									//Inventory
			["RHS_Mag_MAAWS_HEAT",1,1]
		]
	],

		"rhsusf_mich_bare_norotos_alt",						//Headgear
		"",		 																			//Facewear

	[																						//Binocular
		"Binocular",																	//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[																						//Item
		"ItemMap",																		//Map
		"",																						//Terminal
		["TF_anprc152"] call _fnc_tfarRadio,					//Radio
		"ItemCompass",																//Compass
		_tfarMicroDAGRNoArray,												//Watch
		"RHSUSF_ANPVS_14"															//Goggles
	]
];
