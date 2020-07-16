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
    "rhs_weap_rpg7",									//Weapon
    "",													//Muzzle
    "",													//Rail
    "",													//Sight
    ["rhs_rpg7_PG7VL_mag",1],		//Primary Magazine
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
  	"UK3CB_CW_SOV_O_Late_U_Spetsnaz_Uniform_Gorka_01_KLMK",
  	[] + _basicMedicalSupplies + _basicMiscItems
  	],

    [//Vest
    "rhs_6b5",
    [//Inventory
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["rhs_18rnd_9x21mm_7BT3",1,18],
    ["rhs_30Rnd_762x39mm_polymer",4,30],
    ["rhs_mine_msk40p_red_mag",2,1]                 //Flaremine
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "rhs_rpg_empty",						//Backpack
    [//Inventory
    ["rhs_rpg7_PG7VL_mag",2,1]
    ]
    ],

    "UK3CB_ABP_B_H_6b27m_DES",				//Headgear

    "G_Balaclava_oli",       						  //Facewear

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
    ["tf_fadak"] call _fnc_tfarRadio,				//Radio
    "ItemCompass",										//Compass
    _tfarMicroDAGRNoArray,										//Watch
    ""													//Goggles
    ]
];
