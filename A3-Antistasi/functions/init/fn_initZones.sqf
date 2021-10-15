//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
scriptName "initZones.sqf";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("initZones started");

forcedSpawn = [];
citiesX = [];

[] call A3A_fnc_prepareMarkerArrays;

private _fileName = "Map\" + toLower worldName + "Info.sqf";

["zone"] call compile preProcessFileLineNumbers _filename;

private ["_name", "_sizeX", "_sizeY", "_size", "_pos", "_mrk"];


if ((toLower worldName) in ["altis", "chernarus_summer"]) then {

	"((getText (_x >> ""type"")) == ""Hill"") &&
	!((getText (_x >> ""name"")) isEqualTo """") &&
	!(configName _x isEqualTo ""Magos"")"
	configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

		_name = configName _x;
		_sizeX = getNumber (_x >> "radiusA");
		_sizeY = getNumber (_x >> "radiusB");
		_size = [_sizeX, _sizeY] select (_sizeX <= _sizeY);
		_pos = getArray (_x >> "position");
		_size = [_size, 50] select (_size < 10);
		_mrk = createmarker [format ["%1", _name], _pos];
		_mrk setMarkerSize [_size, _size];
		_mrk setMarkerShape "ELLIPSE";
		_mrk setMarkerBrush "SOLID";
		_mrk setMarkerColor "ColorRed";
		_mrk setMarkerText _name;
		controlsX pushBack _name;
	};
};  //this only for Altis and Cherno
if (debug) then {
    Debug_1("Setting Spawn Points for %1.", worldname);
};
//We're doing it this way, because Dedicated servers world name changes case, depending on how the file is named.
//And weirdly, == is not case sensitive.
//this comments has not an information about the code

(seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints + detectionAreas) apply {_x setMarkerAlpha 0};
defaultControlIndex = (count controlsX) - 1;
outpostsFIA = [];
destroyedSites = [];
garrison setVariable ["Synd_HQ", [], true];
markersX = airportsX + resourcesX + factories + outposts + seaports + controlsX + ["Synd_HQ"];
if (debug) then {
    Debug_1("Building roads for %1.",worldname);
};
markersX apply {
	_x setMarkerAlpha 0;
	spawner setVariable [_x, 2, true];
};	//apply faster then forEach and look better


 //Disables Towns/Villages, Names can be found in configFile >> "CfgWorlds" >> "WORLDNAME" >> "Names"
private ["_nameX", "_roads", "_numCiv", "_roadsProv", "_roadcon", "_dmrk", "_info"];

"(getText (_x >> ""type"") in [""NameCityCapital"", ""NameCity"", ""NameVillage"", ""CityCenter""]) &&
!(getText (_x >> ""Name"") isEqualTo """") &&
!((configName _x) in A3A_disableTownName)"
configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

	_nameX = configName _x;
	_sizeX = getNumber (_x >> "radiusA");
	_sizeY = getNumber (_x >> "radiusB");
	_size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	_pos = getArray (_x >> "position");
	_size = [_size, 400] select (_size < 400);
	_numCiv = 0;

	if (A3A_hardcodedPop) then
	{
		_numCiv = server getVariable _nameX;
		if (isNil "_numCiv" || {!(_numCiv isEqualType 0)}) then
		{
            Error_1("Bad population count data for %1", _nameX);
			_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
		};
	}
	else {
		_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
	};

	_roads = nearestTerrainObjects [_pos, ["MAIN ROAD", "ROAD", "TRACK"], _size, true, true];
	if (count _roads > 0) then {
		// Move marker position to the nearest road, if any
		_pos = _roads select 0;
	};
	_numVeh = (count _roads) min (_numCiv / 3);

	_mrk = createmarker [format ["%1", _nameX], _pos];
	_mrk setMarkerSize [_size, _size];
	_mrk setMarkerShape "RECTANGLE";
	_mrk setMarkerBrush "SOLID";
	_mrk setMarkerColor colorOccupants;
	_mrk setMarkerText _nameX;
	_mrk setMarkerAlpha 0;
	citiesX pushBack _nameX;
	spawner setVariable [_nameX, 2, true];
	_dmrk = createMarker [format ["Dum%1", _nameX], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "loc_Ruin";
	_dmrk setMarkerColor colorOccupants;

	sidesX setVariable [_mrk, Occupants, true];
	_info = [_numCiv, _numVeh, prestigeOPFOR, prestigeBLUFOR];
	server setVariable [_nameX, _info, true];
};	//find in congigs faster then find location in 25000 radius
if (debug) then {
    Debug_1("Roads built in %1.", worldName);
};


markersX = markersX + citiesX;
sidesX setVariable ["Synd_HQ", teamPlayer, true];
sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

antennasDead = A3A_antennasDead;
banks = A3A_banks;
mrkAntennas = A3A_mrkAntennas;
private _posAntennas = A3A_posAntennas;
private _blacklistPos = A3A_blacklistPos;
private _posBank = A3A_posBank;

private _banktypes = ["Land_Offices_01_V1_F"];
private _antennatypes = ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F",
"Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1", "Land_vn_tower_signal_01"];
private ["_antenna", "_mrkFinal", "_antennaProv"];
if (debug) then {
    Debug("Setting up Radio Towers.");
};

// Land_A_TVTower_base can't be destroyed, Land_Communication_F and Land_Vysilac_FM are not replaced with "Ruins" when destroyed.
// This causes issues with persistent load and rebuild scripts, so we replace those with antennas that work properly.
private _replaceBadAntenna = {
	params ["_antenna"];
	if ((typeof _antenna) in ["Land_Communication_F", "Land_Vysilac_FM", "Land_A_TVTower_Base"]) then {
		hideObjectGlobal _antenna;
		if (typeof _antenna == "Land_A_TVTower_Base") then {
			// The TV tower is composed of 3 sections - need to hide them all
			private _otherSections = nearestObjects [_antenna, ["Land_A_TVTower_Mid", "Land_A_TVTower_Top"], 200];
			{ hideObjectGlobal _x; } forEach _otherSections;
		};
		private _antennaPos = getPos _antenna;
		_antennaPos set [2, 0];
		private _antennaClass = if (worldName == "chernarus_summer") then { "Land_Telek1" } else { "Land_TTowerBig_2_F" };
		_antenna = createVehicle [_antennaClass, _antennaPos, [], 0, "NONE"];
	};
	_antenna;
};

if (!A3A_hardCodedAntennas) then {
	antennas = nearestObjects [[worldSize /2, worldSize/2], _antennatypes, worldSize];

	banks = nearestObjects [[worldSize /2, worldSize/2], _banktypes, worldSize];

	private _replacedAntennas = [];
	{ _replacedAntennas pushBack ([_x] call _replaceBadAntenna); } forEach antennas;
	antennas = _replacedAntennas;

	antennas apply {
		_mrkFinal = createMarker [format ["Ant%1", mapGridPosition _x], position _x];
		_mrkFinal setMarkerShape "ICON";
		_mrkFinal setMarkerType "loc_Transmitter";
		_mrkFinal setMarkerColor "ColorBlack";
		_mrkFinal setMarkerText "Radio Tower";
		mrkAntennas pushBack _mrkFinal;
		_x addEventHandler [
			"Killed",
			{
			_antenna = _this select 0;
			_antenna removeAllEventHandlers "Killed";

				citiesX apply {
					if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {
						[_x, false] spawn A3A_fnc_blackout;
					};
				};

				_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
				antennas = antennas - [_antenna];
				antennasDead pushBack _antenna;
				deleteMarker _mrk;
				publicVariable "antennas";
				publicVariable "antennasDead";
				["TaskSucceeded", ["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
				["TaskFailed", ["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification", Occupants];
			}
		];
	};
};
if (debug) then {
    Debug("Radio Tower built.");
    Debug("Finding broken Radio Towers.");
};
if (count _posAntennas > 0) then {
	for "_i" from 0 to (count _posAntennas - 1) do {
		_antennaProv = nearestObjects [_posAntennas select _i, _antennaTypes, 35];

		if (count _antennaProv > 0) then {
			_antenna = _antennaProv select 0;

			if (_i in _blacklistPos) then {
				_antenna setdamage 1;
			} else {
				_antenna = ([_antenna] call _replaceBadAntenna);
				antennas pushBack _antenna;
				_mrkFinal = createMarker [format ["Ant%1", mapGridPosition _antenna], _posAntennas select _i];
				_mrkFinal setMarkerShape "ICON";
				_mrkFinal setMarkerType "loc_Transmitter";
				_mrkFinal setMarkerColor "ColorBlack";
				_mrkFinal setMarkerText "Radio Tower";
				mrkAntennas pushBack _mrkFinal;

				_antenna addEventHandler [
					"Killed",
					{
						_antenna = _this select 0;
						_antenna removeAllEventHandlers "Killed";

						citiesX apply {
							if ([antennas, _x] call BIS_fnc_nearestPosition == _antenna) then {
								[_x, false] spawn A3A_fnc_blackout
							};
						};

						_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
						antennas = antennas - [_antenna];
						antennasDead pushBack  _antenna;
						deleteMarker _mrk;
						publicVariable "antennas";
						publicVariable "antennasDead";
						["TaskSucceeded", ["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
						["TaskFailed", ["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification", Occupants];
					}
				];
			};
		};
	};
};
if (debug) then {
	Error("Broken Radio Towers identified.");
};
if (count _posBank > 0) then {
	for "_i" from 0 to (count _posBank - 1) do {
		_bankProv = nearestObjects [_posBank select _i, _banktypes, 30];

		if (count _bankProv > 0) then {
			private _banco = _bankProv select 0;
			banks = banks + [_banco];
		};
	};
};

// Make list of markers that don't have a proper road nearby
blackListDest = (markersX - controlsX - ["Synd_HQ"] - citiesX) select {
	private _nearRoads = (getMarkerPos _x) nearRoads (([_x] call A3A_fnc_sizeMarker) * 1.5);
//	_nearRoads = _nearRoads inAreaArray _x;
	private _badSurfaces = ["#GdtForest", "#GdtRock", "#GdtGrassTall"];
	private _idx = _nearRoads findIf { !(surfaceType (position _x) in _badSurfaces) && { count roadsConnectedTo _x != 0 } };
	if (_idx == -1) then {true} else {false};
};

publicVariable "blackListDest";
publicVariable "markersX";
publicVariable "citiesX";
publicVariable "airportsX";
publicVariable "resourcesX";
publicVariable "factories";
publicVariable "outposts";
publicVariable "controlsX";
publicVariable "seaports";
publicVariable "destroyedSites";
publicVariable "forcedSpawn";
publicVariable "outpostsFIA";
publicVariable "seaMarkers";
publicVariable "spawnPoints";
publicVariable "antennas";
publicVariable "antennasDead";
publicVariable "mrkAntennas";
publicVariable "banks";
publicVariable "seaSpawn";
publicVariable "seaAttackSpawn";
publicVariable "defaultControlIndex";
publicVariable "detectionAreas";

if (isMultiplayer) then {
	[petros, "hint","Zones Init Completed"] remoteExec ["A3A_fnc_commsMP", -2]
};

Info("initZones completed");
