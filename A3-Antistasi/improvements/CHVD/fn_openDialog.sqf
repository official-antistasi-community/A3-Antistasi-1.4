[] spawn {
if (missionNamespace getVariable ["CHVD_loadingDialog",false]) exitWith {true};

if (isNull (findDisplay 2900)) then {
	_dialog = createDialog "CHVD_dialog";
	if (!_dialog) exitWith {systemChat "CH View Distance: Error: can't open dialog."};
};

disableSerialization;
CHVD_loadingDialog = true;

{
	ctrlSetText _x;
} forEach [[1006, str round CHVD_foot],[1007, str round CHVD_footObj],[1013, str round CHVD_car],[1014, str round CHVD_carObj],[1017, str round CHVD_air],[1018, str round CHVD_airObj],[1400, str CHVD_footTerrain],[1401, str CHVD_carTerrain],[1402, str CHVD_airTerrain]];

{
	sliderSetRange [_x select 0, 0, _x select 2];
	sliderSetRange [_x select 3, 0, (_x select 5) min (_x select 1)];
	sliderSetSpeed [_x select 0, 500, 500];
	sliderSetSpeed [_x select 3, 500, 500];
	sliderSetPosition [_x select 0, _x select 1];
	sliderSetPosition [_x select 3, (_x select 4) min (_x select 1)];
} forEach [[1900,CHVD_foot,distanciaSPWN,1901,CHVD_footObj,distanciaSPWN],[1902,CHVD_car,distanciaSPWN,1903,CHVD_carObj,distanciaSPWN],[1904,CHVD_air,distanciaSPWN,1905,CHVD_airObj,distanciaSPWN]];

{
	_ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
	
	_textDisabled = if (isLocalized "STR_chvd_disabled") then {localize "STR_chvd_disabled"} else {"Disabled"};
	_ctrl lbAdd _textDisabled;
	
	_textDynamic = if (isLocalized "STR_chvd_dynamic") then {localize "STR_chvd_dynamic"} else {"Dynamic"};
	_ctrl lbAdd _textDynamic;
	
	_textFov = if (isLocalized "STR_chvd_fov") then {localize "STR_chvd_fov"} else {"FOV"};
	_ctrl lbAdd _textFov;
	
	_mode = call compile ("CHVD_" + (_x select 1) + "SyncMode");
	_ctrl lbSetCurSel _mode;
	//call compile format ["systemChat '%1 %2'",_ctrl, _x select 1];
	
	_handle = _ctrl ctrlSetEventHandler ["LBSelChanged", 
		format ["[_this select 1, '%1',%2,%3,%4] call CHVD_fnc_onLBSelChanged_syncmode", _x select 1, _x select 2, _x select 3, _x select 4]
	];
} forEach [[1404,"foot",1410,1901,1007], [1406,"car",1409,1903,1014], [1408,"air",1411,1905,1018]];

{
	_ctrl = _x select 0;
	_mode = call compile ("CHVD_" + (_x select 1) + "SyncMode");

	switch (_mode) do {
		case 1: {
			_percentage = call compile ("CHVD_" + (_x select 1) + "SyncPercentage");
			ctrlSetText [_ctrl, format ["%1",_percentage * 100] + "%"];
			ctrlEnable [_ctrl, true];
		};
		default {
			ctrlEnable [_ctrl, false];
		};
		
	};
	_ctrlDisplay = (findDisplay 2900) displayCtrl _ctrl;
	_handle = _ctrlDisplay ctrlSetEventHandler ["keyDown", 
		format ["[_this select 0, '%1',%2,%3] call CHVD_fnc_onEBinput_syncmode", _x select 1, _x select 2, _x select 3]
	];
} forEach [[1410,"foot",1901,1007], [1409,"car",1903,1014], [1411,"air",1905,1018]];

{
	_ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
	if (CHVD_allowNoGrass) then {
		_textLow = if (isLocalized "STR_chvd_low") then {localize "STR_chvd_low"} else {"Low"};
		_ctrl lbAdd _textLow;
	};
	_textStandard = if (isLocalized "STR_chvd_standard") then {localize "STR_chvd_standard"} else {"Standard"};
	_ctrl lbAdd _textStandard;
	_textHigh = if (isLocalized "STR_chvd_high") then {localize "STR_chvd_high"} else {"High"};
	_ctrl lbAdd _textHigh;
	_textVeryHigh = if (isLocalized "STR_chvd_veryHigh") then {localize "STR_chvd_veryHigh"} else {"Very High"};
	_ctrl lbAdd _textVeryHigh;
	_textUltra = if (isLocalized "STR_chvd_ultra") then {localize "STR_chvd_ultra"} else {"Ultra"};
	_ctrl lbAdd _textUltra;
	
	_sel = [_x select 1] call CHVD_fnc_selTerrainQuality;
	if (CHVD_allowNoGrass) then {
		_ctrl lbSetCurSel _sel;
	} else {
		_ctrl lbSetCurSel (_sel - 1);
	};
} forEach [[1500,CHVD_footTerrain],[1501,CHVD_carTerrain],[1502,CHVD_airTerrain]];

{
	_ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
	_handle = _ctrl ctrlSetEventHandler ["LBSelChanged", 
		format ["[_this select 1, '%1', %2] call CHVD_fnc_onLBSelChanged", _x select 1, _x select 2]
	];
} forEach [[1500,"CHVD_footTerrain",1400],[1501,"CHVD_carTerrain",1401],[1502,"CHVD_airTerrain",1402]];

if (CHVD_footSyncMode isEqualTo 1) then {
	ctrlEnable [1901,false];
	ctrlEnable [1007,false];
} else {	
	ctrlEnable [1901,true];
	ctrlEnable [1007,true];
};

if (CHVD_carSyncMode isEqualTo 1) then {
	ctrlEnable [1903,false];
	ctrlEnable [1014,false];
} else {	
	ctrlEnable [1903,true];
	ctrlEnable [1014,true];
};

if (CHVD_airSyncMode isEqualTo 1) then {
	ctrlEnable [1905,false];
	ctrlEnable [1018,false];
} else {	
	ctrlEnable [1905,true];
	ctrlEnable [1018,true];
};

CHVD_loadingDialog = false;
};