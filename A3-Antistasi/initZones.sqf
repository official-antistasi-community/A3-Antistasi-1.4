//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
diag_log format ["%1: [Antistasi] | INFO | initZones Started.",servertime];
forcedSpawn = [];
citiesX = [];

//We're doing it this way, because Dedicated servers world name changes case, depending on how the file is named.
//And weirdly, == is not case sensitive.
switch true do {
	case (worldName == "Tanoa"): {
		diag_log format ["%1: [Antistasi] | INFO | initZones | Setting Spawn Points for %2.",servertime,worldname];
		airportsX = ["airport","airport_1","airport_2","airport_3","airport_4"];//airports
		spawnPoints = ["spawnPoint","spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4"];
		resourcesX = ["resource","resource_1","resource_2","resource_3","resource_4","resource_5","resource_6","resource_7"];//economic resources
		factories = ["factory","factory_1","factory_2","factory_3","factory_4"];//factories
		outposts = ["outpost","outpost_1","outpost_2","outpost_3","outpost_4","outpost_5","outpost_6","outpost_7","outpost_8","outpost_9","outpost_10","outpost_11","outpost_12","outpost_13","outpost_14"];//any small zone with mil buildings
		seaports = ["seaport","seaport_1","seaport_2","seaport_3","seaport_4","seaport_5"];//seaports, adding a lot will affect economics, 5 is ok
		controlsX = ["control","control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16","control_17","control_18","control_19","control_20","control_21","control_22","control_23","control_24","control_25","control_26","control_27","control_28","control_29","control_30","control_31","control_32","control_33","control_34","control_35","control_36","control_37","control_38","control_39","control_40","control_41","control_42","control_43","control_44","control_45","control_46","control_47","control_48","control_49","control_50","control_51"];//use this for points where you want a roadblock (logic/strategic points, such as crossroads, airport or bases entrances etc..) game will add some more automatically
		seaMarkers = ["seaPatrol","seaPatrol_1","seaPatrol_2","seaPatrol_3","seaPatrol_4","seaPatrol_5","seaPatrol_6","seaPatrol_7","seaPatrol_8","seaPatrol_9","seaPatrol_10","seaPatrol_11","seaPatrol_12","seaPatrol_13","seaPatrol_14","seaPatrol_15","seaPatrol_16","seaPatrol_17","seaPatrol_18","seaPatrol_19","seaPatrol_20","seaPatrol_21"];
		seaSpawn = ["seaSpawn","seaSpawn_1","seaSpawn_2","seaSpawn_3","seaSpawn_4","seaSpawn_5","seaSpawn_6","seaSpawn_7","seaSpawn_8","seaSpawn_9","seaSpawn_10","seaSpawn_11","seaSpawn_12","seaSpawn_13","seaSpawn_14","seaSpawn_15","seaSpawn_16","seaSpawn_17","seaSpawn_18","seaSpawn_19","seaSpawn_20","seaSpawn_21","seaSpawn_22","seaSpawn_23","seaSpawn_24","seaSpawn_25","seaSpawn_26","seaSpawn_27","seaSpawn_28","seaSpawn_29","seaSpawn_30","seaSpawn_31","seaSpawn_32"];
		seaAttackSpawn = ["seaAttackSpawn","seaAttackSpawn_1","seaAttackSpawn_2","seaAttackSpawn_3","seaAttackSpawn_4","seaAttackSpawn_5","seaAttackSpawn_6","seaAttackSpawn_7","seaAttackSpawn_8","seaAttackSpawn_9","seaAttackSpawn_10"];
    };
    case (worldName == "Altis"): {
        diag_log format ["%1: [Antistasi] | INFO | initZones | Setting Spawn Points for %2.",servertime,worldname];
        airportsX = ["airport","airport_1","airport_2","airport_3","airport_4","airport_5"];//airports
        spawnPoints = ["spawnPoint","spawnPoint_1","spawnPoint_2","spawnPoint_3","spawnPoint_4","spawnPoint_5"];
        resourcesX = ["resource","resource_1","resource_2","resource_3","resource_4","resource_5","resource_6","resource_7"];//economic resources
        factories = ["factory","factory_1","factory_2","factory_3","factory_4","factory_5","factory_6","factory_7","factory_8","factory_9","factory_10","factory_11"];//factories
        outposts = ["outpost","outpost_1","outpost_2","outpost_3","outpost_4","outpost_5","outpost_6","outpost_7","outpost_8","outpost_9","outpost_10","outpost_11","outpost_12","outpost_13","outpost_14","outpost_15","outpost_16","outpost_17","outpost_18","outpost_19","outpost_20","outpost_21","outpost_22","outpost_23","outpost_24","outpost_25","outpost_26","outpost_27","outpost_28","outpost_29","outpost_30","outpost_31","outpost_32","outpost_33","outpost_34","outpost_35","outpost_36","outpost_37","outpost_38","outpost_39","outpost_40","outpost_41","outpost_42"];
        seaports = ["seaport","seaport_1","seaport_2","seaport_3","seaport_4"];//seaports, adding a lot will affect economics, 5 is ok
        controlsX = ["control","control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16","control_17","control_18","control_19","control_20","control_21","control_22","control_23","control_24","control_25","control_26","control_27","control_28","control_29","control_30","control_31","control_32","control_33","control_34","control_35","control_36","control_37","control_38","control_39","control_40","control_41","control_42","control_43","control_44","control_45","control_46","control_47","control_48","control_49","control_50","control_51","control_52","control_53","control_54","control_55","control_56","control_57","control_58"];//use this for points where you want a roadblock (logic/strategic points, such as crossroads, airport or bases entrances etc..) game will add some more automatically
        seaMarkers = ["seaPatrol","seaPatrol_1","seaPatrol_2","seaPatrol_3","seaPatrol_4","seaPatrol_5","seaPatrol_6","seaPatrol_7","seaPatrol_8","seaPatrol_9","seaPatrol_10","seaPatrol_11","seaPatrol_12","seaPatrol_13","seaPatrol_14","seaPatrol_15","seaPatrol_16","seaPatrol_17","seaPatrol_18","seaPatrol_19","seaPatrol_20","seaPatrol_21","seaPatrol_22","seaPatrol_23","seaPatrol_24","seaPatrol_25","seaPatrol_26","seaPatrol_27"];
        seaSpawn = ["seaSpawn","seaSpawn_1","seaSpawn_2","seaSpawn_3","seaSpawn_4","seaSpawn_5","seaSpawn_6","seaSpawn_7","seaSpawn_8","seaSpawn_9"];
        seaAttackSpawn = ["seaAttackSpawn","seaAttackSpawn_1","seaAttackSpawn_2","seaAttackSpawn_3","seaAttackSpawn_4","seaAttackSpawn_5","seaAttackSpawn_6"];
        {
        _name = text _x;
        if ((_name != "Magos") AND !(_name == "")) then {
            _sizeX = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusA");
            _sizeY = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusB");
            _size = if (_sizeX > _sizeY) then {_sizeX} else {_sizeY};
            _pos = getPos _x;
            if (_size < 10) then {_size = 50};

            _mrk = createmarker [format ["%1", _name], _pos];
            _mrk setMarkerSize [_size, _size];
            _mrk setMarkerShape "ELLIPSE";
            _mrk setMarkerBrush "SOLID";
            _mrk setMarkerColor "ColorRed";
            _mrk setMarkerText _name;
            controlsX pushBack _name;
        };
        } foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["Hill"], worldSize/1.414]);
	};
    case (worldName == "chernarus_summer"): {
		diag_log format ["%1: [Antistasi] | INFO | initZones | Setting Spawn Points for %2.",servertime,worldname];
		airportsX = ["airport","airport_1","airport_2"];
		spawnPoints = ["spawnPoint","spawnPoint_1","spawnPoint_2"];
		resourcesX = ["resource","resource_1","resource_2","resource_3","resource_4","resource_5","resource_6","resource_7","resource_8","resource_9"];
		factories = ["factory","factory_1","factory_2","factory_3","factory_4"];
		outposts = ["outpost","outpost_1","outpost_2","outpost_3","outpost_4","outpost_5","outpost_6","outpost_7","outpost_8","outpost_9","outpost_10","outpost_11","outpost_12","outpost_13","outpost_14","outpost_15","outpost_16","outpost_17","outpost_18","outpost_19","outpost_20","outpost_21"];
		seaports = ["seaport","seaport_1","seaport_2","seaport_3","seaport_4"];
		controlsX = ["control","control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16","control_17","control_18","control_19","control_20","control_21","control_22","control_23","control_24","control_25","control_26","control_27","control_28","control_29","control_30","control_31","control_32","control_33","control_34","control_35","control_36","control_37","control_38","control_39","control_40"];
		seaMarkers = [];
		seaSpawn = [];
		seaAttackSpawn = [];
		{
		_name = text _x;
		if ((_name != "Magos") AND !(_name == "")) then
			{
			_sizeX = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusA");
			_sizeY = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusB");
			_size = if (_sizeX > _sizeY) then {_sizeX} else {_sizeY};
			_pos = getPos _x;
			if (_size < 10) then {_size = 50};

			_mrk = createmarker [format ["%1", _name], _pos];
			_mrk setMarkerSize [_size, _size];
			_mrk setMarkerShape "ELLIPSE";
			_mrk setMarkerBrush "SOLID";
			_mrk setMarkerColor "ColorRed";
			_mrk setMarkerText _name;
			controlsX pushBack _name;
			};
		} foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["Hill"], worldSize/1.414]);
	};
	case (worldName == "Malden"): {
		diag_log format ["%1: [Antistasi] | INFO | initZones | Setting Spawn Points for %2.",servertime,worldname];
		airportsX = ["airport","airport_1"];//airports
		spawnPoints = ["spawnPoint","spawnPoint_1","spawnPoint_2"];
		resourcesX = ["resource","resource_1","resource_2","resource_3","resource_4","resource_5"];//economic resources
		factories = ["factory","factory_1","factory_2"];//factories
		outposts = ["outpost","outpost_1","outpost_2","outpost_3","outpost_4","outpost_5","outpost_6","outpost_7","outpost_8","outpost_9","outpost_10","outpost_11","outpost_12","outpost_13"];//any small zone with mil buildings
		seaports = ["seaport","seaport_1","seaport_2","seaport_3","seaport_4","seaport_5","seaport_6","seaport_7"];//seaports, adding a lot will affect economics, 5 is ok
		controlsX = ["control","control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16"];//use this for points where you want a roadblock (logic/strategic points, such as crossroads, airport or bases entrances etc..) game will add some more automatically
		seaMarkers = ["seaPatrol","seaPatrol_1","seaPatrol_2","seaPatrol_3","seaPatrol_4","seaPatrol_5","seaPatrol_6","seaPatrol_7","seaPatrol_8","seaPatrol_9","seaPatrol_10","seaPatrol_11","seaPatrol_12","seaPatrol_13"];
		seaSpawn = ["seaSpawn","seaSpawn_1","seaSpawn_2","seaSpawn_3","seaSpawn_4","seaSpawn_5","seaSpawn_6","seaSpawn_7","seaSpawn_8","seaSpawn_9","seaSpawn_10"];
		seaAttackSpawn = ["seaAttackSpawn","seaAttackSpawn_1","seaAttackSpawn_2","seaAttackSpawn_3","seaAttackSpawn_4","seaAttackSpawn_5","seaAttackSpawn_6","seaAttackSpawn_7"];
    };
};
{_x setMarkerAlpha 0} forEach (seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints);
defaultControlIndex = (count controlsX) - 1;
outpostsFIA = [];
destroyedCities = [];
garrison setVariable ["Synd_HQ",[],true];
markersX = airportsX + resourcesX + factories + outposts + seaports + controlsX + ["Synd_HQ"];
diag_log format ["%1: [Antistasi] | INFO | initZones | Building roads for %2.",servertime,worldname];
{_x setMarkerAlpha 0;
    spawner setVariable [_x,2,true];
} forEach markersX;
private ["_sizeX","_sizeY","_size"];
{
//_nameX = text _x;
_nameX = [text _x, true] call A3A_fnc_fn_location;
if ((_nameX != "") and (_nameX != "Lakatoro01") and (_nameX != "Galili01") and (_nameX != "Sosovu01") and (_nameX != "Ipota01") and (_nameX != "hill12") and (_nameX != "V_broad22")) then//sagonisi is blacklisted in Altis for some reason. If your island has a city in a small island you should blacklist it (road patrols will try to reach it)
    {
    _sizeX = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusA");
    _sizeY = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusB");
    if (_sizeX > _sizeY) then {_size = _sizeX} else {_size = _sizeY};
    _pos = getPos _x;
    if (_size < 400) then {_size = 400};
    _roads = [];
    _numCiv = 0;
    if ((worldName != "Tanoa") and (worldName != "Altis") and (worldName != "chernarus_summer")) then//If Tanoa, data is picked from a DB in initVar.sqf, if not, is built on the fly.
        {
        _numCiv = (count (nearestObjects [_pos, ["house"], _size]));
        _roadsProv = _pos nearRoads _size;
        //_roads = [];
        {
        _roadcon = roadsConnectedto _x;
        if (count _roadcon == 2) then
            {
            _roads pushBack (getPosATL _x);
            };
        } forEach _roadsProv;
        roadsX setVariable [_nameX,_roads];
        }
    else
        {
        _roads = roadsX getVariable _nameX;
        _numCiv = server getVariable _nameX;
        if (isNil "_numCiv") then
            {
            diag_log format ["%1: [Antistasi] | INFO | initZones | No Civilian Limit Set %2.",servertime,_nameX];
            _numCiv = (count (nearestObjects [_pos, ["house"], _size]));
            _roadsProv = _pos nearRoads _size;
            //_roads = [];
            {
            _roadcon = roadsConnectedto _x;
            if (count _roadcon == 2) then
                {
                _roads pushBack (getPosATL _x);
                };
            } forEach _roadsProv;
            roadsX setVariable [_nameX,_roads];
            };
        if (typeName _numCiv != typeName 0) then {
                hint format ["Incorrect Data: %1. Data Type: %2",_nameX, typeName _numCiv];
                diag_log format ["%1: [Antistasi] | INFO | initZones | Incorrect data type for %2, Type given %2",servertime,_nameX, typeName _numCiv];
                };
        //if (isNil "_roads") then {hint format ["A mi no me sale en %1",_nameX]};
        };
    _numVeh = round (_numCiv / 3);
    _nroads = count _roads;
    _nearRoadsFinalSorted = [_roads, [], { _pos distance _x }, "ASCEND"] call BIS_fnc_sortBy;
    _pos = _nearRoadsFinalSorted select 0;
    if (isNil "_pos") then {diag_log format ["Falla %1",_nameX]};
    _mrk = createmarker [format ["%1", _nameX], _pos];
    _mrk setMarkerSize [_size, _size];
    _mrk setMarkerShape "RECTANGLE";
    _mrk setMarkerBrush "SOLID";
    _mrk setMarkerColor colorOccupants;
    _mrk setMarkerText _nameX;
    _mrk setMarkerAlpha 0;
    citiesX pushBack _nameX;
    spawner setVariable [_nameX,2,true];
    _dmrk = createMarker [format ["Dum%1",_nameX], _pos];
    _dmrk setMarkerShape "ICON";
    _dmrk setMarkerType "loc_Ruin";
    _dmrk setMarkerColor colorOccupants;
    if (_nroads < _numVeh) then {_numVeh = _nroads};
    sidesX setVariable [_mrk,Occupants,true];
    _info = [_numCiv, _numVeh, prestigeOPFOR,prestigeBLUFOR];
    server setVariable [_nameX,_info,true];
    };
}foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameCityCapital","NameCity","NameVillage","CityCenter"], 25000]);
diag_log format ["%1: [Antistasi] | INFO | initZones | Roads built in %2.",servertime,worldname];
markersX = markersX + citiesX;
sidesX setVariable ["Synd_HQ",teamPlayer,true];
//if !(isMultiplayer) then {call compile preprocessFileLineNumbers "initGarrisons.sqf"};

antennasDead = [];
banks = [];

_posAntennas = [];
_posBank = [];
_blacklistPos = [];
mrkAntennas = [];
diag_log format ["%1: [Antistasi] | INFO | initZones | Setting up Radio Towers.",servertime];
if (worldName == "Tanoa") then
    {
    _posAntennas = [[6617.95,7853.57,0.200073],[7486.67,9651.9,1.52588e-005],[6005.47,10420.9,0.20298],[2437.25,7224.06,0.0264893],[4701.6,3165.23,0.0633469],[11008.8,4211.16,-0.00154114],[10114.3,11743.1,9.15527e-005],[10949.8,11517.3,0.14209],[11153.3,11435.2,0.210876],[12889.2,8578.86,0.228729],[2682.94,2592.64,-0.000686646],[2690.54,12323,0.0372467],[2965.33,13087.1,0.191544],[13775.8,10976.8,0.170441]];
    _blacklistPos = [8,12];
    _posBank = [[5893.41,10253.1,-0.687263],[9507.5,13572.9,0.133848]];//same as RT for Bank buildings, select the biggest buildings in your island, and make a DB with their positions.
    antennas = [antenna];
    _posAntennas pushBack (getPos antenna);
    }
else
    {
    if (worldName == "Altis") then
        {
        _posAntennas = [[14451.5,16338,0.000354767],[15346.7,15894,-3.8147e-005],[16085.1,16998,7.08781],[17856.7,11734.1,0.863045],[9496.2,19318.5,0.601898],[9222.87,19249.1,0.0348206],[20944.9,19280.9,0.201118],[20642.7,20107.7,0.236603],[18709.3,10222.5,0.716034],[6840.97,16163.4,0.0137177],[19319.8,9717.04,0.215622],[19351.9,9693.04,0.639175],[10316.6,8703.94,0.0508652],[8268.76,10051.6,0.0100708],[4583.61,15401.1,0.262543],[4555.65,15383.2,0.0271606],[4263.82,20664.1,-0.0102234],[26274.6,22188.1,0.0139847],[26455.4,22166.3,0.0223694]];
        _blacklistPos = [1,4,7,8,9,10,12,15,17];
        _posBank = [[16586.6,12834.5,-0.638584],[16545.8,12784.5,-0.485485],[16633.3,12807,-0.635017],[3717.34,13391.2,-0.164862],[3692.49,13158.3,-0.0462074],[3664.31,12826.5,-0.379545],[3536.99,13006.6,-0.508585],[3266.42,12969.9,-0.549738]];
        antennas = [];
        }
    else
        {
        if (worldName == "chernarus_summer") then
            {
            _posAntennas = [[6444.13,6545.83,-0.106628],[5264.35,5314.45,0.0291748],[4968.53,9964.4,0],[3715.81,5984.25,0],[6563.69,3405.56,0.0547104],[4548.22,3131.85,0.570232],[13010.1,5964.96,-0.0164185],[3029.57,2350.28,0.0183334],[13477.6,3345.84,0.0729446],[12937,12763.6,0.164017]];
            _blackListPos = [1,7];
            antennas = [];
            }
        else
            {
            antennas = nearestObjects [[worldSize /2,worldSize/2,0],["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F","Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1"], worldSize];
            banks = nearestObjects [[worldSize /2,worldSize/2,0],["Land_Offices_01_V1_F"],worldSize];
            {
            _mrkFinal = createMarker [format ["Ant%1", _x], position _x];
            _mrkFinal setMarkerShape "ICON";
            _mrkFinal setMarkerType "loc_Transmitter";
            _mrkFinal setMarkerColor "ColorBlack";
            _mrkFinal setMarkerText "Radio Tower";
            mrkAntennas pushBack _mrkFinal;
            _x addEventHandler ["Killed",
                {
                _antenna = _this select 0;
                {if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
                _mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
                antennas = antennas - [_antenna]; antennasDead pushBack (getPos _antenna); deleteMarker _mrk;
                publicVariable "antennas"; publicVariable "antennasDead";
                ["TaskSucceeded",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
                ["TaskFailed",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",Occupants];
                }
                ];
            } forEach antennas;
            };
        };
    };
diag_log format ["%1: [Antistasi] | INFO | initZones | Radio Tower built.",servertime];
diag_log format ["%1: [Antistasi] | INFO | initZones | Finding broken Radio Towers.",servertime];
if (count _posAntennas > 0) then
    {
    for "_i" from 0 to (count _posAntennas - 1) do
        {
        _antennaProv = nearestObjects [_posAntennas select _i,["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F","Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1"], 35];
        if (count _antennaProv > 0) then
            {
            _antenna = _antennaProv select 0;
            if (_i in _blacklistPos) then
                {
                _antenna setdamage 1;
                }
            else
                {
                antennas pushBack _antenna;
                _mrkFinal = createMarker [format ["Ant%1", _i], _posAntennas select _i];
                _mrkFinal setMarkerShape "ICON";
                _mrkFinal setMarkerType "loc_Transmitter";
                _mrkFinal setMarkerColor "ColorBlack";
                _mrkFinal setMarkerText "Radio Tower";
                mrkAntennas pushBack _mrkFinal;
                _antenna addEventHandler ["Killed",
                    {
                    _antenna = _this select 0;
                    {if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
                    _mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
                    antennas = antennas - [_antenna]; antennasDead pushBack (getPos _antenna); deleteMarker _mrk;
                    publicVariable "antennas"; publicVariable "antennasDead";
                    ["TaskSucceeded",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
                    ["TaskFailed",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",Occupants];
                    }
                ];
                };
            };
        };
    };
diag_log format ["%1: [Antistasi] | INFO | initZones | Broken Radio Towers identified.",servertime];
if (count _posBank > 0) then
    {
    for "_i" from 0 to (count _posBank - 1) do
        {
        _bankProv = nearestObjects [_posBank select _i,["Land_Offices_01_V1_F"], 25];
        if (count _bankProv > 0) then
            {
            _banco = _bankProv select 0;
            banks = banks + [_banco];
            };
        };
    };

blackListDest = (markersX - controlsX - ["Synd_HQ"] - citiesX) select {!((position ([getMarkerPos _x] call A3A_fnc_findNearestGoodRoad)) inArea _x)};

publicVariable "blackListDest";
//the following is the console code snippet I use to pick positions of any kind of building. You may do this for gas stations, banks, radios etc.. markerPos "Base_4" is because it's in the middle of the island, and inside the array you may find the type of building I am searching for. Paste the result in a txt and add it to the corresponding arrays.
/*
pepe = nearestObjects [markerPos "base_4", ["Land_Communication_F","Land_TTowerBig_1_F","Land_TTowerBig_2_F"], 16000];
pospepe = [];
{pospepe = pospepe + getPos _x} forEach pepe;
copytoclipboard str pospepe;
*/
if (isMultiplayer) then {[[petros,"hint","Zones Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP};
publicVariable "markersX";
publicVariable "citiesX";
publicVariable "airportsX";
publicVariable "resourcesX";
publicVariable "factories";
publicVariable "outposts";
publicVariable "controlsX";
publicVariable "seaports";
publicVariable "destroyedCities";
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
diag_log format ["%1: [Antistasi] | INFO | initZones Completed.",servertime];
