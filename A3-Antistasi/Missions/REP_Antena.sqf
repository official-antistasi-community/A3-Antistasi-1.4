if (!isServer and hasInterface) exitWith{};

private ["_marcador","_posicion","_fechalim","_fechalimnum","_nombredest","_camionCreado","_size","_pos","_veh","_grupo","_unit"];

_marcador = _this select 0;
_posicion = _this select 1;

_tiempolim = 60;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;
_nombredest = [_marcador] call A3A_fnc_localizar;

[[buenos,civilian],"REP",[format ["%4 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Tower Rebuild Disrupt",_marcador],_posicion,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
misiones pushBack ["REP","CREATED"]; publicVariable "misiones";
_camionCreado = false;

waitUntil {sleep 1;(dateToNumber date > _fechalimnum) or (spawner getVariable _marcador != 2)};

if (spawner getVariable _marcador != 2) then
	{
	_camionCreado = true;
	_size = [_marcador] call A3A_fnc_sizeMarker;
	_road = [_posicion] call A3A_fnc_findNearestGoodRoad;
	_pos = position _road;
	_pos = _pos findEmptyPosition [1,60,"B_T_Truck_01_repair_F"];
	_veh = createVehicle [vehNATORepairTruck, _pos, [], 0, "NONE"];
	_veh allowdamage false;
	_veh setDir (getDir _road);
	_nul = [_veh] call A3A_fnc_AIVEHinit;
	_grupo = createGroup malos;

	sleep 5;
	_veh allowDamage true;

	for "_i" from 1 to 3 do
		{
		_unit = _grupo createUnit [NATOCrew, _pos, [], 0, "NONE"];
		[_unit,""] call A3A_fnc_NATOinit;
		sleep 2;
		};

	waitUntil {sleep 1;(dateToNumber date > _fechalimnum) or (not alive _veh)};

	if (not alive _veh) then
		{
		["REP",[format ["%4 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Tower Rebuild Disrupt",_marcador],_posicion,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
		[2,0] remoteExec ["A3A_fnc_prestige",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (_x distance _veh < 500) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
if (dateToNumber date > _fechalimnum) then
	{
	if (lados getVariable [_marcador,sideUnknown] == buenos) then
		{
		["REP",[format ["%4 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Tower Rebuild Disrupt",_marcador],_posicion,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
		[2,0] remoteExec ["A3A_fnc_prestige",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (_x distance _veh < 500) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		["REP",[format ["%4 is rebuilding a radio tower in %1. If we want to keep up the enemy comms breakdown, the work must be stopped. Destroy the repair truck parked nearby or capture the zone. Work will be finished on %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Tower Rebuild Disrupt",_marcador],_posicion,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
		//[5,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	antenasMuertas = antenasMuertas - [_posicion]; publicVariable "antenasMuertas";
	_antena = nearestBuilding _posicion;
	if (isMultiplayer) then {[_antena,true] remoteExec ["hideObjectGlobal",2]} else {_antena hideObject true};
	_antena = createVehicle ["Land_Communication_F", _posicion, [], 0, "NONE"];
	antenas pushBack _antena; publicVariable "antenas";
	{if ([antenas,_x] call BIS_fnc_nearestPosition == _antena) then {[_x,true] spawn A3A_fnc_apagon}} forEach ciudades;
	_mrkfin = createMarker [format ["Ant%1", count antenas], _posicion];
	_mrkfin setMarkerShape "ICON";
	_mrkfin setMarkerType "loc_Transmitter";
	_mrkfin setMarkerColor "ColorBlack";
	_mrkfin setMarkerText "Radio Tower";
	mrkAntenas pushBack _mrkfin;
	publicVariable "mrkAntenas";
	_antena addEventHandler ["Killed",
		{
		_antena = _this select 0;
		{if ([antenas,_x] call BIS_fnc_nearestPosition == _antena) then {[_x,false] spawn A3A_fnc_apagon}} forEach ciudades;
		_mrk = [mrkAntenas, _antena] call BIS_fnc_nearestPosition;
		antenas = antenas - [_antena]; antenasmuertas = antenasmuertas + [getPos _antena]; deleteMarker _mrk;
		["TaskSucceeded",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",buenos];
		["TaskFailed",["", "Radio Tower Destroyed"]] remoteExec ["BIS_fnc_showNotification",malos];
		publicVariable "antenas"; publicVariable "antenasMuertas";
		}
		];
	};

_nul = [0,"REP"] spawn A3A_fnc_borrarTask;

waitUntil {sleep 1; (spawner getVariable _marcador == 2)};

if (_camionCreado) then
	{
	{deleteVehicle _x} forEach units _grupo;
	deleteGroup _grupo;
	if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) then {deleteVehicle _veh};
	};
