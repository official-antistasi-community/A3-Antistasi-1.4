[//Loadout
    [//Primary Weapon
    "UK3CB_BAF_L110A3",									//Weapon
    "UK3CB_BAF_SFFH",													//Muzzle     //Flashhider
    "UK3CB_BAF_LLM_Flashlight_Black",													//Rail
    "RKSL_optic_EOT552_C",													//Sight
    ["UK3CB_BAF_556_200Rnd",200],		//Primary Magazine
    [],													//Secondary Magazine
    "UK3CB_underbarrel_acc_grippod_t"													//Bipod
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
    "UK3CB_BAF_L131A1",								//Weapon
    "",					//Muzzle
    "UK3CB_BAF_Flashlight_L131A1",																//Rail
    "",																//Sight
    ["UK3CB_BAF_9_17Rnd",17],			//Primary Magazine
    [],																//Secondary Magazine
    ""																//Bipod
    ],

    [//Uniform
    "UK3CB_BAF_U_CombatUniform_MTP_RM",								//Uniform
    [] + _basicMedicalSupplies + _basicMiscItems
    ],

    [//Vest
    "UK3CB_BAF_V_Osprey_Rifleman_D",
    [//Inventory
    ["UK3CB_BAF_HMNVS",1],
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["UK3CB_BAF_9_17Rnd",1,17],
    ["UK3CB_BAF_556_200Rnd",1,200]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "UK3CB_BAF_B_Kitbag_MTP",						//Backpack
    [//Inventory
    ["UK3CB_BAF_556_200Rnd_T",2,200]
    ]

    ],

    "UK3CB_BAF_H_Mk7_Camo_ESS_D",				//Headgear
    "UK3CB_BAF_G_Tactical_Grey",       						  //Facewear

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
    ["TF_ANPRC152"] call _fnc_tfarRadio,				//Radio
    "ItemCompass",										//Compass
    _tfarMicroDAGRNoArray,										//Watch
    ""													//Goggles
    ]
];
