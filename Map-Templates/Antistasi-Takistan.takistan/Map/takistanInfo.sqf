params["_filename", ""];

switch (_filename) do {
	case "zone": {
		A3A_antennasDead = [];
		A3A_banks = [];
		A3A_mrkAntennas = [];
		A3A_posAntennas = [];
		A3A_blacklistPos = [];
		A3A_posBank = [];
		A3A_hardcodedPop = false;
		A3A_hardCodedAntennas = true;
		A3A_disableTowns = true;
		A3A_disableTownName = [];

		A3A_disableTownName = ["Lakatoro01", "Galili01","Sosovu01", "Ipota01", "Malden_C_Airport", "FobNauzad", "FobObeh", "22",
		"23", "toipela", "hirvela", "Kuusela", "Niemela", "fob4", "daumau", "fob1", "quanloi", "stagingarea", "fob2",
		"pleimei", "fob6", "berchtesgaden", "fob3", "khegio", "fob5", "thudridge", "halongnavybase", "plainofjars", "pleikuboatbase",
		"banhoang", "vinhau", "kechau", "quanbo", "huecitadel", "bimat", "danthemthem", "daophai", "phuquoc", "dharmadocks",
 		"dharma", "patmep", "phokham", "rungcung", "tiengtai", "vacang", "hanoi3", "saigonport", "ansungsong", "vanchu",
 		"sangha", "hoxanx", "congtroi", "boave", "longhai", "honba", "kiemtra", "baibiendiep", "nuocbun", "cantho",
 		"nhenden", "soctrang", "mekongdelta", "tampep", "segbegat", "che", "tandi", "lahot", "alieng", "thiengling",
 		"phaonoi", "timho", "quyen", "caloi", "thuphac", "diemdang", "bandao", "mantau","dongxa", "tauphabang", "horgoat",
 		"samsong", "muylai", "caymo", "docon", "paradiseisland", "mien", "giuaho", "daotrai"];

		A3A_posAntennas =
		[[4014.64,3089.66,0.150604], [5249.37,3709.48,-0.353882], [3126.7,8223.88,-0.649429], [8547.92,3897.03,-0.56073], [5578.24,9072.21,-0.842239], [2239.98,12630.7,-0.575844]];
		A3A_blacklistPos = [];
		antennas = [];
	};
	case "garrison": {
		A3A_mrkNATO = [];
		A3A_mrkCSAT = [];
		A3A_controlsNATO = [];
		A3A_controlsCSAT = [];

		A3A_mrkCSAT = ["airport_1", "outpost_5", "outpost_6", "outpost_7", "outpost_8", "resource", "resource_5", "resource_6"];
		A3A_controlsCSAT = ["control", "control_1", "control_2", "control_5", "control_13", "control_20", "control_21", "control_22", "control_24", "control_25", "control_31"];
	};
	case "selector": {
		A3A_terrain = "arid";
	};
	default {};
};