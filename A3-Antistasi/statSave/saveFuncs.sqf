fn_varNameToSaveName = { //Return the name of the save slot for the variable.
	params ["_varName"];

	if (worldName == "Tanoa") then {
		_varName + serverID + campaignID + "WotP";
	} else {
		if (side group petros == independent) then {
			_varName + serverID + campaignID + "Antistasi" + worldName;
		} else {
			_varName + serverID + campaignID + "AntistasiB" + worldName;
		};
	};
};

fn_SaveStat = {
	params ["_varName", "_varValue"];

	if (!isNil "_varValue") then {
		private _varSaveName = [_varName] call fn_varNameToSaveName;
		profileNameSpace setVariable [_varSaveName, _varValue];
		if (isDedicated) then { saveProfileNamespace; };
	};
};

fn_ReturnSavedStat = { //Return the value of this statement
	params ["_varName"];

	_loadVariable = {
		params ["_varName"];
		private _varSaveName = [_varName] call fn_varNameToSaveName;
		profileNameSpace getVariable (_varSaveName);
	};

	private _varValue = [_varName] call _loadVariable;

	if (isNil "_varValue") then {
		private _spanishVarName = [_varName] call A3A_fnc_translateVariable;
		_varValue = [_spanishVarName] call _loadVariable;
	};

	if (isNil "_varValue") exitWith {
		diag_log format ["%1: [Antistasi] | ERROR | saveFuncs.sqf | Variable %2 does not exist.", servertime, _varName];
	};
	_varValue
};

fn_LoadStat = {
	params ["_varName"];

	private _varValue = [_varName] call fn_ReturnSavedStat;
	if (isNil "_varValue") exitWith {};
	[_varName,_varValue] call fn_SetStat;
};

fn_SavePlayerStat = {
	params ["_playerUID", "_varName", "_varValue"];

	private _abort = false;

	if (isNil "_playerUID") then {
		_playerUID = "";
		_abort = true;
	};

	if (isNil "_varName") then {
		_varName = "";
		_abort = true;
	};

	if (isNil "_varValue") then {
		_varValue = "";
		_abort = true;
	};

	if (_abort) exitWith {
		diag_log format ["[Antistiasi] Save invalid for %1, saving %3 as %2", _playerUID, _varName, _varValue];
	};

	private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
	[_playerVarName, _varValue] call fn_SaveStat;
};

fn_RetrievePlayerStat = {
	params ["_playerUID", "_varName"];

	if (isNil "_playerUID" || isNil "_varName") exitWith {
		diag_log ["[Antistiasi] Load invalid for player %1 var %2", _playerUID, _varName]
	};

	private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
	[_playerVarName] call fn_ReturnSavedStat;
};

//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD

specialVarLoads = [
	"outpostsFIA",
	"minesX",
	"staticsX",
	"countCA",
	"antennas",
	"mrkNATO",
	"mrkSDK",
	"prestigeNATO",
	"prestigeCSAT",
	"posHQ",
	"hr",
	"armas",
	"items",
	"backpcks",
	"ammunition",
	"dateX",
	"prestigeOPFOR",
	"prestigeBLUFOR",
	"resourcesFIA",
	"skillFIA",
	"distanceSPWN",
	"civPerc",
	"maxUnits",
	"destroyedCities",
	"garrison",
	"tasks",
	"smallCAmrk",
	"membersX",
	"vehInGarage",
	"destroyedBuildings",
	"idlebases",
	"idleassets",
	"chopForest",
	"weather",
	"killZones",
	"jna_dataList",
	"controlsSDK",
	"mrkCSAT",
	"nextTick",
	"bombRuns",
	"difficultyX",
	"gameMode"
];
//THIS FUNCTIONS HANDLES HOW STATS ARE LOADED
fn_SetStat = {
	params ["_varName", "_varValue"];

	if (isNil "_varValue") exitWith {};

	if (_varName in specialVarLoads) then {

		switch (_varName) do {
			case "countCA": { countCA = _varValue; publicVariable "countCA"; };
			case "difficultyX" : {
				if (!isMultiplayer) then {
					skillMult = _varValue;
					if (skillMult == 0.5) then { minWeaps = 15; };
					if (skillMult == 2) then { minWeaps = 40; };
				};
			};
			case "gameMode" : {
				if (!isMultiplayer) then {
					gameMode = _varValue;
					if (gameMode != 1) then {
						Occupants setFriend [Invaders, 1];
						Invaders setFriend [Occupants, 1];
						if (gameMode == 3) then { "CSAT_carrier" setMarkerAlpha 0; };
						if (gameMode == 4) then { "NATO_carrier" setMarkerAlpha 0; };
					};
				};
			};
			case "bombRuns" : { bombRuns = _varValue; publicVariable "bombRuns"; };
			case "nextTick" : { nextTick = time + _varValue; };
			case "membersX" : { membersX = +_varValue; publicVariable "membersX"; };
			case "smallCAmrk" : { smallCAmrk = +_varValue; };
			case "mrkNATO" : { { sidesX setVariable [_x, Occupants, true]; } forEach _varValue; };
			case "mrkCSAT" : { { sidesX setVariable [_x, Invaders, true]; } forEach _varValue; };
			case "mrkSDK" : { { sidesX setVariable [_x, teamPlayer, true]; } forEach _varValue; };
			case "controlsSDK" : {
				{
					sidesX setVariable [_x, teamPlayer, true];
				} forEach _varValue;
			};
			case "chopForest" : { chopForest = _varValue; publicVariable "chopForest"; };
			case "jna_dataList" : { jna_dataList = +_varValue };
			case "prestigeNATO" : { prestigeNATO = _varValue; publicVariable "prestigeNATO"; };
			case "prestigeCSAT" : { prestigeCSAT = _varValue; publicVariable "prestigeCSAT"; };
			case "hr" : { server setVariable ["HR", _varValue, true]; };
			case "dateX" : { setDate _varValue; };
			case "weather" : {
				0 setFog (_varValue select 0);
				0 setRain (_varValue select 1);
				forceWeatherChange;
			};
			case "resourcesFIA" : { server setVariable ["resourcesFIA", _varValue, true]; };
			case "destroyedCities" : { destroyedCities = +_varValue; publicVariable "destroyedCities"; };
			case "skillFIA" : {
				skillFIA = _varValue; publicVariable "skillFIA";
				{
					_costs = server getVariable _x;
					for "_i" from 1 to _varValue do {
						_costs = round (_costs + (_costs * (_i/280)));
					};
					server setVariable [_x, _costs, true];
				} forEach soldiersSDK;
			};
			case "distanceSPWN" : {
				distanceSPWN = _varValue;
				distanceSPWN1 = distanceSPWN * 1.3;
				distanceSPWN2 = distanceSPWN /2;
				publicVariable "distanceSPWN";
				publicVariable "distanceSPWN1";
				publicVariable "distanceSPWN2";
			};
			case "civPerc" : {
				civPerc = _varValue;
				if (civPerc < 1) then { civPerc = 35; };
				publicVariable "civPerc";
			};
			case "maxUnits" : { maxUnits=_varValue; publicVariable "maxUnits"; };
			case "vehInGarage" : { vehInGarage= +_varValue; publicVariable "vehInGarage"; };
			case "destroyedBuildings" : {
				destroyedBuildings = +_varValue;

				{
					(nearestObject [_x, "House"]) setDamage [1, false];
				} forEach destroyedBuildings;
			};
			case "minesX" : {
				private ["_mineX"];
				{
					_x params ["_typeMine", "_posMine", "_detected", "_dirMine"];

					switch _typeMine do {
						case "APERSMine_Range_Ammo": {_typeMine = "APERSMine"};
						case "ATMine_Range_Ammo": {_typeMine = "ATMine"};
						case "APERSBoundingMine_Range_Ammo": {_typeMine = "APERSBoundingMine"};
						case "SLAMDirectionalMine_Wire_Ammo": {_typeMine = "SLAMDirectionalMine"};
						case "APERSTripMine_Wire_Ammo": {_typeMine = "APERSTripMine"};
						case "ClaymoreDirectionalMine_Remote_Ammo": {_typeMine = "Claymore_F"};
					};

					_mineX = createMine [_typeMine, _posMine, [], 0];
					{ _x revealMine _mineX; } forEach _detected;

					if (count _x > 3) then {
						_mineX setDir _dirMine;
					};

				} forEach _varvalue;
			};
			case "garrison" : {
				{ garrison setVariable [_x select 0, _x select 1, true]; } forEach _varvalue;
			};
			case "outpostsFIA" : {
				if (count (_varValue select 0) == 2) then {
					private ["_mrk"];
					{
						_x params ["_positionX", "_garrison"];

						_mrk = createMarker [format ["FIApost%1", random 1000], _positionX];
						_mrk setMarkerShape "ICON";
						_mrk setMarkerType "loc_bunker";
						_mrk setMarkerColor colourTeamPlayer;

						if (isOnRoad _positionX) then {
							_mrk setMarkerText format ["%1 Roadblock", nameTeamPlayer];
						} else {
							_mrk setMarkerText format ["%1 Watchpost", nameTeamPlayer];
						};

						spawner setVariable [_mrk, 2, true];

						if (count _garrison > 0) then { garrison setVariable [_mrk, _garrison, true]; };

						outpostsFIA pushBack _mrk;
						sidesX setVariable [_mrk, teamPlayer, true];
					} forEach _varvalue;
				};
			};
			case "antennas" : {
				private ["_mrk", "_antenna"];
				antennasDead = +_varvalue;

				{
					_x params ["_posAnt"];
					_mrk = [mrkAntennas, _posAnt] call BIS_fnc_nearestPosition;
					_antenna = [antennas, _mrk] call BIS_fnc_nearestPosition;

					{
						if (([antennas,_x] call BIS_fnc_nearestPosition) == _antenna) then {
							[_x,false] spawn A3A_fnc_blackout;
						};
					} forEach citiesX;

					antennas = antennas - [_antenna];
					_antenna removeAllEventHandlers "Killed";
					_antenna setDamage [1, false];
					deleteMarker _mrk;
				} forEach _varvalue;

				antennasDead = _varvalue;
				publicVariable "antennas";
				publicVariable "antennasDead";
			};
			case "prestigeOPFOR" : {
				private ["_dataX"];
				{
					_dataX = server getVariable _x;
					_dataX params ["_numCiv", "_numVeh", "_prestigeOPFOR", "_prestigeBLUFOR"];
					_prestigeOPFOR = _varvalue select _forEachIndex;
					_dataX = [_numCiv, _numVeh, _prestigeOPFOR, _prestigeBLUFOR];
					server setVariable [_x, _dataX, true];
				} forEach citiesX;
			};
			case "prestigeBLUFOR" : {
				private ["_dataX"];
				{
					_dataX = server getVariable _x;
					_dataX params ["_numCiv", "_numVeh", "_prestigeOPFOR", "_prestigeBLUFOR"];
					_prestigeBLUFOR = _varvalue select _forEachIndex;
					_dataX = [_numCiv, _numVeh, _prestigeOPFOR, _prestigeBLUFOR];
					server setVariable [_x, _dataX, true];
				} forEach citiesX;
			};
			case "idlebases" : {
				{
					server setVariable [_x select 0, _x select 1, true];
				} forEach _varValue;
			};
			case "idleassets" : {
				{
					timer setVariable [_x select 0, _x select 1, true];
				} forEach _varValue;
			};
			case "killZones" : {
				{
					killZones setVariable [_x select 0,_x select 1,true];
				} forEach _varValue;
			};
			case "posHQ" : {
				private _posHQ = [_varValue, _varValue select 0] select (count _varValue > 3);

				{
					if (getMarkerPos _x distance _posHQ < 1000) then {
						sidesX setVariable [_x, teamPlayer, true];
					};
				} forEach controlsX;

				respawnTeamPlayer setMarkerPos _posHQ;
				posHQ = getMarkerPos respawnTeamPlayer;
				petros setPos _posHQ;
				"Synd_HQ" setMarkerPos _posHQ;

				if (chopForest) then {
					if (!isMultiplayer) then {
						{ _x hideObject true } foreach (nearestTerrainObjects [position petros, ["tree", "bush"], 70])
					} else {
						{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [position petros, ["tree", "bush"], 70])
					};
				};

				if (count _varValue == 3) then {
					[] spawn A3A_fnc_buildHQ;
				} else {
					fireX setPos (_varValue select 1);
					boxX setDir ((_varValue select 2) select 0);
					boxX setPos ((_varValue select 2) select 1);
					mapX setDir ((_varValue select 3) select 0);
					mapX setPos ((_varValue select 3) select 1);
					flagX setPos (_varValue select 4);
					vehicleBox setDir ((_varValue select 5) select 0);
					vehicleBox setPos ((_varValue select 5) select 1);
				};

				{ _x setPos _posHQ; } forEach (playableUnits select {side _x == teamPlayer});
			};
			case "staticsX" : {
				private ["_veh"];

				{
					_x params ["_typeVehX", "_posVeh", "_dirVeh"];

					_veh = createVehicle [_typeVehX, [0,0,0], [], 0, "NONE"];
					_veh setDir _dirVeh;
					_veh setPos _posVeh;
					_veh setVectorUp surfaceNormal (getPos _veh);

					if ((typeOf _veh) in ["StaticWeapon", "Building"]) then {
						staticsToSave pushBack _veh;
					};

					[_veh] call A3A_fnc_AIVEHinit;
				} forEach _varvalue;

				publicVariable "staticsToSave";
			};
			case "tasks" : {
			{
				if (_x == "AttackAAF") then {
					[] call A3A_fnc_attackAAF;
				} else {
					if (_x == "DEF_HQ") then {
						[] spawn A3A_fnc_attackHQ;
					} else {
						[_x, true] call A3A_fnc_missionRequest;
					};
				};
			} forEach _varvalue;
		};
			default { };
		};
	} else {
		call compile format ["%1 = %2", _varName, _varValue];
	};
};

//==================================================================================================================================================================================================
saveFuncsLoaded = true;
