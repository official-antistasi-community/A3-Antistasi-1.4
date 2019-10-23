private ["_mrkOrigen","_mrkDestino","_grupo","_posOrigen","_posDestino","_finalArray","_arr2","_final","_isCentral","_roadsCentral","_useCentral"];

_mrkOrigen = _this select 0;
_posOrigen = if (_mrkOrigen isEqualType "") then {getMarkerPos _mrkOrigen} else {_mrkOrigen};
_mrkDestino = _this select 1;
_posDestino = if (_mrkDestino isEqualType "") then {getMarkerPos _mrkDestino} else {_mrkDestino};
_exit = false;
if (_mrkOrigen isEqualType "") then
	{
	if ((_mrkOrigen != "airport") and (_mrkOrigen != "airport_2")) then {_exit = true};
	}
else
	{
	if !([_mrkOrigen,"airport"] call A3A_fnc_isTheSameIsland) then
		{
		_exit = true
		}
	else
		{
		if (_mrkOrigen distance2D (getMarkerPos "airport") < _mrkOrigen distance2D (getMarkerPos "airport_2")) then {_mrkOrigen = "airport"} else {_mrkOrigen = "airport_2"};
		};
	};
if (_exit) exitWith {};

_grupo = _this select 2;
_finalArray = [];
_arr2 = [];
_final = [roadsMrk,_posDestino] call BIS_fnc_nearestPosition;

_useCentral = true;
_isCentral = false;
if (_final in roadsCentral) then
	{
	_isCentral = true;
	}
else
	{
	if (_final in roadsCE) then
		{
		_arr2 = +roadsCE;
		}
	else
		{
		if (_final in roadsCSE) then
			{
			_arr2 = +roadsCSE;
			}
		else
			{
			if (_final in roadsSE) then
				{
				_arr2 = +roadsSE;
				}
			else
				{
				if (_final in roadsSW) then
					{
					_arr2 = +roadsSW;
					if (_mrkOrigen == "airport") then {_useCentral = false};
					}
				else
					{
					if (_final in roadsCW) then
						{
						_arr2 = +roadsCW;
						}
					else
						{
						if (_final in roadsNW) then
							{
							_arr2 = +roadsNW;
							}
						else
							{
							_arr2 = +roadsNE;
							if (_mrkOrigen == "airport_2") then {_useCentral = false};
							};
						};
					};
				};
			};
		};
	};

_roadsCentral = +roadsCentral;
if (_useCentral and (_mrkOrigen != "airport")) then {reverse _roadsCentral};

if (_isCentral) then
	{
	{
	_finalArray pushBack _x;
	if (_x == _final) exitWith {};
	} forEach _roadsCentral;
	}
else
	{
	if (_useCentral) then
		{
		_inicial = _arr2 select 0;
		_medio = [_roadsCentral,_inicial] call BIS_fnc_nearestPosition;
		{
		_finalArray pushBack _x;
		if (_x == _medio) exitWith {};
		} forEach _roadsCentral;
		{
		_finalArray pushBack _x;
		if (_x == _final) exitWith {};
		} forEach _arr2;
		}
	else
		{
		{
		_finalArray pushBack _x;
		if (_x == _final) exitWith {};
		} forEach _arr2;
		};
	};

if (getMarkerPos _final distance _posOrigen > _posDestino distance _posOrigen) then {_finalArray = _finalArray - [_final]};

for "_i" from 0 to ((count _finalArray) - 1) do
	{
	_grupo addWaypoint [getMarkerPos (_finalArray select _i), _i];
	/*
	_mrkfin = createMarker [format ["DES%1", random 100], getMarkerPos (_finalArray select _i)];
	_mrkfin setMarkerShape "ICON";
	_mrkfin setMarkerType "hd_destroy";
	_mrkfin setMarkerColor "ColorRed";
	_mrkfin setMarkerText format ["%1",_i];
	*/
	};
