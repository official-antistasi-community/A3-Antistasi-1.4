if (!isServer and hasInterface) exitWith {};

private ["_posOrigen","_tipoGrupo","_nombreOrig","_markTsk","_wp1","_soldados","_landpos","_pad","_vehiculos","_wp0","_wp3","_wp4","_wp2","_grupo","_grupos","_tipoveh","_vehicle","_heli","_heliCrew","_grupoheli","_pilotos","_rnd","_resourcesAAF","_nVeh","_tam","_roads","_Vwp1","_road","_veh","_vehCrew","_grupoVeh","_Vwp0","_size","_Hwp0","_grupo1","_uav","_grupouav","_uwp0","_tsk","_vehiculo","_soldado","_piloto","_mrkdestino","_posdestino","_prestigeCSAT","_mrkOrigen","_aeropuerto","_nombredest","_tiempo","_solMax","_nul","_coste","_tipo","_threatEvalAir","_threatEvalLand","_pos","_timeOut","_lado","_waves","_cuenta","_tsk1","_spawnPoint","_vehPool"];

bigAttackInProgress = true;
publicVariable "bigAttackInProgress";
_firstWave = true;
_mrkDestino = _this select 0;
_mrkOrigen = _this select 1;
_waves = _this select 2;
if (_waves <= 0) then {_waves = -1};
_size = [_mrkDestino] call A3A_fnc_sizeMarker;
diag_log format ["Antistasi: Waved attack from %1 to %2. Waves: %3",_mrkOrigen,_mrkDestino,_waves];
_tsk = "";
_tsk1 = "";
_posDestino = getMarkerPos _mrkDestino;
_posOrigen = getMarkerPos _mrkOrigen;

_grupos = [];
_soldadosTotal = [];
_pilotos = [];
_vehiculos = [];
_forced = [];

_nombredest = [_mrkDestino] call A3A_fnc_localizar;
_nombreorig = [_mrkOrigen] call A3A_fnc_localizar;

_lado = lados getVariable [_mrkOrigen,sideUnknown];
_ladosTsk = [buenos,civilian,muyMalos];
_ladosTsk1 = [malos];
_nombreEny = nameMalos;
//_config = cfgNATOInf;
if (_lado == muyMalos) then
	{
	_nombreEny = nameMuyMalos;
	//_config = cfgCSATInf;
	_ladosTsk = [buenos,civilian,malos];
	_ladosTsk1 = [muyMalos];
	};
_esSDK = if (lados getVariable [_mrkDestino,sideUnknown] == buenos) then {true} else {false};
_SDKShown = false;
if (_esSDK) then
	{
	_ladosTsk = [buenos,civilian,malos,muyMalos] - [_lado];
	}
else
	{
	if (not(_mrkDestino in _forced)) then {_forced pushBack _mrkDestino};
	};

//forcedSpawn = forcedSpawn + _forced; publicVariable "forcedSpawn";
forcedSpawn pushBack _mrkDestino; publicVariable "forcedSpawn";
diag_log format ["Antistasi: Side attacker: %1. Side defender (false, the other AI side):  %2",_lado,_esSDK];
_nombreDest = [_mrkDestino] call A3A_fnc_localizar;

[_ladosTsk,"AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_ladosTsk1,"AtaqueAAF1",[format ["We are attacking %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,false,0,true,"Attack",true] call BIS_fnc_taskCreate;
//_tsk = ["AtaqueAAF",_ladosTsk,[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,"CREATED",10,true,true,"Defend"] call BIS_fnc_setTask;
//misiones pushbackUnique "AtaqueAAF"; publicVariable "misiones";
//_tsk1 = ["AtaqueAAF1",_ladosTsk1,[format ["We are attacking %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"CREATED",10,true,true,"Attack"] call BIS_fnc_setTask;

_tiempo = time + 3600;

while {(_waves > 0)} do
	{
	_soldados = [];
	_nVeh = 3 + (round random 1);
	_posOrigenLand = [];
	_pos = [];
	_dir = 0;
	_spawnPoint = "";
	if !(_mrkDestino in blackListDest) then
		{
		if (_posOrigen distance _posDestino < distanceForLandAttack) then
			{
			_indice = aeropuertos find _mrkOrigen;
			_spawnPoint = spawnPoints select _indice;
			_pos = getMarkerPos _spawnPoint;
			_posOrigenLand = _posOrigen;
			_dir = markerDir _spawnPoint;
			}
		else
			{
			_puestos = puestos select {(lados getVariable [_x,sideUnknown] == _lado) and (getMarkerPos _x distance _posDestino < distanceForLandAttack)  and ([_x,false] call A3A_fnc_airportCanAttack)};
			if !(_puestos isEqualTo []) then
				{
				_puesto = selectRandom _puestos;
				_posOrigenLand = getMarkerPos _puesto;
				//[_puesto,60] call A3A_fnc_addTimeForIdle;
				_spawnPoint = [_posOrigenLand] call A3A_fnc_findNearestGoodRoad;
				_pos = position _spawnPoint;
				_dir = getDir _spawnPoint;
				};
			};
		};
	if !(_pos isEqualTo []) then
		{
		if ([_mrkDestino,true] call A3A_fnc_fogCheck < 0.3) then {_nveh = round (1.5*_nveh)};
		_vehPool = if (_lado == malos) then {vehNATOAttack} else {vehCSATAttack};
		_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
		if (_esSDK) then
			{
			_rnd = random 100;
			if (_lado == malos) then
				{
				if (_rnd > prestigeNATO) then
					{
					_vehPool = _vehPool - [vehNATOTank];
					};
				}
			else
				{
				if (_rnd > prestigeCSAT) then
					{
					_vehPool = _vehPool - [vehCSATTank];
					};
				};
			};
		_road = [_posDestino] call A3A_fnc_findNearestGoodRoad;
		if ((position _road) distance _posDestino > 150) then {_vehPool = _vehPool - vehTanks};
		_cuenta = 1;
		_landPosBlacklist = [];
		while {(_cuenta <= _nVeh) and (count _soldados <= 80)} do
			{
			if (_vehPool isEqualTo []) then
				{
				if (_lado == malos) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks};
				};
			_tipoVeh = selectRandom _vehPool;
			if ((_cuenta == _nVeh) and (_tipoVeh in vehTanks)) then
				{
				_tipoVeh = if (_lado == malos) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
				};
			//_road = _roads select (_i -1);
			_timeOut = 0;
			_pos = _pos findEmptyPosition [0,100,_tipoveh];
			while {_timeOut < 60} do
				{
				if (count _pos > 0) exitWith {};
				_timeOut = _timeOut + 1;
				_pos = _pos findEmptyPosition [0,100,_tipoveh];
				sleep 1;
				};
			if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
			_vehicle=[_pos, _dir,_tipoVeh, _lado] call bis_fnc_spawnvehicle;

			_veh = _vehicle select 0;
			_vehCrew = _vehicle select 1;
			{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
			[_veh] call A3A_fnc_AIVEHinit;
			_grupoVeh = _vehicle select 2;
			_soldados append _vehCrew;
			_soldadosTotal append _vehCrew;
			_grupos pushBack _grupoVeh;
			_vehiculos pushBack _veh;
			_landPos = [_posDestino,_pos,false,_landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
			if (not(_tipoVeh in vehTanks)) then
				{
				_landPosBlacklist pushBack _landPos;
				_tipogrupo = [_tipoVeh,_lado] call A3A_fnc_cargoSeats;
				_grupo = [_posorigen,_lado, _tipogrupo] call A3A_fnc_spawnGroup;
				{
				_x assignAsCargo _veh;
				_x moveInCargo _veh;
				if (vehicle _x == _veh) then
					{
					_soldados pushBack _x;
					_soldadosTotal pushBack _x;
					[_x] call A3A_fnc_NATOinit;
					_x setVariable ["origen",_mrkOrigen];
					}
				else
					{
					deleteVehicle _x;
					};
				} forEach units _grupo;
				if (not(_tipoVeh in vehTrucks)) then
					{
					{_x disableAI "MINEDETECTION"} forEach (units _grupoVeh);
					(units _grupo) joinSilent _grupoVeh;
					deleteGroup _grupo;
					[_posOrigenLand,_landPos,_grupoVeh] call WPCreate;
					_Vwp0 = (wayPoints _grupoVeh) select 0;
					_Vwp0 setWaypointBehaviour "SAFE";
					_Vwp0 = _grupoVeh addWaypoint [_landPos, count (wayPoints _grupoVeh)];
					_Vwp0 setWaypointType "TR UNLOAD";
					_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
					_Vwp0 setWayPointCompletionRadius (10*_cuenta);
					_Vwp1 = _grupoVeh addWaypoint [_posdestino, 1];
					_Vwp1 setWaypointType "SAD";
					_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_Vwp1 setWaypointBehaviour "COMBAT";
					_veh allowCrewInImmobile true;
					[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
					}
				else
					{
					(units _grupo) joinSilent _grupoVeh;
					deleteGroup _grupo;
					_grupoVeh selectLeader (units _grupoVeh select 1);
					[_posOrigenLand,_landPos,_grupoVeh] call WPCreate;
					_Vwp0 = (wayPoints _grupoVeh) select 0;
					_Vwp0 setWaypointBehaviour "SAFE";
					_Vwp0 = _grupoVeh addWaypoint [_landPos, count (wayPoints _grupoVeh)];
					_Vwp0 setWaypointType "GETOUT";
					_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
					_Vwp1 = _grupoVeh addWaypoint [_posDestino, count (wayPoints _grupoVeh)];
					_Vwp1 setWaypointType "SAD";
					[_veh,"Inf Truck."] spawn A3A_fnc_inmuneConvoy;
					};
				}
			else
				{
				{_x disableAI "MINEDETECTION"} forEach (units _grupoVeh);
				[_posOrigenLand,_posDestino,_grupoVeh] call WPCreate;
				_Vwp0 = (wayPoints _grupoVeh) select 0;
				_Vwp0 setWaypointBehaviour "SAFE";
				_Vwp0 = _grupoVeh addWaypoint [_posDestino, count (wayPoints _grupoVeh)];
				_Vwp0 setWaypointType "MOVE";
				_Vwp0 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				_Vwp0 = _grupoVeh addWaypoint [_posDestino, count (wayPoints _grupoVeh)];
				_Vwp0 setWaypointType "SAD";
				[_veh,"Tank"] spawn A3A_fnc_inmuneConvoy;
				_veh allowCrewInImmobile true;
				};
			sleep 15;
			if (alive _veh) then {_cuenta = _cuenta + 1};
			_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
			};
		}
	else
		{
		_nVeh = 2*_nVeh;
		};

	_esMar = false;
	if !(hayIFA) then
		{
		for "_i" from 0 to 3 do
			{
			_pos = _posDestino getPos [1000,(_i*90)];
			if (surfaceIsWater _pos) exitWith
				{
				if ({lados getVariable [_x,sideUnknown] == _lado} count puertos > 1) then
					{
					_esMar = true;
					};
				};
			};
		};

	if ((_esMar) and (_firstWave)) then
		{
		_pos = getMarkerPos ([seaAttackSpawn,_posDestino] call BIS_fnc_nearestPosition);
		if (count _pos > 0) then
			{
			_vehPool = if (_lado == malos) then {vehNATOBoats} else {vehCSATBoats};
			_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
			_cuenta = 0;
			while {(_cuenta < 3) and (count _soldados <= 80)} do
				{
				_tipoVeh = if (_vehPool isEqualTo []) then {if (_lado == malos) then {vehNATORBoat} else {vehCSATRBoat}} else {selectRandom _vehPool};

				if ((_tipoVeh == vehNATOBoat) or (_tipoVeh == vehCSATBoat)) then
					{
					_landPos = [_posDestino, 10, 1000, 10, 2, 0.3, 0] call BIS_Fnc_findSafePos;
					}
				else
					{
					_tipogrupo = [_tipoVeh,_lado] call A3A_fnc_cargoSeats;
					_landPos = [_posDestino, 10, 1000, 10, 2, 0.3, 1] call BIS_Fnc_findSafePos;
					};
				if (count _landPos > 0) then
					{
					_vehicle=[_pos, random 360,_tipoveh, _lado] call bis_fnc_spawnvehicle;

					_veh = _vehicle select 0;
					_vehCrew = _vehicle select 1;
					_grupoVeh = _vehicle select 2;
					_pilotos append _vehCrew;
					_grupos pushBack _grupoVeh;
					_vehiculos pushBack _veh;
					{[_x] call A3A_fnc_NATOinit} forEach units _grupoVeh;
					[_veh] call A3A_fnc_AIVEHinit;
					if ((_tipoVeh == vehNATOBoat) or (_tipoVeh == vehCSATBoat)) then
						{
						_wp0 = _grupoVeh addWaypoint [_landpos, 0];
						_wp0 setWaypointType "SAD";
						//[_veh,"Boat"] spawn A3A_fnc_inmuneConvoy;
						}
					else
						{
						_grupo = [_posorigen,_lado, _tipogrupo] call A3A_fnc_spawnGroup;
						{
						_x assignAsCargo _veh;
						_x moveInCargo _veh;
						if (vehicle _x == _veh) then
							{
							_soldados pushBack _x;
							_soldadosTotal pushBack _x;
							[_x] call A3A_fnc_NATOinit;
							_x setVariable ["origen",_mrkOrigen];
							}
						else
							{
							deleteVehicle _x;
							};
						} forEach units _grupo;
						if (_tipoVeh in vehAPCs) then
							{
							_grupos pushBack _grupo;
							_Vwp = _grupoVeh addWaypoint [_landPos, 0];
							_Vwp setWaypointBehaviour "SAFE";
							_Vwp setWaypointType "TR UNLOAD";
							_Vwp setWaypointSpeed "FULL";
							_Vwp1 = _grupoVeh addWaypoint [_posdestino, 1];
							_Vwp1 setWaypointType "SAD";
							_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
							_Vwp1 setWaypointBehaviour "COMBAT";
							_Vwp2 = _grupo addWaypoint [_landPos, 0];
							_Vwp2 setWaypointType "GETOUT";
							_Vwp2 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
							//_grupo setVariable ["mrkAttack",_mrkDestino];
							_Vwp synchronizeWaypoint [_Vwp2];
							_Vwp3 = _grupo addWaypoint [_posdestino, 1];
							_Vwp3 setWaypointType "SAD";
							_veh allowCrewInImmobile true;
							//[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
							}
						else
							{
							(units _grupo) joinSilent _grupoVeh;
							deleteGroup _grupo;
							_grupoVeh selectLeader (units _grupoVeh select 1);
							_Vwp = _grupoVeh addWaypoint [_landPos, 0];
							_Vwp setWaypointBehaviour "SAFE";
							_Vwp setWaypointSpeed "FULL";
							_Vwp setWaypointType "GETOUT";
							_Vwp setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
							_Vwp1 = _grupoVeh addWaypoint [_posDestino, 1];
							_Vwp1 setWaypointType "SAD";
							_Vwp1 setWaypointBehaviour "COMBAT";
							//[_veh,"Boat"] spawn A3A_fnc_inmuneConvoy;
							};
						};
					};
				sleep 15;
				if (alive _veh) then {_cuenta = _cuenta + 1};
				_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
				};
			};
		};
	if ([_mrkDestino,true] call A3A_fnc_fogCheck >= 0.3) then
		{
		if ((_posOrigen distance _posDestino < distanceForLandAttack) and !(_mrkDestino in blackListDest)) then {sleep ((_posOrigen distance _posDestino)/30)};
		_posSuelo = [_posOrigen select 0,_posorigen select 1,0];
		_posOrigen set [2,300];
		_grupoUav = grpNull;
		if !(hayIFA) then
			{
			_tipoVeh = if (_lado == malos) then {vehNATOUAV} else {vehCSATUAV};

			_uav = createVehicle [_tipoVeh, _posOrigen, [], 0, "FLY"];
			_vehiculos pushBack _uav;
			//[_uav,"UAV"] spawn A3A_fnc_inmuneConvoy;
			[_uav,_mrkDestino,_lado] spawn A3A_fnc_VANTinfo;
			createVehicleCrew _uav;
			_pilotos append (crew _uav);
			_grupouav = group (crew _uav select 0);
			_grupos pushBack _grupouav;
			{[_x] call A3A_fnc_NATOinit} forEach units _grupoUav;
			[_uav] call A3A_fnc_AIVEHinit;
			_uwp0 = _grupouav addWayPoint [_posdestino,0];
			_uwp0 setWaypointBehaviour "AWARE";
			_uwp0 setWaypointType "SAD";
			if (not(_mrkDestino in aeropuertos)) then {_uav removeMagazines "6Rnd_LG_scalpel"};
			sleep 5;
			}
		else
			{
			_grupoUav = createGroup _lado;
			//_posOrigen set [2,2000];
			_uwp0 = _grupouav addWayPoint [_posdestino,0];
			_uwp0 setWaypointBehaviour "AWARE";
			_uwp0 setWaypointType "SAD";
			};
		_vehPool = if (_lado == malos) then
					{
					if (_mrkDestino in aeropuertos) then {(vehNATOAir - [vehNATOPlaneAA]) select {[_x] call A3A_fnc_vehAvailable}} else {(vehNatoAir - vehFixedWing) select {[_x] call A3A_fnc_vehAvailable}};
					}
				else
					{
					if (_mrkDestino in aeropuertos) then {(vehCSATAir - [vehCSATPlaneAA]) select {[_x] call A3A_fnc_vehAvailable}} else {(vehCSATAir - vehFixedWing) select {[_x] call A3A_fnc_vehAvailable}};
					};
		if (_esSDK) then
			{
			_rnd = random 100;
			if (_lado == malos) then
				{
				if (_rnd > prestigeNATO) then
					{
					_vehPool = _vehPool - [vehNATOPlane];
					};
				}
			else
				{
				if (_rnd > prestigeCSAT) then
					{
					_vehPool = _vehPool - [vehCSATPlane];
					};
				};
			};
		if ((_waves != 1) and (_firstWave) and (!hayIFA)) then
			{
			if (count (_vehPool - vehTransportAir) != 0) then {_vehPool = _vehPool - vehTransportAir};
			};
		_cuenta = 1;
		_pos = _posOrigen;
		_ang = 0;
		_size = [_mrkOrigen] call A3A_fnc_sizeMarker;
		_buildings = nearestObjects [_posOrigen, ["Land_LandMark_F","Land_runway_edgelight"], _size / 2];
		if (count _buildings > 1) then
			{
			_pos1 = getPos (_buildings select 0);
			_pos2 = getPos (_buildings select 1);
			_ang = [_pos1, _pos2] call BIS_fnc_DirTo;
			_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
			};

		while {(_cuenta <= _nVeh) and (count _soldados <= 80)} do
			{
			if (_cuenta == _nveh) then {if (_lado == malos) then {_vehPool = _vehPool select {_x in vehNATOTransportHelis}} else {_vehPool = _vehPool select {_x in vehCSATTransportHelis}}};
			_tipoVeh = if !(_vehPool isEqualTo []) then {selectRandom _vehPool} else {if (_lado == malos) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli}};
			_vehicle=[_pos, _ang + 90,_tipoveh, _lado] call bis_fnc_spawnvehicle;
			_veh = _vehicle select 0;
			if (hayIFA) then {_veh setVelocityModelSpace [((velocityModelSpace _veh) select 0) + 0,((velocityModelSpace _veh) select 1) + 150,((velocityModelSpace _veh) select 2) + 50]};
			_vehCrew = _vehicle select 1;
			_grupoVeh = _vehicle select 2;
			_pilotos append _vehCrew;
			_vehiculos pushBack _veh;
			{[_x] call A3A_fnc_NATOinit} forEach units _grupoVeh;
			[_veh] call A3A_fnc_AIVEHinit;
			if (not (_tipoVeh in vehTransportAir)) then
				{
				(units _grupoVeh) joinSilent _grupoUav;
				deleteGroup _grupoVeh;
				//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
				}
			else
				{
				_grupos pushBack _grupoVeh;
				_tipogrupo = [_tipoVeh,_lado] call A3A_fnc_cargoSeats;
				_grupo = [_posSuelo,_lado, _tipoGrupo] call A3A_fnc_spawnGroup;
				_grupos pushBack _grupo;
				{
				_x assignAsCargo _veh;
				_x moveInCargo _veh;
				if (vehicle _x == _veh) then
					{
					_soldados pushBack _x;
					_soldadosTotal pushBack _x;
					[_x] call A3A_fnc_NATOinit;
					_x setVariable ["origen",_mrkOrigen];
					}
				else
					{
					deleteVehicle _x;
					};
				} forEach units _grupo;
				if (!(_veh isKindOf "Helicopter") or (_mrkDestino in aeropuertos)) then
					{
					[_veh,_grupo,_mrkDestino,_mrkOrigen] spawn A3A_fnc_airdrop;
					}
				else
					{
					_landPos = _posDestino getPos [300, random 360];
					_landPos = [_landPos, 0, 550, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
					if !(_landPos isEqualTo [0,0,0]) then
						{
						_landPos set [2, 0];
						_pad = createVehicle ["Land_HelipadEmpty_F", _landPos, [], 0, "NONE"];
						_vehiculos pushBack _pad;
						_wp0 = _grupoVeh addWaypoint [_landpos, 0];
						_wp0 setWaypointType "TR UNLOAD";
						_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';[vehicle this] call A3A_fnc_smokeCoverAuto"];
						_wp0 setWaypointBehaviour "CARELESS";
						_wp3 = _grupo addWaypoint [_landpos, 0];
						_wp3 setWaypointType "GETOUT";
						_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
						//_grupo setVariable ["mrkAttack",_mrkDestino];
						//_wp3 setWaypointStatements ["true","nul = [this, (group this getVariable ""mrkAttack""), ""SPAWNED"",""NOVEH2"",""NOFOLLOW"",""NOWP3""] execVM ""scripts\UPSMON.sqf"";"];
						_wp0 synchronizeWaypoint [_wp3];
						_wp4 = _grupo addWaypoint [_posDestino, 1];
						_wp4 setWaypointType "SAD";
						//_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
						//_wp4 setWaypointStatements ["true","nul = [this, (group this getVariable ""mrkAttack""), ""SPAWNED"",""NOVEH2"",""NOFOLLOW"",""NOWP3""] execVM ""scripts\UPSMON.sqf"";"];
						_wp4 = _grupo addWaypoint [_posDestino, 1];
						//_wp4 setWaypointType "SAD";
						_wp2 = _grupoVeh addWaypoint [_posOrigen, 1];
						_wp2 setWaypointType "MOVE";
						_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
						[_grupoVeh,1] setWaypointBehaviour "AWARE";
						}
					else
						{
						{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _grupoVeh;
						if ((_tipoVeh in vehFastRope) and ((count(garrison getVariable _mrkDestino)) < 10)) then
							{
							//_grupo setVariable ["mrkAttack",_mrkDestino];
							[_veh,_grupo,_posDestino,_posOrigen,_grupoVeh] spawn A3A_fnc_fastrope;
							}
						else
							{
							[_veh,_grupo,_mrkDestino,_mrkOrigen] spawn A3A_fnc_airdrop;
							}
						};
					};
				};
			sleep 1;
			_pos = [_pos, 80,_ang] call BIS_fnc_relPos;
			if (alive _veh) then {_cuenta = _cuenta + 1};
			_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
			};
		};
	_plane = if (_lado == malos) then {vehNATOPlane} else {vehCSATPlane};
	if (_lado == malos) then
		{
		if (((not(_mrkDestino in puestos)) and (not(_mrkDestino in puertos)) and (_mrkOrigen != "NATO_carrier")) or hayIFA) then
			{
			[_mrkOrigen,_mrkDestino,_lado] spawn A3A_fnc_artilleria;
			diag_log "Antistasi: Arty Spawned";
			if (([_plane] call A3A_fnc_vehAvailable) and (not(_mrkDestino in ciudades)) and _firstWave) then
				{
				sleep 60;
				_rnd = if (_mrkDestino in aeropuertos) then {round random 4} else {round random 2};
				for "_i" from 0 to _rnd do
					{
					if ([_plane] call A3A_fnc_vehAvailable) then
						{
						diag_log "Antistasi: Airstrike Spawned";
						if (_i == 0) then
							{
							if (_mrkDestino in aeropuertos) then
								{
								_nul = [_mrkdestino,_lado,"HE"] spawn A3A_fnc_airstrike;
								}
							else
								{
								_nul = [_mrkdestino,_lado,selectRandom ["HE","CLUSTER","NAPALM"]] spawn A3A_fnc_airstrike;
								};
							}
						else
							{
							_nul = [_mrkdestino,_lado,selectRandom ["HE","CLUSTER","NAPALM"]] spawn A3A_fnc_airstrike;
							};
						sleep 30;
						};
					};
				};
			};
		}
	else
		{
		if (((not(_mrkDestino in recursos)) and (not(_mrkDestino in puertos)) and (_mrkOrigen != "CSAT_carrier")) or hayIFA) then
			{
			if !(_posOrigenLand isEqualTo []) then {[_posOrigenLand,_mrkDestino,_lado] spawn A3A_fnc_artilleria} else {[_mrkOrigen,_mrkDestino,_lado] spawn A3A_fnc_artilleria};
			diag_log "Antistasi: Arty Spawned";
			if (([_plane] call A3A_fnc_vehAvailable) and (_firstWave)) then
				{
				sleep 60;
				_rnd = if (_mrkDestino in aeropuertos) then {if ({lados getVariable [_x,sideUnknown] == muyMalos} count aeropuertos == 1) then {8} else {round random 4}} else {round random 2};
				for "_i" from 0 to _rnd do
					{
					if ([_plane] call A3A_fnc_vehAvailable) then
						{
						diag_log "Antistasi: Airstrike Spawned";
						if (_i == 0) then
							{
							if (_mrkDestino in aeropuertos) then
								{
								_nul = [_mrkdestino,_lado,"HE"] spawn A3A_fnc_airstrike;
								}
							else
								{
								_nul = [_mrkdestino,_lado,selectRandom ["HE","CLUSTER","NAPALM"]] spawn A3A_fnc_airstrike;
								};
							}
						else
							{
							_nul = [_posDestino,_lado,selectRandom ["HE","CLUSTER","NAPALM"]] spawn A3A_fnc_airstrike;
							};
						sleep 30;
						};
					};
				};
			};
		};

	if (!_SDKShown) then
		{
		if !([true] call A3A_fnc_FIAradio) then {sleep 100};
		_SDKShown = true;
		["TaskSucceeded", ["", "Attack Destination Updated"]] remoteExec ["BIS_fnc_showNotification",buenos];
		["AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"CREATED"] call A3A_fnc_taskUpdate;
		};
	_solMax = round ((count _soldados)*0.6);
	_waves = _waves -1;
	_firstWave = false;
	diag_log format ["Antistasi: Reached end of spawning attack, wave %1. Vehicles: %2. Wave Units: %3. Total units: %4 ",_waves, count _vehiculos, count _soldados, count _soldadosTotal];
	if (lados getVariable [_mrkDestino,sideUnknown] != buenos) then {_soldados spawn A3A_fnc_remoteBattle};
	if (_lado == malos) then
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldados) >= _solMax) or (time > _tiempo) or (lados getVariable [_mrkDestino,sideUnknown] == malos) or (({[_x,_mrkDestino] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_mrkDestino] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_mrkDestino] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_mrkDestino] call A3A_fnc_canConquer)} count allUnits)) or (lados getVariable [_mrkDestino,sideUnknown] == malos)) then
			{
			_waves = 0;
			if ((!(lados getVariable [_mrkDestino,sideUnknown] == malos)) and !(_mrkDestino in ciudades)) then {["BLUFORSpawn",_mrkDestino] remoteExec ["A3A_fnc_markerChange",2]};
			["AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,"FAILED"] call A3A_fnc_taskUpdate;
			["AtaqueAAF1",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"SUCEEDED"] call A3A_fnc_taskUpdate;
			if (_mrkDestino in ciudades) then
				{
				[0,-100,_mrkDestino] remoteExec ["A3A_fnc_citySupportChange",2];
				["TaskFailed", ["", format ["%1 joined %2",[_mrkDestino, false] call A3A_fnc_fn_location,nameMalos]]] remoteExec ["BIS_fnc_showNotification",buenos];
				lados setVariable [_mrkDestino,malos,true];
				_nul = [-5,0] remoteExec ["A3A_fnc_prestige",2];
				_mrkD = format ["Dum%1",_mrkDestino];
				_mrkD setMarkerColor colorMalos;
				garrison setVariable [_mrkDestino,[],true];
				};
			};
		sleep 10;
		if (!(lados getVariable [_mrkDestino,sideUnknown] == malos)) then
			{
			_tiempo = time + 3600;
			if (lados getVariable [_mrkOrigen,sideUnknown] == malos) then
				{
				_killZones = killZones getVariable [_mrkOrigen,[]];
				_killZones append [_mrkDestino,_mrkDestino,_mrkDestino];
				killZones setVariable [_mrkOrigen,_killZones,true];
				};

			if !(_posOrigenLand isEqualTo []) then
				{
				if ({[_x] call A3A_fnc_vehAvailable} count vehNATOAPC == 0) then {_waves = _waves -1};
				if !([vehNATOTank] call A3A_fnc_vehAvailable) then {_waves = _waves - 1};
				};
			if ({[_x] call A3A_fnc_vehAvailable} count vehNATOAttackHelis == 0) then
				{
				if (_posOrigenLand isEqualTo []) then {_waves = _waves -2} else {_waves = _waves -1};
				};
			if !([vehNATOPlane] call A3A_fnc_vehAvailable) then
				{
				if (_posOrigenLand isEqualTo []) then {_waves = _waves -2} else {_waves = _waves -1};
				};

			if ((_waves <= 0) or (!(lados getVariable [_mrkOrigen,sideUnknown] == malos))) then
				{
				{_x doMove _posorigen} forEach _soldadosTotal;
				if (_waves <= 0) then {[_mrkDestino,_mrkOrigen] call A3A_fnc_minefieldAAF};

				["AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,"SUCCEEDED"] call A3A_fnc_taskUpdate;
				["AtaqueAAF1",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"FAILED"] call A3A_fnc_taskUpdate;
				};
			};
		}
	else
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldados) >= _solMax) or (time > _tiempo) or (lados getVariable [_mrkDestino,sideUnknown] == muyMalos) or (({[_x,_mrkDestino] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_mrkDestino] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_mrkDestino] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_mrkDestino] call A3A_fnc_canConquer)} count allUnits)) or (lados getVariable [_mrkDestino,sideUnknown] == muyMalos))  then
			{
			_waves = 0;
			if (not(lados getVariable [_mrkDestino,sideUnknown] == muyMalos)) then {["OPFORSpawn",_mrkDestino] remoteExec ["A3A_fnc_markerChange",2]};
			["AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,"FAILED"] call A3A_fnc_taskUpdate;
			["AtaqueAAF1",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"SUCCEEDED"] call A3A_fnc_taskUpdate;
			};
		sleep 10;
		if (!(lados getVariable [_mrkDestino,sideUnknown] == muyMalos)) then
			{
			_tiempo = time + 3600;
			diag_log format ["Antistasi debug wavedCA: Wave number %1 on wavedCA lost",_waves];
			if (lados getVariable [_mrkOrigen,sideUnknown] == muyMalos) then
				{
				_killZones = killZones getVariable [_mrkOrigen,[]];
				_killZones append [_mrkDestino,_mrkDestino,_mrkDestino];
				killZones setVariable [_mrkOrigen,_killZones,true];
				};

			if !(_posOrigenLand isEqualTo []) then
				{
				if ({[_x] call A3A_fnc_vehAvailable} count vehCSATAPC == 0) then {_waves = _waves -1};
				if !([vehCSATTank] call A3A_fnc_vehAvailable) then {_waves = _waves - 1};
				};
			if ({[_x] call A3A_fnc_vehAvailable} count vehCSATAttackHelis == 0) then
				{
				if (_posOrigenLand isEqualTo []) then {_waves = _waves -2} else {_waves = _waves -1};
				};
			if !([vehCSATPlane] call A3A_fnc_vehAvailable) then
				{
				if (_posOrigenLand isEqualTo []) then {_waves = _waves -2} else {_waves = _waves -1};
				};

			if ((_waves <= 0) or (lados getVariable [_mrkOrigen,sideUnknown] != muyMalos)) then
				{
				{_x doMove _posorigen} forEach _soldadosTotal;
				if (_waves <= 0) then {[_mrkDestino,_mrkOrigen] call A3A_fnc_minefieldAAF};
				["AtaqueAAF",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],format ["%1 Attack",_nombreEny],_mrkOrigen],getMarkerPos _mrkOrigen,"SUCCEEDED"] call A3A_fnc_taskUpdate;
				["AtaqueAAF1",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nombreorig,_nombreDest],format ["%1 Attack",_nombreEny],_mrkDestino],getMarkerPos _mrkDestino,"FAILED"] call A3A_fnc_taskUpdate;
				};
			};
		};
	};





//_tsk = ["AtaqueAAF",_ladosTsk,[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nombreorig,_nombreEny],"AAF Attack",_mrkOrigen],getMarkerPos _mrkOrigen,"FAILED",10,true,true,"Defend"] call BIS_fnc_setTask;
if (_esSDK) then
	{
	if (!(lados getVariable [_mrkDestino,sideUnknown] == buenos)) then
		{
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posdestino,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
diag_log "Antistasi: Reached end of winning conditions. Starting despawn";
sleep 30;
_nul = [0,"AtaqueAAF"] spawn A3A_fnc_borrarTask;
_nul = [0,"AtaqueAAF1"] spawn A3A_fnc_borrarTask;

[_mrkOrigen,60] call A3A_fnc_addTimeForIdle;
bigAttackInProgress = false; publicVariable "bigAttackInProgress";
//forcedSpawn = forcedSpawn - _forced; publicVariable "forcedSpawn";
forcedSpawn = forcedSpawn - [_mrkDestino]; publicVariable "forcedSpawn";
[3600] remoteExec ["A3A_fnc_timingCA",2];

{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _pilotos = _pilotos - [_x]};
} forEach _pilotos;
{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiculos;
{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldadosTotal = _soldadosTotal - [_x]};
} forEach _soldadosTotal;

if (count _pilotos > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _pilotos;
	};

if (count _soldadosTotal > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _soldadosTotal;
	};


{deleteGroup _x} forEach _grupos;
diag_log "Antistasi: Despawn completed";