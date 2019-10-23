private _unidades = _this select 0;
private _cercano = _this select 1;
private _lider = leader (_unidades select 0);

private _ang = _lider getDir _cercano;
private _dist = (_lider distance _cercano) * 1.3;
private _pos1 = _lider getPos [_dist,_ang + 45];
private _pos2 = _lider getPos [_dist,_ang - 45];
{
private ["_pos"];
_x setVariable ["maniobrando",true];
_pos = if (floor (_forEachIndex/2) == (_forEachIndex / 2)) then {_pos1} else {_pos2};
_x doMove _pos;
[_x,_cercano,_pos] spawn
	{
	private _unit = _this select 0;
	private _cercano = _this select 1;
	private _pos = _this select 2;
	private _timeOut = time + 60;
	while {(_unit getVariable ["maniobrando",true]) and (time < _timeOut)} do
		{
		if (_unit distance _pos < 3) then {_unit doMove (position _cercano)};
		if (!([_cercano] call A3A_fnc_canFight) or !([_unit] call A3A_fnc_canFight)) exitWith {};
		sleep 3;
		};
	};
} forEach _unidades;
_timeOut = time + 60;
waitUntil {sleep 5, !([_cercano] call A3A_fnc_canFight) or (time > _timeOut)};
{
_x call A3A_fnc_recallGroup
} forEach _unidades;
