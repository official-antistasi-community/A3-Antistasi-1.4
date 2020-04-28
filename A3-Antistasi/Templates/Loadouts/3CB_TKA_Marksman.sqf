[//Loadout
    [//Primary Weapon
    "rhs_weap_svdp_wd",									//Weapon
    "",													//Muzzle
    "",													//Rail
    "rhs_acc_pso1m2",													//Sight
    ["rhs_10Rnd_762x54mmR_7N1",10],		//Primary Magazine
    [],													//Secondary Magazine
    ""													//Bipod
    ],

    [//Launcher
    "",									//Weapon
    "",													//Muzzle
    "",													//Rail
    "",													//Sight
    [],		//Primary Magazine
    [],													//Secondary Magazine
    ""													//Bipod
    ],

    [//Secondary Weapon
    "rhs_weap_savz61_folded",								//Weapon
    "",					//Muzzle
    "",																//Rail
    "",																//Sight
    ["rhsgref_10rnd_765x17_vz61",10],			//Primary Magazine
    [],																//Secondary Magazine
    ""																//Bipod
    ],

    [//Uniform
  	selectRandom										//Uniform
  	["UK3CB_TKA_I_U_CombatUniform_01_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_02_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_03_TKA_Brush"],
  	[] + _basicMedicalSupplies + _basicMiscItems
  	],

    [//Vest
    selectrandom
    ["UK3CB_TKA_I_V_6Sh92_TKA_Brush", "UK3CB_TKA_I_V_6Sh92_Radio_TKA_Brush", "UK3CB_TKA_I_V_6Sh92_vog_TKA_Brush"],
    [//Inventory
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["rhs_10Rnd_762x54mmR_7N1",6,10],
    ["rhs_mine_msk40p_blue_mag",2,1]    //Flaremine
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
		[//Inventory
		[]
		]
		],

    "UK3CB_TKA_I_H_Shemag_Des",				//Headgear

    selectrandom
    ["G_Bandanna_khk","UK3CB_G_Neck_Shemag_Tan"],       						  //Facewear

    [//Binocular
    "Binocular",					//Binocular
    "",
    "",
    "",
    [],
    [],
    ""
    ],

    [//Item
    "ItemMap",											//Map
    "",													//Terminal
    ["tf_anprc148jem"] call _fnc_tfarRadio,				//Radio
    "ItemCompass",										//Compass
    _tfarMicroDAGRNoArray,										//Watch
    ""													//Goggles
    ]
];
