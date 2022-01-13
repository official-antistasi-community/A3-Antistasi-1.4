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
		//[_popValue, _disableTownName];
		[nil, nil];
	};
	case "antennas": {
		private _posAntennas =
		[[3142.96,2739.15,0.18647], [8514.74,7996.98,0.0240936], [11464.1,6307.43,-0.0322723], [11885.1,6210.11,-15.4125],
		[9617.11,9829.03,0], [10214.7,9348.09,0.0702515], [9738.74,9966.7,-0.226944], [10415.5,9761.01,-0.0189056],
		[12621.4,7490.31,0.1297], [12560.1,8362.11,-0.157566], [13328.6,9055.83,0.350442], [4940.89,15457.6,-0.18277],
		[12327.2,15031.4,0], [14788,12762.9,-15.4287], [11068.1,16903.5,-0.0132771], [13964.6,15752.9,-15.429],
		[17263.3,14160.1,-0.1]];
		private _blacklistIndex = [1, 3, 4, 5, 9, 11, 13, 16, 17];
		
		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, _blacklistIndex];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["airport_1", "seaport_6", "outpost_22", "outpost_15", "resource_9", "outpost_19", "outpost_14", "resource_11"];
		private _controlsCSAT = ["control_28", "control_27"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	case "climate": {
	"arid";
	};
	case "fuelStationTypes":{
		private _fuelStationTypes = ["Land_Fuelstation_army", "Land_Benzina_schnell"];
		//_fuelStationTypes
		[_fuelStationTypes];
	};
	default {
		Info("Map Info given unknown parameter");
	};
};