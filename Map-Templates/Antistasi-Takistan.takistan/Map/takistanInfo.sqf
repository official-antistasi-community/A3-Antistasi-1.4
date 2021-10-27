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
		[nil, _disableTownName];
	};
	case "antennas": {
		private _posAntennas =
		[[4014.64,3089.66,0.150604], [5249.37,3709.48,-0.353882], [3126.7,8223.88,-0.649429], [8547.92,3897.03,-0.56073], [5578.24,9072.21,-0.842239], [2239.98,12630.7,-0.575844]];
		
		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, nil];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["airport_1", "outpost_5", "outpost_6", "outpost_7", "outpost_8", "resource", "resource_5", "resource_6"];
		private _controlsCSAT = ["control", "control_1", "control_2", "control_5", "control_13", "control_20", "control_21", "control_22", "control_24", "control_25", "control_31"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	};
	case "climate": {
	"arid";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};