[                                            //Loadout
  [                                              //Primary Weapon
    "ffaa_armas_aw",                                 //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "ffaa_optic_3x12x50",                            //Sight
    ["ffaa_762x51_accuracy",10],                     //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                               //Bipod
  ],

  [                                              //Launcher
    "",                                              //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "",                                              //Sight
    [],                                              //Primary Magazine
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
    "ffaa_brilat_CombatUniform_item_b",              //Uniform
    [] + _basicMedicalSupplies + _basicMiscItems
  ],

  [                                              //Vest
    "ffaa_et_moe_peco_02_mtp",                       //Vest
    [                                                    //Inventory
      ["ffaa_762x51_accuracy",10,10],
      ["ffaa_9x19_pistola",1,15],
      ["ffaa_granada_alhambra",2,1],
      ["SmokeShell",2,1]
    ]
    + _aceFlashlight
    + _aceM84
    + _aceRangecard
  ],

  [                                             //Backpack
      [                                             //Backpack
          []                                            //Inventory
      ]
  ],

    selectRandom                                //Headgear
    ["ffaa_moe_casco_02_1_b","ffaa_moe_casco_02_2_b","ffaa_moe_casco_02_3_b","ffaa_moe_casco_02_4_b","ffaa_moe_casco_02_5_b"],
    "ffaa_Glasses",                             //Facewear

  [                                             //Binocular
    "Binocular",                                  //Binocular
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
