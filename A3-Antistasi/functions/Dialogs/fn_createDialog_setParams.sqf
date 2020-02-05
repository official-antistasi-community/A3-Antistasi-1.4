_nul=createDialog "set_params";

waitUntil {dialog};
hint "W A R N I N G\n\nREAD THIS!!!\n\n\nAntistasi does NOT support vanilla save. Do not expect 100% of functionalities if you Save&Exit and after you come back with Resume option. Both on SP and MP.\n\n\nAntistasi has an in built save system, GTA alike, which is the system you have to use in order to have full functionalities.\n\nTo Save: Go to the Map Board, select ""Game Options"" and hit on ""Persistent Save"" button.\n\nTo load: RESTART the game and click YES on this window";
waitUntil {!dialog};

if (!isNil "loadLastSave" && {!loadLastSave}) then {
	_nul=createDialog "diff_menu";
	waitUntil {dialog};
	hint "Choose a difficulty level";
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
	hint "Choose a Game Mode";
	waitUntil {!dialog};
};

