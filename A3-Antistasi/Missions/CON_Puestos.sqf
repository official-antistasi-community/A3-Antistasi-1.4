if (!isServer and hasInterface) exitWith{};

private ["_marcador"];

_marcador = _this select 0;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";
_posicion = getMarkerPos _marcador;
_tiempolim = if (_dificil) then {30} else {90};//120
if (hayIFA) then {_tiempolim = _tiempolim * 2};
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call A3A_fnc_localizar;
_texto = "";
_taskName = "";
if (_marcador in recursos) then
	{
	_texto = format ["A %1 would be a fine addition to our cause. Go there and capture it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4];
	_taskName = "Resource Acquisition";
	}
else
	{
	_texto = format ["A %1 is disturbing our operations in the area. Go there and capture it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4];
	_taskName = "Take the Outpost";
	};


[[buenos,civilian],"CON",[_texto,_taskName,_marcador],_posicion,false,0,true,"Target",true] call BIS_fnc_taskCreate;
misiones pushBack ["CON","CREATED"]; publicVariable "misiones";
waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (lados getVariable [_marcador,sideUnknown] == buenos)};

if (dateToNumber date > _fechalimnum) then
	{
	["CON",[_texto,_taskName,_marcador],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
	if (_dificil) then
		{
		[10,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[-1200] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[5,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	}
else
	{
	sleep 10;
	["CON",[_texto,_taskName,_marcador],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	if (_dificil) then
		{
		[0,400] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-10,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[20,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-5,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[600] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};

_nul = [1200,"CON"] spawn A3A_fnc_borrarTask;