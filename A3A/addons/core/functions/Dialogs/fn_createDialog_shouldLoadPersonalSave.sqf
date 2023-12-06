//TODO: add header

private _saveString = [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line1"] joinString "";
_saveString = if (autoSave) then { [_saveString,localize "STR_A3A_fn_dialogs_createDialog_SLPS_line2" + "<t color='#f0d498'>",(autoSaveInterval/60) toFixed 0," " + [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line3"] + "</t>."] joinString "" }
    else { [_saveString,localize "STR_A3A_fn_dialogs_createDialog_SLPS_line4"] joinString "" };

[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line5", _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;