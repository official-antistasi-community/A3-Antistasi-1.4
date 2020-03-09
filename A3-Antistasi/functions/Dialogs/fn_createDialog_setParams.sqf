_nul=createDialog "set_params";

waitUntil {dialog};
["W A R N I N G", "READ THIS!!!<br/><br/><br/>Antistasi does NOT support vanilla save. Do not expect 100% of functionalities if you Save and Exit and after you come back with Resume option. Both on SP and MP.<br/><br/><br/>Antistasi has an in built save system, GTA alike, which is the system you have to use in order to have full functionalities.<br/><br/>To Save: Go to the Map Board, select ""Game Options"" and hit on ""Persistent Save"" button.<br/><br/>To load: RESTART the game and click YES on this window"] call A3A_fnc_customHint;
waitUntil {!dialog};

if (!isNil "loadLastSave" && {!loadLastSave}) then {
	_nul=createDialog "diff_menu";
	waitUntil {dialog};
	["Load Save", "Choose a difficulty level"] call A3A_fnc_customHint;
	waitUntil {!dialog};

	[] spawn {
		waitUntil {(!isNil "serverInitDone")};			// need following params to be initialized
		if (isNil "skillMult") exitWith {};
		if (skillMult == 1) then
			{
			//Easy Difficulty Tweaks
			server setVariable ["hr",25,true];
			server setVariable ["resourcesFIA",5000,true];
			vehInGarage = [vehSDKTruck,vehSDKTruck,SDKMortar,SDKMGStatic,staticAAteamPlayer];
			minWeaps = 15;
			if !(hasTFAR) then
				{
				["ItemRadio"] call A3A_fnc_unlockEquipment;
				haveRadio = true;
				};
			};
		if (skillMult == 3) then 
			{
			//Hard Difficulty Tweaks
			server setVariable ["hr",0,true];
			server setVariable ["resourcesFIA",200,true];
			minWeaps = 40;
			};
		[] call A3A_fnc_statistics;
		};
	_nul= createDialog "gameMode_menu";
	waitUntil {dialog};
	["Load Save", "Choose a Game Mode"] call A3A_fnc_customHint;
	waitUntil {!dialog};
};

