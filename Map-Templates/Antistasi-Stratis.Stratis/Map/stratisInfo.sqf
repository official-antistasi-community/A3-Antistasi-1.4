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
		[nil, _disableTownName];
	};
	case "zone": {
		//[_posAntennas, _blacklistPos, _posBank];
		[nil, nil, nil];
	};
	case "garrison": {
		private _mrkCSAT = ["outpost_3"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, nil];
	};
	case "selector": {
		A3A_terrain = "";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};