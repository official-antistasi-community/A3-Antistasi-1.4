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

//Check if the flag is locked
if(_flagX getVariable ["isGettingCaptured", false]) exitWith
{
	hint "This flag pole is locked, try again in 30 seconds!";
};

//Lock the flag
_flagX setVariable ["isGettingCaptured", true, true];

//Unlock the flag after 30 seconds
_flagX spawn
{
	sleep 30;
	_this setVariable ["isGettingCaptured", nil, true];
};

private _filename = "fn_mrkWIN";
[2, format ["Flag capture at %1 initiated by %2", _markerX, str _playerX], _filename, true] call A3A_fnc_log;

if (!isNull _playerX) then
{
	if (_size > 300) then
	{
		_size = 300
	};
	_revealX = [];
	{
		if (((side _x == Occupants) or (side _x == Invaders)) and ([_x,_markerX] call A3A_fnc_canConquer)) then
		{
			_revealX pushBack _x
		};
	} forEach allUnits;
	if (player == _playerX) then
	{
		_playerX playMove "MountSide";
		sleep 8;
		_playerX playMove "";
		{
			player reveal _x
		} forEach _revealX;
		//[_markerX] call A3A_fnc_intelFound;
	};
};

if ((count _revealX) > 2*({([_x,_markerX] call A3A_fnc_canConquer) and (side _x == teamPlayer)} count allUnits)) exitWith
{
	[2, format ["Flag capture by %1 abandoned due to outnumbering", str _playerX], _filename, true] call A3A_fnc_log;
	hint "The enemy still outnumber us, check the map and clear the rest of the area";
};
//if (!isServer) exitWith {};

[2, format ["Flag capture by %1 rewarded", str _playerX], _filename, true] call A3A_fnc_log;

{
	if (isPlayer _x) then
	{
		[5,_x] remoteExec ["A3A_fnc_playerScoreAdd",_x];
		[_markerX] remoteExec ["A3A_fnc_intelFound",_x];
		if (captive _x) then
		{
			[_x,false] remoteExec ["setCaptive",0,_x];
			_x setCaptive false;
		};
	}
} forEach ([_size,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);

//_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
[teamPlayer,_markerX] remoteExec ["A3A_fnc_markerChange",2];
