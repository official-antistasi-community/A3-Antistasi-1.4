if (!isServer and hasInterface) exitWith{};

private _fileName = "fn_createCIV.sqf";

private ["_markerX","_dataX","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR","_civs","_groups","_vehiclesX","_civsPatrol","_groupsPatrol","_vehPatrol","_typeCiv","_typeVehX","_dirVeh","_countX","_groupX","_size","_road","_typeVehX","_dirVeh","_positionX","_area","_civ","_veh","_roadcon","_pos","_p1","_p2","_mrkMar","_patrolCities","_countPatrol","_burst","_groupP","_wp","_wp1"];

_markerX = _this select 0;

if (_markerX in destroyedSites) exitWith {};

_dataX = server getVariable _markerX;

_numCiv = _dataX select 0;
_numVeh = _dataX select 1;
//_roads = _dataX select 2;
_roads = roadsX getVariable [_markerX, []];
if (count _roads == 0) then {
	[1, format ["Roads not found for marker %1", _markerX], _fileName] call A3A_fnc_log;
};

_prestigeOPFOR = _dataX select 2;
_prestigeBLUFOR = _dataX select 3;

_civs = [];
_groups = [];
_vehiclesX = [];
_civsPatrol = [];
_groupsPatrol = [];
_vehPatrol = [];
_size = [_markerX] call A3A_fnc_sizeMarker;

_typeCiv = "";
_typeVehX = "";
_dirVeh = 0;

_positionX = getMarkerPos (_markerX);

_area = [_markerX] call A3A_fnc_sizeMarker;

_roads = _roads call BIS_fnc_arrayShuffle;

_numVeh = round (_numVeh * (civPerc/200) * civTraffic);
if (_numVeh < 1) then {_numVeh = 1};
_numCiv = round (_numCiv * (civPerc/250));
if ((daytime < 8) or (daytime > 21)) then {_numCiv = round (_numCiv/4); _numVeh = round (_numVeh * 1.5)};
if (_numCiv < 1) then {_numCiv = 1};

_countX = 0;
_max = count _roads;

while {(spawner getVariable _markerX != 2) and (_countX < _numVeh) and (_countX < _max)} do
	{
	_p1 = _roads select _countX;
	_road = roadAt _p1;
	if (!isNull _road) then
		{
		if ((count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) and !([50,1,_road,teamPlayer] call A3A_fnc_distanceUnits)) then
			{
			_roadcon = roadsConnectedto (_road);
			_p2 = getPos (_roadcon select 0);
			_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
			_pos = [_p1, 3, _dirveh + 90] call BIS_Fnc_relPos;
			_typeVehX = selectRandom arrayCivVeh;
			/*
			_mrk = createmarker [format ["%1", count vehicles], _p1];
		    _mrk setMarkerSize [5, 5];
		    _mrk setMarkerShape "RECTANGLE";
		    _mrk setMarkerBrush "SOLID";
		    _mrk setMarkerColor colorTeamPlayer;
		    //_mrk setMarkerText _nameX;
		    */
			_veh = _typeVehX createVehicle _pos;
			_veh setDir _dirveh;
			_vehiclesX pushBack _veh;
			_nul = [_veh] spawn A3A_fnc_civVEHinit;
			};
		};
	sleep 0.5;
	_countX = _countX + 1;
	};

_mrkMar = if !(hasIFA) then {seaSpawn select {getMarkerPos _x inArea _markerX}} else {[]};
if (count _mrkMar > 0) then
	{
	for "_i" from 0 to (round (random 3)) do
		{
		if (spawner getVariable _markerX != 2) then
			{
			_typeVehX = selectRandom civBoats;
			_pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0,20,_typeVehX];
			_veh = _typeVehX createVehicle _pos;
			_veh setDir (random 360);
			_vehiclesX pushBack _veh;
			[_veh] spawn A3A_fnc_civVEHinit;
			sleep 0.5;
			};
		};
	};

if ((random 100 < ((prestigeNATO) + (prestigeCSAT))) and (spawner getVariable _markerX != 2)) then
	{
	_pos = [];
	while {true} do
		{
		_pos = [_positionX, round (random _area), random 360] call BIS_Fnc_relPos;
		if (!surfaceIsWater _pos) exitWith {};
		};
	_groupX = createGroup civilian;
	_groups pushBack _groupX;
	_civ = _groupX createUnit ["C_journalist_F", _pos, [],0, "NONE"];
	_nul = [_civ] spawn A3A_fnc_CIVinit;
	_civs pushBack _civ;
	_nul = [_civ, _markerX, "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
	};


if ([_markerX,false] call A3A_fnc_fogCheck > 0.2) then
	{
	_patrolCities = [_markerX] call A3A_fnc_citiesToCivPatrol;

	_countPatrol = 0;

	_burst = round (_numCiv / 60);
	if (_burst < 1) then {_burst = 1};

	for "_i" from 1 to _burst do
		{
		while {(spawner getVariable _markerX != 2) and (_countPatrol < (count _patrolCities - 1) and (_countX < _max))} do
			{
			//_p1 = getPos (_roads select _countX);
			_p1 = _roads select _countX;
			//_road = (_p1 nearRoads 5) select 0;
			_road = roadAt _p1;
			if (!isNull _road) then
			//if (!isNil "_road") then
				{
				if (count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) then
					{
					_groupP = createGroup civilian;
					_groupsPatrol = _groupsPatrol + [_groupP];
					_roadcon = roadsConnectedto _road;
					//_p1 = getPos (_roads select _countX);
					_p2 = getPos (_roadcon select 0);
					_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
					_typeVehX = selectRandom arrayCivVeh;
					_veh = _typeVehX createVehicle _p1;
					_veh setDir _dirveh;
					_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_this select 0))) then {0;} else {(_this select 2);};}];
					_veh addEventHandler ["HandleDamage",
						{
						_veh = _this select 0;
						if (side(_this select 3) == teamPlayer) then
							{
							_driverX = driver _veh;
							if (side _driverX == civilian) then {_driverX leaveVehicle _veh};
							};
						}
						];
					//_veh forceFollowRoad true;
					_vehPatrol = _vehPatrol + [_veh];
					_typeCiv = selectRandom arrayCivs;
					_civ = _groupP createUnit [_typeCiv, _p1, [],0, "NONE"];
					_nul = [_civ] spawn A3A_fnc_CIVinit;
					_civsPatrol = _civsPatrol + [_civ];
					_civ moveInDriver _veh;
					_groupP addVehicle _veh;
					_groupP setBehaviour "CARELESS";
					_veh limitSpeed 50;
					_posDestination = selectRandom (roadsX getVariable (_patrolCities select _countPatrol));
					_wp = _groupP addWaypoint [_posDestination,0];
					_wp setWaypointType "MOVE";
					_wp setWaypointSpeed "LIMITED";
					_wp setWaypointTimeout [30, 45, 60];
					_wp = _groupP addWaypoint [_positionX,1];
					_wp setWaypointType "MOVE";
					_wp setWaypointTimeout [30, 45, 60];
					_wp1 = _groupP addWaypoint [_positionX,2];
					_wp1 setWaypointType "CYCLE";
					_wp1 synchronizeWaypoint [_wp];
					};
				};
			_countPatrol = _countPatrol + 1;
			sleep 5;
			};
		};
	};

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};

{deleteVehicle _x} forEach _civs;
{deleteGroup _x} forEach _groups;
{
if (!([distanceSPWN-_size,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then
	{
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	deleteVehicle _x;
	}
} forEach _vehiclesX;
{
waitUntil {sleep 1; !([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits)};
deleteVehicle _x} forEach _civsPatrol;
{
if (!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then
	{
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	deleteVehicle _x
	}
else
	{
	[_x] spawn A3A_fnc_civVEHinit
	};
} forEach _vehPatrol;
{deleteGroup _x} forEach _groupsPatrol;
