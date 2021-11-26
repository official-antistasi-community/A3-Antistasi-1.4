[                                            //Loadout
  [                                              //Primary Weapon
    "ffaa_armas_hkg36k_tir",                         //Weapon
    "",                                              //Muzzle
    "ffaa_acc_puntero_ir",                           //Rail
    "ffaa_optic_holografico",                        //Sight
    ["ffaa_556x45_g36",30],                          //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                               //Bipod
  ],

  [                                              //Launcher
    "ffaa_armas_c90",                                //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "",                                              //Sight
    ["ffaa_mag_c90",1],                              //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                               //Bipod
  ],

  [                                              //Secondary Weapon
    "ffaa_armas_usp",                                //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "",                                              //Sight
    ["ffaa_9x19_pistola",15],                        //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                               //Bipod
  ],

  [                                              //Uniform
    "ffaa_brilat_CombatUniform_item_d",              //Uniform
    [] + _basicMedicalSupplies + _basicMiscItems
  ],

  [                                              //Vest
    "ffaa_et_moe_peco_02_mtp",                       //Vest
    [                                                    //Inventory
      ["ffaa_556x45_g36",4,30],
      ["ffaa_9x19_pistola",1,15],
      ["ffaa_granada_alhambra",2,1],
      ["SmokeShell",2,1]
    ]
    + _aceFlashlight
    + _aceM84
  ],

  [                                              //Backpack
    "ffaa_brilat_mochila_ligera_arida",              //Backpack
    [                                                    //Inventory
      ["ffaa_mag_c90",1,1]
    ]
  ],

    selectRandom                                //Headgear
    ["ffaa_moe_casco_02_1_d","ffaa_moe_casco_02_2_d","ffaa_moe_casco_02_3_d","ffaa_moe_casco_02_4_d","ffaa_moe_casco_02_5_d"],
    "ffaa_Glasses",                             //Facewear

  [                                             //Binocular
    "Binocular",                                    //Binocular
    "",
    "",
    "",
    [],
    [],
    ""
  ],

  [                                              //Item
    "ItemMap",                                       //Map
    "",                                              //Terminal
    ["tf_anprc152"] call _fnc_tfarRadio,             //Radio
    "ItemCompass",                                   //Compass
    _tfarMicroDAGRNoArray,                           //Watch
    "ffaa_nvgoggles"                                 //Goggles
  ]
];
