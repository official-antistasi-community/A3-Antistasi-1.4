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
  	"UK3CB_CW_SOV_O_Late_U_Spetsnaz_Uniform_Gorka_01_KLMK",
  	[] + _basicMedicalSupplies + _basicMiscItems
  	],

    [//Vest
    "rhs_6b5",
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
