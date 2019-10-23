private _grupo = _this;
private _result = objNull;

_enemigos = _grupo getVariable ["objetivos",[]];
if (count _enemigos > 0) then
	{
	for "_i" from 0 to (count _enemigos) - 1 do
		{
		_eny = (_enemigos select _i) select 4;
		if (vehicle _eny == _eny) exitWith {_result = _eny};
		};
	};
_result