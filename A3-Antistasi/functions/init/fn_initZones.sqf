//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
scriptName "initZones.sqf";
private _fileName = "initZones.sqf";
[2,"initZones started",_fileName] call A3A_fnc_log;

forcedSpawn = [];
citiesX = [];

[] call A3A_fnc_prepareMarkerArrays;

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
	diag_log format ["%1: [Antistasi] | DEBUG | initZones | Setting Spawn Points for %2.", servertime, worldname];
};
//We're doing it this way, because Dedicated servers world name changes case, depending on how the file is named.
//And weirdly, == is not case sensitive.
//this comments has not an information about the code

(seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints + detectionAreas + islands) apply {_x setMarkerAlpha 0};
defaultControlIndex = (count controlsX) - 1;
outpostsFIA = [];
destroyedSites = [];
garrison setVariable ["Synd_HQ", [], true];
markersX = airportsX + resourcesX + factories + outposts + seaports + controlsX + ["Synd_HQ"];
if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initZones | Building roads for %2.",servertime,worldname];
};
markersX apply {
	_x setMarkerAlpha 0;
	spawner setVariable [_x, 2, true];
};	//apply faster then forEach and look better


// setup hardcoded population counts for towns
private _hardcodedPop = true;
switch (toLower worldName) do {
	case "tanoa": {
		{server setVariable [_x select 0,_x select 1]} forEach [["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],["Ovau01",226],["IndPort01",420],["Ba01",106]];
	};
	case "altis": {
		{server setVariable [_x select 0,_x select 1]} forEach [["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
	};
	case "chernarus_summer": {
		{server setVariable [_x select 0,_x select 1]} forEach [["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["hill_Olsha",20]];
	};
	case "chernarus_winter": {
		{server setVariable [_x select 0,_x select 1]} forEach [["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["hill_Olsha",20]];
	};
	default { _hardcodedPop = false };
};

private ["_nameX", "_roads", "_numCiv", "_roadsProv", "_roadcon", "_dmrk", "_info"];

"(getText (_x >> ""type"") in [""NameCityCapital"", ""NameCity"", ""NameVillage"", ""CityCenter""]) &&
!(getText (_x >> ""Name"") isEqualTo """") &&
!((configName _x) in [""Lakatoro01"", ""Galili01"",""Sosovu01"", ""Ipota01"", ""hill12"", ""V_broad22""])"
configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

	_nameX = configName _x;
	_sizeX = getNumber (_x >> "radiusA");
	_sizeY = getNumber (_x >> "radiusB");
	_size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	_pos = getArray (_x >> "position");
	_size = [_size, 400] select (_size < 400);		// Different from generateRoadsDB. Maybe not good.
	_roads = [];
	_numCiv = 0;

	_roads = roadsX getVariable [_nameX, []];
	if (count _roads == 0) then
	{
		[2, format ["No roads found for marker %1, generating...", _nameX], _fileName] call A3A_fnc_log;
		_roadsProv = _pos nearRoads _size;
		_roadsProv apply
		{
			_roadcon = roadsConnectedto _x;
			if (count _roadcon == 2) then
			{
				_roads pushBack (getPosATL _x);
			};
		};
		roadsX setVariable [_nameX, _roads, true];
	};

	if (_hardcodedPop) then
	{
		_numCiv = server getVariable _nameX;
		if (isNil "_numCiv" || {!(_numCiv isEqualType 0)}) then
		{
			[1, format ["Bad population count data for %1", _nameX], _fileName] call A3A_fnc_log;
			_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
		};
	}
	else {
		_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
	};

	_numVeh = round (_numCiv / 3);
	_nroads = count _roads;
	if(_nroads > 0) then
	{
		//Fixed issue with a town on tembledan having no roads
		_nearRoadsFinalSorted = [_roads, [], { _pos distance _x }, "ASCEND"] call BIS_fnc_sortBy;
		_pos = _nearRoadsFinalSorted select 0;
	};
	if (_nroads < _numVeh) then {_numVeh = _nroads};

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
diag_log format ["%1: [Antistasi] | DEBUG | initZones | Roads built in %2.",servertime,worldname];
};

[2,"Loading nav grid",_fileName] call A3A_fnc_log;
[] call A3A_fnc_loadNavGrid;
[2,"Loaded nav grid",_fileName] call A3A_fnc_log;


markersX = markersX + citiesX;
sidesX setVariable ["Synd_HQ", teamPlayer, true];
sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

antennasDead = [];
banks = [];
mrkAntennas = [];
private _posAntennas = [];
private _blacklistPos = [];
private _posBank = [];
private ["_antenna", "_mrkFinal", "_antennaProv"];
if (debug) then {
diag_log format ["%1: [Antistasi] | DEBUG | initZones | Setting up Radio Towers.",servertime];
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

switch (worldName) do {
	case "tanoa": {
		_posAntennas = [[6617.95,7853.57,0.200073], [7486.67,9651.9,1.52588e-005], [6005.47,10420.9,0.20298], [2437.25,7224.06,0.0264893], [4701.6,3165.23,0.0633469], [11008.8,4211.16,-0.00154114], [10114.3,11743.1,9.15527e-005], [10949.8,11517.3,0.14209], [11153.3,11435.2,0.210876], [12889.2,8578.86,0.228729], [2682.94,2592.64,-0.000686646], [2690.54,12323,0.0372467], [2965.33,13087.1,0.191544], [13775.8,10976.8,0.170441]];	// All antennas to be bases or to ignore.
		_blacklistPos = [8, 12];		// Ignore Antenna at <Index> in _posAntennas.
		_posBank = [[5893.41,10253.1,-0.687263], [9507.5,13572.9,0.133848]];	// same as RT for Bank buildings, select the biggest buildings in your island, and make a DB with their positions.
		antennas = [antenna];			// Don't do this.
		_posAntennas pushBack (getPos antenna);	// Create _posAntennas element from object.
	};
	case "altis": {
		_posAntennas = [[14451.5,16338,0.000354767], [15346.7,15894,-3.8147e-005], [16085.1,16998,7.08781], [17856.7,11734.1,0.863045], [9496.2,19318.5,0.601898], [9222.87,19249.1,0.0348206], [20944.9,19280.9,0.201118], [20642.7,20107.7,0.236603], [18709.3,10222.5,0.716034], [6840.97,16163.4,0.0137177], [19319.8,9717.04,0.215622], [19351.9,9693.04,0.639175], [10316.6,8703.94,0.0508652], [8268.76,10051.6,0.0100708], [4583.61,15401.1,0.262543],[4555.65,15383.2,0.0271606], [4263.82,20664.1,-0.0102234], [26274.6,22188.1,0.0139847], [26455.4,22166.3,0.0223694]];
		_blacklistPos = [1, 4, 7, 8, 9, 10, 12, 15, 17];
		_posBank = [[16586.6,12834.5,-0.638584], [16545.8,12784.5,-0.485485], [16633.3,12807,-0.635017], [3717.34,13391.2,-0.164862], [3692.49,13158.3,-0.0462074], [3664.31,12826.5,-0.379545], [3536.99,13006.6,-0.508585], [3266.42,12969.9,-0.549738]];
		antennas = [];
	};
	case "chernarus_summer": {
		_posAntennas = [[6444.13,6545.83,-0.106628], [5264.35,5314.45,0.0291748], [4968.53,9964.4,0], [3715.81,5984.25,0], [6563.69,3405.56,0.0547104],[4548.22,3131.85,0.570232], [13010.1,5964.96,-0.0164185], [3029.57,2350.28,0.0183334], [13477.6,3345.84,0.0729446], [12937,12763.6,0.164017]];
		_blackListPos = [1, 7];
		antennas = [];
	};
	default {
		antennas = nearestObjects [[worldSize /2, worldSize/2], ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F", "Land_Vysilac_FM","Land_A_TVTower_base", "Land_Telek1"], worldSize];

		banks = nearestObjects [[worldSize /2, worldSize/2], ["Land_Offices_01_V1_F"], worldSize];

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
};
if (debug) then {
diag_log format ["%1: [Antistasi] | DEBUG | initZones | Radio Tower built.", servertime];
diag_log format ["%1: [Antistasi] | DEBUG | initZones | Finding broken Radio Towers.", servertime];
};
if (count _posAntennas > 0) then {
	for "_i" from 0 to (count _posAntennas - 1) do {
		_antennaProv = nearestObjects [_posAntennas select _i, ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F", "Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1"], 35];

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
diag_log format ["%1: [Antistasi] | DEBUG | initZones | Broken Radio Towers identified.",servertime];
};
if (count _posBank > 0) then {
	for "_i" from 0 to (count _posBank - 1) do {
		_bankProv = nearestObjects [_posBank select _i, ["Land_Offices_01_V1_F"], 30];

		if (count _bankProv > 0) then {
			private _banco = _bankProv select 0;
			banks = banks + [_banco];
		};
	};
};

blackListDest = (markersX - controlsX - ["Synd_HQ"] - citiesX) select {!((position ([getMarkerPos _x] call A3A_fnc_findNearestGoodRoad)) inArea _x)};

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
publicVariable "islands";
publicVariable "roadsMrk";

if (isMultiplayer) then {
	[petros, "hint","Zones Init Completed"] remoteExec ["A3A_fnc_commsMP", -2]
};

[2,"initZones completed",_fileName] call A3A_fnc_log;
