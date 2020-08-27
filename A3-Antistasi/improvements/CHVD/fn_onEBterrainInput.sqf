private ["_textValue"];
_varType = [_this, 0, "", [""]] call BIS_fnc_param;
_textCtrl = [_this, 1, controlNull, [0, controlNull]] call BIS_fnc_param;
_listbox = [_this, 2, controlNull, [0, controlNull]] call BIS_fnc_param;

_textValue = [ctrlText _textCtrl, "0123456789."] call BIS_fnc_filterString;
_textValue = if (_textValue == "") then {50} else {call compile _textValue min 50 max 3.125};


if (!CHVD_allowNoGrass) then {
	_textValue = _textValue min 48.99;
};

//update listbox
_listboxCtrl = (finddisplay 2900) displayCtrl _listbox;
//remove EH not to cause huge lag
_listboxCtrl ctrlRemoveAllEventHandlers "LBSelChanged";
_sel = [_textValue] call CHVD_fnc_selTerrainQuality;
if (CHVD_allowNoGrass) then {
	_listboxCtrl lbSetCurSel _sel;	
} else {
	_listboxCtrl lbSetCurSel (_sel - 1);
};	
//add EH again
_listboxCtrl ctrlSetEventHandler ["LBSelChanged", 
	format ["[_this select 1, '%1', %2] call CHVD_fnc_onLBSelChanged", _varType, _textCtrl]
];

//ctrlSetText [_textCtrl, str _textValue];	
call compile format ["%1 = %2",_varType, _textValue];
call compile format ["profileNamespace setVariable ['%1',%1]", _varType];

[] call CHVD_fnc_updateTerrain;