private ["_size","_frontera","_marcador","_nVeh","_buildings"];
_marcador = _this select 0;
_size = [_marcador] call A3A_fnc_sizeMarker;
_frontera = [_marcador] call A3A_fnc_isFrontline;

_nVeh = 0;

if (_marcador in aeropuertos) then
	{
	_nveh = _nveh + round (_size/60);
	if (_frontera) then {_nveh = _nveh * 2};
	_nVeh = _nVeh + 1;
	}
else
	{
	if (_marcador in puestos) then
		{
		_nveh = round (_size/50);
		_buildings = nearestObjects [getMarkerPos _marcador,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + listMilBld, _size];
		if (count _buildings > 0) then
			{
			_nveh = _nveh + 1;
			};
		}
	else
		{
		_nveh = if (lados getVariable [_marcador,sideUnknown] == malos) then {round (_size/70)} else {round (_size/50)};
		};
	if (_frontera) then {_nveh = _nveh + 1};
	};

if (_nveh < 1) then {_nVeh = 1};
_nVeh = 8 * _nVeh;

_nVeh
