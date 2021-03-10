[//Loadout - These match the layout of an ACE arsenal export if you properly format it by breaking up and indenting the braces. Use the various +xyz to add medical, misc, flashlight and stun grenade as these are inteligently handled by the script so that ACE equiment is supplied where possible.
			[//Primary Weapon
			"",								//Weapon
			"",													//Muzzle
			"",									//Rail
			"",									//Sight
			["",30],						//Primary Magazine
			[],													//Secondary Magazine
			""													//Bipod
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
			"",									//Weapon
			"",									//Muzzle
			"",													//Rail
			"",													//Sight
			["", 11],								//Primary Magazine
			[],													//Secondary Magazine
			""													//Bipod
			],

			[//Uniform
			selectRandom										//Uniform
			["", ""], //No Ghillies.
			[] + _basicMedicalSupplies + _basicMiscItems
			],

			[//Vest
			selectRandom										//Vest
			["", "", ""],
			[//Inventory
			["",1]
			]
			+ _aceFlashlight
			+ _aceM84
			],

			[//Backpack
			"",							//Backpack
			[//Inventory
			["",3,1]
			]
			],

			selectRandom										//Headgear
			["", "", "", ""],
			"",													//Facewear

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
			"",											//Map
			"",											//Terminal
			[""] call _fnc_tfarRadio,				//Radio
			"",										//Compass
			"",										//Watch
			""													//Goggles
			]
	];
