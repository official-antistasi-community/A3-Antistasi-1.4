//if (!isMultiplayer) exitWith {};
if ((side player == malos) or (side player == muyMalos)) exitWith {};
private ["_puntos","_jugador","_puntosJ","_dineroJ"];
_puntos = _this select 0;
_jugador = _this select 1;

if (!isPlayer _jugador) exitWith {};

//if (rank _jugador == "COLONEL") exitWith {};
_jugador = _jugador getVariable ["owner",_jugador];
//if (typeName _jugador == typeName "") exitWith {diag_log format ["Antistasi Error: Intento de asignar puntos a un %1 siendo en realidad %2",_jugador, _this select 1]};
if (isMultiplayer) exitWith
	{
	_puntosJ = _jugador getVariable ["score",0];
	_dineroJ = _jugador getVariable ["dinero",0];
	if (_puntos > 0) then
		{
		_dineroJ = _dineroJ + (_puntos * 10);
		_jugador setVariable ["dinero",_dineroJ,true];
		if (_puntos > 1) then
			{
			_texto = format ["<br/><br/><br/><br/><br/><br/>Money +%1 €",_puntos*10];
			[petros,"income",_texto] remoteExec ["A3A_fnc_commsMP",_jugador];
			//[] remoteExec ["A3A_fnc_statistics",_jugador];
			};
		};
	_puntos = _puntos + _puntosJ;
	_jugador setVariable ["score",_puntos,true];
	};

if (_puntos > 0) then
	{
	if (_puntos != 1) then {[0,(_puntos * 5)] remoteExec ["A3A_fnc_resourcesFIA",2]} else {[0,20-(tierWar * 2)] remoteExec ["A3A_fnc_resourcesFIA",2]};
	};

