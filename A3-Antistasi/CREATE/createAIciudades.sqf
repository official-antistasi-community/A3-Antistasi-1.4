//NOTA: TAMBIÉN LO USO PARA FIA
if (!isServer and hasInterface) exitWith{};

private ["_marcador","_grupos","_soldados","_posicion","_num","_datos","_prestigeOPFOR","_prestigeBLUFOR","_esAAF","_params","_frontera","_array","_cuenta","_grupo","_perro","_grp","_lado"];
_marcador = _this select 0;

_grupos = [];
_soldados = [];

_posicion = getMarkerPos (_marcador);

_num = [_marcador] call A3A_fnc_sizeMarker;
_lado = lados getVariable [_marcador,sideUnknown];
if ({if ((getMarkerPos _x inArea _marcador) and (lados getVariable [_x,sideUnknown] != _lado)) exitWith {1}} count marcadores > 0) exitWith {};
_num = round (_num / 100);

_datos = server getVariable _marcador;
//_prestigeOPFOR = _datos select 3;
//_prestigeBLUFOR = _datos select 4;
_prestigeOPFOR = _datos select 2;
_prestigeBLUFOR = _datos select 3;
_esAAF = true;
if (_marcador in destroyedCities) then
	{
	_esAAF = false;
	_params = [_posicion,muyMalos,CSATSpecOp];
	}
else
	{
	if (_lado == malos) then
		{
		_num = round (_num * (_prestigeOPFOR + _prestigeBLUFOR)/100);
		_frontera = [_marcador] call A3A_fnc_isFrontline;
		if (_frontera) then
			{
			_num = _num * 2;
			_params = [_posicion, malos, gruposNATOSentry];
			}
		else
			{
			_params = [_posicion, malos, gruposNATOGen];
			};
		}
	else
		{
		_esAAF = false;
		_num = round (_num * (_prestigeBLUFOR/100));
		_array = [];
		{if (random 20 < skillFIA) then {_array pushBack (_x select 0)} else {_array pushBack (_x select 1)}} forEach gruposSDKsentry;
		_params = [_posicion, buenos, _array];
		};
	};
if (_num < 1) then {_num = 1};

_cuenta = 0;
while {(spawner getVariable _marcador != 2) and (_cuenta < _num)} do
	{
	_grupo = _params call A3A_fnc_spawnGroup;
	sleep 1;
	if (_esAAF) then
		{
		if (random 10 < 2.5) then
			{
			_perro = _grupo createUnit ["Fin_random_F",_posicion,[],0,"FORM"];
			[_perro] spawn A3A_fnc_guardDog;
			};
		};
	_nul = [leader _grupo, _marcador, "SAFE", "RANDOM", "SPAWNED","NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
	_grupos pushBack _grupo;
	_cuenta = _cuenta + 1;
	};

if ((_esAAF) or (_marcador in destroyedCities)) then
	{
	{_grp = _x;
	{[_x,""] call A3A_fnc_NATOinit; _soldados pushBack _x} forEach units _grp;} forEach _grupos;
	}
else
	{
	{_grp = _x;
	{[_x] spawn A3A_fnc_FIAinitBases; _soldados pushBack _x} forEach units _grp;} forEach _grupos;
	};

waitUntil {sleep 1;((spawner getVariable _marcador == 2)) or ({[_x,_marcador] call A3A_fnc_canConquer} count _soldados == 0)};

if (({[_x,_marcador] call A3A_fnc_canConquer} count _soldados == 0) and (_esAAF)) then
	{
	[[_posicion,malos,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
	};

waitUntil {sleep 1;(spawner getVariable _marcador == 2)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldados;
{deleteGroup _x} forEach _grupos;