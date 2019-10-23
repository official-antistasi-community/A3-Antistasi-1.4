if (!isServer and hasInterface) exitWith {false};
private ["_marcador","_base","_posbase","_posmarcador","_angOrig","_ang","_intentos","_distancia","_pos","_fallo","_mina"];

_marcador = _this select 0;

_base = _this select 1;

if (spawner getVariable _base != 2) exitWith {false};
_posbase = getMarkerPos _base;
_posmarcador = getMarkerPos _marcador;
_angOrig = [_posbase,_posmarcador] call BIS_fnc_dirTo;
_angOrig = _angOrig - 45;
_ang = _angOrig + random 90;
_intentos = 1;
//_distancia = (distanciaSPWN/2) + 101;
_distancia = 500;

_pos = [];
_fallo = true;
while {_intentos < 37} do
	{
	_pos = [_posbase, _distancia, _ang] call BIS_Fnc_relPos;
	if (!surfaceIsWater _pos) then
		{
		_cercano = [marcadores,_pos] call BIS_fnc_nearestPosition;
		if (spawner getVariable _cercano == 2) then
			{
			_size = [_cercano] call A3A_fnc_sizeMarker;
			if ((_pos distance (getMarkerPos _cercano)) > (_size + 100)) then
				{
				_road = [_pos,101] call BIS_fnc_nearestRoad;
				if (isNull _road) then
					{
					if ({_x distance _pos < 100} count allMines == 0) then
						{
						_fallo = false;
						};
					};
				};
			};
		};
	if (!_fallo) exitWith {};
	_intentos = _intentos + 1;
	_ang = _ang - 10;
	};

if (_fallo) exitWith {false};

for "_i" from 1 to 60 do
	{
	_mina = createMine ["APERSMine",_pos,[],100];
	if (lados getVariable [_marcador,sideUnknown] == malos) then {malos revealMine _mina} else {muyMalos revealMine _mina};
	};

//[-4000] remoteExec ["resourcesAAF",2];
true