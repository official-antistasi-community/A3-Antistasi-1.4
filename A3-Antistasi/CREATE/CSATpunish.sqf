if (!isServer and hasInterface) exitWith {};
private ["_posorigen","_tipogrupo","_nombreorig","_markTsk","_wp1","_soldados","_landpos","_pad","_vehiculos","_wp0","_wp3","_wp4","_wp2","_grupo","_grupos","_tipoveh","_vehicle","_heli","_heliCrew","_grupoheli","_pilotos","_rnd","_resourcesAAF","_nVeh","_tam","_roads","_Vwp1","_tanques","_road","_veh","_vehCrew","_grupoVeh","_Vwp0","_size","_Hwp0","_grupo1","_uav","_grupouav","_uwp0","_tsk","_vehiculo","_soldado","_piloto","_mrkdestino","_posdestino","_prestigeCSAT","_base","_aeropuerto","_nombredest","_tiempo","_solMax","_nul","_pos","_timeOut"];
_mrkDestino = _this select 0;
_mrkOrigen = _this select 1;
bigAttackInProgress = true;
publicVariable "bigAttackInProgress";
_posDestino = getMarkerPos _mrkDestino;
_posOrigen = getMarkerPos _mrkOrigen;
_grupos = [];
_soldados = [];
_pilotos = [];
_vehiculos = [];
_civiles = [];

_nombredest = [_mrkDestino] call A3A_fnc_localizar;
[[buenos,civilian,malos],"AtaqueAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nombredest,nameMuyMalos],format ["%1 Punishment",nameMuyMalos],_mrkDestino],getMarkerPos _mrkDestino,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

_nul = [_mrkOrigen,_mrkDestino,muyMalos] spawn A3A_fnc_artilleria;
_lado = if (lados getVariable [_mrkDestino,sideUnknown] == malos) then {malos} else {buenos};
_tiempo = time + 3600;

for "_i" from 1 to 3 do
	{
	_tipoveh = if (_i != 3) then {selectRandom (vehCSATAir select {[_x] call A3A_fnc_vehAvailable})} else {selectRandom (vehCSATTransportHelis select {[_x] call A3A_fnc_vehAvailable})};
	_timeOut = 0;
	_pos = _posorigen findEmptyPosition [0,100,_tipoveh];
	while {_timeOut < 60} do
		{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = _posorigen findEmptyPosition [0,100,_tipoveh];
		sleep 1;
		};
	if (count _pos == 0) then {_pos = _posorigen};
	_vehicle=[_pos, 0, _tipoveh, muyMalos] call bis_fnc_spawnvehicle;
	_heli = _vehicle select 0;
	_heliCrew = _vehicle select 1;
	{[_x] call A3A_fnc_NATOinit} forEach _heliCrew;
	[_heli] call A3A_fnc_AIVEHinit;
	_grupoheli = _vehicle select 2;
	_pilotos = _pilotos + _heliCrew;
	_grupos pushBack _grupoheli;
	_vehiculos pushBack _heli;
	//_heli lock 3;
	if (not(_tipoveh in vehCSATTransportHelis)) then
		{
		{[_x] call A3A_fnc_NATOinit} forEach _heliCrew;
		_wp1 = _grupoheli addWaypoint [_posdestino, 0];
		_wp1 setWaypointType "SAD";
		//[_heli,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
		}
	else
		{
		{_x setBehaviour "CARELESS";} forEach units _grupoheli;
		_tipoGrupo = [_tipoVeh,muyMalos] call A3A_fnc_cargoSeats;
		_grupo = [_posOrigen, muyMalos, _tipoGrupo] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _heli;_x moveInCargo _heli; _soldados pushBack _x; [_x] call A3A_fnc_NATOinit; _x setVariable ["origen",_mrkOrigen]} forEach units _grupo;
		_grupos pushBack _grupo;
		//[_heli,"CSAT Air Transport"] spawn A3A_fnc_inmuneConvoy;

		if (not(_tipoVeh in vehFastRope)) then
			{

			_landPos = _posDestino getPos [(random 500) + 300, random 360];

			_landPos = [_landPos, 200, 350, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
			if !(_landPos isEqualTo [0,0,0]) then
				{
				_landPos set [2, 0];
				_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
				_vehiculos pushBack _pad;
				_wp0 = _grupoheli addWaypoint [_landpos, 0];
				_wp0 setWaypointType "TR UNLOAD";
				_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT'"];
				[_grupoheli,0] setWaypointBehaviour "CARELESS";
				_wp3 = _grupo addWaypoint [_landpos, 0];
				_wp3 setWaypointType "GETOUT";
				_wp0 synchronizeWaypoint [_wp3];
				_wp4 = _grupo addWaypoint [_posdestino, 1];
				_wp4 setWaypointType "SAD";
				_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				_wp2 = _grupoheli addWaypoint [_posorigen, 1];
				_wp2 setWaypointType "MOVE";
				_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
				[_grupoheli,1] setWaypointBehaviour "AWARE";
				}
			else
				{
				[_heli,_grupo,_mrkDestino,_mrkOrigen] spawn A3A_fnc_airdrop;
				};
			}
		else
			{
			{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _grupoheli;
			[_heli,_grupo,_posdestino,_posorigen,_grupoheli] spawn A3A_fnc_fastrope;
			};
		};
	sleep 20;
	};

_datos = server getVariable _mrkDestino;

_numCiv = _datos select 0;
_numCiv = round (_numCiv /10);

if (lados getVariable [_mrkDestino,sideUnknown] == malos) then {[[_posDestino,malos,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};

if (_numCiv < 8) then {_numCiv = 8};

_size = [_mrkDestino] call A3A_fnc_sizeMarker;
//_grupoCivil = if (_lado == buenos) then {createGroup buenos} else {createGroup malos};
_grupoCivil = createGroup buenos;
_grupos pushBack _grupoCivil;
//[muyMalos,[civilian,0]] remoteExec ["setFriend",2];
_tipoUnit = if (_lado == buenos) then {SDKUnarmed} else {NATOUnarmed};
for "_i" from 0 to _numCiv do
	{
	while {true} do
		{
		_pos = _posdestino getPos [random _size,random 360];
		if (!surfaceIsWater _pos) exitWith {};
		};
	_tipoUnit = selectRandom arrayCivs;
	_civ = _grupoCivil createUnit [_tipoUnit,_pos, [],0,"NONE"];
	_civ forceAddUniform (selectRandom civUniforms);
	_rnd = random 100;
	if (_rnd < 90) then
		{
		if (_rnd < 25) then {[_civ, "hgun_PDW2000_F", 5, 0] call BIS_fnc_addWeapon;} else {[_civ, "hgun_Pistol_heavy_02_F", 5, 0] call BIS_fnc_addWeapon;};
		};
	_civiles pushBack _civ;
	[_civ] call A3A_fnc_civInit;
	sleep 0.5;
	};

_nul = [leader _grupoCivil, _mrkDestino, "AWARE","SPAWNED","NOVEH2"] execVM "scripts\UPSMON.sqf";

_civilMax = {alive _x} count _civiles;
_solMax = count _soldados;

for "_i" from 0 to round random 2 do
	{
	if ([vehCSATPlane] call A3A_fnc_vehAvailable) then
		{
		_nul = [_mrkdestino,muyMalos,"NAPALM"] spawn A3A_fnc_airstrike;
		sleep 30;
		};
	};

waitUntil {sleep 5; (({not (captive _x)} count _soldados) < ({captive _x} count _soldados)) or ({alive _x} count _soldados < round (_solMax / 3)) or (({(_x distance _posdestino < _size*2) and (not(vehicle _x isKindOf "Air")) and (alive _x) and (!captive _x)} count _soldados) > 4*({(alive _x) and (_x distance _posdestino < _size*2)} count _civiles)) or (time > _tiempo)};

if ((({not (captive _x)} count _soldados) < ({captive _x} count _soldados)) or ({alive _x} count _soldados < round (_solMax / 3)) or (time > _tiempo)) then
	{
	{_x doMove [0,0,0]} forEach _soldados;
	//["AtaqueAAF", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
	["AtaqueAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nombredest,nameMuyMalos],format ["%1 Punishment",nameMuyMalos],_mrkDestino],getMarkerPos _mrkDestino,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	if ({(side _x == buenos) and (_x distance _posDestino < _size * 2)} count allUnits >= {(side _x == malos) and (_x distance _posDestino < _size * 2)} count allUnits) then
		{
		if (lados getVariable [_mrkDestino,sideUnknown] == malos) then {[-15,15,_posdestino] remoteExec ["A3A_fnc_citySupportChange",2]} else {[-5,15,_posdestino] remoteExec ["A3A_fnc_citySupportChange",2]};
		[-5,0] remoteExec ["A3A_fnc_prestige",2];
		{[-10,10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach ciudades;
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posdestino,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		if (lados getVariable [_mrkDestino,sideUnknown] == malos) then {[15,-5,_posdestino] remoteExec ["A3A_fnc_citySupportChange",2]} else {[15,-15,_posdestino] remoteExec ["A3A_fnc_citySupportChange",2]};
		{[10,-10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach ciudades;
		};
	}
else
	{
	["AtaqueAAF",[format ["%2 is making a punishment expedition to %1. They will kill everybody there. Defend the city at all costs",_nombredest,nameMuyMalos],format ["%1 Punishment",nameMuyMalos],_mrkDestino],getMarkerPos _mrkDestino,"FAILED"] call A3A_fnc_taskUpdate;
	//["AtaqueAAF", "FAILED",true] spawn BIS_fnc_taskSetState;
	[-20,-20,_posdestino] remoteExec ["A3A_fnc_citySupportChange",2];
	{[-10,-10,_x] remoteExec ["A3A_fnc_citySupportChange",2]} forEach ciudades;
	destroyedCities = destroyedCities + [_mrkDestino];
	publicVariable "destroyedCities";
	for "_i" from 1 to 60 do
		{
		_mina = createMine ["APERSMine",_posdestino,[],_size];
		muyMalos revealMine _mina;
		};
	[_mrkDestino] call A3A_fnc_destroyCity;
	};

sleep 15;
//[muyMalos,[civilian,1]] remoteExec ["setFriend",2];
_nul = [0,"AtaqueAAF"] spawn A3A_fnc_borrarTask;
[7200] remoteExec ["A3A_fnc_timingCA",2];
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

bigAttackInProgress = false;
publicVariable "bigAttackInProgress";

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

waitUntil {sleep 1; (spawner getVariable _mrkDestino == 2)};

{deleteVehicle _x} forEach _civiles;
deleteGroup _grupoCivil;