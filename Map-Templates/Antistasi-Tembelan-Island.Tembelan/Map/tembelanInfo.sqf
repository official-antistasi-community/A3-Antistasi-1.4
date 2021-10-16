/*
    Author: []
    [Description]
        map data getter

    Arguments:
    0. <String> key for globals need in file

	Return:
	0. <any> data returned

    Scope: Server
    Environment: scheduled 
    Public: [yes]
    Dependencies:

    Example:
	private _fnc_mapInfo = compile preProcessFileLineNumbers ("Map\"+ toLower worldName +"Info.sqf");
	("antennas" call _fnc_mapInfo) params [["_posAntennas", [], [[]]], ["_blacklistIndex",[],[[]]]];

    License: MIT license 
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
	case "antennas": {

		private _posAntennas =
		[[502.398,348.476,0.000190735], [4310.99,844.668,0.0271759], [1724.15,4777.62,-1.14441e-005], [2916.02,4174.11,1.14441e-005],
		[3020.15,8111.37,0.517868], [4133.57,8028.41,0.30658], [7080.68,5748.77,0.500134], [9160.06,4707.45,0.19401],
		[9542.17,5029,0.0381298], [9191.69,6012.89,0], [9238.39,6075.66,0.160484]];
		private _blacklistIndex = [1, 4, 6, 8, 9];

		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, _blacklistIndex];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["airport_4"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, nil];
	};
	case "climate": {
	"temperate";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};