[//Loadout
    [//Primary Weapon
    "UK3CB_BAF_L119A1_FG",					//Weapon
    "UK3CB_BAF_SFFH",											//Muzzel
    "UK3CB_BAF_LLM_Flashlight_Black",									//Rail
    "RKSL_optic_EOT552",																	//Sight
    ["UK3CB_BAF_556_30Rnd",30],	//Primary Magazine
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
    "UK3CB_BAF_V_Osprey_Medic_B",
    [//Inventory
    ["UK3CB_BAF_HMNVS",1],
    ["UK3CB_BAF_SmokeShell",2,1],
    ["HandGrenade",1,1],
    ["UK3CB_BAF_9_17Rnd",1,17],
    ["UK3CB_BAF_556_30Rnd",4,30]
    ]
    + _aceFlashlight
    + _aceM84
    ],

    [//Backpack
    "UK3CB_BAF_B_Bergen_MTP_Medic_L_B",
    [] + _medicSupplies
	   ],

    "UK3CB_BAF_H_CrewHelmet_ESS_A",				//Headgear

    "UK3CB_BAF_G_Tactical_Grey",		//Facewear

    [//Binocular
    "",										//Binocular
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
