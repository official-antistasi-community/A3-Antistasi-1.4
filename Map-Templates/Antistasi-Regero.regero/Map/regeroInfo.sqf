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
		_posAntennas = 
		[[7954.92,4073.66,-0.00434113],[5882.92,2019.64,-4.3018],[7277.5,2559.15,-15.4134],[7530.9,2127.34,5.72205e-006],
		[7187.52,1389.39,0.474205],[8438.74,2433.79,-0.0430965],[9554.05,4129.93,-15.3872],[9444.25,2874.31,-33.8679],
		[7165.63,555.428,-15.4359],[9347.84,1332.12,-0.0178871],[9354.15,1329.87,0.0515499],[9351.84,1197.67,-0.0194836],
		[9290.96,1080.57,-15.4632]];
		_blacklistIndex = [6, 7, 9, 10, 11, 12];

		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, _blacklistIndex];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		_mrkCSAT = ["airport_5", "outpost_17", "outpost_10"];
		_controlsCSAT = ["control_13"];
		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	case "climate": {
	"arid";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};