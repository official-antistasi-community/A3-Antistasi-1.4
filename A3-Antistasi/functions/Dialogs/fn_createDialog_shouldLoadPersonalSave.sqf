_nul=createDialog "should_load_personal_save";

waitUntil {dialog};
["W A R N I N G", "READ THIS!!!<br/><br/><br/>Antistasi does NOT support vanilla save. Do not expect 100% of functionalities if you Save and Exit and after you come back with Resume option. Both on SP and MP.<br/><br/><br/>Antistasi has an in built save system, GTA alike, which is the system you have to use in order to have full functionalities.<br/><br/>To Save: Go to the Map Board, select ""Game Options"" and hit on ""Persistent Save"" button.<br/><br/>To load: RESTART the game and click YES on this window"] call A3A_fnc_customHint;
waitUntil {!dialog};

if (isNil "previousSessionLoaded") then {
	// Dialog closed without selecting a button. Default to loading previous save.
	[true] call A3A_fnc_loadPreviousSession;
};

[] spawn A3A_fnc_credits;
