if (!isServer and hasInterface) exitWith{};

private ["_mrkOrigen","_pos","_lado","_cuenta","_mrkDestino","_veh","_posOrigen","_ladosMalos","_posDestino","_tipoVeh","_tipoMuni","_size","_vehicle","_vehCrew","_grupoVeh","_rondas","_objetivo","_objetivos","_tiempo"];

_mrkOrigen = _this select 0;
_posOrigen = if (_mrkOrigen isEqualType "") then {getMarkerPos _mrkOrigen} else {_mrkOrigen};
_mrkDestino = _this select 1;
_lado = _this select 2;
_ladosMalos = _lado call BIS_fnc_enemySides;
_posDestino = getMarkerPos _mrkDestino;
_tipoVeh = if (_lado == malos) then {vehNATOMRLS} else {vehCSATMRLS};

if !([_tipoVeh] call A3A_fnc_vehAvailable) exitWith {};

_tipoMuni = if (_lado == malos) then {vehNATOMRLSMags} else {vehCSATMRLSMags};

_pos = [_posOrigen, 50,100, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;

_vehicle=[_pos, random 360,_tipoveh, _lado] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
_vehCrew = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_veh] call A3A_fnc_AIVEHinit;
_grupoVeh = _vehicle select 2;
_size = [_mrkDestino] call A3A_fnc_sizeMarker;

if (_posDestino inRangeOfArtillery [[_veh], ((getArtilleryAmmo [_veh]) select 0)]) then
	{
	while {(alive _veh) and ({_x select 0 == _tipoMuni} count magazinesAmmo _veh > 0) and (_mrkDestino in forcedSpawn)} do
		{
		_objetivo = objNull;
		_rondas = 1;
		_objetivos = vehicles select {(side (group driver _x) in _ladosMalos) and (_x distance _posDestino <= _size * 2) and (_lado knowsAbout _x >= 1.4) and (speed _x < 1)};
		if (count _objetivos > 0) then
			{
			{
			if (typeOf _x in vehAttack) exitWith {_objetivo = _x; _rondas = 4};
			} forEach _objetivos;
			if (isNull _objetivo) then {_objetivo = selectRandom _objetivos};
			}
		else
			{
			_objetivos = allUnits select {(side (group _x) in _ladosMalos) and (_x distance _posDestino <= _size * 2) and (_lado knowsAbout _x >= 1.4) and (_x == leader group _x)};
			if (count _objetivos > 0) then
				{
				_cuenta = 0;
				{
				_posible = _x;
				_cuentaGrupo = {(alive _x) and (!captive _x)} count units group _posible;
				if (_cuentaGrupo > _cuenta) then
					{
					if ((_lado == muyMalos) or ({(side (group _x) == civilian) and (_x distance _posible < 50)} count allUnits == 0)) then
						{
						_objetivo = _posible;
						if (_cuentaGrupo > 6) then {_rondas = 2};
						};
					};
				} forEach _objetivos;
				};
			};
		if (!isNull _objetivo) then
			{
			_veh commandArtilleryFire [position _objetivo,_tipoMuni,_rondas];
			_tiempo = _veh getArtilleryETA [position _objetivo, ((getArtilleryAmmo [_veh]) select 0)];
			sleep 9 + ((_rondas - 1) * 3);
			}
		else
			{
			sleep 29;
			};
		sleep 1;
		};
	};

if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _veh};

{
_veh = _x;
waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
deleteVehicle _veh;
} forEach _vehCrew;

deleteGroup _grupoVeh;