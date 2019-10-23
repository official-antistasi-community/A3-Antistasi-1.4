if (!isServer and hasInterface) exitWith{};

private ["_marcador","_datos","_numCiv","_numVeh","_roads","_prestigeOPFOR","_presitgeBLUFOR","_civs","_grupos","_vehiculos","_civsPatrol","_gruposPatrol","_vehPatrol","_tipoCiv","_tipoVeh","_dirVeh","_cuenta","_grupo","_size","_road","_tipociv","_tipoVeh","_dirVeh","_posicion","_area","_civ","_veh","_roadcon","_pos","_p1","_p2","_mrkMar","_patrolCiudades","_cuentaPatrol","_andanadas","_grupoP","_wp","_wp1"];

_marcador = _this select 0;

if (_marcador in destroyedCities) exitWith {};

_datos = server getVariable _marcador;

_numCiv = _datos select 0;
_numVeh = _datos select 1;
//_roads = _datos select 2;
_roads = carreteras getVariable _marcador;//
//_prestigeOPFOR = _datos select 3;
//_prestigeBLUFOR = _datos select 4;

_prestigeOPFOR = _datos select 2;
_prestigeBLUFOR = _datos select 3;

_civs = [];
_grupos = [];
_vehiculos = [];
_civsPatrol = [];
_gruposPatrol = [];
_vehPatrol = [];
_size = [_marcador] call A3A_fnc_sizeMarker;

_tipociv = "";
_tipoVeh = "";
_dirVeh = 0;

_posicion = getMarkerPos (_marcador);

_area = [_marcador] call A3A_fnc_sizeMarker;

_roads = _roads call BIS_fnc_arrayShuffle;

_numVeh = round (_numVeh * (civPerc/200) * civTraffic);
if (_numVeh < 1) then {_numVeh = 1};
_numCiv = round (_numCiv * (civPerc/250));
if ((daytime < 8) or (daytime > 21)) then {_numCiv = round (_numCiv/4); _numVeh = round (_numVeh * 1.5)};
if (_numCiv < 1) then {_numCiv = 1};

_cuenta = 0;
_max = count _roads;

while {(spawner getVariable _marcador != 2) and (_cuenta < _numVeh) and (_cuenta < _max)} do
	{
	_p1 = _roads select _cuenta;
	_road = roadAt _p1;
	if (!isNull _road) then
		{
		if ((count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) and !([50,1,_road,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) then
			{
			_roadcon = roadsConnectedto (_road);
			_p2 = getPos (_roadcon select 0);
			_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
			_pos = [_p1, 3, _dirveh + 90] call BIS_Fnc_relPos;
			_tipoveh = selectRandom arrayCivVeh;
			/*
			_mrk = createmarker [format ["%1", count vehicles], _p1];
		    _mrk setMarkerSize [5, 5];
		    _mrk setMarkerShape "RECTANGLE";
		    _mrk setMarkerBrush "SOLID";
		    _mrk setMarkerColor colorBuenos;
		    //_mrk setMarkerText _nombre;
		    */
			_veh = _tipoveh createVehicle _pos;
			_veh setDir _dirveh;
			_vehiculos pushBack _veh;
			_nul = [_veh] spawn A3A_fnc_civVEHinit;
			};
		};
	sleep 0.5;
	_cuenta = _cuenta + 1;
	};

_mrkMar = if !(hayIFA) then {seaSpawn select {getMarkerPos _x inArea _marcador}} else {[]};
if (count _mrkMar > 0) then
	{
	for "_i" from 0 to (round (random 3)) do
		{
		if (spawner getVariable _marcador != 2) then
			{
			_tipoVeh = selectRandom civBoats;
			_pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0,20,_tipoVeh];
			_veh = _tipoveh createVehicle _pos;
			_veh setDir (random 360);
			_vehiculos pushBack _veh;
			[_veh] spawn A3A_fnc_civVEHinit;
			sleep 0.5;
			};
		};
	};

if ((random 100 < ((prestigeNATO) + (prestigeCSAT))) and (spawner getVariable _marcador != 2)) then
	{
	_pos = [];
	while {true} do
		{
		_pos = [_posicion, round (random _area), random 360] call BIS_Fnc_relPos;
		if (!surfaceIsWater _pos) exitWith {};
		};
	_grupo = createGroup civilian;
	_grupos pushBack _grupo;
	_civ = _grupo createUnit ["C_journalist_F", _pos, [],0, "NONE"];
	_nul = [_civ] spawn A3A_fnc_CIVinit;
	_civs pushBack _civ;
	_nul = [_civ, _marcador, "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf";
	};


if ([_marcador,false] call A3A_fnc_fogCheck > 0.2) then
	{
	_patrolCiudades = [_marcador] call A3A_fnc_citiesToCivPatrol;

	_cuentaPatrol = 0;

	_andanadas = round (_numCiv / 60);
	if (_andanadas < 1) then {_andanadas = 1};

	for "_i" from 1 to _andanadas do
		{
		while {(spawner getVariable _marcador != 2) and (_cuentaPatrol < (count _patrolCiudades - 1) and (_cuenta < _max))} do
			{
			//_p1 = getPos (_roads select _cuenta);
			_p1 = _roads select _cuenta;
			//_road = (_p1 nearRoads 5) select 0;
			_road = roadAt _p1;
			if (!isNull _road) then
			//if (!isNil "_road") then
				{
				if (count (nearestObjects [_p1, ["Car", "Truck"], 5]) == 0) then
					{
					_grupoP = createGroup civilian;
					_gruposPatrol = _gruposPatrol + [_grupoP];
					_roadcon = roadsConnectedto _road;
					//_p1 = getPos (_roads select _cuenta);
					_p2 = getPos (_roadcon select 0);
					_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
					_tipoveh = arrayCivVeh call BIS_Fnc_selectRandom;
					_veh = _tipoveh createVehicle _p1;
					_veh setDir _dirveh;
					_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_this select 0))) then {0;} else {(_this select 2);};}];
					_veh addEventHandler ["HandleDamage",
						{
						_veh = _this select 0;
						if (side(_this select 3) == buenos) then
							{
							_condu = driver _veh;
							if (side _condu == civilian) then {_condu leaveVehicle _veh};
							};
						}
						];
					//_veh forceFollowRoad true;
					_vehPatrol = _vehPatrol + [_veh];
					_tipociv = selectRandom arrayCivs;
					_civ = _grupoP createUnit [_tipociv, _p1, [],0, "NONE"];
					_nul = [_civ] spawn A3A_fnc_CIVinit;
					_civsPatrol = _civsPatrol + [_civ];
					_civ moveInDriver _veh;
					_grupoP addVehicle _veh;
					_grupoP setBehaviour "CARELESS";
					_posDestino = selectRandom (carreteras getVariable (_patrolCiudades select _cuentaPatrol));
					_wp = _grupoP addWaypoint [_posDestino,0];
					_wp setWaypointType "MOVE";
					_wp setWaypointSpeed "FULL";
					_wp setWaypointTimeout [30, 45, 60];
					_wp = _grupoP addWaypoint [_posicion,1];
					_wp setWaypointType "MOVE";
					_wp setWaypointTimeout [30, 45, 60];
					_wp1 = _grupoP addWaypoint [_posicion,2];
					_wp1 setWaypointType "CYCLE";
					_wp1 synchronizeWaypoint [_wp];
					};
				};
			_cuentaPatrol = _cuentaPatrol + 1;
			sleep 5;
			};
		};
	};

waitUntil {sleep 1;(spawner getVariable _marcador == 2)};

{deleteVehicle _x} forEach _civs;
{deleteGroup _x} forEach _grupos;
{
if (!([distanciaSPWN-_size,1,_x,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) then
	{
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	deleteVehicle _x;
	}
} forEach _vehiculos;
{
waitUntil {sleep 1; !([distanciaSPWN,1,_x,"GREENFORSpawn"] call A3A_fnc_distanceUnits)};
deleteVehicle _x} forEach _civsPatrol;
{
if (!([distanciaSPWN,1,_x,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) then
	{
	if (_x in reportedVehs) then {reportedVehs = reportedVehs - [_x]; publicVariable "reportedVehs"};
	deleteVehicle _x
	}
else
	{
	[_x] spawn A3A_fnc_civVEHinit
	};
} forEach _vehPatrol;
{deleteGroup _x} forEach _gruposPatrol;