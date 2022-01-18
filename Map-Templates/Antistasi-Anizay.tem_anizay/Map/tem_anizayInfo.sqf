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
		private _popValue = [["Akhund",102],["Anizay",89],["Baluchan",125],
		["Dehqobad",95],["Didar",111],["Dola",102],["Gholam",97],["Gorqan",89],
		["Idak",80],["Janur",96],["Kakoran",78],["Kaza",94],["Khas",80],["Landay",81],
		["makan_aljamal",75],["Maku",109],["Mian",93],["Murabat",87],["Musakhan",89],["Naudeh",82],
		["Naw", 123],["Qalandar",85],["Rangrezan",91],["Riqay",85],["Salam",83],["Seyyedan",84],
		["Zaranj",130],["Zarifkheyl",129]];

		private _disableTownName = ["Barekzi","Bum","Deraz","FobNauzad","FobObeh","Herati","Mahajerin","Maku","Tebbi","Sufian","Rangrezan"];
		 
		//[_popValue, _disableTownName];
		[_popValue, _disableTownName];
	};
	case "antennas": {
		private _posAntennas =
		[[4956.87,5345.27,0.394165],[3026.59,8501.88,0.0330505],[9142.61,1949.89,0.513176]];
		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, nil];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["outpost_8", "control_19", "control_44", "control_45"];
		private _controlsCSAT = ["control_19", "control_44", "control_45"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	case "climate": {
	"arid";
	};
	case "fuelStationTypes":{
		private _fuelStationTypes = ["Land_Fuelstation_Feed_F", "Land_fs_feed_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_01_pump_malevil_F", "Land_FuelStation_03_pump_F", "Land_FuelStation_02_pump_F"];
		//_fuelStationTypes
		[_fuelStationTypes];
	};
	default {
		Info("Map Info given unknown parameter");
	};
};