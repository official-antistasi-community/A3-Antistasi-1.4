private ["_flagX","_pos","_markerX","_positionX","_size","_powerpl","_revealX"];

_flagX = _this select 0;
_playerX = _this select 1;

_pos = getPos _flagX;
_markerX = [markersX,_pos] call BIS_fnc_nearestPosition;
if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) exitWith {};
_positionX = getMarkerPos _markerX;
_size = [_markerX] call A3A_fnc_sizeMarker;

if ((!isNull _playerX) and (captive _playerX)) exitWith {hint "You cannot Capture the Flag while Undercover"};
if ((_markerX in airportsX) and (tierWar < 3)) exitWith {hint "You cannot capture Airports until you reach War Level 3"};
_revealX = [];
if (!isNull _playerX) then
	{
	if (_size > 300) then {_size = 300};
	_revealX = [];
	{
	if (((side _x == Occupants) or (side _x == Invaders)) and ([_x,_markerX] call A3A_fnc_canConquer)) then {_revealX pushBack _x};
	} forEach allUnits;
	if (player == _playerX) then
		{
		_playerX playMove "MountSide";
		sleep 8;
		_playerX playMove "";
		{player reveal _x} forEach _revealX;
		//[_markerX] call A3A_fnc_intelFound;
		};
	};

if ((count _revealX) > 2*({([_x,_markerX] call A3A_fnc_canConquer) and (side _x == teamPlayer)} count allUnits)) exitWith {hint "The enemy still outnumber us, check the map and clear the rest of the area"};
//if (!isServer) exitWith {};

{
if (isPlayer _x) then
	{
	[5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
	[_markerX] remoteExec ["A3A_fnc_intelFound",_x];
	if (captive _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false};
	}
} forEach ([_size,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);

//_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
[teamPlayer,_markerX] remoteExec ["A3A_fnc_markerChange",2];
