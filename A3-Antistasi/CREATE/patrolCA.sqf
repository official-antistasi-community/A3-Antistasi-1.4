if (!isServer and hasInterface) exitWith {};

private ["_marcador","_esMarcador","_exit","_radio","_base","_aeropuerto","_posDestino","_soldados","_vehiculos","_grupos","_roads","_posOrigen","_tam","_tipoVeh","_vehicle","_veh","_vehCrew","_grupoVeh","_landPos","_tipoGrupo","_grupo","_soldado","_threatEval","_pos","_timeOut","_lado","_cuenta","_esMarcador","_inWaves","_typeOfAttack","_cercano","_aeropuertos","_sitio","_enemigos","_plane","_amigos","_tipo","_esSDK","_weapons","_nombreDest","_vehPool","_super","_spawnPoint","_pos1","_pos2"];

_marcador = _this select 0;
_aeropuerto = _this select 1;
_typeOfAttack = _this select 2;
_super = if (!isMultiplayer) then {false} else {_this select 3};
_inWaves = false;
_lado = malos;
_posOrigen = [];
_posDestino = [];
if ([_marcador,false] call A3A_fnc_fogCheck < 0.3) exitWith {diag_log format ["Antistasi PatrolCA: Attack on %1 exit because of heavy fog",_marcador]};
if (_aeropuerto isEqualType "") then
	{
	_inWaves = true;
	if (lados getVariable [_aeropuerto,sideUnknown] == muyMalos) then {_lado = muyMalos};
	_posOrigen = getMarkerPos _aeropuerto;
	}
else
	{
	_lado = _aeropuerto;
	};

//if ((!_inWaves) and (diag_fps < minimoFPS)) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because of FPS %1",""]};

_esMarcador = false;
_exit = false;
if (_marcador isEqualType "") then
	{
	_esMarcador = true;
	_posDestino = getMarkerPos _marcador;
	if (!_inWaves) then {if (_marcador in smallCAmrk) then {_exit = true}};
	}
else
	{
	_posDestino = _marcador;
	_cercano = [smallCApos,_marcador] call BIS_fnc_nearestPosition;
	if (_cercano distance _marcador < (distanciaSPWN2)) then
		{
		_exit = true;
		}
	else
		{
		if (count smallCAmrk > 0) then
			{
			_cercano = [smallCAmrk,_marcador] call BIS_fnc_nearestPosition;
			if (getMarkerPos _cercano distance _marcador < (distanciaSPWN2)) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because of other CA in vincity of %1",_marcador]};

_enemigos = allUnits select {_x distance _posDestino < distanciaSPWN2 and (side (group _x) != _lado) and (side (group _x) != civilian) and (alive _x)};

if ((!_esMarcador) and (_typeOfAttack != "Air") and (!_super) and ({lados getVariable [_x,sideUnknown] == _lado} count aeropuertos > 0)) then
	{
	_plane = if (_lado == malos) then {vehNATOPlane} else {vehCSATPlane};
	if ([_plane] call A3A_fnc_vehAvailable) then
		{
		_amigos = if (_lado == malos) then {allUnits select {(_x distance _posDestino < 200) and (alive _x) and ((side (group _x) == _lado) or (side (group _x) == civilian))}} else {allUnits select {(_x distance _posDestino < 100) and ([_x] call A3A_fnc_canFight) and (side (group _x) == _lado)}};
		if (count _amigos == 0) then
			{
			_tipo = "NAPALM";
			{
			if (vehicle _x isKindOf "Tank") then
				{
				_tipo = "HE"
				}
			else
				{
				if (vehicle _x != _x) then
					{
					if !(vehicle _x isKindOf "StaticWeapon") then {_tipo = "CLUSTER"};
					};
				};
			if (_tipo == "HE") exitWith {};
			} forEach _enemigos;
			_exit = true;
			if (!_esMarcador) then {smallCApos pushBack _posDestino};
			[_posDestino,_lado,_tipo] spawn A3A_fnc_airstrike;
			diag_log format ["Antistasi PatrolCA: Airstrike of type %1 sent to %2",_tipo,_marcador];
			if (!_esMarcador) then
				{
				sleep 120;
				smallCApos = smallCApos - [_posDestino];
				};
			diag_log format ["Antistasi PatrolCA: CA resolved on airstrike %1",_marcador]
			};
		};
	};
if (_exit) exitWith {};

if (!_inWaves) then
	{
	_aeropuertos = aeropuertos select {lados getVariable [_x,sideUnknown] == _lado};
	_aeropuertos = if (hayIFA) then {_aeropuertos select {(getMarkerPos _x distance _posDestino < distanceForLandAttack) and ([_x,true] call A3A_fnc_airportCanAttack) and ([_posDestino,getMarkerPos _x] call A3A_fnc_isTheSameIsland)}} else {_aeropuertos select 	{(getMarkerPos _x distance _posDestino < distanceForAirAttack) and ([_x,true] call A3A_fnc_airportCanAttack)}};
	_puestos = puestos select {(lados getVariable [_x,sideUnknown] == _lado) and ([_posDestino,getMarkerPos _x] call A3A_fnc_isTheSameIsland)};
	_aeropuertos = _aeropuertos + (_puestos select 	{(getMarkerPos _x distance _posDestino < distanceForLandAttack)  and ([_x,true] call A3A_fnc_airportCanAttack)});
	if (_esMarcador) then
		{
		_aeropuertos = _aeropuertos select {({_x == _marcador} count (killZones getVariable [_x,[]])) < 3};
		//if (hayIFA) then {_aeropuertos = _aeropuertos select {getMarkerPos _x distance _posDestino < distanceForLandAttack}};
		}
	else
		{
		if (!_super) then
			{
			_sitio = [(recursos + fabricas + aeropuertos + puestos + puertos),_marcador] call BIS_fnc_nearestPosition;
			_aeropuertos = _aeropuertos select {({_x == _sitio} count (killZones getVariable [_x,[]])) < 3};
			};
		};
	if (_esMarcador) then
		{
		_aeropuertos = _aeropuertos - [_marcador];
		};
	if (_aeropuertos isEqualTo []) then
		{
		_exit = true;
		}
	else
		{
		_aeropuerto = [_aeropuertos,_posDestino] call BIS_fnc_nearestPosition;
		_posOrigen = getMarkerPos _aeropuerto;
		};
	};

if (_exit) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because no available base (distance, not spawned, busy, killzone) to attack %1",_marcador]};

_base = if ((_posOrigen distance _posDestino < distanceForLandAttack) and ([_posDestino,_posOrigen] call A3A_fnc_isTheSameIsland)) then {_aeropuerto} else {""};

if ((_base != "") and (_esMarcador)) then {if (_marcador in blackListDest) then {_base == ""}};


/*
if (_base != "") then
	{
	if (lados getVariable [_base,sideUnknown] == buenos) then {_exit = true}
	}
else
	{
	if (lados getVariable [_aeropuerto,sideUnknown] == buenos) then {_exit = true}
	};*/


if (_typeOfAttack == "") then
	{
	_typeOfAttack = "Normal";
	{
	_exit = false;
	if (vehicle _x != _x) then
		{
		_veh = vehicle _x;
		if (_veh isKindOf "Plane") exitWith {_exit = true; _typeOfAttack = "Air"};
		if (_veh isKindOf "Helicopter") then
			{
			_weapons = getArray (configfile >> "CfgVehicles" >> (typeOf _veh) >> "weapons");
			if (_weapons isEqualType []) then
				{
				if (count _weapons > 1) then {_exit = true; _typeOfAttack = "Air"};
				};
			}
		else
			{
			if (_veh isKindOf "Tank") then {_typeOfAttack = "Tank"};
			};
		};
	if (_exit) exitWith {};
	} forEach _enemigos;
	};
if (_base != "") then
	{
	_threatEval = [_posDestino] call A3A_fnc_landThreatEval;
	if (_threatEval > 15) then
		{
		_base = "";
		}
	};
_esSDK = false;
if (_esMarcador) then
	{
	smallCAmrk pushBackUnique _marcador; publicVariable "smallCAmrk";
	if (lados getVariable [_marcador,sideUnknown] == buenos) then
		{
		_esSDK = true;
		_nombreDest = [_marcador] call A3A_fnc_localizar;
		if (!_inWaves) then {["IntelAdded", ["", format ["QRF sent to %1",_nombreDest]]] remoteExec ["BIS_fnc_showNotification",_lado]};
		}
	else
		{
		//forcedSpawn pushBackUnique _marcador; publicVariable "forcedSpawn";
		};
	}
else
	{
	smallCApos pushBack _posDestino;
	};

//if (debug) then {hint format ["Nos contraatacan desde %1 o desde el aeropuerto %2 hacia %3", _base, _aeropuerto,_marcador]; sleep 5};
diag_log format ["Antistasi PatrolCA: CA performed from %1 to %2.Is waved:%3.Is super:%4",_aeropuerto,_marcador,_inWaves,_super];
//_config = if (_lado == malos) then {cfgNATOInf} else {cfgCSATInf};

_soldados = [];
_vehiculos = [];
_grupos = [];
_roads = [];

if (_base != "") then
	{
	_aeropuerto = "";
	if (_base in puestos) then {[_base,60] call A3A_fnc_addTimeForIdle} else {[_base,30] call A3A_fnc_addTimeForIdle};
	_indice = aeropuertos find _base;
	_spawnPoint = objNull;
	_pos = [];
	_dir = 0;
	if (_indice > -1) then
		{
		_spawnPoint = spawnPoints select _indice;
		_pos = getMarkerPos _spawnPoint;
		_dir = markerDir _spawnPoint;
		}
	else
		{
		_spawnPoint = [_posOrigen] call A3A_fnc_findNearestGoodRoad;
		_pos = position _spawnPoint;
		_dir = getDir _spawnPoint;
		};

	_vehPool = if (_lado == malos) then {vehNATOAttack select {[_x] call A3A_fnc_vehAvailable}} else {vehCSATAttack select {[_x] call A3A_fnc_vehAvailable}};
	_road = [_posDestino] call A3A_fnc_findNearestGoodRoad;
	if ((position _road) distance _posDestino > 150) then {_vehPool = _vehPool - vehTanks};
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
	_cuenta = if (!_super) then {if (_esMarcador) then {2} else {1}} else {round ((tierWar + difficultyCoef) / 2) + 1};
	_landPosBlacklist = [];
	for "_i" from 1 to _cuenta do
		{
		if (_vehPool isEqualTo []) then {if (_lado == malos) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
		_tipoVeh = if (_i == 1) then
						{
						if (_typeOfAttack == "Normal") then
							{
							selectRandom _vehPool
							}
						else
							{
							if (_typeOfAttack == "Air") then
								{
								if (_lado == malos) then
									{
									if ([vehNATOAA] call A3A_fnc_vehAvailable) then {vehNATOAA} else {selectRandom _vehPool}
									}
								else
									{
									if ([vehCSATAA] call A3A_fnc_vehAvailable) then {vehCSATAA} else {selectRandom _vehPool}
									};
								}
							else
								{
								if (_lado == malos) then
									{
									if ([vehNATOTank] call A3A_fnc_vehAvailable) then {vehNATOTank} else {selectRandom _vehPool}
									}
								else
									{
									if ([vehCSATTank] call A3A_fnc_vehAvailable) then {vehCSATTank} else {selectRandom _vehPool}
									};
								};
							};
						}
					else
						{
						if ((_esMarcador) and !((_vehPool - vehTanks) isEqualTo [])) then {selectRandom (_vehPool - vehTanks)} else {selectRandom _vehPool};
						};
		//_road = _roads select 0;
		_timeOut = 0;
		_pos = _pos findEmptyPosition [0,100,_tipoVeh];
		while {_timeOut < 60} do
			{
			if (count _pos > 0) exitWith {};
			_timeOut = _timeOut + 1;
			_pos = _pos findEmptyPosition [0,100,_tipoVeh];
			sleep 1;
			};
		if (count _pos == 0) then {_pos = if (_indice == -1) then {getMarkerPos _spawnPoint} else {position _spawnPoint}};
		_vehicle=[_pos, _dir,_tipoveh, _lado] call bis_fnc_spawnvehicle;

		_veh = _vehicle select 0;
		_vehCrew = _vehicle select 1;
		{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
		[_veh] call A3A_fnc_AIVEHinit;
		_grupoVeh = _vehicle select 2;
		_soldados = _soldados + _vehCrew;
		_grupos pushBack _grupoVeh;
		_vehiculos pushBack _veh;
		_landPos = [_posDestino,_pos,false,_landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
		if ((not(_tipoVeh in vehTanks)) and (not(_tipoVeh in vehAA))) then
			{
			_landPosBlacklist pushBack _landPos;
			_tipogrupo = if (_typeOfAttack == "Normal") then
				{
				[_tipoVeh,_lado] call A3A_fnc_cargoSeats;
				}
			else
				{
				if (_typeOfAttack == "Air") then
					{
					if (_lado == malos) then {gruposNATOAA} else {gruposCSATAA}
					}
				else
					{
					if (_lado == malos) then {gruposNATOAT} else {gruposCSATAT}
					};
				};
			_grupo = [_posorigen,_lado,_tipogrupo] call A3A_fnc_spawnGroup;
			//{_x assignAsCargo _veh;_x moveInCargo _veh; [_x] call A3A_fnc_NATOinit;_soldados pushBack _x; _x setVariable ["origen",_base]} forEach units _grupo;
			{
			_x assignAsCargo _veh;
			_x moveInCargo _veh;
			if (vehicle _x == _veh) then
				{
				_soldados pushBack _x;
				[_x] call A3A_fnc_NATOinit;
				_x setVariable ["origen",_base];
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
				//_grupos pushBack _grupo;
				[_base,_landPos,_grupoVeh] call WPCreate;
				_Vwp0 = (wayPoints _grupoVeh) select 0;
				_Vwp0 setWaypointBehaviour "SAFE";
				_Vwp0 = _grupoVeh addWaypoint [_landPos,count (wayPoints _grupoVeh)];
				_Vwp0 setWaypointType "TR UNLOAD";
				_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
				//_Vwp0 setWaypointStatements ["true", "[vehicle this] call A3A_fnc_smokeCoverAuto"];
				_Vwp1 = _grupoVeh addWaypoint [_posDestino, count (wayPoints _grupoVeh)];
				_Vwp1 setWaypointType "SAD";
				_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				_Vwp1 setWaypointBehaviour "COMBAT";
				[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
				_veh allowCrewInImmobile true;
				}
			else
				{
				(units _grupo) joinSilent _grupoVeh;
				deleteGroup _grupo;

				if (count units _grupoVeh > 1) then {_grupoVeh selectLeader (units _grupoVeh select 1)};
				[_base,_landPos,_grupoVeh] call WPCreate;
				_Vwp0 = (wayPoints _grupoVeh) select 0;
				_Vwp0 setWaypointBehaviour "SAFE";
				/*
				_Vwp0 = (wayPoints _grupoVeh) select ((count wayPoints _grupoVeh) - 1);
				_Vwp0 setWaypointType "GETOUT";
				*/
				_Vwp0 = _grupoVeh addWaypoint [_landPos, count (wayPoints _grupoVeh)];
				_Vwp0 setWaypointType "GETOUT";
				_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
				_Vwp1 = _grupoVeh addWaypoint [_posDestino, count (wayPoints _grupoVeh)];
				_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				if (_esMarcador) then
					{

					if ((count (garrison getVariable _marcador)) < 4) then
						{
						_Vwp1 setWaypointType "MOVE";
						_Vwp1 setWaypointBehaviour "AWARE";
						}
					else
						{
						_Vwp1 setWaypointType "SAD";
						_Vwp1 setWaypointBehaviour "COMBAT";
						};
					}
				else
					{
					_Vwp1 setWaypointType "SAD";
					_Vwp1 setWaypointBehaviour "COMBAT";
					};
				[_veh,"Inf Truck."] spawn A3A_fnc_inmuneConvoy;
				};
			}
		else
			{
			{_x disableAI "MINEDETECTION"} forEach (units _grupoVeh);
			[_base,_posDestino,_grupoVeh] call WPCreate;
			_Vwp0 = (wayPoints _grupoVeh) select 0;
			_Vwp0 setWaypointBehaviour "SAFE";
			_Vwp0 = _grupoVeh addWaypoint [_posDestino, count (waypoints _grupoVeh)];
			[_veh,"Tank"] spawn A3A_fnc_inmuneConvoy;
			_Vwp0 setWaypointType "SAD";
			_Vwp0 setWaypointBehaviour "AWARE";
			_Vwp0 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
			_veh allowCrewInImmobile true;
			};
		_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable}
		};
	diag_log format ["Antistasi PatrolCA: Land CA performed on %1, Type is %2, Vehicle count: %3, Soldier count: %4",_marcador,_typeOfAttack,count _vehiculos,count _soldados];
	};
if (_aeropuerto != "") then
	{
	[_aeropuerto,20] call A3A_fnc_addTimeForIdle;
	_vehPool = [];
	_cuenta = if (!_super) then {if (_esMarcador) then {2} else {1}} else {round ((tierWar + difficultyCoef) / 2) + 1};
	_tipoVeh = "";
	_vehPool = if (_lado == malos) then {(vehNATOAir - [vehNATOPlane]) select {[_x] call A3A_fnc_vehAvailable}} else {(vehCSATAir - [vehCSATPlane]) select {[_x] call A3A_fnc_vehAvailable}};
	if (_esSDK) then
		{
		_rnd = random 100;
		if (_lado == malos) then
			{
			if (_rnd > prestigeNATO) then
				{
				_vehPool = _vehPool - vehNATOAttackHelis;
				};
			}
		else
			{
			if (_rnd > prestigeCSAT) then
				{
				_vehPool = _vehPool - vehCSATAttackHelis;
				};
			};
		};
	if (_vehPool isEqualTo []) then {if (_lado == malos) then {_vehPool = [vehNATOPatrolHeli]} else {_vehPool = [vehCSATPatrolHeli]}};
	for "_i" from 1 to _cuenta do
		{
		_tipoVeh = if (_i == 1) then
				{
				if (_typeOfAttack == "Normal") then
					{
					if (_cuenta == 1) then
						{
						if (count (_vehPool - vehTransportAir) == 0) then {selectRandom _vehPool} else {selectRandom (_vehPool - vehTransportAir)};
						}
					else
						{
						//if (count (_vehPool - vehTransportAir) == 0) then {selectRandom _vehPool} else {selectRandom (_vehPool - vehTransportAir)};
						selectRandom (_vehPool select {_x in vehTransportAir});
						};
					}
				else
					{
					if (_typeOfAttack == "Air") then
						{
						if (_lado == malos) then {if ([vehNATOPlaneAA] call A3A_fnc_vehAvailable) then {vehNATOPlaneAA} else {selectRandom _vehPool}} else {if ([vehCSATPlaneAA] call A3A_fnc_vehAvailable) then {vehCSATPlaneAA} else {selectRandom _vehPool}};
						}
					else
						{
						if (_lado == malos) then {if ([vehNATOPlane] call A3A_fnc_vehAvailable) then {vehNATOPlane} else {selectRandom _vehPool}} else {if ([vehCSATPlane] call A3A_fnc_vehAvailable) then {vehCSATPlane} else {selectRandom _vehPool}};
						};
					};
				}
			else
				{
				if (_esMarcador) then {selectRandom (_vehPool select {_x in vehTransportAir})} else {selectRandom _vehPool};
				};

		_pos = _posOrigen;
		_ang = 0;
		_size = [_aeropuerto] call A3A_fnc_sizeMarker;
		_buildings = nearestObjects [_posOrigen, ["Land_LandMark_F","Land_runway_edgelight"], _size / 2];
		if (count _buildings > 1) then
			{
			_pos1 = getPos (_buildings select 0);
			_pos2 = getPos (_buildings select 1);
			_ang = [_pos1, _pos2] call BIS_fnc_DirTo;
			_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
			};
		if (count _pos == 0) then {_pos = _posOrigen};
		_vehicle=[_pos, _ang + 90,_tipoVeh, _lado] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		if (hayIFA) then {_veh setVelocityModelSpace [((velocityModelSpace _veh) select 0) + 0,((velocityModelSpace _veh) select 1) + 150,((velocityModelSpace _veh) select 2) + 50]};
		_vehCrew = _vehicle select 1;
		_grupoVeh = _vehicle select 2;
		_soldados append _vehCrew;
		_grupos pushBack _grupoVeh;
		_vehiculos pushBack _veh;
		{[_x] call A3A_fnc_NATOinit} forEach units _grupoVeh;
		[_veh] call A3A_fnc_AIVEHinit;
		if (not (_tipoVeh in vehTransportAir)) then
			{
			_Hwp0 = _grupoVeh addWaypoint [_posdestino, 0];
			_Hwp0 setWaypointBehaviour "AWARE";
			_Hwp0 setWaypointType "SAD";
			//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
			}
		else
			{
			_tipogrupo = if (_typeOfAttack == "Normal") then
				{
				[_tipoVeh,_lado] call A3A_fnc_cargoSeats;
				}
			else
				{
				if (_typeOfAttack == "Air") then
					{
					if (_lado == malos) then {gruposNATOAA} else {gruposCSATAA}
					}
				else
					{
					if (_lado == malos) then {gruposNATOAT} else {gruposCSATAT}
					};
				};
			_grupo = [_posorigen,_lado,_tipogrupo] call A3A_fnc_spawnGroup;
			//{_x assignAsCargo _veh;_x moveInCargo _veh; [_x] call A3A_fnc_NATOinit;_soldados pushBack _x;_x setVariable ["origen",_aeropuerto]} forEach units _grupo;
			{
			_x assignAsCargo _veh;
			_x moveInCargo _veh;
			if (vehicle _x == _veh) then
				{
				_soldados pushBack _x;
				[_x] call A3A_fnc_NATOinit;
				_x setVariable ["origen",_aeropuerto];
				}
			else
				{
				deleteVehicle _x;
				};
			} forEach units _grupo;
			_grupos pushBack _grupo;
			_landpos = [];
			_proceder = true;
			if (_esMarcador) then
				{
				if ((_marcador in aeropuertos)  or !(_veh isKindOf "Helicopter")) then
					{
					_proceder = false;
					[_veh,_grupo,_marcador,_aeropuerto] spawn A3A_fnc_airdrop;
					}
				else
					{
					if (_esSDK) then
						{
						if (((count(garrison getVariable [_marcador,[]])) < 10) and (_tipoVeh in vehFastRope)) then
							{
							_proceder = false;
							//_grupo setVariable ["mrkAttack",_marcador];
							[_veh,_grupo,_posDestino,_posOrigen,_grupoVeh] spawn A3A_fnc_fastrope;
							};
						};
					};
				}
			else
				{
				if !(_veh isKindOf "Helicopter") then
					{
					_proceder = false;
					[_veh,_grupo,_posDestino,_aeropuerto] spawn A3A_fnc_airdrop;
					};
				};
			if (_proceder) then
				{
				_landPos = [_posDestino, 300, 550, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
				if !(_landPos isEqualTo [0,0,0]) then
					{
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiculos pushBack _pad;
					_wp0 = _grupoVeh addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';[vehicle this] call A3A_fnc_smokeCoverAuto"];
					_wp0 setWaypointBehaviour "CARELESS";
					_wp3 = _grupo addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _grupo addWaypoint [_posDestino, 1];
					_wp4 setWaypointType "MOVE";
					_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_wp2 = _grupoVeh addWaypoint [_posOrigen, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
					[_grupoVeh,1] setWaypointBehaviour "AWARE";
					}
				else
					{
					if (_tipoVeh in vehFastRope) then
						{
						[_veh,_grupo,_posDestino,_posOrigen,_grupoVeh] spawn A3A_fnc_fastrope;
						}
					else
						{
						[_veh,_grupo,_marcador,_aeropuerto] spawn A3A_fnc_airdrop;
						};
					};
				};
			};
		sleep 30;
		_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
		};
	diag_log format ["Antistasi PatrolCA: Air CA performed on %1, Type is %2, Vehicle count: %3, Soldier count: %4",_marcador,_typeOfAttack,count _vehiculos,count _soldados];
	};

if (_esMarcador) then
	{
	_tiempo = time + 3600;
	_size = [_marcador] call A3A_fnc_sizeMarker;
	if (_lado == malos) then
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldados) >= 3*({([_x] call A3A_fnc_canFight)} count _soldados)) or (time > _tiempo) or (lados getVariable [_marcador,sideUnknown] == malos) or (({[_x,_marcador] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_marcador] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_marcador] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_marcador] call A3A_fnc_canConquer)} count allUnits)) and (not(lados getVariable [_marcador,sideUnknown] == malos))) then
			{
			["BLUFORSpawn",_marcador] remoteExec ["A3A_fnc_markerChange",2];
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 succesful. Retaken.",_aeropuerto,_base,_marcador];
			};
		sleep 10;
		if (!(lados getVariable [_marcador,sideUnknown] == malos)) then
			{
			{_x doMove _posorigen} forEach _soldados;
			if (lados getVariable [_aeropuerto,sideUnknown] == malos) then
				{
				_killZones = killZones getVariable [_aeropuerto,[]];
				_killZones = _killZones + [_marcador,_marcador];
				killZones setVariable [_aeropuerto,_killZones,true];
				};
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 failed",_aeropuerto,_base,_marcador];
			}
		}
	else
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldados) >= 3*({([_x] call A3A_fnc_canFight)} count _soldados))or (time > _tiempo) or (lados getVariable [_marcador,sideUnknown] == muyMalos) or (({[_x,_marcador] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_marcador] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_marcador] call A3A_fnc_canConquer} count _soldados) > 3*({(side _x != _lado) and (side _x != civilian) and ([_x,_marcador] call A3A_fnc_canConquer)} count allUnits)) and (not(lados getVariable [_marcador,sideUnknown] == muyMalos))) then
			{
			["OPFORSpawn",_marcador] remoteExec ["A3A_fnc_markerChange",2];
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 succesful. Retaken.",_aeropuerto,_base,_marcador];
			};
		sleep 10;
		if (!(lados getVariable [_marcador,sideUnknown] == muyMalos)) then
			{
			{_x doMove _posorigen} forEach _soldados;
			if (lados getVariable [_aeropuerto,sideUnknown] == muyMalos) then
				{
				_killZones = killZones getVariable [_aeropuerto,[]];
				_killZones = _killZones + [_marcador,_marcador];
				killZones setVariable [_aeropuerto,_killZones,true];
				};
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 failed",_aeropuerto,_base,_marcador];
			}
		};
	}
else
	{
	_ladoENY = if (_lado == malos) then {"OPFORSpawn"} else {"BLUFORSpawn"};
	if (_typeOfAttack != "Air") then {waitUntil {sleep 1; (!([distanciaSPWN1,1,_posDestino,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and !([distanciaSPWN1,1,_posDestino,_ladoENY] call A3A_fnc_distanceUnits)) or (({!([_x] call A3A_fnc_canFight)} count _soldados) >= 3*({([_x] call A3A_fnc_canFight)} count _soldados))}} else {waitUntil {sleep 1; (({!([_x] call A3A_fnc_canFight)} count _soldados) >= 3*({([_x] call A3A_fnc_canFight)} count _soldados))}};
	if (({!([_x] call A3A_fnc_canFight)} count _soldados) >= 3*({([_x] call A3A_fnc_canFight)} count _soldados)) then
		{
		_marcadores = recursos + fabricas + aeropuertos + puestos + puertos select {getMarkerPos _x distance _posDestino < distanciaSPWN};
		_sitio = if (_base != "") then {_base} else {_aeropuerto};
		_killZones = killZones getVariable [_sitio,[]];
		_killZones append _marcadores;
		killZones setVariable [_sitio,_killZones,true];
		diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to %3 failed",_aeropuerto,_base,_marcador];
		};
	diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to %3 despawned",_aeropuerto,_base,_marcador];
	};
diag_log format ["Antistasi PatrolCA: CA on %1 finished",_marcador];

//if (_marcador in forcedSpawn) then {forcedSpawn = forcedSpawn - [_marcador]; publicVariable "forcedSpawn"};

{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiculos;
{
_veh = _x;
if (!([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldados = _soldados - [_x]};
} forEach _soldados;

if (count _soldados > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanciaSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _soldados;
	};

{deleteGroup _x} forEach _grupos;

sleep ((300 - ((tierWar + difficultyCoef) * 5)) max 0);
if (_esMarcador) then {smallCAmrk = smallCAmrk - [_marcador]; publicVariable "smallCAmrk"} else {smallCApos = smallCApos - [_posDestino]};
