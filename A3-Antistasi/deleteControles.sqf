private ["_marcador","_control","_cercano","_pos"];

_marcador = _this select 0;
_control = _this select 1;

_pos = getMarkerPos _control;

_cercano = [(marcadores - controles),_pos] call BIS_fnc_nearestPosition;

if (_cercano == _marcador) then
	{
	waitUntil {sleep 1;(spawner getVariable _control == 2)};
	_lado = lados getVariable [_marcador,sideUnknown];
	lados setVariable [_control,_lado,true];
	};