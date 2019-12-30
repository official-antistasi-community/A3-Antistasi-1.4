if (!isServer and hasInterface) exitWith {};

private ["_markerX","_isMarker","_exit","_radio","_base","_airportX","_posDestination","_soldiers","_vehiclesX","_groups","_roads","_posOrigin","_radiusX","_typeVehX","_vehicle","_veh","_vehCrew","_groupVeh","_landPos","_typeGroup","_groupX","_soldierX","_threatEval","_pos","_timeOut","_sideX","_countX","_isMarker","_inWaves","_typeOfAttack","_nearX","_airportsX","_siteX","_enemiesX","_plane","_friendlies","_typeX","_isSDK","_weapons","_nameDest","_vehPool","_super","_spawnPoint","_pos1","_pos2"];

_markerX = _this select 0;//[position player,Occupants,"Normal",false] spawn A3A_Fnc_patrolCA
_airportX = _this select 1;
_typeOfAttack = _this select 2;
_super = if (!isMultiplayer) then {false} else {_this select 3};
_inWaves = false;
_sideX = Occupants;
_posOrigin = [];
_posDestination = [];

diag_log format ["[Antistasi] Spawning PatrolCA at %1 from %2 of type %3 (patrolCA.sqf)", _markerX, _airportX, _typeOfAttack];

if ([_markerX,false] call A3A_fnc_fogCheck < 0.3) exitWith {diag_log format ["Antistasi PatrolCA: Attack on %1 exit because of heavy fog",_markerX]};
if (_airportX isEqualType "") then
	{
	_inWaves = true;
	if (sidesX getVariable [_airportX,sideUnknown] == Invaders) then {_sideX = Invaders};
	_posOrigin = getMarkerPos _airportX;
	}
else
	{
	_sideX = _airportX;
	};

//if ((!_inWaves) and (diag_fps < minimoFPS)) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because of FPS %1",""]};

_isMarker = false;
_exit = false;
if (_markerX isEqualType "") then
	{
	_isMarker = true;
	_posDestination = getMarkerPos _markerX;
	if (!_inWaves) then {if (_markerX in smallCAmrk) then {_exit = true}};
	}
else
	{
	_posDestination = _markerX;
	_nearX = [smallCApos,_markerX] call BIS_fnc_nearestPosition;
	if (_nearX distance _markerX < (distanceSPWN2)) then
		{
		_exit = true;
		}
	else
		{
		if (count smallCAmrk > 0) then
			{
			_nearX = [smallCAmrk,_markerX] call BIS_fnc_nearestPosition;
			if (getMarkerPos _nearX distance _markerX < (distanceSPWN2)) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because of other CA in vincity of %1",_markerX]};

_enemiesX = allUnits select {_x distance _posDestination < distanceSPWN2 and (side (group _x) != _sideX) and (side (group _x) != civilian) and (alive _x)};

if ((!_isMarker) and (_typeOfAttack != "Air") and (!_super) and ({sidesX getVariable [_x,sideUnknown] == _sideX} count airportsX > 0)) then
	{
	_plane = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};
	if ([_plane] call A3A_fnc_vehAvailable) then
		{
		_friendlies = if (_sideX == Occupants) then {allUnits select {(_x distance _posDestination < 200) and (alive _x) and ((side (group _x) == _sideX) or (side (group _x) == civilian))}} else {allUnits select {(_x distance _posDestination < 100) and ([_x] call A3A_fnc_canFight) and (side (group _x) == _sideX)}};
		if (count _friendlies == 0) then
			{
			_typeX = if (napalmEnabled) then {"NAPALM"} else {"HE"};
			{
			if (vehicle _x isKindOf "Tank") then
				{
				_typeX = "HE"
				}
			else
				{
				if (vehicle _x != _x) then
					{
					if !(vehicle _x isKindOf "StaticWeapon") then {_typeX = "CLUSTER"};
					};
				};
			if (_typeX == "HE") exitWith {};
			} forEach _enemiesX;
			_exit = true;
			if (!_isMarker) then {smallCApos pushBack _posDestination};
			[_posDestination,_sideX,_typeX] spawn A3A_fnc_airstrike;
			diag_log format ["Antistasi PatrolCA: Airstrike of type %1 sent to %2",_typeX,_markerX];
			if (!_isMarker) then
				{
				sleep 120;
				smallCApos = smallCApos - [_posDestination];
				};
			diag_log format ["Antistasi PatrolCA: CA resolved on airstrike %1",_markerX]
			};
		};
	};
if (_exit) exitWith {};
_threatEvalLand = 0;
if (!_inWaves) then
	{
	_threatEvalLand = [_posDestination,_sideX] call A3A_fnc_landThreatEval;
	_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == _sideX) and ([_x,true] call A3A_fnc_airportCanAttack) and (getMarkerPos _x distance2D _posDestination < distanceForAirAttack)};
	if (hasIFA and (_threatEvalLand <= 15)) then {_airportsX = _airportsX select {(getMarkerPos _x distance2D _posDestination < distanceForLandAttack)}};
	_outposts = if (_threatEvalLand <= 15) then {outposts select {(sidesX getVariable [_x,sideUnknown] == _sideX) and ([_posDestination,getMarkerPos _x] call A3A_fnc_isTheSameIsland) and (getMarkerPos _x distance _posDestination < distanceForLandAttack)  and ([_x,true] call A3A_fnc_airportCanAttack)}} else {[]};
	_airportsX = _airportsX + _outposts;
	if (_isMarker) then
		{
		if (_markerX in blackListDest) then
			{
			_airportsX = _airportsX - outposts;
			};
		_airportsX = _airportsX - [_markerX];
		_airportsX = _airportsX select {({_x == _markerX} count (killZones getVariable [_x,[]])) < 3};
		}
	else
		{
		if (!_super) then
			{
			_siteX = [(resourcesX + factories + airportsX + outposts + seaports),_posDestination] call BIS_fnc_nearestPosition;
			_airportsX = _airportsX select {({_x == _siteX} count (killZones getVariable [_x,[]])) < 3};
			};
		};
	if (_airportsX isEqualTo []) then
		{
		_exit = true;
		}
	else
		{
		_airportX = [_airportsX,_posDestination] call BIS_fnc_nearestPosition;
		_posOrigin = getMarkerPos _airportX;
		};
	};

if (_exit) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because no available base (distance, not spawned, busy, killzone) to attack %1",_markerX]};


_allUnits = {(local _x) and (alive _x)} count allUnits;
_allUnitsSide = 0;
_maxUnitsSide = maxUnits;

if (gameMode <3) then
	{
	_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
	_maxUnitsSide = round (maxUnits * 0.7);
	};
if ((_allUnits + 4 > maxUnits) or (_allUnitsSide + 4 > _maxUnitsSide)) then {_exit = true};

if (_exit) exitWith {diag_log format ["Antistasi PatrolCA: CA cancelled because of reaching the maximum of units on attacking %1",_markerX]};

_base = if ((_posOrigin distance _posDestination < distanceForLandAttack) and ([_posDestination,_posOrigin] call A3A_fnc_isTheSameIsland) and (_threatEvalLand <= 15)) then {_airportX} else {""};

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
	} forEach _enemiesX;
	};

_isSDK = false;
if (_isMarker) then
	{
	smallCAmrk pushBackUnique _markerX; publicVariable "smallCAmrk";
	if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
		{
		_isSDK = true;
		_nameDest = [_markerX] call A3A_fnc_localizar;
		if (!_inWaves) then {["IntelAdded", ["", format ["QRF sent to %1",_nameDest]]] remoteExec ["BIS_fnc_showNotification",_sideX]};
		};
	}
else
	{
	smallCApos pushBack _posDestination;
	};

//if (debug) then {hint format ["Nos contraatacan desde %1 o desde el airportX %2 hacia %3", _base, _airportX,_markerX]; sleep 5};
diag_log format ["Antistasi PatrolCA: CA performed from %1 to %2.Is waved:%3.Is super:%4",_airportX,_markerX,_inWaves,_super];
//_config = if (_sideX == Occupants) then {cfgNATOInf} else {cfgCSATInf};

_soldiers = [];
_vehiclesX = [];
_groups = [];
_roads = [];

if (_base != "") then
	{
	_airportX = "";
	if (_base in outposts) then {[_base,60] call A3A_fnc_addTimeForIdle} else {[_base,30] call A3A_fnc_addTimeForIdle};
	_indexX = airportsX find _base;
	_spawnPoint = objNull;
	_pos = [];
	_dir = 0;
	if (_indexX > -1) then
		{
		_spawnPoint = server getVariable (format ["spawn_%1", _base]);
		_pos = getMarkerPos _spawnPoint;
		_dir = markerDir _spawnPoint;
		}
	else
		{
		_spawnPoint = [_posOrigin] call A3A_fnc_findNearestGoodRoad;
		_pos = position _spawnPoint;
		_dir = getDir _spawnPoint;
		};

	_vehPool = if (_sideX == Occupants) then {vehNATOAttack select {[_x] call A3A_fnc_vehAvailable}} else {vehCSATAttack select {[_x] call A3A_fnc_vehAvailable}};
	_road = [_posDestination] call A3A_fnc_findNearestGoodRoad;
	if ((position _road) distance _posDestination > 150) then {_vehPool = _vehPool - vehTanks};
	if (_isSDK) then
		{
		_rnd = random 100;
		if (_sideX == Occupants) then
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
	_countX = if (!_super) then {if (_isMarker) then {2} else {1}} else {round ((tierWar + difficultyCoef) / 2) + 1};
	_landPosBlacklist = [];
	for "_i" from 1 to _countX do
		{
		if (_vehPool isEqualTo []) then {if (_sideX == Occupants) then {_vehPool = vehNATOTrucks} else {_vehPool = vehCSATTrucks}};
		_typeVehX = if (_i == 1) then
						{
						if (_typeOfAttack == "Normal") then
							{
							selectRandom _vehPool
							}
						else
							{
							if (_typeOfAttack == "Air") then
								{
								if (_sideX == Occupants) then
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
								if (_sideX == Occupants) then
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
						if ((_isMarker) and !((_vehPool - vehTanks) isEqualTo [])) then {selectRandom (_vehPool - vehTanks)} else {selectRandom _vehPool};
						};
		//_road = _roads select 0;
		_timeOut = 0;
		_pos = _pos findEmptyPosition [0,100,_typeVehX];
		while {_timeOut < 60} do
			{
			if (count _pos > 0) exitWith {};
			_timeOut = _timeOut + 1;
			_pos = _pos findEmptyPosition [0,100,_typeVehX];
			sleep 1;
			};
		if (count _pos == 0) then {_pos = if (_indexX == -1) then {getMarkerPos _spawnPoint} else {position _spawnPoint}};
		_vehicle=[_pos, _dir,_typeVehX, _sideX] call bis_fnc_spawnvehicle;

		_veh = _vehicle select 0;
		_vehCrew = _vehicle select 1;
		{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
		[_veh] call A3A_fnc_AIVEHinit;
		_groupVeh = _vehicle select 2;
		_soldiers = _soldiers + _vehCrew;
		_groups pushBack _groupVeh;
		_vehiclesX pushBack _veh;
		_landPos = [_posDestination,_pos,false,_landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
		if ((not(_typeVehX in vehTanks)) and (not(_typeVehX in vehAA))) then
			{
			_landPosBlacklist pushBack _landPos;
			_typeGroup = if (_typeOfAttack == "Normal") then
				{
				[_typeVehX,_sideX] call A3A_fnc_cargoSeats;
				}
			else
				{
				if (_typeOfAttack == "Air") then
					{
					if (_sideX == Occupants) then {groupsNATOAA} else {groupsCSATAA}
					}
				else
					{
					if (_sideX == Occupants) then {groupsNATOAT} else {groupsCSATAT}
					};
				};
			_groupX = [_posOrigin,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
			{
			_x assignAsCargo _veh;
			_x moveInCargo _veh;
			if (vehicle _x == _veh) then
				{
				_soldiers pushBack _x;
				[_x] call A3A_fnc_NATOinit;
				_x setVariable ["originX",_base];
				}
			else
				{
				deleteVehicle _x;
				};
			} forEach units _groupX;
			if (not(_typeVehX in vehTrucks)) then
				{
				{_x disableAI "MINEDETECTION"} forEach (units _groupVeh);
				(units _groupX) joinSilent _groupVeh;
				deleteGroup _groupX;
				_groupVeh spawn A3A_fnc_attackDrillAI;
				//_groups pushBack _groupX;
				[_base,_landPos,_groupVeh] call A3A_fnc_WPCreate;
				_Vwp0 = (wayPoints _groupVeh) select 0;
				_Vwp0 setWaypointBehaviour "SAFE";
				_Vwp0 = _groupVeh addWaypoint [_landPos,count (wayPoints _groupVeh)];
				_Vwp0 setWaypointType "TR UNLOAD";
				//_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
				//_Vwp0 setWaypointStatements ["true", "[vehicle this] call A3A_fnc_smokeCoverAuto"];
				_Vwp1 = _groupVeh addWaypoint [_posDestination, count (wayPoints _groupVeh)];
				_Vwp1 setWaypointType "SAD";
				_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				_Vwp1 setWaypointBehaviour "COMBAT";
				[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
				_veh allowCrewInImmobile true;
				}
			else
				{
				(units _groupX) joinSilent _groupVeh;
				deleteGroup _groupX;
				_groupVeh spawn A3A_fnc_attackDrillAI;
				if (count units _groupVeh > 1) then {_groupVeh selectLeader (units _groupVeh select 1)};
				[_base,_landPos,_groupVeh] call A3A_fnc_WPCreate;
				_Vwp0 = (wayPoints _groupVeh) select 0;
				_Vwp0 setWaypointBehaviour "SAFE";
				/*
				_Vwp0 = (wayPoints _groupVeh) select ((count wayPoints _groupVeh) - 1);
				_Vwp0 setWaypointType "GETOUT";
				*/
				_Vwp0 = _groupVeh addWaypoint [_landPos, count (wayPoints _groupVeh)];
				_Vwp0 setWaypointType "GETOUT";
				//_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
				_Vwp1 = _groupVeh addWaypoint [_posDestination, count (wayPoints _groupVeh)];
				_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				if (_isMarker) then
					{

					if ((count (garrison getVariable [_markerX, []])) < 4) then
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
			{_x disableAI "MINEDETECTION"} forEach (units _groupVeh);
			[_base,_posDestination,_groupVeh] call A3A_fnc_WPCreate;
			_Vwp0 = (wayPoints _groupVeh) select 0;
			_Vwp0 setWaypointBehaviour "SAFE";
			_Vwp0 = _groupVeh addWaypoint [_posDestination, count (waypoints _groupVeh)];
			[_veh,"Tank"] spawn A3A_fnc_inmuneConvoy;
			_Vwp0 setWaypointType "SAD";
			_Vwp0 setWaypointBehaviour "AWARE";
			_Vwp0 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
			_veh allowCrewInImmobile true;
			};
		_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable}
		};
	diag_log format ["Antistasi PatrolCA: Land CA performed on %1, Type is %2, Vehicle count: %3, Soldier count: %4",_markerX,_typeOfAttack,count _vehiclesX,count _soldiers];
	}
else
	{
	[_airportX,20] call A3A_fnc_addTimeForIdle;
	_vehPool = [];
	_countX = if (!_super) then {if (_isMarker) then {2} else {1}} else {round ((tierWar + difficultyCoef) / 2) + 1};
	_typeVehX = "";
	_vehPool = if (_sideX == Occupants) then {(vehNATOAir - [vehNATOPlane]) select {[_x] call A3A_fnc_vehAvailable}} else {(vehCSATAir - [vehCSATPlane]) select {[_x] call A3A_fnc_vehAvailable}};
	if (_isSDK) then
		{
		_rnd = random 100;
		if (_sideX == Occupants) then
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
	if (_vehPool isEqualTo []) then {if (_sideX == Occupants) then {_vehPool = [vehNATOPatrolHeli]} else {_vehPool = [vehCSATPatrolHeli]}};
	for "_i" from 1 to _countX do
		{
		_typeVehX = if (_i == 1) then
				{
				if (_typeOfAttack == "Normal") then
					{
					if (_countX == 1) then
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
						if (_sideX == Occupants) then {if ([vehNATOPlaneAA] call A3A_fnc_vehAvailable) then {vehNATOPlaneAA} else {selectRandom _vehPool}} else {if ([vehCSATPlaneAA] call A3A_fnc_vehAvailable) then {vehCSATPlaneAA} else {selectRandom _vehPool}};
						}
					else
						{
						if (_sideX == Occupants) then {if ([vehNATOPlane] call A3A_fnc_vehAvailable) then {vehNATOPlane} else {selectRandom _vehPool}} else {if ([vehCSATPlane] call A3A_fnc_vehAvailable) then {vehCSATPlane} else {selectRandom _vehPool}};
						};
					};
				}
			else
				{
				if (_isMarker) then {selectRandom (_vehPool select {_x in vehTransportAir})} else {selectRandom _vehPool};
				};

		_pos = _posOrigin;
		_ang = 0;
		_size = [_airportX] call A3A_fnc_sizeMarker;
		_buildings = nearestObjects [_posOrigin, ["Land_LandMark_F","Land_runway_edgelight"], _size / 2];
		if (count _buildings > 1) then
			{
			_pos1 = getPos (_buildings select 0);
			_pos2 = getPos (_buildings select 1);
			_ang = [_pos1, _pos2] call BIS_fnc_DirTo;
			_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
			};
		if (count _pos == 0) then {_pos = _posOrigin};
		_vehicle=[_pos, _ang + 90,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		if (hasIFA) then {_veh setVelocityModelSpace [((velocityModelSpace _veh) select 0) + 0,((velocityModelSpace _veh) select 1) + 150,((velocityModelSpace _veh) select 2) + 50]};
		_vehCrew = _vehicle select 1;
		_groupVeh = _vehicle select 2;
		_soldiers append _vehCrew;
		_groups pushBack _groupVeh;
		_vehiclesX pushBack _veh;
		{[_x] call A3A_fnc_NATOinit} forEach units _groupVeh;
		[_veh] call A3A_fnc_AIVEHinit;
		if (not (_typeVehX in vehTransportAir)) then
			{
			_Hwp0 = _groupVeh addWaypoint [_posDestination, 0];
			_Hwp0 setWaypointBehaviour "AWARE";
			_Hwp0 setWaypointType "SAD";
			//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
			}
		else
			{
			_typeGroup = if (_typeOfAttack == "Normal") then
				{
				[_typeVehX,_sideX] call A3A_fnc_cargoSeats;
				}
			else
				{
				if (_typeOfAttack == "Air") then
					{
					if (_sideX == Occupants) then {groupsNATOAA} else {groupsCSATAA}
					}
				else
					{
					if (_sideX == Occupants) then {groupsNATOAT} else {groupsCSATAT}
					};
				};
			_groupX = [_posOrigin,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
			//{_x assignAsCargo _veh;_x moveInCargo _veh; [_x] call A3A_fnc_NATOinit;_soldiers pushBack _x;_x setVariable ["originX",_airportX]} forEach units _groupX;
			{
			_x assignAsCargo _veh;
			_x moveInCargo _veh;
			if (vehicle _x == _veh) then
				{
				_soldiers pushBack _x;
				[_x] call A3A_fnc_NATOinit;
				_x setVariable ["originX",_airportX];
				}
			else
				{
				deleteVehicle _x;
				};
			} forEach units _groupX;
			_groups pushBack _groupX;
			_landpos = [];
			_proceed = true;
			if (_isMarker) then
				{
				if ((_markerX in airportsX)  or !(_veh isKindOf "Helicopter")) then
					{
					_proceed = false;
					[_veh,_groupX,_markerX,_airportX] spawn A3A_fnc_airdrop;
					}
				else
					{
					if (_isSDK) then
						{
						if (((count(garrison getVariable [_markerX,[]])) < 10) and (_typeVehX in vehFastRope)) then
							{
							_proceed = false;
							//_groupX setVariable ["mrkAttack",_markerX];
							[_veh,_groupX,_posDestination,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
							};
						};
					};
				}
			else
				{
				if !(_veh isKindOf "Helicopter") then
					{
					_proceed = false;
					[_veh,_groupX,_posDestination,_airportX] spawn A3A_fnc_airdrop;
					};
				};
			if (_proceed) then
				{
				_landPos = [_posDestination, 300, 550, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
				if !(_landPos isEqualTo [0,0,0]) then
					{
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiclesX pushBack _pad;
					_wp0 = _groupVeh addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';[vehicle this] call A3A_fnc_smokeCoverAuto"];
					_wp0 setWaypointBehaviour "CARELESS";
					_wp3 = _groupX addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _groupX addWaypoint [_posDestination, 1];
					_wp4 setWaypointType "MOVE";
					_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
					[_groupVeh,1] setWaypointBehaviour "AWARE";
					}
				else
					{
					if (_typeVehX in vehFastRope) then
						{
						[_veh,_groupX,_posDestination,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
						}
					else
						{
						[_veh,_groupX,_markerX,_airportX] spawn A3A_fnc_airdrop;
						};
					};
				};
			};
		sleep 30;
		_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
		};
	diag_log format ["Antistasi PatrolCA: Air CA performed on %1, Type is %2, Vehicle count: %3, Soldier count: %4",_markerX,_typeOfAttack,count _vehiclesX,count _soldiers];
	};

if (_isMarker) then
	{
	_timeX = time + 3600;
	_size = [_markerX] call A3A_fnc_sizeMarker;
	if (_sideX == Occupants) then
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= 3*({([_x] call A3A_fnc_canFight)} count _soldiers)) or (time > _timeX) or (sidesX getVariable [_markerX,sideUnknown] == Occupants) or (({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits)) and (not(sidesX getVariable [_markerX,sideUnknown] == Occupants))) then
			{
			[Occupants,_markerX] remoteExec ["A3A_fnc_markerChange",2];
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 has outnumbered the enemy, changing marker!",_airportX,_base,_markerX];
			};
		sleep 10;
		if (!(sidesX getVariable [_markerX,sideUnknown] == Occupants)) then
			{
			{_x doMove _posOrigin} forEach _soldiers;
			if (sidesX getVariable [_airportX,sideUnknown] == Occupants) then
				{
				_killZones = killZones getVariable [_airportX,[]];
				_killZones = _killZones + [_markerX,_markerX];
				killZones setVariable [_airportX,_killZones,true];
				};
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 has failed as the marker is not changed!",_airportX,_base,_markerX];
			}
		}
	else
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= 3*({([_x] call A3A_fnc_canFight)} count _soldiers))or (time > _timeX) or (sidesX getVariable [_markerX,sideUnknown] == Invaders) or (({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_markerX] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits)) and (not(sidesX getVariable [_markerX,sideUnknown] == Invaders))) then
			{
			[Invaders,_markerX] remoteExec ["A3A_fnc_markerChange",2];
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 has outnumbered the enemy, changing marker!",_airportX,_base,_markerX];
			};
		sleep 10;
		if (!(sidesX getVariable [_markerX,sideUnknown] == Invaders)) then
			{
			{_x doMove _posOrigin} forEach _soldiers;
			if (sidesX getVariable [_airportX,sideUnknown] == Invaders) then
				{
				_killZones = killZones getVariable [_airportX,[]];
				_killZones = _killZones + [_markerX,_markerX];
				killZones setVariable [_airportX,_killZones,true];
				};
			diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to retake %3 has failed as the marker is not changed!",_airportX,_base,_markerX];
			}
		};
	}
else
	{
	_sideEnemy = if (_sideX == Occupants) then {Invaders} else {Occupants};
	if (_typeOfAttack != "Air") then {waitUntil {sleep 1; (!([distanceSPWN1,1,_posDestination,teamPlayer] call A3A_fnc_distanceUnits) and !([distanceSPWN1,1,_posDestination,_sideEnemy] call A3A_fnc_distanceUnits)) or (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= 3*({([_x] call A3A_fnc_canFight)} count _soldiers))}} else {waitUntil {sleep 1; (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= 3*({([_x] call A3A_fnc_canFight)} count _soldiers))}};
	if (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= 3*({([_x] call A3A_fnc_canFight)} count _soldiers)) then
		{
		_markersX = resourcesX + factories + airportsX + outposts + seaports select {getMarkerPos _x distance _posDestination < distanceSPWN};
		_siteX = if (_base != "") then {_base} else {_airportX};
		_killZones = killZones getVariable [_siteX,[]];
		_killZones append _markersX;
		killZones setVariable [_siteX,_killZones,true];
		diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to %3 failed",_airportX,_base,_markerX];
		};
	diag_log format ["Antistasi Debug patrolCA: Attack from %1 or %2 to %3 despawned",_airportX,_base,_markerX];
	};
diag_log format ["Antistasi PatrolCA: CA on %1 finished",_markerX];

//if (_markerX in forcedSpawn) then {forcedSpawn = forcedSpawn - [_markerX]; publicVariable "forcedSpawn"};

{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiclesX;
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldiers = _soldiers - [_x]};
} forEach _soldiers;

if (count _soldiers > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _soldiers;
	};

{deleteGroup _x} forEach _groups;

sleep ((300 - ((tierWar + difficultyCoef) * 5)) max 0);
if (_isMarker) then {smallCAmrk = smallCAmrk - [_markerX]; publicVariable "smallCAmrk"} else {smallCApos = smallCApos - [_posDestination]};
