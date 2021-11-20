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
	("antennas" call _fnc_mapInfo) params [["_posAntennas", [], [[]]], ["_blacklistIndex",[], [[]]]];

    License: MIT license
*/
#include "..\Includes\common.inc"

params["_filename", ""];

switch (_filename) do {
	case "population": {
		//To improve Performance, reduces pop from 13972 to 4850
		private _popValue = [["Khesanhvil",586], ["Axau",25], ["Xiso",200], ["PalienKhun",25], ["Koso",153], ["BanNeme",72], ["Avau",25], ["ToRout",108],
		["RoRo",32], ["Tavouac",200], ["Thanh",28], ["AHo",25], ["ACoi",200], ["Dan",200], ["Bahy",25], ["HaiPhuc",25],
		["HaiTan",115], ["Donque",25], ["Hamy",25], ["BichNam",25], ["Bolieu",31], ["Raoha",25], ["NhiHa",25], ["GioHai",145],
		["Kok",25], ["HopTac",200], ["CoSo",200], ["Cola",200], ["Seina",96], ["Viski",25], ["NamHung",200], ["VinhTu",66],
		["ThaiLai",200], ["Lako",28], ["pagnouy",48], ["Sadoun",25], ["Salen",25], ["Lousalia",25], ["Paxiou",25], ["Gnavet",25],
		["Xok",25], ["Soy",200], ["SonXuan",25], ["Nabo",200], ["Tuan",193], ["Naxok",114], ["Koanphan",117], ["Phonsang",25],
		["Louang",25], ["Phonsi",73], ["Pomkhoun",38], ["Doy",57], ["Nase",53], ["Nadou",33], ["Cukty",25], ["HoaThanh",25],
		["CuYang",63], ["Ploy",25], ["Thongxa",25], ["Kang",25], ["Pasom",25], ["Donxat",200], ["Vangkoy",37], ["Nalao",44],
		["Kouthi",143], ["Nasano",40], ["Naxuak",200], ["Dantete",25], ["Nonghano",25], ["Saoven",25], ["Prao",62], ["Talu",25]];

		private _disableTownName = ["Paca", "Kate", "Hinlap", "XomBau", "XingEa", "AnMy", "That", "Tanloan", "Avian", "Kengkep", "MuTa",
		"KoNo", "Paxia", "KoWe", "LiemCong", "SonGiang", "Nongno", "Tansoum", "Hindam", "AnDinh", "Lapoung", "Xingwe",
		"Bengdan", "Napang", "Khoyamep", "Donvay", "Palo", "Lukdong", "Xino", "Xombatu", "Xombolu", "Gnavay",
		"Xombolou", "Xomcon", "Pakpong", "XiMi", "Xeku", "Xombong", "Phailom"];

		//[_popValue, _disableTownName];
		[_popValue, nil];
	};
	case "antennas": {
		private _posAntennas =
		[[9048.66,6549.03,-0.258987], [9387.63,10437.2,0.00366211], [5117.96,11335,-110.99], [2792.38,8592.84,0.140808],
		[10692.6,3183.53,-0.000190735], [11182.8,1808.63,0.138306], [4562.41,866.129,0.49115], [748.892,11575.5,0.138336],
		[11235.1,14857.8,0.000335693], [412.002,509.969,0.00694847]];
		private _blacklistIndex = [];

		//[_posAntennas, _blacklistIndex,]
		[_posAntennas, _blacklistIndex];
	};
	case "bank": {
		//_posBank
		[nil];
	};
	case "garrison": {
		private _mrkCSAT = ["airport_2", "airport_3", "outpost_1", "outpost_11", "outpost_12", "outpost_13", "outpost_14", "outpost_15", "outpost_16", "outpost_17", "outpost_18", "outpost_19", "outpost_20", "resource_1", "resource_2", "resource_3", "resource_5", "resource_6", "resource_7", "seaport_4", "factory_1", "factory_4"];
		private _controlsCSAT = ["control_1", "control_2", "control_3", "control_4", "control_5", "control_6", "control_7", "control_8", "control_9", "control_10", "control_11", "control_12", "control_13", "control_14", "control_15", "control_16", "control_17", "control_18", "control_19", "control_20"];

		//[_mrkNATO, _mrkCSAT, _controlsNATO, _controlsCSAT];
		[nil, _mrkCSAT, nil, _controlsCSAT];
	};
	case "climate": {
	"tropical";
	};
	default {
		Info("Map Info given unknown parameter");
	};
};
