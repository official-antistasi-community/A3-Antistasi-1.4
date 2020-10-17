_nul=createDialog "should_load_personal_save";

waitUntil {dialog};
private _autoSaveInterval = "autoSaveInterval" call BIS_fnc_getParamValue;
[
	"W A R N I N G ",
	["Antistasi has a custom save system similar to other CTIs.<br/><br/>",
	"To Save: Your commander needs to go to the <t color='#f0d498'>Map Board</t>, scroll-select <t color='#f0d498'>""Game Options""</t> and click on the <t color='#f0d498'>""Persistent Save""</t> button.<br/><br/>",
	"Current parameters are configured to auto-save every <t color='#f0d498'>",(_autoSaveInterval/60) toFixed 0," minutes</t>."] joinString ""
] call A3A_fnc_customHint;
waitUntil {!dialog};

if (isNil "previousSessionLoaded") then {
	// Dialog closed without selecting a button. Default to loading previous save.
	[true] call A3A_fnc_loadPreviousSession;
};

[] spawn A3A_fnc_credits;
