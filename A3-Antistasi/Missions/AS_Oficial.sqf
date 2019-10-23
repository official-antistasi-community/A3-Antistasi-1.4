if (!isServer and hasInterface) exitWith{};

_marcador = _this select 0;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";

_lado = if (lados getVariable [_marcador,sideUnknown] == malos) then {malos} else {muyMalos};
_posicion = getMarkerPos _marcador;

_tiempolim = if (_dificil) then {15} else {30};//120
if (hayIFA) then {_tiempolim = _tiempolim * 2};
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call A3A_fnc_localizar;
_nombreBando = if (_lado == malos) then {"NATO"} else {"CSAT"};

[[buenos,civilian],"AS",[format ["A %4 officer is inspecting %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"Kill the Officer",_marcador],_posicion,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
misiones pushBack ["AS","CREATED"]; publicVariable "misiones";
_grp = createGroup _lado;

_tipo = if (_lado == malos) then {NATOOfficer} else {CSATOfficer};
_oficial = _grp createUnit [_tipo, _posicion, [], 0, "NONE"];
_tipo = if (_lado == malos) then {NATOBodyG} else {CSATBodyG};
_piloto = _grp createUnit [_tipo, _posicion, [], 0, "NONE"];
if (_dificil) then
	{
	for "_i" from 1 to 4 do
		{
		_piloto = _grp createUnit [_tipo, _posicion, [], 0, "NONE"];
		};
	};

_grp selectLeader _oficial;
sleep 1;
_nul = [leader _grp, _marcador, "SAFE", "SPAWNED", "NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

{_nul = [_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _grp;

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (not alive _oficial)};

if (not alive _oficial) then
	{
	["AS",[format ["A %4 officer is inspecting %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"Kill the Officer",_marcador],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	if (_dificil) then
		{
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[2400] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[20,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		[_marcador,60] call A3A_fnc_addTimeForIdle;
		}
	else
		{
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		[1800] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		[_marcador,30] call A3A_fnc_addTimeForIdle;
		};
	["TaskFailed", ["", format ["Officer killed at %1",[_nombreDest, false] call A3A_fnc_fn_location]]] remoteExec ["BIS_fnc_showNotification",_lado];
	}
else
	{
	["AS",[format ["A %4 officer is inspecting %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"Kill the Officer",_marcador],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
	if (_dificil) then
		{
		[-1200] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		[_marcador,-60] call A3A_fnc_addTimeForIdle;
		}
	else
		{
		[-600] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		[_marcador,-30] call A3A_fnc_addTimeForIdle;
		};
	};

{deleteVehicle _x} forEach units _grp;
deleteGroup _grp;

_nul = [1200,"AS"] spawn A3A_fnc_borrarTask;


