if (!isServer) exitWith {};
private ["_tipo","_lado","_marcador","_modo","_garrison","_subTipo"];
_tipo = _this select 0;
if (_tipo isEqualType []) then
	{
	if ((_tipo select 0) isEqualType objNull) then
		{
		_subTipo = [];
		{
		_subTipo pushBack (typeOf _x);
		} forEach _tipo;
		_tipo = _subTipo;
		};
	}
else
	{
	if (_tipo isEqualType objNull) then {_tipo = typeOf _tipo};
	};
_lado = _this select 1;
_marcador = _this select 2;
if !(_marcador isEqualType "") exitWith {diag_log format ["Antistasi error: En garrison update hemos enviado algo que no es marcador. Params: %1",_this]};
_modo = _this select 3;//-1 to remove 1 unbit (killed EHs etc). 1 add 1 single classname / object. 2 adds a hole array and admits classnames or objects
_exit = false;
//diag_log format ["Antistasi: Error en garrisonUpdate al enviar mal datos: %1,%2,%3,%4",_tipo,_lado,_marcador,_modo];
{if (isNil _x) exitWith {_exit = true}} forEach ["_tipo","_lado","_marcador","_modo"];
if (_exit) exitWith {diag_log format ["Antistasi: Error en garrisonUpdate al enviar mal datos: %1,%2,%3,%4",_tipo,_lado,_marcador,_modo]};
waitUntil {!garrisonIsChanging};
{if (isNil _x) exitWith {_exit = true}} forEach ["_tipo","_lado","_marcador","_modo"];
if (_exit) exitWith {diag_log format ["Antistasi: Error en garrisonUpdate al enviar mal datos: %1,%2,%3,%4",_tipo,_lado,_marcador,_modo]};
garrisonIsChanging = true;
if ((_lado == malos) and (!(lados getVariable [_marcador,sideUnknown] == malos))) exitWith {garrisonIsChanging = false};
if ((_lado == muyMalos) and (!(lados getVariable [_marcador,sideUnknown] == muyMalos))) exitWith {garrisonIsChanging = false};
if ((_lado == buenos) and (!(lados getVariable [_marcador,sideUnknown] == buenos))) exitWith {garrisonIsChanging = false};
_garrison = [];
_garrison = _garrison + (garrison getVariable [_marcador,[]]);
if (_modo == -1) then
	{
	for "_i" from 0 to (count _garrison -1) do
		{
		if (_tipo == (_garrison select _i)) exitWith {_garrison deleteAt _i};
		};
	}
else
	{
	if (_modo == 1) then {_garrison pushBack _tipo} else {_garrison append _tipo};
	};
if (isNil "_garrison") exitWith {garrisonIsChanging = false};
garrison setVariable [_marcador,_garrison,true];
if (_lado == buenos) then {[_marcador] call A3A_fnc_mrkUpdate};
garrisonIsChanging = false;