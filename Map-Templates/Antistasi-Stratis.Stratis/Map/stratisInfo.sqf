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
		//[_posAntennas, _blacklistIndex,]
		[nil, nil];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["outpost_3"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, nil];
	};
	case "climate": {
	"";
	};
	case "fuelStationTypes":{
		private _fuelStationTypes = ["Land_FuelStation_Feed_F"];
		//_fuelStationTypes
		[_fuelStationTypes];
	};
	default {
		Info("Map Info given unknown parameter");
	};
};