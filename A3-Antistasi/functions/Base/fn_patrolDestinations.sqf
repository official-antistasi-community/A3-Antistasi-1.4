private ["_markersX","_array","_pos","_markerX","_destinationsX","_positionX"];

_markersX = _this select 0;
_positionX = _this select 1;
_array = (_markersX - controlsX) select {getMarkerPos _x distance2D _positionX < distanceForLandAttack};
_destinationsX = [];
if !(isMultiplayer) then
	{
	{
	_destinationX = _x;
	_pos = getMarkerPos _destinationX;
	if (markersX findIf {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (getMarkerPos _x distance2d _pos < 2000)} != -1) then {_destinationsX pushBack _destinationX};
	} forEach _array;
	}
else
	{
	{
	_destinationX = _x;
	_pos = getMarkerPos _destinationX;
	if (playableUnits findIf {(side (group _x) == teamPlayer) and (_x distance2d _pos < 2000)} != -1) then {_destinationsX pushBack _destinationX};
	} forEach _array;
	};
_destinationsX