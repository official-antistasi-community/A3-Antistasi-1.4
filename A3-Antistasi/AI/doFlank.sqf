private _unitsX = _this select 0;
private _nearX = _this select 1;
private _LeaderX = leader (_unitsX select 0);

private _ang = _LeaderX getDir _nearX;
private _dist = (_LeaderX distance _nearX) * 1.3;
private _pos1 = _LeaderX getPos [_dist,_ang + 45];
private _pos2 = _LeaderX getPos [_dist,_ang - 45];
{
private ["_pos"];
_x setVariable ["maneuvering",true];
_pos = if (floor (_forEachIndex/2) == (_forEachIndex / 2)) then {_pos1} else {_pos2};
_x doMove _pos;
[_x,_nearX,_pos] spawn
	{
	private _unit = _this select 0;
	private _nearX = _this select 1;
	private _pos = _this select 2;
	private _timeOut = time + 60;
	while {(_unit getVariable ["maneuvering",true]) and (time < _timeOut)} do
		{
		if (_unit distance _pos < 3) then {_unit doMove (position _nearX)};
		if (!([_nearX] call A3A_fnc_canFight) or !([_unit] call A3A_fnc_canFight)) exitWith {};
		sleep 3;
		};
	};
} forEach _unitsX;
_timeOut = time + 60;
waitUntil {sleep 5; !([_nearX] call A3A_fnc_canFight) or (time > _timeOut)};
{
_x call A3A_fnc_recallGroup
} forEach _unitsX;
