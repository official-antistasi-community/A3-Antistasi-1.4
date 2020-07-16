[                                            //Loadout
  [                                              //Primary Weapon
    "RHS_Weap_M249_PIP",                            //Weapon
    "",                                              //Muzzle
    "",                                              //Rail
    "RHSUSF_Acc_Eotech_xps3",                        //Sight
    ["RHSUSF_100Rnd_556x45_soft_pouch",100],        //Primary Magazine
    [],                                              //Secondary Magazine
    "rhsusf_acc_saw_bipod"                          //Bipod
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
    "rhsgref_6b23_ttsko_mountain",          //Vest
    [                                                    //Inventory
      ["RHS_Mag_rgd5",2,1],
      ["RHS_mag_rdg2_white",2,1],
      ["RHSUSF_100Rnd_556x45_soft_pouch",2,100],
      ["rhs_mag_9x18_8_57n181s",1,8]
    ]
    + _aceFlashlight
    + _aceM84
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
    "",                                               //Terminal
    ["TF_anprc148jem"] call _fnc_tfarRadio,          //Radio
    "ItemCompass",                                  //Compass
    _tfarMicroDAGRNoArray,                          //Watch
    "rhs_1pn138"                                    //Goggles
  ]
];
