if (!isServer and hasInterface) exitWith{};

_marcador = _this select 0;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";
_posicion = getMarkerPos _marcador;
_lado = if (lados getVariable [_marcador,sideUnknown] == malos) then {malos} else {muyMalos};
_tiempolim = if (_dificil) then {60} else {120};
if (hayIFA) then {_tiempolim = _tiempolim * 2};
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call A3A_fnc_localizar;
_nombreBando = if (_lado == malos) then {"NATO"} else {"CSAT"};

[[buenos,civilian],"AS",[format ["We have spotted a %4 SpecOp team patrolling around a %1. Ambush them and we will have one less problem. Do this before %2:%3. Be careful, they are tough boys.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"SpecOps",_marcador],_posicion,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
misiones pushBack ["AS","CREATED"]; publicVariable "misiones";
waitUntil  {sleep 5; (dateToNumber date > _fechalimnum) or (lados getVariable [_marcador,sideUnknown] == buenos)};

if (dateToNumber date > _fechalimnum) then
	{
	["AS",[format ["We have spotted a %4 SpecOp team patrolling around an %1. Ambush them and we will have one less problem. Do this before %2:%3. Be careful, they are tough boys.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"SpecOps",_marcador],_posicion,"FAILED"] call A3A_fnc_taskUpdate;
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
	["AS",[format ["We have spotted a %4 SpecOp team patrolling around an %1. Ambush them and we will have one less problem. Do this before %2:%3. Be careful, they are tough boys.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombreBando],"SpecOps",_marcador],_posicion,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	if (_dificil) then
		{
		[0,400] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0,10,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[20,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[20,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		[0,200] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0,5,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
		[600] remoteExec ["A3A_fnc_timingCA",2];
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posicion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[10,theBoss] call A3A_fnc_playerScoreAdd;
		};
	if (_lado == malos) then {[3,0] remoteExec ["A3A_fnc_prestige",2]} else {[0,3] remoteExec ["A3A_fnc_prestige",2]};
	["TaskFailed", ["", format ["SpecOp Team decimated at a %1",_nombredest]]] remoteExec ["BIS_fnc_showNotification",_lado];
	};

_nul = [1200,"AS"] spawn A3A_fnc_borrarTask;
