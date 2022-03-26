private ["_markerX","_ok","_positionX","_antenna","_nearX"];

_markerX = _this select 0;
_positionX = _this select 0;
if (_markerX isEqualType "") then {_positionX = getMarkerPos _markerX};
_ok = false;
if (count antennas > 0) then
	{
	for "_i" from 0 to (count antennas) - 1 do
		{
		_antenna = antennas select _i;
		if ((alive _antenna) and (_positionX distance _antenna < 3500)) then
			{
			_nearX = [markersX,_antenna] call BIS_fnc_nearestPosition;
			if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) then {_ok = true};
			};
		};
	};
_ok