class iron_excelsior_Tobruk {
	population[] = {
        {"baccara",50},
        {"marcuca",0},
        {"solaro",0},
        {"hariga",0},
        {"perrone",0},
        {"hotel",86},
        {"tobruk",1360},
        {"birauda",102},
        {"hospital",25},
        {"airenti",0},
        {"oupost2",0},
        {"kingscross",0},
        {"outpost1",0},
        {"maclub",62},
        {"gubbi",50},
        {"mahmud",50},
        {"marsatobruk",50},
        {"daud",94},
        {"distillery",0}
    };
	disabledTowns[] = {"marcuca","solaro","hariga","perrone","airenti","oupost2","kingscross","outpost1","distillery"};
	antennas[] = {};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {{},{"outpost_9", "airport_2"},{},{}};
	fuelStationTypes[] = {};
	climate = "arid";
	buildObjects[] = {
		// Large vanilla arid structures
		{"Land_BagBunker_Large_F", 300}, {"Land_BagBunker_Tower_F", 300}, {"Land_BagBunker_Small_F", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
		// Vanilla arid sandbag walls
		{"Land_BagFence_Long_F", 10}, {"Land_BagFence_Round_F", 10}, {"Land_BagFence_Short_F", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
