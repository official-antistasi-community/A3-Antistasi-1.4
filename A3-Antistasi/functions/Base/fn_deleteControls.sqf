private ["_markerX","_control","_nearX","_pos"];

_markerX = _this select 0;
_control = _this select 1;

_pos = getMarkerPos _control;

_nearX = [(markersX - controlsX),_pos] call BIS_fnc_nearestPosition;

if (_nearX == _markerX) then
	{
	waitUntil {sleep 1;(spawner getVariable _control == 2)};
	_sideX = sidesX getVariable [_markerX,sideUnknown];
	sidesX setVariable [_control,_sideX,true];
	};