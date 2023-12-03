//TODO: add header

private _saveString = [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line1" + "<br/><br/>",
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line2"] + 
    "<t color='#f0d498'>" + [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line3"]  + "</t>, " + 
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line4"] + "<t color='#f0d498'>" + 
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line5"] + "</t> " + 
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line6"] + " <t color='#f0d498'>" + 
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line7"] +"</t> " + 
    [localize "STR_A3A_fn_dialogs_createDialog_SLPS_line8"] + 
    ".<br/><br/>"] joinString "";
_saveString = if (autoSave) then { [_saveString,[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line9"] + "<t color='#f0d498'>",(autoSaveInterval/60) toFixed 0," " + [localize "STR_A3A_createDialog_SLPS_line10"] + "</t>."] joinString "" }
    else { [_saveString,[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line11"]] joinString "" };

[[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line12"], _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;