[//Loadout
    [//Primary Weapon
    "rhs_weap_ak103",					//Weapon
    "rhs_acc_dtk3",											//Muzzel
    "",									//Rail
    "rhs_acc_pkas",																	//Sight
    ["rhs_30Rnd_762x39mm_polymer",30],	//Primary Magazine
    [],										//Secondary Magazine
    "" 	//Grip

    ],

    [//Launcher
    "",													//Weapon
    "",													//Muzzle
    "",													//Rail
    "",													//Sight
    [],													//Primary Magazine
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
    ["rhs_30Rnd_762x39mm_polymer",4,30]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "rhs_sidor",
    [] + _medicSupplies
		],

    "UK3CB_ABP_B_H_6b27m_DES",				//Headgear

    "G_Balaclava_oli",       						  //Facewear

    [//Binocular
    "Binocular",										//Binocular
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
