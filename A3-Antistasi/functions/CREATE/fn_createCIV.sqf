if (!isServer and hasInterface) exitWith{};
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private ["_markerX","_dataX","_numCiv","_numVeh","_prestigeOPFOR","_prestigeBLUFOR","_civs","_groups","_vehiclesX","_civsPatrol","_groupsPatrol","_vehPatrol","_typeCiv","_typeVehX","_dirVeh","_groupX","_size","_road","_typeVehX","_dirVeh","_positionX","_area","_civ","_veh","_roadcon","_pos","_p1","_p2","_mrkMar","_burst","_groupP","_wp","_wp1"];

_markerX = _this select 0;
private _spawnKey = _markerX + "_civ";				// civ part of cities has a separate spawn state from the garrison

if (_markerX in destroyedSites) exitWith {};

_dataX = server getVariable _markerX;

_numCiv = _dataX select 0;
_numVeh = _dataX select 1;

private _roads = nearestTerrainObjects [getMarkerPos _markerX, ["MAIN ROAD", "ROAD", "TRACK"], 250, false, true];
if (count _roads == 0) exitWith
{
    Error_1("Roads not found for marker %1", _markerX);
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
private _maxRoads = count _roads;

private _numParked = _numCiv * (1/60) * civTraffic;		// civTraffic is 0,1,2(default),4
private _numTraffic = _numCiv * (1/300) * civTraffic;

if ((daytime < 8) or (daytime > 21)) then {_numParked = _numParked * 1.5; _numTraffic = _numTraffic / 4 };
_numParked = 1 max (round _numParked) min _maxRoads;
_numTraffic = 1 max (round _numTraffic) min _maxRoads;

private _countParked = 0;

while {(spawner getVariable _spawnKey != 2) and (_countParked < _numParked)} do
	{
	_p1 = _roads select _countParked;
	_road = roadAt _p1;
	if (!isNull _road) then
		{
		if ((count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) and !([50,1,_road,teamPlayer] call A3A_fnc_distanceUnits)) then
			{
			_dirveh = 0;
			_roadcon = roadsConnectedTo [_road, true];

			if (count _roadcon != 0)
			then
			{
				_p2 = getPos (_roadcon # 0);
				_dirveh = _p1 getDir _p2;
			};

			_pos = [_p1, 3, _dirveh + 90] call BIS_Fnc_relPos;
			_typeVehX = selectRandomWeighted civVehiclesWeighted;
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
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
			_vehiclesX pushBack _veh;
			[_veh, civilian] spawn A3A_fnc_AIVEHinit;
			_veh setVariable ["originalPos", getPos _veh];
			};
		};
	sleep 0.5;
	_countParked = _countParked + 1;
	};

_mrkMar = if !(A3A_hasIFA) then {seaSpawn select {getMarkerPos _x inArea _markerX}} else {[]};
if (count _mrkMar > 0) then
	{
	for "_i" from 0 to (round (random 3)) do
		{
		if (spawner getVariable _spawnKey != 2) then
			{
			_typeVehX = selectRandomWeighted civBoatsWeighted;
			_pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0,20,_typeVehX];
			_veh = _typeVehX createVehicle _pos;
			_veh setDir (random 360);
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
			_vehiclesX pushBack _veh;
			[_veh, civilian] spawn A3A_fnc_AIVEHinit;
			_veh setVariable ["originalPos", getPos _veh];
			sleep 0.5;
			};
		};
	};

if ((random 100 < ((aggressionOccupants) + (aggressionInvaders))) and (spawner getVariable _spawnKey != 2)) then
	{
	_pos = [];
	while {true} do
		{
		_pos = [_positionX, round (random _area), random 360] call BIS_Fnc_relPos;
		if (!surfaceIsWater _pos) exitWith {};
		};
	_groupX = createGroup civilian;
	_groups pushBack _groupX;
	_civ = [_groupX, "C_journalist_F", _pos, [],0, "NONE"] call A3A_fnc_createUnit;
	_nul = [_civ] spawn A3A_fnc_CIVinit;
	_civs pushBack _civ;
	_nul = [_civ, _markerX, "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
	};


if ([_markerX,false] call A3A_fnc_fogCheck > 0.2) then
	{
	private _countTraffic = 0;

	private _patrolCities = [_markerX] call A3A_fnc_citiesToCivPatrol;
	if (count _patrolCities > 0) then
		{
		while {(spawner getVariable _spawnKey != 2) and (_countTraffic < _numTraffic)} do
			{
			_p1 = selectRandom _roads;
			_road = roadAt _p1;
			if (!isNull _road) then
				{
				if (count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) then
					{
					_groupP = createGroup civilian;
					_groupsPatrol = _groupsPatrol + [_groupP];
					_roadcon = roadsConnectedto _road;
					//_p1 = getPos (_roads select _countX);
					_p2 = getPos (_roadcon select 0);
					_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
					_typeVehX = selectRandomWeighted civVehiclesWeighted;
					_veh = _typeVehX createVehicle (getPos _p1);
					_veh setDir _dirveh;
					clearMagazineCargoGlobal _veh;
					clearWeaponCargoGlobal _veh;
					clearItemCargoGlobal _veh;
					clearBackpackCargoGlobal _veh;

					//_veh forceFollowRoad true;
					_vehPatrol = _vehPatrol + [_veh];
					_typeCiv = selectRandom arrayCivs;
					_civ = [_groupP, _typeCiv, (getPos _p1), [],0, "NONE"] call A3A_fnc_createUnit;
					_nul = [_civ] spawn A3A_fnc_CIVinit;
					_civsPatrol = _civsPatrol + [_civ];
					_civ moveInDriver _veh;
					[_veh, civilian] call A3A_fnc_AIVEHInit;

					_groupP addVehicle _veh;
					_groupP setBehaviour "CARELESS";
					_veh limitSpeed 50;
					_posDestination = getPos (selectRandom (nearestTerrainObjects [getMarkerPos (selectRandom _patrolCities), ["ROAD", "TRACK"], 250, false, true]));
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
			_countTraffic = _countTraffic + 1;
			sleep 5;
			};
		};
	};

waitUntil {sleep 1; (spawner getVariable _spawnKey == 2)};

{deleteVehicle _x} forEach _civs;
{deleteGroup _x} forEach _groups;

{
	// delete all parked vehicles that haven't been stolen
	if (_x getVariable "ownerSide" == civilian) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { [_x] spawn A3A_fnc_VEHdespawner };
	};
} forEach _vehiclesX;

// Chuck all the civ vehicle patrols into the despawners
{ [_x] spawn A3A_fnc_groupDespawner } forEach _groupsPatrol;
{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehPatrol;
