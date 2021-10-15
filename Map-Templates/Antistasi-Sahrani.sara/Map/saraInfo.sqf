/*
    Author: []
    [Description]
        Adds globals to the misson that are used in initZones, selector, and initGarrison, depends on what the parameter is.

    Arguments:
    0. <String> key for globals need in file

    Scope: Server
    Environment: scheduled 
    Public: [no]
    Dependencies:

    Example:
	private _fileName = "Map\" + toLower worldName + "Info.sqf";
	["garrison"] call compile preProcessFileLineNumbers _filename;

    License: MIT the license switch is noted in the code
*/

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
		[[3142.96,2739.15,0.18647], [8514.74,7996.98,0.0240936], [11464.1,6307.43,-0.0322723], [11885.1,6210.11,-15.4125],
		[9617.11,9829.03,0], [10214.7,9348.09,0.0702515], [9738.74,9966.7,-0.226944], [10415.5,9761.01,-0.0189056],
		[12621.4,7490.31,0.1297], [12560.1,8362.11,-0.157566], [13328.6,9055.83,0.350442], [4940.89,15457.6,-0.18277],
		[12327.2,15031.4,0], [14788,12762.9,-15.4287], [11068.1,16903.5,-0.0132771], [13964.6,15752.9,-15.429],
		[17263.3,14160.1,-0.1]];
		A3A_blackListPos = [1, 3, 4, 5, 9, 11, 13, 16, 17];
		antennas = [];
	};
	case "garrison": {
		A3A_mrkNATO = [];
		A3A_mrkCSAT = [];
		A3A_controlsNATO = [];
		A3A_controlsCSAT = [];

		A3A_mrkCSAT = ["airport_1", "seaport_6", "outpost_22", "outpost_15", "resource_9", "outpost_19", "outpost_14", "resource_11"];
		A3A_controlsCSAT = ["control_28", "control_27"];
	};
	case "selector": {
		A3A_terrain = "arid";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};