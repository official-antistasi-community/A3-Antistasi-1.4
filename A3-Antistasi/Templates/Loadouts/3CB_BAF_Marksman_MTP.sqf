[																					//Loadout
	[																						//Primary Weapon
    "UK3CB_BAF_L129A1",							             //Weapon
    "",																				   //Muzzle
    "UK3CB_BAF_LLM_IR_Black",									   //Rail
    "RKSL_optic_PMII_312",  										 //Sight
    ["UK3CB_BAF_762_L42A1_20Rnd",20],            //Primary Magazine
    [],                                          //Secondary Magazine
    "UK3CB_underbarrel_acc_bipod" 		  			   //Bipod
  ],

  [																						//Launcher
    "",									                          //Weapon
    "",													                  //Muzzle
    "",													                  //Rail
    "",													                  //Sight
    [],													                  //Primary Magazine
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
    "UK3CB_BAF_V_Osprey_Marksman_A",              //vest
    [                                                 //Inventory
      ["UK3CB_BAF_SmokeShell",2,1],
      ["HandGrenade",1,1],
      ["UK3CB_BAF_9_17Rnd",1,17],
      ["UK3CB_BAF_762_L42A1_20Rnd",4,20]
    ]
    + _aceFlashlight
    + _aceM84
    + _aceRangecard
  ],

  [																						//Backpack
		[																					    //Backpack
		[]																						    //Inventory
		]
	],

"UK3CB_BAF_H_Mk7_Camo_ESS_A",				          //Headgear
"UK3CB_BAF_G_Tactical_Clear",       					//Facewear

  [																						//Binocular
    "Binocular",							    								//Binocular
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
