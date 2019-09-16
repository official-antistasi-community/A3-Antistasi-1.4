private ["_size","_frontierX","_markerX","_nVeh","_buildings"];
_markerX = _this select 0;
_size = [_markerX] call A3A_fnc_sizeMarker;
_frontierX = [_markerX] call A3A_fnc_isFrontline;

_nVeh = 0;

if (_markerX in airportsX) then
	{
	_nveh = _nveh + round (_size/60);
	if (_frontierX) then {_nveh = _nveh * 2};
	_nVeh = _nVeh + 1;
	}
else
	{
	if (_markerX in outposts) then
		{
		_nveh = round (_size/50);
		_buildings = nearestObjects [getMarkerPos _markerX,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + listMilBld, _size];
		if (count _buildings > 0) then
			{
			_nveh = _nveh + 1;
			};
		}
	else
		{
		_nveh = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {round (_size/70)} else {round (_size/50)};
		};
	if (_frontierX) then {_nveh = _nveh + 1};
	};

if (_nveh < 1) then {_nVeh = 1};
_nVeh = 8 * _nVeh;

_nVeh
