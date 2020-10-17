private _filename = "fn_createQRF";
//if (!isServer and hasInterface) exitWith {};

// target can be either position or marker. Source is always outpost or airport marker
params ["_target", "_source", "_sideX", "_vehicleCount", "_landAttack", "_typeOfAttack"];

[2, format ["Spawning CA. Target:%1, Source:%2, Side:%3, Count:%4, Land:%5, Type:%6", _target, _source, _sideX, _vehicleCount, _landAttack, _typeOfAttack], _filename] call A3A_fnc_log;

private _fnc_remUnitCount = {
	private _unitCount = {(local _x) and (alive _x)} count allUnits;
	private _remUnitCount = maxUnits - _unitCount;
	if (gameMode <3) then
	{
		private _sideCount = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
		_remUnitCount = _remUnitCount min (maxUnits * 0.7 - _sideCount);
	};
	_remUnitCount;
};

private _isMarker = false;
private _posOrigin = getMarkerPos _source;
private _posDest = _target;
private _isRebelMarker = false;

if (_target isEqualType "") then
{
	_isMarker = true;
	_posDest = getMarkerPos _target;
	if (sidesX getVariable [_target,sideUnknown] == teamPlayer) then { _isRebelMarker = true };
};


private _soldiers = [];
private _vehiclesX = [];
private _groups = [];
private _roads = [];

if (_landAttack) then
{
	private _pos = [];
	private _dir = 0;
	if (_source in airportsX) then
	{
		[_source,30] call A3A_fnc_addTimeForIdle;
		private _spawnPoint = server getVariable (format ["spawn_%1", _source]);
		_pos = getMarkerPos _spawnPoint;
		_dir = markerDir _spawnPoint;
	}
	else
	{
		[_source,60] call A3A_fnc_addTimeForIdle;
		private _spawnPoint = [_posOrigin] call A3A_fnc_findNearestGoodRoad;
		_pos = position _spawnPoint;
		_dir = getDir _spawnPoint;
	};

	private _vehPool = [_sideX, ["Air"]] call A3A_fnc_getVehiclePoolForQRFs;
    if(count _vehPool == 0) then
    {
        if(_sideX == Occupants) then
        {
            {
                _vehPool pushBack _x;
                _vehPool pushBack 5;
            } forEach (vehNATOTrucks + vehNATOLightArmed);
        }
        else
        {
            {
                _vehPool pushBack _x;
                _vehPool pushBack 5;
            } forEach (vehCSATTrucks + vehCSATLightArmed);
        };
    };
	if (_typeOfAttack == "Air") then {
		private _aaType = if (_sideX == Occupants) then {vehNATOAA} else {vehCSATAA};
		if ([_aaType] call A3A_fnc_vehAvailable) then { _vehPool append [_aaType, 30] };
	};
	if (_typeOfAttack == "Tank") then {
		private _tankType = if (_sideX == Occupants) then {vehNATOTank} else {vehCSATTank};
		if ([_tankType] call A3A_fnc_vehAvailable) then { _vehPool append [_tankType, 30] };
	};

	_road = [_posDest] call A3A_fnc_findNearestGoodRoad;
	_landPosBlacklist = [];

	for "_i" from 1 to _vehicleCount do
	{
		_typeVehX = selectRandomWeighted _vehPool;
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
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_groupVeh = _vehicle select 2;
		_soldiers = _soldiers + _vehCrew;
		_groups pushBack _groupVeh;
		_vehiclesX pushBack _veh;
		_landPos = [_posDest,_pos,false,_landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
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
                    _x setVariable ["originX",_source];
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
				[_source,_landPos,_groupVeh] call A3A_fnc_WPCreate;
				_Vwp0 = _groupVeh addWaypoint [_landPos,count (wayPoints _groupVeh)];
				_Vwp0 setWaypointType "TR UNLOAD";
				_Vwp1 = _groupVeh addWaypoint [_posDest, count (wayPoints _groupVeh)];
				_Vwp1 setWaypointType "SAD";
				_Vwp1 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				_Vwp1 setWaypointBehaviour "COMBAT";
				private _typeName = if (_typeVehX in vehAPCs) then {"APC"} else {"MRAP"};
				[_veh, _typeName] spawn A3A_fnc_inmuneConvoy;
				_veh allowCrewInImmobile true;
			}
			else
			{
				(units _groupX) joinSilent _groupVeh;
				deleteGroup _groupX;
				_groupVeh spawn A3A_fnc_attackDrillAI;
				if (count units _groupVeh > 1) then {_groupVeh selectLeader (units _groupVeh select 1)};
				[_source,_landPos,_groupVeh] call A3A_fnc_WPCreate;
				/*
				_Vwp0 = (wayPoints _groupVeh) select ((count wayPoints _groupVeh) - 1);
				_Vwp0 setWaypointType "GETOUT";
				*/
				_Vwp0 = _groupVeh addWaypoint [_landPos, count (wayPoints _groupVeh)];
				_Vwp0 setWaypointType "GETOUT";
				_Vwp1 = _groupVeh addWaypoint [_posDest, count (wayPoints _groupVeh)];
				_Vwp1 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
				if (_isMarker) then
				{
					if ((count (garrison getVariable [_target, []])) < 4) then
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
				[_veh, "Truck"] spawn A3A_fnc_inmuneConvoy;
			};
		}
		else
		{
			{_x disableAI "MINEDETECTION"} forEach (units _groupVeh);
			[_source,_posDest,_groupVeh] call A3A_fnc_WPCreate;
			_Vwp0 = _groupVeh addWaypoint [_posDest, count (waypoints _groupVeh)];
			_Vwp0 setWaypointType "SAD";
			_Vwp0 setWaypointBehaviour "AWARE";
			_Vwp0 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
			private _typeName = if (_typeVehX in vehTanks) then {"Tank"} else {"AA"};
			[_veh, _typeName] spawn A3A_fnc_inmuneConvoy;
			_veh allowCrewInImmobile true;
		};
		[3, format ["QRF vehicle %1 sent with %2 soldiers", typeof _veh, count crew _veh], _filename] call A3A_fnc_log;

		if (call _fnc_remUnitCount < 5) exitWith {
			[3, "QRF reached maximum unit limit", _filename] call A3A_fnc_log;
		};
	};
	[2, format ["Land QRF performed on %1, type %2, veh count %3, troop count %4", _target,_typeOfAttack,count _vehiclesX,count _soldiers], _filename] call A3A_fnc_log;
}
else
{
	[_source,20] call A3A_fnc_addTimeForIdle;
	private _vehPool = [_sideX, ["LandVehicle"]] call A3A_fnc_getVehiclePoolForQRFs;
    if(count _vehPool == 0) then
    {
        if(_sideX == Occupants) then
        {
            {
                _vehPool pushBack _x;
                _vehPool pushBack 10;
            } forEach vehNATOTransportHelis + [vehNATOPatrolHeli];
        }
        else
        {
            {
                _vehPool pushBack _x;
                _vehPool pushBack 10;
            } forEach vehCSATTransportHelis + [vehCSATPatrolHeli];
        };
    };
	if (_typeOfAttack == "Air") then {
		private _vehType = if (_sideX == Occupants) then {vehNATOPlaneAA} else {vehCSATPlaneAA};
		if ([_vehType] call A3A_fnc_vehAvailable) then { _vehPool append [_vehType, 30] };
	};
	if (_typeOfAttack == "Tank") then {
		private _vehType = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};
		if ([_vehType] call A3A_fnc_vehAvailable) then { _vehPool append [_vehType, 30] };
	};

	for "_i" from 1 to _vehicleCount do
	{
		private _typeVehX = selectRandomWeighted _vehPool;
		_pos = _posOrigin;
		_ang = 0;
		_size = [_source] call A3A_fnc_sizeMarker;
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
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		if (not (_typeVehX in vehTransportAir)) then
		{
			_Hwp0 = _groupVeh addWaypoint [_posDest, 0];
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
			//{_x assignAsCargo _veh;_x moveInCargo _veh; [_x] call A3A_fnc_NATOinit;_soldiers pushBack _x;_x setVariable ["originX",_source]} forEach units _groupX;
			{
                _x assignAsCargo _veh;
                _x moveInCargo _veh;
                if (vehicle _x == _veh) then
                {
                    _soldiers pushBack _x;
                    [_x] call A3A_fnc_NATOinit;
                    _x setVariable ["originX",_source];
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
				if ((_target in airportsX) or !(_veh isKindOf "Helicopter")) then
				{
					_proceed = false;
					[_veh,_groupX,_target,_source] spawn A3A_fnc_airdrop;
				}
				else
				{
					if (_isRebelMarker) then
					{
						if (((count(garrison getVariable [_target,[]])) < 10) and (_typeVehX in vehFastRope)) then
						{
							_proceed = false;
                            //_groupX setVariable ["mrkAttack",_target];
							[_veh,_groupX,_posDest,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
						};
					};
				};
			}
			else
			{
				if !(_veh isKindOf "Helicopter") then
				{
					_proceed = false;
					[_veh,_groupX,_posDest,_source] spawn A3A_fnc_airdrop;
				};
			};
			if (_proceed) then
			{
				_landPos = [_posDest, 300, 550, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
				if !(_landPos isEqualTo [0,0,0]) then
				{
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiclesX pushBack _pad;
					_wp0 = _groupVeh addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "if !(local this) exitWith {}; (vehicle this) land 'GET OUT';[vehicle this] call A3A_fnc_smokeCoverAuto"];
					_wp0 setWaypointBehaviour "CARELESS";
					_wp3 = _groupX addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp3 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _groupX addWaypoint [_posDest, 1];
					_wp4 setWaypointType "MOVE";
					_wp4 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
					[_groupVeh,1] setWaypointBehaviour "AWARE";
				}
				else
				{
					if (_typeVehX in vehFastRope) then
					{
						[_veh,_groupX,_posDest,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
					}
					else
					{
						[_veh,_groupX,_target,_source] spawn A3A_fnc_airdrop;
					};
				};
			};
		};
		sleep 15;
		[3, format ["QRF vehicle %1 sent with %2 soldiers", typeof _veh, count crew _veh], _filename] call A3A_fnc_log;

		if (call _fnc_remUnitCount < 5) exitWith {
			[3, "QRF reached maximum unit limit", _filename] call A3A_fnc_log;
		};
	};
	[2, format ["Air QRF performed on %1, type %2, veh count %3, troop count %4", _target,_typeOfAttack,count _vehiclesX,count _soldiers], _filename] call A3A_fnc_log;
};

private _fnc_lowStrength = {
	({[_x] call A3A_fnc_canFight} count _soldiers) <= 0.25 * (count _soldiers);
};

if (_isMarker) then
{
	_timeX = time + 3600;
	_size = [_target] call A3A_fnc_sizeMarker;

	waitUntil {sleep 5; (call _fnc_lowStrength) or (time > _timeX) or (sidesX getVariable [_target,sideUnknown] == _sideX) or (({[_x,_target] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_target] call A3A_fnc_canConquer)} count allUnits))};
	if  ((({[_x,_target] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_target] call A3A_fnc_canConquer)} count allUnits)) and (not(sidesX getVariable [_target,sideUnknown] == _sideX))) then
	{
		[_sideX,_target] remoteExec ["A3A_fnc_markerChange",2];
		[3, format ["QRF from %1 to retake %2 has outnumbered the enemy, changing marker!", _source, _target], _filename] call A3A_fnc_log;
	};
	sleep 10;
	if (!(sidesX getVariable [_target,sideUnknown] == _sideX)) then
	{
		{_x doMove _posOrigin} forEach _soldiers;
		if (sidesX getVariable [_source,sideUnknown] == _sideX) then
		{
			_killZones = killZones getVariable [_source,[]];
			_killZones = _killZones + [_target,_target];
			killZones setVariable [_source,_killZones,true];
		};
		[3, format ["QRF from %1 to retake %2 has failed as the marker is not changed!", _source, _target], _filename] call A3A_fnc_log;
	};
}
else
{
	_timeX = time + 1800;
	_sideEnemy = if (_sideX == Occupants) then {Invaders} else {Occupants};

	if (_typeOfAttack != "Air") then {waitUntil {sleep 5; (_timeX < time) or (call _fnc_lowStrength) or (!([distanceSPWN1,1,_posDest,teamPlayer] call A3A_fnc_distanceUnits) and !([distanceSPWN1,1,_posDest,_sideEnemy] call A3A_fnc_distanceUnits))}}
	else {waitUntil {sleep 5; (_timeX < time) or (call _fnc_lowStrength)}};
	if (call _fnc_lowStrength) then
	{
		private _nearMrk = [(resourcesX + factories + airportsX + outposts + seaports),_posDest] call BIS_fnc_nearestPosition;
		_killZones = killZones getVariable [_source,[]];
		_killZones pushBack _nearMrk;
		killZones setVariable [_source,_killZones,true];
		[3, format ["QRF from %1 on position %2 defeated", _source, _target], _filename] call A3A_fnc_log;
	}
	else {
		[3, format ["QRF from %1 on position %2 despawned", _source, _target], _filename] call A3A_fnc_log;
	};
};
[2, format ["QRF on %1 finished", _target], _filename] call A3A_fnc_log;

//if (_target in forcedSpawn) then {forcedSpawn = forcedSpawn - [_target]; publicVariable "forcedSpawn"};


// Hand remaining aggressor units to the group despawner.
{
	private _isPilot = vehicle leader _x isKindOf "Air";
	if (_isPilot || !_isMarker || {_target in citiesX || sidesX getVariable [_target,sideUnknown] != _sideX}) then {
		private _wp = _x addWaypoint [_posOrigin, 50];
		_wp setWaypointType "MOVE";
		_x setCurrentWaypoint _wp;
	};
	[_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;

{ [_x] spawn A3A_fnc_VEHdespawner } forEach _vehiclesX;


// After a delay, remove the fencing mark
sleep (60 * (30 - (tierWar + difficultyCoef))) max 0;		// 20-30 min delay. Maybe uisleep?
[_target, "remove"] remoteExecCall ["A3A_fnc_updateCAMark", 2];

