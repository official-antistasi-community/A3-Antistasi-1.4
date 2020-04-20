[																	 				  //Loadout
	[																							//Primary Weapon
		"rhs_weap_pkp",																	//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		["rhs_100Rnd_762x54mmR",100],										//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Launcher
		"",																							//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		[],																							//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Secondary Weapon
		"rhs_weap_pya",																	//Weapon
		"",																							//Muzzle
		"",																							//Rail
		"",																							//Sight
		["rhs_mag_9x19_17",17],													//Primary Magazine
		[],																							//Secondary Magazine
		""																							//Bipod
	],

	[																							//Uniform
		"rhs_uniform_emr_patchless",										//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																							//Vest
		"rhs_6b23_digi_6sh92_headset_spetsnaz",					//Vest
		[																										//Inventory
			["rhs_mag_9x19_17",1,17],
			["rhs_mag_rdg2_white",2,1],
			["rhs_mag_rgo",1,1]
			]
		+ _aceM84
		+	_aceFlashlight
	],

	[																							//Backpack
		"rhs_sidor",																		//Backpack
		[																										//Inventory
			["rhs_100Rnd_762x54mmR",2,100]
		]
	],

																									//Headgear
		"rhs_6b27m_digi_ess_bala",
		"",																						//Facewear

	[																								//Binocular
		"Binocular",																			//Binocular
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
		_tfarMicroDAGRNoArray,													//Watch
		"rhs_1PN138"																		//Goggles
	]
];
