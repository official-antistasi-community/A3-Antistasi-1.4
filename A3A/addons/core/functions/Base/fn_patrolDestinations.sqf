private ["_markersX","_array","_pos","_markerX","_destinationsX","_positionX"];

_markersX = _this select 0;
_positionX = _this select 1;
_array = (_markersX - controlsX) select {getMarkerPos _x distance2D _positionX < distanceForLandAttack};
_destinationsX = [];

//Spawn patrols if we've nearby fast travel points if we're in singleplayer, otherwise use nearby players.
private _isValidDestination = if (isMultiplayer) then {
	{playableUnits findIf {(side (group _x) == teamPlayer) and (_x distance2d _this < 2000)} != -1};
} else {
	{markersX findIf {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (getMarkerPos _x distance2d _this < 2000)} != -1};
};

{
	_destinationX = _x;
	_pos = getMarkerPos _destinationX;
	if (_pos call _isValidDestination) then {_destinationsX pushBack _destinationX};
} forEach _array;

_destinationsX