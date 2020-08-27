if (CHVD_keyDown) exitWith {};
CHVD_keyDown = true;

private ["_vehTypeString"];
_updateType = [_this, 0, 0, [0]] call BIS_fnc_param; // 0 - decrease VD, 1 - increase VD
_updateValue = if (_updateType isEqualTo 0) then {-500} else {500};

if (!isNull (findDisplay 2900)) then {call CHVD_fnc_openDialog};

switch (CHVD_vehType) do {
	case 1: {
		_vehTypeString = "car";
	};
	case 2: {
		_vehTypeString = "air";
	};
	default {
		_vehTypeString = "foot";
	};
};

_updateMode = call compile ("CHVD_" + _vehTypeString + "SyncMode");
_viewDistVar = "CHVD_" + _vehTypeString;
_viewDist = call compile _viewDistVar;
_objViewDistVar = "CHVD_" + _vehTypeString + "Obj";
_objViewDist = call compile _objViewDistVar;
_vdDiff = _viewDist - _objViewDist;

switch (_updateMode) do {
	case 1: {
		_viewDistValue = _viewDist + _updateValue min distanciaSPWN max 500;		
		
		_percentVar = "CHVD_" + _vehTypeString + "SyncPercentage";
		_percentValue = call compile _percentVar;
		
		_objViewDistValue = _viewDistValue * _percentValue min distanciaSPWN;
		
		if (_objViewDistValue >= 500) then {
			call compile format ["%1 = %2", _viewDistVar, _viewDistValue];
			call compile format ["profileNamespace setVariable ['%1',%1]", _viewDistVar];
			call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
			call compile format ["profileNamespace setVariable ['%1',%1]", _objViewDistVar];
			
			[3] call CHVD_fnc_updateSettings;
		};
	};
	case 2: {		
		_objViewDistValue = _objViewDist + _updateValue min _viewDist min distanciaSPWN max 500;
		call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
		call compile format ["profileNamespace setVariable ['%1',%1]", _objViewDistVar];
		
		[4] call CHVD_fnc_updateSettings;
	};
	default {
		_viewDistValue = _viewDist + _updateValue min distanciaSPWN max (500 + _vdDiff);
		_objViewDistValue = _objViewDist + _updateValue min (_viewDistValue - _vdDiff) min distanciaSPWN max 500;
		call compile format ["%1 = %2", _viewDistVar, _viewDistValue];
		call compile format ["profileNamespace setVariable ['%1',%1]", _viewDistVar];
		
		call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
		call compile format ["profileNamespace setVariable ['%1',%1]", _objViewDistVar];
				
		[3] call CHVD_fnc_updateSettings;	
	};
};

_vdString = "";
for "_i" from 1 to (35) step 1 do {
	if ((call compile _viewDistVar) < distanciaSPWN / 35 * _i) then {
		_vdString = _vdString + "·";
	} else {	
		_vdString = _vdString + "I";
	};
};

_ovdString = "";
for "_i" from 1 to (35) step 1 do {
	if ((call compile _objViewDistVar) < distanciaSPWN / 35 * _i) then {
		_ovdString = _ovdString + "·";
	} else {	
		_ovdString = _ovdString + "I";
	};
};

_textViewDistance = if (isLocalized "STR_chvd_viewDistance") then {localize "STR_chvd_viewDistance"} else {"View Distance"};
_textObjViewDistance = if (isLocalized "STR_chvd_objViewDistance") then {localize "STR_chvd_objViewDistance"} else {"View Distance"};

hintSilent parseText format ["<t align='left' size='1.33'>
%2:	<t align='right'>%3</t>
<br /> 
<t size='2' shadow='0' color='%1'>%4</t>
<br /> 
%5: <t align='right'>%6</t>
<br /> 
<t size='2' shadow='0' color='%1'>%7</t>
</t>", 
[profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843], profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019], profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862], profilenamespace getvariable ['GUI_BCG_RGB_A',0.7]] call BIS_fnc_colorRGBAtoHTML,
_textViewDistance,
call compile _viewDistVar, 
_vdString, 
_textObjViewDistance,
call compile _objViewDistVar, 
_ovdString
];

terminate (missionNamespace getVariable ["CHVD_hintHandle", scriptNull]);
CHVD_hintHandle = [] spawn {
	uiSleep 2;
	hintSilent "";
};

[] spawn {
	uiSleep 0.05;
	CHVD_keyDown = false;
};