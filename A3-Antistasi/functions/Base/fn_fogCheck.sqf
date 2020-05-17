//params [["_pos0", [0,0,0], [[]], 3], ["_pos1", [0,0,0], [[]], 3]];
private ["_thing0","_typeX","_error","_pos0","_pos1"];

_thing0 = _this select 0;
_typeX = _this select 1;//false : tierra, misma altura, true: aire, 300 metros más arriba
_error = false;
_pos0 = [];
if (_thing0 isEqualType []) then
	{
	if ((_thing0 select 2) < 3) then
		{
		_pos0 = ATLToASL _thing0;
		}
	else
		{
		_pos0 = _thing0;
		};
	}
else
	{
	if (_thing0 isEqualType "") then
		{
		_pos0 = ATLToASL (getMarkerPos _thing0);
		}
	else
		{
		if (_thing0 isEqualType objNull) then {_pos0 = getPosASL _thing0} else {_error = true};
		};
	};
if (_error) exitWith {
	diag_log format ["%1: [Antistasi] | ERROR | fogCheck.sqf | Unknown height:%2.",servertime,_thing0];
	};

_pos1 = [(_pos0 select 0) + 300,_pos0 select 1,_pos0 select 2];
if (_typeX) then {_pos1 = [(_pos0 select 0) + 300,_pos0 select 1,(_pos0 select 2)+300]};
private _MaxViewDistance = 10000;
private _ViewDistanceDecayRate = 120;
private _z0 = _pos0 param [2, 0, [0]];
private _z1 = _pos1 param [2, 0, [0]];
private _l = _pos0 distance _pos1;
fogParams params ["_fogValue", "_fogDecay", "_fogBase"];
_fogValue = _fogValue min 1.0;
_fogValue = _fogValue max 0.0;
_fogDecay = _fogDecay min 1.0;
_fogDecay = _fogDecay max -1.0;
_fogBase = _fogBase min 5000;
_fogBase = _fogBase max -5000;
private _dz = _z1 - _z0;
private _fogCoeff = 1.0;
if (_dz !=0 && _fogDecay != 0) then
	{
	private _cl = -_fogDecay * _dz;
	private _d = -_fogDecay * (_z0 - _fogBase);
	// lim [(exp(x)-1) / x] = 1 as x->0
	if (abs(_cl) > 1e-4) then
		{
		_fogCoeff = exp(_d) * ( exp (_cl) - 1.0) / _cl;
		}
	else
		{
		_fogCoeff = exp(_d);
		};
	};
private _fogAverage = _fogValue * _fogCoeff;
private _fogViewDistance = 0.9 * _MaxViewDistance * exp (- _fogAverage * ln(_ViewDistanceDecayRate));
if (_fogViewDistance == 0) exitWith {0};
0 max (1.0 - _l/_fogViewDistance)
