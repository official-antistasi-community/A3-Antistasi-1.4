#include "\a3\editor_f\Data\Scripts\dikCodes.h"

_textDecreaseVD = if (isLocalized "STR_chvd_decreaseVD") then {localize "STR_chvd_decreaseVD"} else {"Decrease view distance"};
_decViewdistKey = ["CH View Distance", "dec_viewdistance", _textDecreaseVD, {[0] call CHVD_fnc_keyDown}, "", [DIK_LBRACKET, [false, true, false]], true] call CBA_fnc_addKeybind;

_textIncreaseVD = if (isLocalized "STR_chvd_increaseVD") then {localize "STR_chvd_increaseVD"} else {"Increase view distance"};
_incViewdistKey = ["CH View Distance", "inc_viewdistance", _textIncreaseVD, {[1] call CHVD_fnc_keyDown}, "", [DIK_RBRACKET, [false, true, false]], true] call CBA_fnc_addKeybind;

_textOpenSettings = if (isLocalized "STR_chvd_openSettings") then {localize "STR_chvd_openSettings"} else {"Open view distance settings"};
_openSettingsKey = ["CH View Distance", "open_settings", _textOpenSettings, {call CHVD_fnc_openDialog}, "", [DIK_BACKSLASH, [false, true, false]], false] call CBA_fnc_addKeybind;

_textDecreaseTerrain = if (isLocalized "STR_chvd_decreaseTerrain") then {localize "STR_chvd_decreaseTerrain"} else {"Decrease terrain quality"};
_decTerrainKey = ["CH View Distance", "dec_terrain_quality", _textDecreaseTerrain, {[-1] call CHVD_fnc_keyDownTerrain}, "", [DIK_LBRACKET, [true, false, false]], true] call CBA_fnc_addKeybind;

_textIncreaseTerrain = if (isLocalized "STR_chvd_increaseTerrain") then {localize "STR_chvd_increaseTerrain"} else {"Increase terrain quality"};
_incTerrainKey = ["CH View Distance", "inc_terrain_quality", _textIncreaseTerrain, {[1] call CHVD_fnc_keyDownTerrain}, "", [DIK_RBRACKET, [true, false, false]], true] call CBA_fnc_addKeybind;

_useShift = _openSettingsKey select 1 select 0;
_useCtrl = _openSettingsKey select 1 select 1;
_useAlt = _openSettingsKey select 1 select 2;

_SCAstring = (if (_useShift) then {"Shift + "} else {""}) + (if (_useCtrl) then {"Ctrl + "} else {""}) + (if (_useAlt) then {"Alt + "} else {""});

systemChat format ["CH View Distance: CBA Keybindings activated. Press <%1%2> to open settings.", _SCAstring, [[_openSettingsKey select 0] call BIS_fnc_keyCode] call CBA_fnc_capitalize];