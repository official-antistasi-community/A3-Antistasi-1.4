[//Loadout
    [//Primary Weapon
    "UK3CB_Enfield_Rail",									//Weapon
    "",													//Muzzle
    "",													//Rail
    "RKSL_optic_PMII_312",													//Sight
    ["UK3CB_Enfield_Mag",10],		//Primary Magazine
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
  	["UK3CB_TKM_O_U_01","UK3CB_TKM_O_U_01_B","UK3CB_TKM_O_U_01_C","UK3CB_TKM_O_U_01_D","UK3CB_TKM_O_U_03","UK3CB_TKM_O_U_03_B","UK3CB_TKM_O_U_03_C","UK3CB_TKM_O_U_04","UK3CB_TKM_O_U_04_B","UK3CB_TKM_O_U_04_C","UK3CB_TKM_O_U_05","UK3CB_TKM_O_U_05_B","UK3CB_TKM_O_U_05_C","UK3CB_TKM_O_U_06","UK3CB_TKM_O_U_06_B","UK3CB_TKM_O_U_06_C"],
  	[] + _basicMedicalSupplies + _basicMiscItems
  	],

    [//Vest
    "UK3CB_V_Pouch",
    [//Inventory
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["rhsgref_10rnd_765x17_vz61",4,10],
    ["UK3CB_Enfield_Mag",5,10]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
		[//Inventory
		[]
		]
		],

    selectrandom ["UK3CB_TKM_O_H_Turban_01_1","UK3CB_TKM_O_H_Turban_02_1","UK3CB_TKM_O_H_Turban_03_1","UK3CB_TKM_O_H_Turban_04_1","UK3CB_TKM_O_H_Turban_05_1"],				//Headgear
    "UK3CB_G_Face_Wrap_01",       						  //Facewear

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
