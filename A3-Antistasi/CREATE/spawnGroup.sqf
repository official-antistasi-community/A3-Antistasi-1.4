private ["_posicion","_lado","_tipos","_grupo","_cuenta","_cuentaRangos","_lider","_override","_unidades","_index"];

_posicion = _this select 0;
_lado = _this select 1;
_tipos = _this select 2;
_override = if (count _this >3) then {_this select 3} else {false};
_grupo = createGroup _lado;
_allUnits = {(local _x) /*and (simulationEnabled _x)*/ and (alive _x)} count allUnits;
_cuenta = count _tipos;
_rangos = ["LIEUTENANT","SERGEANT","CORPORAL"];

if (_cuenta < 4) then
	{
	_rangos = _rangos - ["LIEUTENANT","SERGEANT"];
	}
else
	{
	if (_cuenta < 8) then {_rangos = _rangos - ["LIEUTENANT"]};
	};
_cuentaRangos = (count _rangos - 1);
for "_i" from 0 to (_cuenta - 1) do
	{
	if ((_i == 0) or ((_allUnits + _i) < maxUnits) or _override) then
		{
		_unit = _grupo createUnit [(_tipos select _i), _posicion, [], 0, "NONE"];
		_unit allowDamage false;
		_allUnits = _allUnits + 1;
		if (_i <= _cuentaRangos) then
			{
			_unit setRank (_rangos select _i);
			if (_i == 0) then {policeOfficer};
			};
		sleep 0.5;
		};
	};
_unidades = units _grupo;
_index = _unidades findIf {(typeOf _x in squadLeaders)};
if (_index == -1) then {_grupo selectLeader (_unidades select 0)} else {_grupo selectLeader (_unidades select _index)};
{_x allowDamage true} forEach _unidades;
_grupo




