class Staszow {
	population[] = {
    {"Zaraz",83},
    {"Ogledow",262},
    {"STASZOW",729},
    {"SZYDLOW",698},
    {"KUROZWEKI",240},
    {"Osowka",280},
    {"Korytnica",210},
    {"WolaOsowa",222},
    {"Mokre",81},
    {"Yablonica",135},
    {"Ponik",137},
    {"Sielec",231},
    {"Ziemblice",99},
    {"Kucow",127},
    {"Gacki",173},
    {"Pieczonogi_Gacki",82},
    {"Dobrow",314},
    {"Rzedow",173},
    {"Grzybow",191},
    {"Brzezina",61},
    {"Na_Gorze",34},
    {"Krzywolecz",138},
    {"Podlesie",54},
    {"Koniemloty",238},
    {"Niemscice",130},
    {"Nizny",243},
    {"Januszkowice",107},
    {"Wola",163},
    {"Poduchowna",120},
    {"Gacki_nw",64},
    {"Zyzna",117},
    {"Kol_Rzedow",82},
    {"Stefanowek",121},
    {"SichowDuzy",171},
    {"SichowMaly",221},
    {"Brzeziny",160},
    {"OsowkaNowa",128},
    {"OsowkaStara",55},
    {"Pacanowka",252},
    {"Kotuszow",177},
    {"Swiecica",127},
    {"Gora",181},
    {"Jasien",161},
    {"Jaroslawice",199},
    {"Tuklecz",213},
    {"Sachalin",223},
    {"Krzczonowice",132},
    {"Lenartwoice",128},
    {"Niecieslawice",114},
    {"Wierzbica",209},
    {"Poddebowiec",123},
    {"Gaj_Koniemlocki",121},
    {"Czernica",194},
    {"Podlesie2",117},
    {"Tuczepy2",106},
    {"Nowy",95},
    {"Wadoty",69},
    {"Kol_Wierzbicka",47},
    {"Podborek",125},
    {"Zapusty",139},
    {"Rudki",37},
    {"Podlesie3",117},
    {"Sieczkow",149},
    {"Przyjmy",50},
    {"Krzewiny",26},
    {"Wolka_zabna",108},
    {"Kopanina",78}
    };
	disabledTowns[] = {};
	antennas[] = {};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {{},{"airport_4"},{},{}};
	fuelStationTypes[] = {};
	climate = "temperate";
	buildObjects[] = {
		// Large vanilla tropical structures
		{"Land_BagBunker_01_large_green_F", 300}, {"Land_HBarrier_01_tower_green_F", 300}, {"Land_BagBunker_01_small_green_F", 60},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
		// vanilla tropical sandbag walls
		{"Land_BagFence_01_short_green_F", 10}, {"Land_BagFence_01_round_green_F", 10}, {"Land_BagFence_01_long_green_F", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
