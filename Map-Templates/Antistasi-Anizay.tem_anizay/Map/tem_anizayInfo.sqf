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
		private _disableTownName = [ "FobNauzad", "FobObeh"];
		 
		//[_popValue, _disableTownName];
		[nil, _disableTownName];
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