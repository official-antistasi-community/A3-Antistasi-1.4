private ["_varString"];
_mode = _this select 0;
_varString = [_this, 1, "", [""]] call BIS_fnc_param; // type of variable to use: foot/car/air
_textBoxCtrl = [_this, 2, controlNull, [0, controlNull]] call BIS_fnc_param;
_sliderCtrl = [_this, 3, controlNull, [0, controlNull]] call BIS_fnc_param;
_sliderTextboxCtrl = [_this, 4, controlNull, [0, controlNull]] call BIS_fnc_param;

switch (_mode) do {
	case 1: {
		ctrlEnable [_textBoxCtrl, true];
		_percentageVar = "CHVD_" + _varString + "SyncPercentage";
		_percentage = call compile _percentageVar;
		ctrlSetText [_textBoxCtrl, format ["%1",_percentage * 100] + "%"];	
		
		_viewDistVar = "CHVD_" + _varString;
		_viewDist = call compile _viewDistVar;
		_objVDVar = "CHVD_" + _varString + "Obj";
		_objVD = _viewDist * _percentage min distanciaSPWN;
		
		//disable VD slider and textbox because they are not in use
		ctrlEnable [_sliderCtrl, false];
		sliderSetPosition [_sliderCtrl, _objVD];
		ctrlEnable [_sliderTextboxCtrl, false];		
		ctrlSetText [_sliderTextboxCtrl, str round _objVD];
		
		call compile format ["%1 = %2", _objVDVar, _objVD];
		call compile format ["profileNamespace setVariable ['%1',%1]", _objVDVar];
	};
	default {
		ctrlEnable [_textBoxCtrl, false];
		ctrlSetText [_textBoxCtrl, ""];
		
		//enable VD slider and textbox in case they are disabled
		ctrlEnable [_sliderCtrl, true];
		ctrlEnable [_sliderTextboxCtrl, true];		
	};	
};

_modeVar = "CHVD_" + _varString + "SyncMode";
call compile format ["%1 = %2", _modeVar, _mode];
call compile format ["profileNamespace setVariable ['%1',%1]", _modeVar];

[2] call CHVD_fnc_updateSettings;