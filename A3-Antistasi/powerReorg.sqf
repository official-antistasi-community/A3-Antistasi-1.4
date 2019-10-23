private ["_marcador","_ciudad","_pos","_power","_datos","_powered","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR","_sitio"];

_marcador = _this select 0;

{
_ciudad = _x;
_pos = getMarkerPos _x;
_power = [power,_pos] call BIS_fnc_nearestPosition;
_powered = true;
if (_power == _marcador) then
	{
	//_datos = server getVariable _ciudad;
	if (_marcador in destroyedCities) then
		{
		_powered = false;
		//[-10,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		//_powered = _datos select 4;
		if (lados getVariable [_marcador,sideUnknown] == buenos) then
			{
			if (lados getVariable [_ciudad,sideUnknown] == buenos) then
				{
				//hint format ["You achieved to bring power to %1, more people there supports our cause",_ciudad];
				//[-10,10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [5,0] remoteExec ["A3A_fnc_prestige",2];
				}
			else
				{
				//hint format ["You cutted off power to %1, less people support AAF there",_ciudad];
				//[-10,0,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [-5,0] remoteExec ["A3A_fnc_prestige",2];
				_powered = false;
				};
			}
		else
			{
			if (lados getVariable [_ciudad,sideUnknown] == buenos) then
				{
				//hint format ["AAF has cut off power to %1, less people there supports our cause",_ciudad];
				//[0,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [5,0] remoteExec ["A3A_fnc_prestige",2];
				_powered = false;
				};
			};
		};
	[_ciudad,_powered] spawn A3A_fnc_apagon;
	};
} forEach ciudades;

_marcadores = fabricas + recursos;
{
_sitio = _x;
_pos = getMarkerPos _x;
_power = [power,_pos] call BIS_fnc_nearestPosition;
_powered = true;
if (_power == _marcador) then
	{
	if (_marcador in destroyedCities) then
		{
		_powered = false;
		//[-10,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		if (lados getVariable [_marcador,sideUnknown] == buenos) then
			{
			if (lados getVariable [_sitio,sideUnknown] == malos) then
				{
				//_ciudad = [ciudades,_pos] call BIS_fnc_nearestPosition;
				//hint format ["You cutted off power to AAF resources near %1. They will be less productive from now",_ciudad];
				_powered = false;
				};
			}
		else
			{
			if (lados getVariable [_sitio,sideUnknown] == buenos) then
				{
				//_ciudad = [ciudades,_pos] call BIS_fnc_nearestPosition;
				//hint format ["AAF cutted off power supply to our resources near %1. They will be less productive from now",_ciudad];
				_powered = false;
				};
			};
		};
	[_sitio,_powered] spawn A3A_fnc_apagon;
	};
} forEach _marcadores;