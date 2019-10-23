if (!isServer and hasInterface) exitWith {};

private ["_marcador","_destino","_origen","_grupos","_soldados","_vehiculos","_size","_grupo","_camion","_tam","_roads","_road","_pos"];

_marcador = _this select 0;
if (not(_marcador in smallCAmrk)) exitWith {};

_destino = getMarkerPos _marcador;
_origen = getMarkerPos respawnBuenos;

_grupos = [];
_soldados = [];
_vehiculos = [];

_size = [_marcador] call A3A_fnc_sizeMarker;

_divisor = 50;

if (_marcador in aeropuertos) then {_divisor = 100};

_size = round (_size / _divisor);

if (_size == 0) then {_size = 1};

_tiposGrupo = [gruposSDKmid,gruposSDKAT,gruposSDKSquad,gruposSDKSniper];

while {(_size > 0)} do
	{
	//if (diag_fps > minimoFPS) then
		//{
		/*
		_tam = 10;
		while {true} do
			{
			_roads = _origen nearRoads _tam;
			if (count _roads > 0) exitWith {};
			_tam = _tam + 10;
			};
		_road = _roads select 0;
		_tipoVeh = [vehSDKTruck,vehSDKLightUnarmed,vehSDKBike,vehSDKLightArmed] call BIS_fnc_selectRandom;
		_pos = position _road findEmptyPosition [1,30,_tipoVeh];
		_vehicle=[_pos, random 360,_tipoVeh, buenos] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		_vehCrew = _vehicle select 1;
		{[_x] spawn A3A_fnc_FIAinit} forEach _vehCrew;
		[_veh] call A3A_fnc_AIVEHinit;
		_nul = [_veh,"Reinf"] spawn A3A_fnc_inmuneConvoy;
		_grupoVeh = _vehicle select 2;
		_grupoVeh setVariable ["esNATO",true,true];
		_soldados = _soldados + _vehCrew;
		_grupos pushBack _grupoVeh;
		_vehiculos pushBack _veh;
		if (_tipoVeh != vehSDKLightArmed) then
			{
			if (_tipoVeh == vehSDKBike) then
				{
				_tipoSoldado = if (random 20 <= skillFIA) then {SDKSniper select 1} else {SDKSniper select 0};
				_soldado = _grupoVeh createUnit [_tipoSoldado, _pos, [], 0, "NONE"];
				[_soldado] spawn A3A_fnc_FIAinit;
				_soldados pushBack _soldado;
				_soldado moveInCargo _veh;
				}
			else
				{
				_tipoGrupo = gruposSDKSquad;
				if (_tipoVeh == vehSDKLightUnarmed) then {_tipoGrupo = selectRandom [gruposSDKmid,gruposSDKAT]};
				_formato = [];
				{
				if (random 20 <= skillFIA) then {_formato pushBack (_x select 1)} else {_formato pushBack (_x select 0)};
				} forEach _tipoGrupo;
				_grupo = [_origen, buenos, _formato] call BIS_Fnc_spawnGroup;
				{[_x] call A3A_fnc_FIAinit; [_x] join _grupoVeh; _x moveInCargo _veh; _soldados pushBack _x} forEach units _grupo;
				deleteGroup _grupo;
				};
			//[_marcador,_grupoVeh] spawn A3A_fnc_attackDrill;
			_Vwp0 = _grupoVeh addWaypoint [_destino, 0];
			_Vwp0 setWaypointBehaviour "SAFE";
			_Vwp0 setWaypointType "GETOUT";
			_Vwp1 = _grupoVeh addWaypoint [_destino, 1];
			_Vwp1 setWaypointType "SAD";
			_Vwp1 setWaypointBehaviour "AWARE";
			}
		else
			{
			_Vwp1 = _grupoVeh addWaypoint [_destino, 0];
			_Vwp1 setWaypointType "SAD";
			_Vwp1 setWaypointBehaviour "AWARE";
			};
		*/
		_grupo = createGroup buenos;
		_grupos pushBack _grupo;
		_tipoGrupo = selectRandom _tiposGrupo;
		_formato = [];
		{
		if (random 20 <= skillFIA) then {_formato pushBack (_x select 1)} else {_formato pushBack (_x select 0)};
		} forEach _tipoGrupo;
		_grupo = [_origen, buenos, _formato] call A3A_fnc_spawnGroup;
		{[_x] spawn A3A_fnc_FIAinit; _soldados pushBack _x} forEach units _grupo;
		_Vwp1 = _grupo addWaypoint [_destino, 0];
		_Vwp1 setWaypointType "MOVE";
		_Vwp1 setWaypointBehaviour "AWARE";
		//};
	sleep 30;
	_size = _size - 1;
	};

waitUntil {sleep 1;((not(_marcador in smallCAmrk)) or (lados getVariable [_marcador,sideUnknown] == malos) or (lados getVariable [_marcador,sideUnknown] == muyMalos))};
/*
{_vehiculo = _x;
waitUntil {sleep 1; {_x distance _vehiculo < distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F")) == 0};
deleteVehicle _vehiculo;
} forEach _vehiculos;*/
{_soldado = _x;
waitUntil {sleep 1; {_x distance _soldado < distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F")) == 0};
deleteVehicle _soldado;
} forEach _soldados;
{deleteGroup _x} forEach _grupos;