if (!isServer and hasInterface) exitWith{};

_posicion = getMarkerPos respawnBuenos;

_pilotos = [];
_vehiculos = [];
_grupos = [];
_soldados = [];

if ({(_x distance _posicion < 500) and (typeOf _x == staticAABuenos)} count staticsToSave > 4) exitWith {};

_aeropuertos = aeropuertos select {(lados getVariable [_x,sideUnknown] != buenos) and (spawner getVariable _x == 2)};
if (count _aeropuertos == 0) exitWith {};
_aeropuerto = [_aeropuertos,_posicion] call BIS_fnc_nearestPosition;
_posOrigen = getMarkerPos _aeropuerto;
_lado = if (lados getVariable [_aeropuerto,sideUnknown] == malos) then {malos} else {muyMalos};
_tsk1 = "";
_tsk = "";
[[buenos,civilian],"DEF_HQ",[format ["Enemy knows our HQ coordinates. They have sent a SpecOp Squad in order to kill %1. Intercept them and kill them. Or you may move our HQ 1Km away so they will loose track",name petros],format ["Defend %1",name petros],respawnBuenos],_posicion,true,10,true,"Defend",true] call BIS_fnc_taskCreate;
[[_lado],"DEF_HQ1",[format ["We know %2 HQ coordinates. We have sent a SpecOp Squad in order to kill his leader %1. Help the SpecOp team",name petros, nameBuenos],format ["Kill %1",name petros],respawnBuenos],_posicion,true,10,true,"Attack",true] call BIS_fnc_taskCreate;
misiones pushBack ["DEF_HQ","CREATED"]; publicVariable "misiones";
_tiposVeh = if (_lado == malos) then {vehNATOAttackHelis} else {vehCSATAttackHelis};
_tiposVeh = _tiposVeh select {[_x] call A3A_fnc_vehAvailable};

if (count _tiposVeh > 0) then
	{
	_tipoVeh = selectRandom _tiposVeh;
	//_pos = [_posicion, distanciaSPWN * 3, random 360] call BIS_Fnc_relPos;
	_vehicle=[_posOrigen, 0, _tipoVeh, _lado] call bis_fnc_spawnvehicle;
	_heli = _vehicle select 0;
	_heliCrew = _vehicle select 1;
	_grupoheli = _vehicle select 2;
	_pilotos = _pilotos + _heliCrew;
	_grupos pushBack _grupoheli;
	_vehiculos pushBack _heli;
	{[_x] call A3A_fnc_NATOinit} forEach _heliCrew;
	[_heli] call A3A_fnc_AIVEHinit;
	_wp1 = _grupoheli addWaypoint [_posicion, 0];
	_wp1 setWaypointType "SAD";
	//[_heli,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
	sleep 30;
	};
_tiposVeh = if (_lado == malos) then {vehNATOTransportHelis} else {vehCSATTransportHelis};
_tipoGrupo = if (_lado == malos) then {NATOSpecOp} else {CSATSpecOp};

for "_i" from 0 to (round random 2) do
	{
	_tipoVeh = selectRandom _tiposVeh;
	//_pos = [_posicion, distanciaSPWN * 3, random 360] call BIS_Fnc_relPos;
	_vehicle=[_posOrigen, 0, _tipoVeh, _lado] call bis_fnc_spawnvehicle;
	_heli = _vehicle select 0;
	_heliCrew = _vehicle select 1;
	_grupoheli = _vehicle select 2;
	_pilotos = _pilotos + _heliCrew;
	_grupos pushBack _grupoheli;
	_vehiculos pushBack _heli;

	{_x setBehaviour "CARELESS";} forEach units _grupoheli;
	_grupo = [_posOrigen, _lado, _tipoGrupo] call A3A_fnc_spawnGroup;
	{_x assignAsCargo _heli; _x moveInCargo _heli; _soldados pushBack _x; [_x] call A3A_fnc_NATOinit} forEach units _grupo;
	_grupos pushBack _grupo;
	//[_heli,"Air Transport"] spawn A3A_fnc_inmuneConvoy;
	[_heli,_grupo,_posicion,_posOrigen,_grupoHeli] spawn A3A_fnc_fastrope;
	sleep 10;
	};

waitUntil {sleep 1;({[_x] call A3A_fnc_canFight} count _soldados < {!([_x] call A3A_fnc_canFight)} count _soldados) or (_posicion distance getMarkerPos respawnBuenos > 999) or (!alive petros)};

if (!alive petros) then
	{
	["DEF_HQ",[format ["Enemy knows our HQ coordinates. They have sent a SpecOp Squad in order to kill %1. Intercept them and kill them. Or you may move our HQ 1Km away so they will loose track",name petros],format ["Defend %1",name petros],respawnBuenos],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
	["DEF_HQ1",[format ["We know %2 HQ coordinates. We have sent a SpecOp Squad in order to kill his leader %1. Help the SpecOp team",name petros,nameBuenos],format ["Kill %1",name petros],respawnBuenos],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	}
else
	{
	if (_posicion distance getMarkerPos respawnBuenos > 999) then
		{
		["DEF_HQ",[format ["Enemy knows our HQ coordinates. They have sent a SpecOp Squad in order to kill Maru. Intercept them and kill them. Or you may move our HQ 1Km away so they will loose track",name petros],format ["Defend %1",name petros],respawnBuenos],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
		["DEF_HQ1",[_lado],[format ["We know %2 HQ coordinates. We have sent a SpecOp Squad in order to kill his leader %1. Help the SpecOp team",name petros,nameBuenos],format ["Kill %1",name petros],respawnBuenos],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
		}
	else
		{
		["DEF_HQ",[format ["Enemy knows our HQ coordinates. They have sent a SpecOp Squad in order to kill %1. Intercept them and kill them. Or you may move our HQ 1Km away so they will loose track",name petros],format ["Defend %1",name petros],respawnBuenos],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
		["DEF_HQ1",[format ["We know %2 HQ coordinates. We have sent a SpecOp Squad in order to kill his leader %1. Help the SpecOp team",name petros,nameBuenos],format ["Kill %1",name petros],respawnBuenos],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
		[0,3] remoteExec ["A3A_fnc_prestige",2];
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		//[-5,5,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		};
	};

_nul = [1200,"DEF_HQ"] spawn A3A_fnc_borrarTask;
sleep 60;
_nul = [0,"DEF_HQ1"] spawn A3A_fnc_borrarTask;

{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiculos;
{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldados = _soldados - [_x]};
} forEach _soldados;
{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _pilotos = _pilotos - [_x]};
} forEach _pilotos;

if (count _soldados > 0) then
	{
	{
	_veh = _x;
	waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
	deleteVehicle _veh;
	} forEach _soldados;
	};

if (count _pilotos > 0) then
	{
	{
	_veh = _x;
	waitUntil {sleep 1; !([distanciaSPWN,1,_x,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
	deleteVehicle _veh;
	} forEach _pilotos;
	};
{deleteGroup _x} forEach _grupos;