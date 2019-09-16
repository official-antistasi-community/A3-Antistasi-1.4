private ["_unit","_dist","_return"];
_unit = _this select 0;
_dist = _this select 1;
_return = false;
{if (_x distance _unit < _dist) exitWith {_return = true}} forEach (allUnits select {((side group _x == Occupants) or (side group _x == Invaders)) and ([_x] call A3A_fnc_canFight)});
_return
