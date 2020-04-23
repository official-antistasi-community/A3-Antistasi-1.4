[																					//Loadout
	[																						//Primary Weapon
    "UK3CB_BAF_L119A1_FG",							          //Weapon
    "",																				    //Muzzle
    "UK3CB_BAF_LLM_IR_Black",									    //Rail
    "RKSL_optic_EOT552",  										    //Sight
    ["UK3CB_BAF_556_30Rnd",30],                   //Primary Magazine
    [],                                           //Secondary Magazine
    "" 																				    //Bipod
  ],

  [																						//Launcher
    "rhs_weap_maaws",									            //Weapon
    "",													                  //Muzzle
    "",													                  //Rail
    "",													                  //Sight
    ["rhs_mag_maaws_HEAT",1],											//Primary Magazine
    [],													                  //Secondary Magazine
    ""													                  //Bipod
  ],

  [                                           //Secondary Weapon
    "UK3CB_BAF_L131A1",							            	//Weapon
    "",					                                  //Muzzle
    "",					                                  //Rail
    "",					                                  //Sight
    ["UK3CB_BAF_9_17Rnd",17],			                //Primary Magazine
    [],																            //Secondary Magazine
    ""																            //Bipod
  ],

  [                                           //Uniform
    "UK3CB_BAF_U_CombatUniform_MTP_RM",						//Uniform
		[] + _basicMedicalSupplies + _basicMiscItems      //Inventory
  ],

  [                                           //Vest
    "UK3CB_BAF_V_Osprey_Rifleman_E",              //vest
    [                                                 //Inventory
      ["UK3CB_BAF_SmokeShell",2,1],
      ["HandGrenade",2,1],
      ["UK3CB_BAF_9_17Rnd",1,17],
      ["UK3CB_BAF_556_30Rnd",4,30]
    ]
    + _aceFlashlight
    + _aceM84
  ],

  [																							//Backpack
		"UK3CB_BAF_B_Kitbag_MTP",												//Backpack
		[																										//Inventory
			["rhs_mag_maaws_HEAT",1,1]
		]
	],

"UK3CB_BAF_H_Mk7_Camo_ESS_A",				          //Headgear
"UK3CB_BAF_G_Tactical_Clear",       					//Facewear

  [																						//Binocular
    "Binocular",							                    //Binocular
    "",
    "",
    "",
    [],
    [],
    ""
  ],

  [																						//Item
		"ItemMap",																		//Map
		"",																		        //Terminal
		["TF_anprc152"] call _fnc_tfarRadio,					//Radio
		"ItemCompass",																//Compass
		_tfarMicroDAGRNoArray,												//Watch
		"UK3CB_BAF_HMNVS"															//Goggles
	]
];
