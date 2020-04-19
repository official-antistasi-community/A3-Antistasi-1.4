[																					//Loadout
 [																							//Primary Weapon
	"rhs_weap_ak103_zenitco01",																	//Weapon
	"rhs_acc_dtk3",																		//Muzzel
	"rhs_acc_perst3_2dp_h",																//Rail
	"rhs_acc_pkas",																				//Sight
	["rhs_30Rnd_762x39mm_polymer",30],								//Primary Magazine
	[],																								//Secondary Magazine
		"" 																								//Grip

	],

	[																							//Launcher
		"",																								//Weapon
		"",																								//Muzzle
		"",																								//Rail
		"",																								//Sight
		[],																								//Primary Magazine
		[],																								//Secondary Magazine
		""																								//Bipod
	],

	[																							//Secondary Weapon
		"rhs_weap_pya",																		//Weapon
		"",																								//Muzzle
		"",																								//Rail
		"",																								//Sight
		["rhs_mag_9x19_17",17],														//Primary Magazine
		[],																								//Secondary Magazine
		""																								//Bipod
	],

	[																							//Uniform
		"rhs_uniform_emr_patchless",											//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems
	],

	[																							//Vest
		"rhs_6b23_digi_6sh92_headset_spetsnaz",					//Vest
		[																										//Inventory
			["rhs_mag_9x19_17",1,17],
			["rhs_30Rnd_762x39mm_polymer",5,30],
			["rhs_mag_rdg2_white",2,1],
			["rhs_mag_rgo",2,1]
		]
		+ _aceM84
		+	_aceFlashlight
	],

	[																							//Backpack
		"",																							//Backpack
		[]																									//Inventory
	],

		"rhs_6b27m_digi_ess_bala",									//Headgear
		[""],       									  						//Facewear

	[																							//Binocular
		"rhs_pdu4",																			//Binocular
		"",
		"",
		"",
		[],
		[],
		""
	],

	[																							//Item
		"ItemMap",																				//Map
		"ItemGPS",																				//Terminal
		["tf_fadak"] call _fnc_tfarRadio,									//Radio
		"ItemCompass",																		//Compass
		_tfarMicroDAGRNoArray,														//Watch
		"rhs_1PN138"																			//Goggles
	]
];
