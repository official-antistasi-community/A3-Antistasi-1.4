private ["_pos","_sitio","_ciudad","_texto"];

_sitio = _this select 0;

_pos = getMarkerPos _sitio;

_texto = "";


if (_sitio in ciudades) then
	{
	_texto = format ["%1",[_sitio,false] call A3A_fnc_fn_location];
	}
else
	{
	_ciudad = [ciudades,_pos] call BIS_fnc_nearestPosition;
	_ciudad = [_ciudad,false] call A3A_fnc_fn_location;
	if (_sitio in aeropuertos) then {_texto = format ["%1 Airbase",_ciudad]};
	if (_sitio in recursos) then {_texto = format ["Resource near %1",_ciudad]};
	if (_sitio in fabricas) then {_texto = format ["Factory near %1",_ciudad]};
	if (_sitio in puestos) then {_texto = format ["Outpost near %1",_ciudad]};
	if (_sitio in puertos) then {_texto = format ["Seaport near %1",_ciudad]};
	if (_sitio in controles) then
		{
		if (isOnRoad getMarkerPos _sitio) then
			{
			_texto = format ["Roadblock near %1",_ciudad]
			}
		else
			{
			_texto = format ["Forest near %1",_ciudad]
			};
		}
	else{
		if ((_sitio == "NATO_carrier") or (_sitio == "CSAT_carrier")) then {_texto = "their carrier"};
		};
	};
_texto