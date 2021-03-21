private _saveString = ["Antistasi has a custom save system similar to other CTIs.<br/><br/>",
    "To Save: Your commander needs to go to the <t color='#f0d498'>Map Board</t>, scroll-select <t color='#f0d498'>""Game Options""</t> and click on the <t color='#f0d498'>""Persistent Save""</t> button.<br/><br/>"] joinString "";
_saveString = if (autoSave) then { [_saveString,"Current parameters are configured to auto-save every <t color='#f0d498'>",(autoSaveInterval/60) toFixed 0," minutes</t>."] joinString "" }
    else { [_saveString,"Auto-save is currently disabled"] joinString "" };

["W A R N I N G ", _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;
