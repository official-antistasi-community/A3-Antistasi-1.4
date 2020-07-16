[                                            //Loadout
  [                                              //Primary Weapon
    "rhs_weap_svds",                                //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "rhs_acc_pso1m2",                                //Sight
    ["rhs_10Rnd_762x54mmR_7n1",10],                  //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                              //Bipod
  ],

  [                                              //Launcher
    "",                                              //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "",                                              //Sight
    [],                                              //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                              //Bipod
  ],

  [                                              //Secondary Weapon
    "RHS_Weap_makarov_pm",                          //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "",                                              //Sight
    ["rhs_mag_9x18_8_57n181s",8],                    //Primary Magazine
    [],                                              //Secondary Magazine
    ""                                              //Bipod
  ],

  [                                              //Uniform
    "rhsgref_uniform_ttsko_mountain",                //Uniform
    [] + _basicMedicalSupplies + _basicMiscItems
  ],

  [                                              //Vest
    "rhsgref_6b23_ttsko_mountain_sniper",          //Vest
    [                                                    //Inventory
      ["RHS_Mag_rgd5",2,1],
      ["RHS_mag_rdg2_white",2,1],
      ["rhs_10Rnd_762x54mmR_7n1",9,10],
      ["rhs_mag_9x18_8_57n181s",1,8]
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

    "rhsgref_ssh68_ttsko_mountain",              //Headgear
    "",                                          //Facewear

  [                                              //Binocular
    "Binocular",                                    //Binocular
    "",
    "",
    "",
    [],
    [],
    ""
  ],

  [                                              //Item
    "ItemMap",                                      //Map
    "",                                              //Terminal
    ["TF_anprc148jem"] call _fnc_tfarRadio,          //Radio
    "ItemCompass",                                  //Compass
    _tfarMicroDAGRNoArray,                          //Watch
    "rhs_1pn138"                                    //Goggles
  ]
];
