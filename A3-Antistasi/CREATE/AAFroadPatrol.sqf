private ["_soldados","_vehiculos","_grupos","_base","_posBase","_roads","_tipoCoche","_arrayaeropuertos","_arrayDestinos","_tam","_road","_veh","_vehCrew","_grupoVeh","_grupo","_grupoP","_distancia","_spawnPoint"];

_soldados = [];
_vehiculos = [];
_grupos = [];
_base = "";
_roads = [];

_arrayAeropuertos = if (hayIFA) then {(aeropuertos + puestos) select {((spawner getVariable _x != 0)) and (lados getVariable [_x,sideUnknown] != buenos)}} else {(puertos + aeropuertos + puestos) select {((spawner getVariable _x != 0)) and (lados getVariable [_x,sideUnknown] != buenos)}};

_arrayAeropuertos1 = [];
if !(isMultiplayer) then
	{
	{
	_aeropuerto = _x;
	_pos = getMarkerPos _aeropuerto;
	if (allUnits findIf {(_x getVariable ["GREENFORSpawn",false]) and (_x distance2d _pos < distanceForLandAttack)} != -1) then {_arrayAeropuertos1 pushBack _aeropuerto};
	} forEach _arrayAeropuertos;
	}
else
	{
	{
	_aeropuerto = _x;
	_pos = getMarkerPos _aeropuerto;
	if (playableUnits findIf {(side (group _x) == buenos) and (_x distance2d _pos < distanceForLandAttack)} != -1) then {_arrayAeropuertos1 pushBack _aeropuerto};
	} forEach _arrayAeropuertos;
	};
if (_arrayAeropuertos1 isEqualTo []) exitWith {};

_base = selectRandom _arrayAeropuertos1;
_tipoCoche = "";
_lado = malos;
_tipoPatrol = "LAND";
if (lados getVariable [_base,sideUnknown] == malos) then
	{
	if ((_base in puertos) and ([vehNATOBoat] call A3A_fnc_vehAvailable)) then
		{
		_tipoCoche = vehNATOBoat;
		_tipoPatrol = "SEA";
		}
	else
		{
		if (random 100 < prestigeNATO) then
			{
			_tipoCoche = if (_base in aeropuertos) then {selectRandom (vehNATOLight + [vehNATOPatrolHeli])} else {selectRandom vehNATOLight};
			if (_tipoCoche == vehNATOPatrolHeli) then {_tipoPatrol = "AIR"};
			}
		else
			{
			_tipoCoche = selectRandom [vehPoliceCar,vehFIAArmedCar];
			};
		};
	}
else
	{
	_lado = muyMalos;
	if ((_base in puertos) and ([vehCSATBoat] call A3A_fnc_vehAvailable)) then
		{
		_tipoCoche = vehCSATBoat;
		_tipoPatrol = "SEA";
		}
	else
		{
		_tipoCoche = if (_base in aeropuertos) then {selectRandom (vehCSATLight + [vehCSATPatrolHeli])} else {selectRandom vehCSATLight};
		if (_tipoCoche == vehCSATPatrolHeli) then {_tipoPatrol = "AIR"};
		};
	};

_posbase = getMarkerPos _base;


if (_tipoPatrol == "AIR") then
	{
	_arrayDestinos = marcadores select {lados getVariable [_x,sideUnknown] == _lado};
	_distancia = 200;
	}
else
	{
	if (_tipoPatrol == "SEA") then
		{
		_arraydestinos = seaMarkers select {(getMarkerPos _x) distance _posbase < 2500};
		_distancia = 100;
		}
	else
		{
		_arrayDestinos = marcadores select {lados getVariable [_x,sideUnknown] == _lado};
		_arraydestinos = [_arrayDestinos,_posBase] call A3A_fnc_patrolDestinos;
		_distancia = 50;
		};
	};

if (count _arraydestinos < 4) exitWith {};

AAFpatrols = AAFpatrols + 1;

if (_tipoPatrol != "AIR") then
	{
	if (_tipoPatrol == "SEA") then
		{
		_posbase = [_posbase,50,150,10,2,0,0] call BIS_Fnc_findSafePos;
		}
	else
		{
		_indice = aeropuertos find _base;
		if (_indice != -1) then
			{
			_spawnPoint = spawnPoints select _indice;
			_posBase = getMarkerPos _spawnPoint;
			}
		else
			{
			_posbase = position ([_posbase] call A3A_fnc_findNearestGoodRoad);
			};
		};
	};

_vehicle=[_posBase, 0,_tipoCoche, _lado] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
[_veh] call A3A_fnc_AIVEHinit;
[_veh,"Patrol"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
_grupos = _grupos + [_grupoVeh];
_vehiculos = _vehiculos + [_veh];


if (_tipoCoche in vehNATOLightUnarmed) then
	{
	sleep 1;
	_grupo = [_posbase, _lado, gruposNATOSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x; [_x] joinSilent _grupoveh; [_x] call A3A_fnc_NATOinit} forEach units _grupo;
	deleteGroup _grupo;
	};
if (_tipoCoche in vehCSATLightUnarmed) then
	{
	sleep 1;
	_grupo = [_posbase, _lado, gruposCSATSentry] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _veh;_x moveInCargo _veh; _soldados pushBack _x; [_x] joinSilent _grupoveh; [_x] call A3A_fnc_NATOinit} forEach units _grupo;
	deleteGroup _grupo;
	};

//if (_tipoPatrol == "LAND") then {_veh forceFollowRoad true};

while {alive _veh} do
	{
	if (count _arraydestinos < 2) exitWith {};
	_destino = selectRandom _arraydestinos;
	if (debug) then {player globalChat format ["Patrulla AI generada. Origen: %2 Destino %1", _destino, _base]; sleep 3};
	_posDestino = getMarkerPos _destino;
	if (_tipoPatrol == "LAND") then
		{
		_road = [_posDestino] call A3A_fnc_findNearestGoodRoad;
		_posDestino = position _road;
		};
	_Vwp0 = _grupoVeh addWaypoint [_posdestino, 0];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Vwp0 setWaypointSpeed "LIMITED";
	_veh setFuel 1;

	waitUntil {sleep 60; (_veh distance _posdestino < _distancia) or ({[_x] call A3A_fnc_canFight} count _soldados == 0) or (!canMove _veh)};
	if !(_veh distance _posdestino < _distancia) exitWith {};
	if (_tipoPatrol == "AIR") then
		{
		_arrayDestinos = marcadores select {lados getVariable [_x,sideUnknown] == _lado};
		}
	else
		{
		if (_tipoPatrol == "SEA") then
			{
			_arraydestinos = seaMarkers select {(getMarkerPos _x) distance position _veh < 2500};
			}
		else
			{
			_arrayDestinos = marcadores select {lados getVariable [_x,sideUnknown] == _lado};
			_arraydestinos = [_arraydestinos,position _veh] call A3A_fnc_patrolDestinos;
			};
		};
	};

_enemigos = if (_lado == malos) then {"OPFORSpawn"} else {"BLUFORSpawn"};

{_unit = _x;
waitUntil {sleep 1;!([distanciaSPWN,1,_unit,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and !([distanciaSPWN,1,_unit,_enemigos] call A3A_fnc_distanceUnits)};deleteVehicle _unit} forEach _soldados;

{_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and !([distanciaSPWN,1,_veh,_enemigos] call A3A_fnc_distanceUnits)) then {deleteVehicle _veh}} forEach _vehiculos;
{deleteGroup _x} forEach _grupos;
AAFpatrols = AAFpatrols - 1;