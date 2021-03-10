[                                            //Loadout
  [                                              //Primary Weapon
    "rhs_weap_ak105_zenitco01",                      //Weapon
    "rhs_acc_dtk3",                                  //Muzzle
    "rhs_acc_perst3_2dp_h",                          //Rail
    "rhs_acc_pkas",                                  //Sight
    ["rhs_30rnd_545x39_7n10_ak",30],                //Primary Magazine
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
    "rhsgref_6b23_ttsko_mountain_rifleman",          //Vest
    [                                                    //Inventory
      ["RHS_Mag_rgd5",2,1],
      ["RHS_mag_rdg2_white",2,1],
      ["rhs_30rnd_545x39_7n10_ak",4,30],
      ["rhs_mag_9x18_8_57n181s",1,8]
    ]
    + _aceFlashlight
    + _aceM84
  ],

  [                                              //Backpack
    "rhs_medic_bag",                                //Backpack
    [] + _medicSupplies
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
