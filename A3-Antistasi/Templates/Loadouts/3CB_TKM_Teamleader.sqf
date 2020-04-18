[//Loadout
    [//Primary Weapon
    "rhs_weap_akmn",									//Weapon
    "rhs_acc_dtkakm",													//Muzzle     //Flashhider
    "",													//Rail
    "rhs_acc_1p63",													//Sight
    ["rhs_30Rnd_762x39mm_bakelite_tracer",30],		//Primary Magazine
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
    selectrandom ["UK3CB_TKM_O_U_01","UK3CB_TKM_O_U_01_B","UK3CB_TKM_O_U_01_C","UK3CB_TKM_O_U_01_D","UK3CB_TKM_O_U_03","UK3CB_TKM_O_U_03_B","UK3CB_TKM_O_U_03_C","UK3CB_TKM_O_U_04","UK3CB_TKM_O_U_04_B","UK3CB_TKM_O_U_04_C","UK3CB_TKM_O_U_05","UK3CB_TKM_O_U_05_B","UK3CB_TKM_O_U_05_C","UK3CB_TKM_O_U_06","UK3CB_TKM_O_U_06_B","UK3CB_TKM_O_U_06_C"],								//Uniform
    [] + _basicMedicalSupplies + _basicMiscItems
    ],

    [//Vest
    "UK3CB_V_Pouch",
    [//Inventory
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["rhs_18rnd_9x21mm_7BT3",1,18],
    ["rhs_30Rnd_762x39mm_bakelite_tracer",4,30]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "UK3CB_B_O_Radio_Backpack",						//Backpack
    [//Inventory
    ["SmokeShellGreen",1,1],
    ["SmokeShellOrange",1,1],
    ["SmokeShellRed",1,1]
    ]

    ],

    selectrandom ["UK3CB_TKM_O_H_Turban_01_1","UK3CB_TKM_O_H_Turban_02_1","UK3CB_TKM_O_H_Turban_03_1","UK3CB_TKM_O_H_Turban_04_1","UK3CB_TKM_O_H_Turban_05_1"],				//Headgear
    "UK3CB_G_Face_Wrap_01",       						  //Facewear

    [//Binocular
    "rhs_tr8_periscope",					//Binocular
    "",
    "",
    "",
    [],
    [],
    ""
    ],

    [//Item
    "ItemMap",											//Map
    "ItemGPS",													//Terminal
    ["tf_fadak"] call _fnc_tfarRadio,				//Radio
    "ItemCompass",										//Compass
    _tfarMicroDAGRNoArray,										//Watch
    ""													//Goggles
    ]
];
