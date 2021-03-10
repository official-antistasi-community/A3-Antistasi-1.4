[//Loadout
    [//Primary Weapon
    "rhs_weap_ak103",					//Weapon
    "rhs_acc_dtk3",											//Muzzel
    "",									//Rail
    "rhs_acc_ekp1",																	//Sight
    ["rhs_30Rnd_762x39mm_polymer",30],	//Primary Magazine
    [],													//Secondary Magazine
    ""													//Bipod
    ],

    [//Launcher
    "rhs_weap_rpg26",									//Weapon
    "",													//Muzzle
    "",													//Rail
    "",													//Sight
    [],		//Primary Magazine
    [],													//Secondary Magazine
    ""													//Bipod
    ],

    [//Secondary Weapon
    "rhs_weap_6p53",								//Weapon
    "",					//Muzzle
    "",																//Rail
    "",																//Sight
    ["rhs_18rnd_9x21mm_7BT3",18],			//Primary Magazine
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
    ["rhs_18rnd_9x21mm_7BT3",1,18],
    ["rhs_30Rnd_762x39mm_polymer",4,30],
    ["rhs_mine_msk40p_white_mag",2,1]                 //Flaremine
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "rhs_rpg_empty",						//Backpack
    [//Inventory
    ["rhs_rpg7_PG7VR_mag",2,1]
    ]
    ],

    selectrandom
    ["UK3CB_TKA_I_H_SSh68_Khk","UK3CB_TKA_I_H_Shemag_Des"],				//Headgear

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
