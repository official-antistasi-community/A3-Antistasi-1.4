if (!isServer and hasInterface) exitWith{};

private ["_antena","_posicion","_tiempolim","_marcador","_nombredest","_mrkfin","_tsk"];

_antena = _this select 0;
_marcador = [marcadores,_antena] call BIS_fnc_nearestPosition;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";
_nombredest = [_marcador] call A3A_fnc_localizar;
_posicion = getPos _antena;

_tiempolim = if (_dificil) then {30} else {120};
if (hayIFA) then {_tiempolim = _tiempolim * 2};
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_mrkfin = createMarker [format ["DES%1", random 100], _posicion];
_mrkfin setMarkerShape "ICON";

[[buenos,civilian],"DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %4 Propaganda Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Destroy Radio Tower",_mrkfin],_posicion,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
misiones pushBack ["DES","CREATED"]; publicVariable "misiones";
waitUntil {sleep 1;(dateToNumber date > _fechalimnum) or (not alive _antena) or (not(lados getVariable [_marcador,sideUnknown] == malos))};

_bonus = if (_dificil) then {2} else {1};

if (dateToNumber date > _fechalimnum) then
	{
	["DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %4 Propaganda Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Destroy Radio Tower",_mrkfin],_posicion,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
	//[5,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	[-3,0] remoteExec ["A3A_fnc_prestige",2]
	}
else
	{
	sleep 15;
	["DES",[format ["We need to destroy or take a Radio Tower in %1. This will interrupt %4 Propaganda Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,nameMalos],"Destroy Radio Tower",_mrkfin],_posicion,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
	//[-5,0,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
	[5,-5] remoteExec ["A3A_fnc_prestige",2];
	[600*_bonus] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _posicion < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	[3,0] remoteExec ["A3A_fnc_prestige",2]
	};

deleteMarker _mrkfin;

_nul = [1200,"DES"] spawn A3A_fnc_borrarTask;
