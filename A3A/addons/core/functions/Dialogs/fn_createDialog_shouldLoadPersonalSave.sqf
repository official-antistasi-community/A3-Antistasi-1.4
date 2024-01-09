//TODO: add header
_autoSaveInterval = if (autoSave) then {(autoSaveInterval/60) toFixed 0;} else {false};
_autoSaveInterval = "<t color='#f0d498'>" + _autoSaveInterval + "</t>";

private _saveString = (localize "STR_A3A_fn_dialogs_createDialog_SLPS_line1") + "<br/><br/>";
_saveString = if (autoSave) then { [_saveString,format[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line2", _autoSaveInterval]] joinString "" }
    else { [_saveString,localize "STR_A3A_fn_dialogs_createDialog_SLPS_line4"] joinString "" };

[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line5", _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;