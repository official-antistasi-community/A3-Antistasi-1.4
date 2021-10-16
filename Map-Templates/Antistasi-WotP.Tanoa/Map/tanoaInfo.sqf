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

    License: MIT the license 
*/
#include "..\Includes\common.inc"

params["_filename", ""];

switch (_filename) do {
	case "population": {
		private _popValue = 	[["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],
		["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],
		["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],
		["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],
		["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],
		["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],
		["Ovau01",226],["IndPort01",420],["Ba01",106]];

		private _disableTownName = ["Lakatoro01", "Galili01","Sosovu01", "Ipota01", "Malden_C_Airport", "FobNauzad", "FobObeh", "22",
		"23", "toipela", "hirvela", "Kuusela", "Niemela", "fob4", "daumau", "fob1", "quanloi", "stagingarea", "fob2",
		"pleimei", "fob6", "berchtesgaden", "fob3", "khegio", "fob5", "thudridge", "halongnavybase", "plainofjars", "pleikuboatbase",
		"banhoang", "vinhau", "kechau", "quanbo", "huecitadel", "bimat", "danthemthem", "daophai", "phuquoc", "dharmadocks",
 		"dharma", "patmep", "phokham", "rungcung", "tiengtai", "vacang", "hanoi3", "saigonport", "ansungsong", "vanchu",
 		"sangha", "hoxanx", "congtroi", "boave", "longhai", "honba", "kiemtra", "baibiendiep", "nuocbun", "cantho",
 		"nhenden", "soctrang", "mekongdelta", "tampep", "segbegat", "che", "tandi", "lahot", "alieng", "thiengling",
 		"phaonoi", "timho", "quyen", "caloi", "thuphac", "diemdang", "bandao", "mantau","dongxa", "tauphabang", "horgoat",
 		"samsong", "muylai", "caymo", "docon", "paradiseisland", "mien", "giuaho", "daotrai"];
		
		//[_popValue, _disableTownName];
		[_popValue, _disableTownName];
	};
	case "zone": { 
		private _posAntennas =
		[[2682.94,2592.64,-0.000686646], [4701.6,3165.23,0.0633469], [2437.25,7224.06,0.0264893], [2563.15,9017.1,0.291538],
		[6617.95,7853.57,0.200073], [11008.8,4211.16,-0.00154114], [6005.47,10420.9,0.20298], [7486.67,9651.9,1.52588e-005],
		[2690.54,12323,0.0372467], [2965.33,13087.1,0.191544], [7278.8,12846.6,0.0838776], [12889.2,8578.86,0.228729],
		[10114.3,11743.1,9.15527e-005], [10949.8,11517.3,0.14209], [11153.3,11435.2,0.210876], [13775.8,10976.8,0.170441]];	// All antennas to be bases or to ignore.
		private _blacklistPos = [9, 14];		// Ignore Antenna at <Index> in A3A_posAntennas.
		private _posBank = [[5893.41,10253.1,-0.687263], [9507.5,13572.9,0.133848]];	// same as RT for Bank buildings, select the biggest buildings in your island, and make a DB with their positions.
	
		//[_posAntennas, _blacklistPos, _posBank];
		[_posAntennas, _blacklistPos, _posBank];
	};
	case "garrison": {
		_mrkCSAT = ["airport_1", "seaport_5", "outpost_10", "control_20"];
		_controlsCSAT = ["control_20"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, A3A_controlsCSAT]
	};
	case "selector": {
		A3A_terrain = "tropical";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};

