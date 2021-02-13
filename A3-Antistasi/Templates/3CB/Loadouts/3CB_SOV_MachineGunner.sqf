[//Loadout
    [//Primary Weapon
    "UK3CB_RPK",									//Weapon
    "",													//Muzzle     //Flashhider
    "",													//Rail
    "",													//Sight
    ["UK3CB_RPK_75Rnd_Drum_T",75],		//Primary Magazine
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
    ["UK3CB_RPK_75Rnd_Drum_T",1,75],
    ["UK3CB_RPK_75Rnd_Drum",2,75]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "rhs_sidor",						//Backpack
    [//Inventory
    ["UK3CB_RPK_75Rnd_Drum_T",1,75]
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
