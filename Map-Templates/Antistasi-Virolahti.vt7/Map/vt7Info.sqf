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
		//To improve Performance, reduces pop from 13972 to 4850
		private _popValue = [["aarre",80],["Alapihlaja",90],["Eerikkala",88],["haavisto",60],["Hailila",90],["Hanski",100],["Harju",100],["harjula",70],["hirvela",0],
		["Hurppu",80],["Hyypianvuori",60],["Jarvenkyla",100],["kallio",10],["Kirkonkyla",500],["Klamila",150],["Koivuniemi",100],["Korpela",80],
		["Kouki",90],["Kuusela",100],["Lansikyla",100],["Myllynmaki",60],["Nakarinmaki",90],["Niemela",60],["nopala",80],["Ojala",80],["Onnela",100],
		["Pajunlahti",90],["piispa",100],["Pyterlahti",390],["Rannanen",80],["Ravijoki",90],["Riko",100],["Santaniemi",100],["Skippari",80],["suopelto",80],
		["Sydankyla",150],["Tinkanen",80],["toipela",0],["uski",80],["Uutela",100],["Vilkkila",110],["Virojoki",500],["Ylapaa",80],["Ylapihlaja",80],
		["Souvio",70]];

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
	case "antennas": {
		private _posAntennas =
		[[907.35,2955.65,0], [6644.62,7275.58,0.00256348], [6242.47,13009.4,0.39426], [13061.2,6487.81,0.760155],
		[1768.36,15526.1,0.00277328], [15449.2,16603.3,0]];
	
		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, nil];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["airport_2", "control_25", "control_29", "control_30", "control_31", "control_32", "Seaport_1", "Outpost_3"];
		private _controlsCSAT = ["control_25", "control_29", "control_30", "control_31", "control_32"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	case "climate": {
	"temperate";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};