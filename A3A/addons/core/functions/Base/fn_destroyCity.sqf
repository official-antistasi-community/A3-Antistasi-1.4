private ["_markerX","_positionX","_size","_buildings"];

_markerX = _this select 0;

_positionX = getMarkerPos _markerX;
_size = [_markerX] call A3A_fnc_sizeMarker;

_buildings = _positionX nearobjects ["house",_size];

{
if (random 100 < 70) then
	{
	for "_i" from 1 to 7 do
		{
		_x sethit [format ["dam%1",_i],1];
		_x sethit [format ["dam %1",_i],1];
		};
	}
} forEach _buildings;

[_markerX,false] spawn A3A_fnc_blackout;