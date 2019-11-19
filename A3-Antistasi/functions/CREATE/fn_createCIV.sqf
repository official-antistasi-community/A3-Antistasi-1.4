if (!isServer and hasInterface) exitWith{};
private ["_countSpawnedPatrols","_countPatrolAttempts","_newPatrolGroup","_wp","_wp1"];

private _locationMarker = _this select 0;
if (_locationMarker in destroyedSites) exitWith {};

private _locationData = server getVariable _locationMarker;
private _roadPositions = roadsX getVariable _locationMarker;
private _civilianPopulation = _locationData select 0;
private _vehicleLimit = _locationData select 1;
private _occupantSupport = _locationData select 2;
private _rebelSupport = _locationData select 3;
private _locationMarkerPosition = getMarkerPos (_locationMarker);
private _locationMarkerSize = [_locationMarker] call A3A_fnc_sizeMarker;

private _spawnedCivilians = [];
private _spawnedGroups = [];
private _spawnedEmptyVehicles = [];
private _spawnedDrivingCivilians = [];
private _spawnedDrivingGroups = [];
private _spawnedDrivingVehicles = [];

private _civilianClassname = "";
private _vehicleClassname = "";
private _emptyVehicleOrientation = 0;
private _countSpawnedVehicles = 0;
private _countVehiclePositions = count _roadPositions;

//---------------------------------------------------------------------------------------------
_roadPositions = _roadPositions call BIS_fnc_arrayShuffle;

_vehicleLimit = round (_vehicleLimit * (civPerc/200) * civTraffic);
if (_vehicleLimit < 1) then {_vehicleLimit = 1};

_civilianPopulation = round (_civilianPopulation * (civPerc/250));
if ((daytime < 8) or (daytime > 21)) then {_civilianPopulation = round (_civilianPopulation/4); _vehicleLimit = round (_vehicleLimit * 1.5)};
if (_civilianPopulation < 1) then {_civilianPopulation = 1};

while {(spawner getVariable _locationMarker != 2) and (_countSpawnedVehicles < _vehicleLimit) and (_countSpawnedVehicles < _countVehiclePositions)} do
	{
	private _position1 = _roadPositions select _countSpawnedVehicles;
	private _road = roadAt _position1;
	if (!isNull _road) then
		{
		if ((count (nearestObjects [_position1, ["Car", "Truck"], 5]) == 0) and !([50,1,_road,teamPlayer] call A3A_fnc_distanceUnits)) then
			{
			private _connectedRoads = roadsConnectedto _road;
			private _position2 = getPos (_connectedRoads select 0);
			_emptyVehicleOrientation = [_position1,_position2] call BIS_fnc_DirTo;
			private _spawnPosition = [_position1, 3, _emptyVehicleOrientation + 90] call BIS_Fnc_relPos;
			_vehicleClassname = selectRandom arrayCivVeh;
			private _spawnedVehicle = _vehicleClassname createVehicle _spawnPosition;
			_spawnedVehicle setDir _emptyVehicleOrientation;
			_spawnedEmptyVehicles pushBack _spawnedVehicle;
			[_spawnedVehicle] spawn A3A_fnc_civVEHinit;
			};
		};
	sleep 0.5;
	_countSpawnedVehicles = _countSpawnedVehicles + 1;
	};

private _locationBoatSpawns = if !(hasIFA) then {seaSpawn select {getMarkerPos _x inArea _locationMarker}} else {[]};
if (count _locationBoatSpawns > 0) then
	{
	for "_i" from 0 to (round (random 3)) do
		{
		if (spawner getVariable _locationMarker != 2) then
			{
			_vehicleClassname = selectRandom civBoats;
			private _spawnPosition = (getMarkerPos (_locationBoatSpawns select 0)) findEmptyPosition [0,20,_vehicleClassname];
			private _spawnedVehicle = _vehicleClassname createVehicle _spawnPosition;
			_spawnedVehicle setDir (random 360);
			_spawnedEmptyVehicles pushBack _spawnedVehicle;
			[_spawnedVehicle] spawn A3A_fnc_civVEHinit;
			sleep 0.5;
			};
		};
	};

if ((random 100 < ((prestigeNATO) + (prestigeCSAT))) and (spawner getVariable _locationMarker != 2)) then
	{
	while {true} do
		{
		private _spawnPosition = [_locationMarkerPosition, round (random _locationMarkerSize), random 360] call BIS_Fnc_relPos;
		if (!surfaceIsWater _spawnPosition) exitWith {};
		};
	private _newCivilianGroup = createGroup civilian;
	_spawnedGroups pushBack _newCivilianGroup;
	private _spawnedCivilian = _newCivilianGroup createUnit ["C_journalist_F", _pos, [],0, "NONE"];
	[_spawnedCivilian] spawn A3A_fnc_CIVinit;
	_spawnedCivilians pushBack _spawnedCivilian;
	[_spawnedCivilian, _locationMarker, "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
	};


if ([_locationMarker,false] call A3A_fnc_fogCheck > 0.2) then
	{
	private _citiesInPatrolRange = [_locationMarker] call A3A_fnc_citiesToCivPatrol;
	private _countSpawnedPatrols = 0;

	private _countPatrolAttempts = round (_civilianPopulation / 60);
	if (_countPatrolAttempts < 1) then {_countPatrolAttempts = 1};

	for "_i" from 1 to _countPatrolAttempts do
		{
		while {(spawner getVariable _locationMarker != 2) and (_countSpawnedPatrols < (count _citiesInPatrolRange - 1) and (_countSpawnedVehicles < _countVehiclePositions))} do
			{
			private _position1 = _roadPositions select _countSpawnedVehicles;
			private _road = roadAt _position1;
			if (!isNull _road) then
				{
				if (count (nearestObjects [_position1, ["Car", "Truck"], 5]) == 0) then
					{
					_newPatrolGroup = createGroup civilian;
					_spawnedDrivingGroups = _spawnedDrivingGroups + [_newPatrolGroup];
					private _connectedRoads = roadsConnectedto _road;
					private _position2 = getPos (_connectedRoads select 0);
					_emptyVehicleOrientation = [_position1,_position2] call BIS_fnc_DirTo;
					_vehicleClassname = selectRandom arrayCivVeh;
					private _newPatrolVehicle = _vehicleClassname createVehicle _position1;
					_newPatrolVehicle setDir _emptyVehicleOrientation;
					_newPatrolVehicle addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_this select 0))) then {0;} else {(_this select 2);};}];
					_newPatrolVehicle addEventHandler ["HandleDamage",
						{
						private _patrolVehicle = _this select 0;
						if (side(_this select 3) == teamPlayer) then
							{
							private _patrolDriver = driver _patrolVehicle;
							if (side _patrolDriver == civilian) then {_patrolDriver leaveVehicle _patrolVehicle};
							};
						}
						];
					_spawnedDrivingVehicles = _spawnedDrivingVehicles + [_newPatrolVehicle];
					_civilianClassname = selectRandom arrayCivs;
					_spawnedCivilian = _newPatrolGroup createUnit [_civilianClassname, _position1, [],0, "NONE"];
					[_spawnedCivilian] spawn A3A_fnc_CIVinit;
					_spawnedDrivingCivilians = _spawnedDrivingCivilians + [_spawnedCivilian];
					_spawnedCivilian moveInDriver _newPatrolVehicle;
					_newPatrolGroup addVehicle _newPatrolVehicle;
					_newPatrolGroup setBehaviour "CARELESS";
					_newPatrolVehicle limitSpeed 50;
					private _patrolDestination = selectRandom (roadsX getVariable (_citiesInPatrolRange select _countSpawnedPatrols));
					private _wp1 = _newPatrolGroup addWaypoint [_patrolDestination,0];
					_wp1 setWaypointType "MOVE";
					_wp1 setWaypointSpeed "LIMITED";
					_wp1 setWaypointTimeout [30, 45, 60];
					private _wp2 = _newPatrolGroup addWaypoint [_locationMarkerPosition,1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointTimeout [30, 45, 60];
					private _wp3 = _newPatrolGroup addWaypoint [_locationMarkerPosition,2];
					_wp3 setWaypointType "CYCLE";
					_wp3 synchronizeWaypoint [_wp1];
					};
				};
			_countSpawnedPatrols = _countSpawnedPatrols + 1;
			sleep 5;
			};
		};
	};

waitUntil {sleep 1;(spawner getVariable _locationMarker == 2)};

{deleteVehicle _x} forEach _spawnedCivilians;
{deleteGroup _x} forEach _spawnedGroups;
{
if (!([distanceSPWN - _locationMarkerSize,1,_x,teamPlayer] call A3A_fnc_distanceUnits)) then
	{
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	deleteVehicle _x;
	}
} forEach _spawnedEmptyVehicles;
{
waitUntil {sleep 1; !([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits)};
deleteVehicle _x} forEach _spawnedDrivingCivilians;
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
} forEach _spawnedDrivingVehicles;
{deleteGroup _x} forEach _spawnedDrivingGroups;
