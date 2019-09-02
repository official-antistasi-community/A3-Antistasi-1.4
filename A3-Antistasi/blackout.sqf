//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params ["_markerX", "_onoff"];

private _positionX = getMarkerPos _markerX;
private _damage = [0.95, 0] select _onoff;
private _radiusX = markerSize _markerX;
private _size = _radiusX select 0;
private ["_lamps"];

{
	_lamps = _positionX nearObjects [_x, _size];
	{
		sleep 0.3;
		_x setDamage _damage;
	} forEach _lamps;
} forEach lamptypes;
