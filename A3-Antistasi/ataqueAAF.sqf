//if ([0.5] call A3A_fnc_fogCheck) exitWith {};
private ["_objetivos","_marcadores","_base","_objetivo","_cuenta","_aeropuerto","_datos","_prestigeOPFOR","_scoreLand","_scoreAir","_analizado","_garrison","_size","_estaticas","_salir"];

_objetivos = [];
_marcadores = [];
_cuentaFacil = 0;
_natoIsFull = false;
_csatIsFull = false;
_aeropuertos = aeropuertos select {([_x,false] call A3A_fnc_airportCanAttack) and (lados getVariable [_x,sideUnknown] != buenos)};
_objetivos = marcadores - controles - puestosFIA - ["Synd_HQ","NATO_carrier","CSAT_carrier"] - destroyedCities;
if (gameMode != 1) then {_objetivos = _objetivos select {lados getVariable [_x,sideUnknown] == buenos}};
//_objetivosSDK = _objetivos select {lados getVariable [_x,sideUnknown] == buenos};
if ((tierWar < 2) and (gameMode <= 2)) then
	{
	_aeropuertos = _aeropuertos select {(lados getVariable [_x,sideUnknown] == malos)};
	//_objetivos = _objetivosSDK;
	_objetivos = _objetivos select {lados getVariable [_x,sideUnknown] == buenos};
	}
else
	{
	if (gameMode != 4) then {if ({lados getVariable [_x,sideUnknown] == malos} count _aeropuertos == 0) then {_aeropuertos pushBack "NATO_carrier"}};
	if (gameMode != 3) then {if ({lados getVariable [_x,sideUnknown] == muyMalos} count _aeropuertos == 0) then {_aeropuertos pushBack "CSAT_carrier"}};
	if (([vehNATOPlane] call A3A_fnc_vehAvailable) and ([vehNATOMRLS] call A3A_fnc_vehAvailable) and ([vehNATOTank] call A3A_fnc_vehAvailable)) then {_natoIsFull = true};
	if (([vehCSATPlane] call A3A_fnc_vehAvailable) and ([vehCSATMRLS] call A3A_fnc_vehAvailable) and ([vehCSATTank] call A3A_fnc_vehAvailable)) then {_csatIsFull = true};
	};
if (gameMode != 4) then
	{
	if (tierWar < 3) then {_objetivos = _objetivos - ciudades};
	}
else
	{
	if (tierWar < 5) then {_objetivos = _objetivos - ciudades};
	};
//lets keep the nearest targets for each AI airbase in the target list, so we ensure even when they are surrounded of friendly zones, they remain as target
_nearestObjectives = [];
{
_lado = lados getVariable [_x,sideUnknown];
_tmpTargets = _objetivos select {lados getVariable [_x,sideUnknown] != _lado};
if !(_tmpTargets isEqualTo []) then
	{
	_nearestTarget = [_tmpTargets,getMarkerPos _x] call BIS_fnc_nearestPosition;
	_nearestObjectives pushBack _nearestTarget;
	};
} forEach _aeropuertos;
//the following discards targets which are surrounded by friendly zones, excluding airbases and the nearest targets
_objetivosProv = _objetivos - aeropuertos - _nearestObjectives;
{
_posObj = getMarkerPos _x;
_ladoObj = lados getVariable [_x,sideUnknown];
if (((marcadores - controles - ciudades - puestosFIA) select {lados getVariable [_x,sideUnknown] != _ladoObj}) findIf {getMarkerPos _x distance2D _posObj < 2000} == -1) then {_objetivos = _objetivos - [_x]};
} forEach _objetivosProv;

if (_objetivos isEqualTo []) exitWith {};
_objetivosFinal = [];
_basesFinal = [];
_cuentasFinal = [];
_objetivoFinal = [];
_faciles = [];
_facilesArr = [];
_puertoCSAT = if ({(lados getVariable [_x,sideUnknown] == muyMalos)} count puertos >0) then {true} else {false};
_puertoNATO = if ({(lados getVariable [_x,sideUnknown] == malos)} count puertos >0) then {true} else {false};
_waves = 1;

{
_base = _x;
_posBase = getMarkerPos _base;
_killZones = killZones getVariable [_base,[]];
_tmpObjetivos = [];
_baseNATO = true;
if (lados getVariable [_base,sideUnknown] == malos) then
	{
	_tmpObjetivos = _objetivos select {lados getVariable [_x,sideUnknown] != malos};
	_tmpObjetivos = _tmpObjetivos - (ciudades select {([_x] call A3A_fnc_powerCheck) == buenos});
	}
else
	{
	_baseNATO = false;
	_tmpObjetivos = _objetivos select {lados getVariable [_x,sideUnknown] != muyMalos};
	_tmpObjetivos = _tmpObjetivos - (ciudades select {(((server getVariable _x) select 2) + ((server getVariable _x) select 3) < 90) and ([_x] call A3A_fnc_powerCheck != malos)});
	};

_tmpObjetivos = _tmpObjetivos select {getMarkerPos _x distance2D _posBase < distanceForAirAttack};
if !(_tmpObjetivos isEqualTo []) then
	{
	_cercano = [_tmpObjetivos,_base] call BIS_fnc_nearestPosition;
	{
	_esCiudad = if (_x in ciudades) then {true} else {false};
	_proceder = true;
	_posSitio = getMarkerPos _x;
	_esSDK = false;
	_isTheSameIsland = [_x,_base] call A3A_fnc_isTheSameIsland;
	if ([_x,true] call A3A_fnc_fogCheck >= 0.3) then
		{
		if (lados getVariable [_x,sideUnknown] == buenos) then
			{
			_esSDK = true;
			/*
			_valor = if (_baseNATO) then {prestigeNATO} else {prestigeCSAT};
			if (random 100 > _valor) then
				{
				_proceder = false
				}
			*/
			};
		if (!_isTheSameIsland and (not(_x in aeropuertos))) then
			{
			if (!_esSDK) then {_proceder = false};
			};
		}
	else
		{
		_proceder = false;
		};
	if (_proceder) then
		{
		if (!_esCiudad) then
			{
			if !(_x in _killZones) then
				{
				if !(_x in _facilesArr) then
					{
					_sitio = _x;
					if (((!(_sitio in aeropuertos)) or (_esSDK)) and !(_base in ["NATO_carrier","CSAT_carrier"])) then
						{
						_ladoEny = if (_baseNATO) then {muyMalos} else {malos};
						if ({(lados getVariable [_x,sideUnknown] == _ladoEny) and (getMarkerPos _x distance _posSitio < distanciaSPWN)} count aeropuertos == 0) then
							{
							_garrison = garrison getVariable [_sitio,[]];
							_estaticas = staticsToSave select {_x distance _posSitio < distanciaSPWN};
							_puestos = puestosFIA select {getMarkerPos _x distance _posSitio < distanciaSPWN};
							_cuenta = ((count _garrison) + (count _puestos) + (2*(count _estaticas)));
							if (_cuenta <= 8) then
								{
								if (!hayIFA or (_posSitio distance _posBase < distanceForLandAttack)) then
									{
									_proceder = false;
									_faciles pushBack [_sitio,_base];
									_facilesArr pushBackUnique _sitio;
									};
								};
							};
						};
					};
				};
			};
		};
	if (_proceder) then
		{
		_times = 1;
		if (_baseNATO) then
			{
			if ({lados getVariable [_x,sideUnknown] == malos} count aeropuertos <= 1) then {_times = 2};
			if (!_esCiudad) then
				{
				if ((_x in puestos) or (_x in puertos)) then
					{
					if (!_esSDK) then
						{
						if (({[_x] call A3A_fnc_vehAvailable} count vehNATOAttack > 0) or ({[_x] call A3A_fnc_vehAvailable} count vehNATOAttackHelis > 0)) then {_times = 2*_times} else {_times = 0};
						}
					else
						{
						_times = 2*_times;
						};
					}
				else
					{
					if (_x in aeropuertos) then
						{
						if (!_esSDK) then
							{
							if (([vehNATOPlane] call A3A_fnc_vehAvailable) or (!([vehCSATAA] call A3A_fnc_vehAvailable))) then {_times = 5*_times} else {_times = 0};
							}
						else
							{
							if (!_isTheSameIsland) then {_times = 5*_times} else {_times = 2*_times};
							};
						}
					else
						{
						if ((!_esSDK) and _natoIsFull) then {_times = 0};
						};
					};
				};
			if (_times > 0) then
				{
				_aeropCercano = [aeropuertos,_posSitio] call bis_fnc_nearestPosition;
				if ((lados getVariable [_aeropCercano,sideUnknown] == muyMalos) and (_x != _aeropCercano)) then {_times = 0};
				};
			}
		else
			{
			_times = 2;
			if (!_esCiudad) then
				{
				if ((_x in puestos) or (_x in puertos)) then
					{
					if (!_esSDK) then
						{
						if (({[_x] call A3A_fnc_vehAvailable} count vehCSATAttack > 0) or ({[_x] call A3A_fnc_vehAvailable} count vehCSATAttackHelis > 0)) then {_times = 2*_times} else {_times = 0};
						}
					else
						{
						_times = 2*_times;
						};
					}
				else
					{
					if (_x in aeropuertos) then
						{
						if (!_esSDK) then
							{
							if (([vehCSATPlane] call A3A_fnc_vehAvailable) or (!([vehNATOAA] call A3A_fnc_vehAvailable))) then {_times = 5*_times} else {_times = 0};
							}
						else
							{
							if (!_isTheSameIsland) then {_times = 5*_times} else {_times = 2*_times};
							};
						}
					else
						{
						if ((!_esSDK) and _csatIsFull) then {_times = 0};
						};
					}
				};
			if (_times > 0) then
				{
				_aeropCercano = [aeropuertos,_posSitio] call bis_fnc_nearestPosition;
				if ((lados getVariable [_aeropCercano,sideUnknown] == malos) and (_x != _aeropCercano)) then {_times = 0};
				};
			};
		if (_times > 0) then
			{
			if ((!_esSDK) and (!_esCiudad)) then
				{
				//_times = _times + (floor((garrison getVariable [_x,0])/8))
				_numGarr = [_x] call A3A_fnc_garrisonSize;
				if ((_numGarr/2) < count (garrison getVariable [_x,[]])) then {if ((_numGarr/3) < count (garrison getVariable [_x,[]])) then {_times = _times + 6} else {_times = _times +2}};
				};
			if (_isTheSameIsland) then
				{
				if (_posSitio distance _posBase < distanceForLandAttack) then
					{
					if  (!_esCiudad) then
						{
						_times = _times * 4
						};
					};
				};
			if (!_esCiudad) then
				{
				_esMar = false;
				if ((_baseNATO and _puertoNATO) or (!_baseNATO and _puertoCSAT)) then
					{
					for "_i" from 0 to 3 do
						{
						_pos = _posSitio getPos [1000,(_i*90)];
						if (surfaceIsWater _pos) exitWith {_esMar = true};
						};
					};
				if (_esMar) then {_times = _times * 2};
				};
			if (_x == _cercano) then {_times = _times * 5};
			if (_x in _killZones) then
				{
				_sitio = _x;
				_times = _times / (({_x == _sitio} count _killZones) + 1);
				};
			_times = round (_times);
			_index = _objetivosFinal find _x;
			if (_index == -1) then
				{
				_objetivosFinal pushBack _x;
				_basesFinal pushBack _base;
				_cuentasFinal pushBack _times;
				}
			else
				{
				if ((_times > (_cuentasFinal select _index)) or ((_times == (_cuentasFinal select _index)) and (random 1 < 0.5))) then
					{
					_objetivosFinal deleteAt _index;
					_basesFinal deleteAt _index;
					_cuentasFinal deleteAt _index;
					_objetivosFinal pushBack _x;
					_basesFinal pushBack _base;
					_cuentasFinal pushBack _times;
					};
				};
			};
		};
	if (count _faciles == 4) exitWith {};
	} forEach _tmpObjetivos;
	};
if (count _faciles == 4) exitWith {};
} forEach _aeropuertos;

if (count _faciles == 4) exitWith
	{
	{[[_x select 0,_x select 1,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];sleep 30} forEach _faciles;
	};
if (hayIFA and (sunOrMoon < 1)) exitWith {};
if ((count _objetivosFinal > 0) and (count _faciles < 3)) then
	{
	_arrayFinal = [];
	/*{
	for "_i" from 1 to _x do
		{
		_arrayFinal pushBack [(_objetivosFinal select _forEachIndex),(_basesFinal select _forEachIndex)];
		};
	} forEach _cuentasFinal;*/
	for "_i" from 0 to (count _objetivosFinal) - 1 do
		{
		_arrayFinal pushBack [_objetivosFinal select _i,_basesFinal select _i];
		};
	//_objetivoFinal = selectRandom _arrayFinal;
	_objetivoFinal = _arrayFinal selectRandomWeighted _cuentasFinal;
	_destino = _objetivoFinal select 0;
	_origen = _objetivoFinal select 1;
	///aquí decidimos las oleadas
	if (_waves == 1) then
		{
		if (lados getVariable [_destino,sideUnknown] == buenos) then
			{
			_waves = (round (random tierWar));
			if (_waves == 0) then {_waves = 1};
			}
		else
			{
			if (lados getVariable [_origen,sideUnknown] == muyMalos) then
				{
				if (_destino in aeropuertos) then
					{
					_waves = 2 + round (random tierWar);
					}
				else
					{
					if (!(_destino in ciudades)) then
						{
						_waves = 1 + round (random (tierWar)/2);
						};
					};
				}
			else
				{
				if (!(_destino in ciudades)) then
					{
					_waves = 1 + round (random ((tierWar - 3)/2));
					};
				};
			};
		};
	if (not(_destino in ciudades)) then
		{
		///[[_destino,_origen,_waves],"A3A_fnc_wavedCA"] call A3A_fnc_scheduler;
		[_destino,_origen,_waves] spawn A3A_fnc_wavedCA;
		}
	else
		{
		//if (lados getVariable [_origen,sideUnknown] == malos) then {[[_destino,_origen,_waves],"A3A_fnc_wavedCA"] call A3A_fnc_scheduler} else {[[_destino,_origen],"A3A_fnc_CSATpunish"] call A3A_fnc_scheduler};
		if (lados getVariable [_origen,sideUnknown] == malos) then {[_destino,_origen,_waves] spawn A3A_fnc_wavedCA} else {[_destino,_origen] spawn A3A_fnc_CSATpunish};
		};
	};

if (_waves == 1) then
	{
	{[[_x select 0,_x select 1,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]} forEach _faciles;
	};