private ["_soldiers","_vehiclesX","_groups","_base","_posBase","_roads","_typeCar","_arrayAirports","_arrayDestinations","_radiusX","_road","_veh","_vehCrew","_groupVeh","_groupX","_groupP","_distanceX","_spawnPoint"];

diag_log "[Antistasi] Spawning AI Vehicle Patrol (aiVehPatrol.sqf)";

_soldiers = [];
_vehiclesX = [];
_groups = [];
_base = "";
_roads = [];

_arrayAirports = if (hasIFA) then {(airportsX + outposts) select {((spawner getVariable _x != 0)) and (sidesX getVariable [_x,sideUnknown] != rebelSide)}} else {(seaports + airportsX + outposts) select {((spawner getVariable _x != 0)) and (sidesX getVariable [_x,sideUnknown] != rebelSide)}};

_arrayAirports1 = [];
if !(isMultiplayer) then
	{
	{
	_airportX = _x;
	_pos = getMarkerPos _airportX;
	if ([distanceForLandAttack,1,_pos,rebelSide] call A3A_fnc_distanceUnits) then {_arrayAirports1 pushBack _airportX};
	} forEach _arrayAirports;
	}
else
	{
	{
	_airportX = _x;
	_pos = getMarkerPos _airportX;
	if (playableUnits findIf {(side (group _x) == rebelSide) and (_x distance2d _pos < distanceForLandAttack)} != -1) then {_arrayAirports1 pushBack _airportX};
	} forEach _arrayAirports;
	};
if (_arrayAirports1 isEqualTo []) exitWith {};

_base = selectRandom _arrayAirports1;
_typeCar = "";
_sideX = Occupants;
_typePatrol = "LAND";
if (sidesX getVariable [_base,sideUnknown] == Occupants) then
	{
	if ((_base in seaports) and ([vehNATOBoat] call A3A_fnc_vehAvailable)) then
		{
		_typeCar = vehNATOBoat;
		_typePatrol = "SEA";
		}
	else
		{
		if (random 100 < prestigeNATO) then
			{
			_typeCar = if (_base in airportsX) then {selectRandom (vehNATOLight + [vehNATOPatrolHeli])} else {selectRandom vehNATOLight};
			if (_typeCar == vehNATOPatrolHeli) then {_typePatrol = "AIR"};
			}
		else
			{
			_typeCar = selectRandom [vehPoliceCar,militiaVehArmed];
			};
		};
	}
else
	{
	_sideX = Invaders;
	if ((_base in seaports) and ([vehCSATBoat] call A3A_fnc_vehAvailable)) then
		{
		_typeCar = vehCSATBoat;
		_typePatrol = "SEA";
		}
	else
		{
		_typeCar = if (_base in airportsX) then {selectRandom (vehCSATLight + [vehCSATPatrolHeli])} else {selectRandom vehCSATLight};
		if (_typeCar == vehCSATPatrolHeli) then {_typePatrol = "AIR"};
		};
	};

_posbase = getMarkerPos _base;


if (_typePatrol == "AIR") then
	{
	_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
	_distanceX = 200;
	}
else
	{
	if (_typePatrol == "SEA") then
		{
		_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance _posbase < 2500};
		_distanceX = 100;
		}
	else
		{
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		_arrayDestinations = [_arrayDestinations,_posBase] call A3A_fnc_patrolDestinations;
		_distanceX = 50;
		};
	};

if (count _arrayDestinations < 4) exitWith {};

aiVehiclePatrols = aiVehiclePatrols + 1;

if (_typePatrol != "AIR") then
	{
	if (_typePatrol == "SEA") then
		{
		_posbase = [_posbase,50,150,10,2,0,0] call BIS_Fnc_findSafePos;
		}
	else
		{
		_indexX = airportsX find _base;
		if (_indexX != -1) then
			{
			_spawnPoint = spawnPoints select _indexX;
			_posBase = getMarkerPos _spawnPoint;
			}
		else
			{
			_posbase = position ([_posbase] call A3A_fnc_findNearestGoodRoad);
			};
		};
	};

_vehicle=[_posBase, 0,_typeCar, _sideX] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
[_veh] call A3A_fnc_AIVEHinit;
[_veh,"Patrol"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
_groupVeh = _vehicle select 2;
_soldiers = _soldiers + _vehCrew;
_groups = _groups + [_groupVeh];
_vehiclesX = _vehiclesX + [_veh];


if (_typeCar in vehNATOLightUnarmed) then
	{
	sleep 1;
	_groupX = [_posbase, _sideX, groupsNATOSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
	deleteGroup _groupX;
	};
if (_typeCar in vehCSATLightUnarmed) then
	{
	sleep 1;
	_groupX = [_posbase, _sideX, groupsCSATSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
	deleteGroup _groupX;
	};

//if (_typePatrol == "LAND") then {_veh forceFollowRoad true};

while {alive _veh} do
	{
	if (count _arrayDestinations < 2) exitWith {};
	_destinationX = selectRandom _arrayDestinations;
	_posDestination = getMarkerPos _destinationX;
	if (_typePatrol == "LAND") then
		{
		_road = [_posDestination] call A3A_fnc_findNearestGoodRoad;
		_posDestination = position _road;
		};
	_Vwp0 = _groupVeh addWaypoint [_posDestination, 0];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Vwp0 setWaypointSpeed "LIMITED";
	_veh setFuel 1;

	waitUntil {sleep 60; (_veh distance _posDestination < _distanceX) or ({[_x] call A3A_fnc_canFight} count _soldiers == 0) or (!canMove _veh)};
	if !(_veh distance _posDestination < _distanceX) exitWith {};
	if (_typePatrol == "AIR") then
		{
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		}
	else
		{
		if (_typePatrol == "SEA") then
			{
			_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance position _veh < 2500};
			}
		else
			{
			_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
			_arrayDestinations = [_arrayDestinations,position _veh] call A3A_fnc_patrolDestinations;
			};
		};
	};

_enemiesX = if (_sideX == Occupants) then {Invaders} else {Occupants};

{_unit = _x;
waitUntil {sleep 1;!([distanceSPWN,1,_unit,rebelSide] call A3A_fnc_distanceUnits) and !([distanceSPWN,1,_unit,_enemiesX] call A3A_fnc_distanceUnits)};deleteVehicle _unit} forEach _soldiers;

{_veh = _x;
if (!([distanceSPWN,1,_veh,rebelSide] call A3A_fnc_distanceUnits) and !([distanceSPWN,1,_veh,_enemiesX] call A3A_fnc_distanceUnits)) then {deleteVehicle _veh}} forEach _vehiclesX;
{deleteGroup _x} forEach _groups;
aiVehiclePatrols = aiVehiclePatrols - 1;