private ["_puntMax","_texto","_multiplicador","_newRank","_selectable","_disconnected","_owner","_puntos","_datos"];
_puntMax = 0;
_texto = "";
_multiplicador = 1;
//_newRank = "CORPORAL";
_disconnected = false;

_jugadores = [];
_miembros = [];
_elegibles = [];

_lider = objNull;

{
_jugadores pushBack (_x getVariable ["owner",_x]);
if (_x != _x getVariable ["owner",_x]) then {waitUntil {_x == _x getVariable ["owner",_x]}};
if ([_x] call A3A_fnc_isMember) then
	{
	_miembros pushBack _x;
	if (_x getVariable ["elegible",true]) then
		{
		_elegibles pushBack _x;
		if (_x == theBoss) then
			{
			_lider = _x;
			_datos = [_lider] call A3A_fnc_numericRank;
			_puntMax = _datos select 0;
			};
		};
	};
} forEach (playableUnits select {(side (group _x) == buenos)});

if (isNull _lider) then
	{
	_puntMax = 0;
	_disconnected = true;
	};
_texto = "Promoted Players:\n\n";
_promoted = false;
{
_puntos = _x getVariable ["score",0];
_datos = [_x] call A3A_fnc_numericRank;
_multiplicador = _datos select 0;
_newRank = _datos select 1;
_rank = _x getVariable ["rango","PRIVATE"];
if (_rank != "COLONEL") then
	{
	if (_puntos >= 50*_multiplicador) then
		{
		_promoted = true;
		[_x,_newRank] remoteExec ["A3A_fnc_ranksMP"];
		_x setVariable ["rango",_newRank,true];
		_texto = format ["%3%1: %2.\n",name _x,_newRank,_texto];
		[-1*(50*_multiplicador),_x] call A3A_fnc_playerScoreAdd;
		_multiplicador = _multiplicador + 1;
		sleep 5;
		};
	};
} forEach _jugadores;

if (_promoted) then
	{
	_texto = format ["%1\n\nCONGATULATIONS!!",_texto];
	[petros,"hint",_texto] remoteExec ["A3A_fnc_commsMP"];
	};

_proceder = false;

if ((isNull _lider) or switchCom) then
	{
	if (count _miembros > 0) then
		{
		_proceder = true;
		if (count _elegibles == 0) then {_elegibles = _miembros};
		};
	};

if (!_proceder) exitWith {};

_selectable = objNull;
{
_datos = [_x] call A3A_fnc_numericRank;
_multiplicador = _datos select 0;
if ((_multiplicador > _puntMax) and (_x!=_lider)) then
	{
	_selectable = _x;
	_puntMax = _multiplicador;
	};
} forEach _elegibles;

if (!isNull _selectable) then
	{
	if (_disconnected) then {_texto = format ["Player Commander disconnected or renounced. %1 is our new leader. Greet him!", name _selectable]} else {_texto = format ["%1 is no longer leader of the our Forces.\n\n %2 is our new leader. Greet him!", name theBoss, name _selectable]};
	[_selectable] call A3A_fnc_theBossInit;
	sleep 5;
	[[petros,"hint",_texto],"A3A_fnc_commsMP"] call BIS_fnc_MP;
	};