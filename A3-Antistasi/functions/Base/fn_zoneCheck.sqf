if (!isServer) exitWith {};

private ["_markerX","_sideX","_leave","_enemy1","_enemy2","_winner"];

_markerX = _this select 0;
_sideX = _this select 1;
if ((isNil "_markerX") or (isNil "_sideX")) exitWith {};
waitUntil {!zoneCheckInProgress};
zoneCheckInProgress = true;
_leave = true;
_enemy1 = "";
_enemy2 = "";

if ((_sideX == teamPlayer) and (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) then
	{
	_leave = false;
	_enemy1 = Invaders;
	_enemy2 = Occupants;
	}
else
	{
	if ((_sideX == Occupants) and (sidesX getVariable [_markerX,sideUnknown] == Occupants)) then
		{
		_leave = false;
		_enemy1 = Invaders;
		_enemy2 = teamPlayer;
		}
	else
		{
		if ((_sideX == Invaders) and (sidesX getVariable [_markerX,sideUnknown] == Invaders)) then
			{
			_leave = false;
			_enemy1 = Occupants;
			_enemy2 = teamPlayer;
			};
		};
	};

if (_leave) exitWith {zoneCheckInProgress = false};
_leave = true;

if ({((_x getVariable ["spawner",false]) and ((side group _x) in [_enemy1,_enemy2])) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits > 3*({([_x,_markerX] call A3A_fnc_canConquer) and (_x getVariable ["markerX",""] == _markerX)} count allUnits)) then
	{
	_leave = false;
	};
if (_leave) exitWith {zoneCheckInProgress = false};

_winner = _enemy1;
if ({(_x getVariable ["spawner",false]) and (side group _x == _enemy1) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits <= {(_x getVariable ["spawner",false]) and (side group _x == _enemy2) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits) then {_winner = _enemy2};

[_winner,_markerX] remoteExec ["A3A_fnc_markerChange",2];

waitUntil {sleep 1; sidesX getVariable [_markerX,sideUnknown] == _winner};
zoneCheckInProgress = false;
