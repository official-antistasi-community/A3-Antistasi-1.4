if (!isServer and hasInterface) exitWith {};

private ["_posOrigin","_typeGroup","_nameOrigin","_markTsk","_wp1","_soldiers","_landpos","_pad","_vehiclesX","_wp0","_wp3","_wp4","_wp2","_groupX","_groups","_typeVehX","_vehicle","_heli","_heliCrew","_groupHeli","_pilots","_rnd","_resourcesAAF","_nVeh","_radiusX","_roads","_Vwp1","_road","_veh","_vehCrew","_groupVeh","_Vwp0","_size","_Hwp0","_groupX1","_uav","_groupUAV","_uwp0","_tsk","_vehicle","_soldierX","_pilot","_mrkDestination","_posDestination","_prestigeCSAT","_mrkOrigin","_airportX","_nameDest","_timeX","_solMax","_nul","_costs","_typeX","_threatEvalAir","_threatEvalLand","_pos","_timeOut","_sideX","_waves","_countX","_tsk1","_spawnPoint","_vehPool", "_airportIndex"];

private _fileName = "wavedCA";

bigAttackInProgress = true;
publicVariable "bigAttackInProgress";
_firstWave = true;
_mrkDestination = _this select 0;
//_mrkOrigin can be an Airport or Carrier
_mrkOrigin = _this select 1;
_waves = _this select 2;
if (_waves <= 0) then {_waves = -1};
_size = [_mrkDestination] call A3A_fnc_sizeMarker;
_tsk = "";
_tsk1 = "";
_posDestination = getMarkerPos _mrkDestination;
_posOrigin = getMarkerPos _mrkOrigin;

diag_log format ["[Antistasi] Spawning Waved Attack Against %1 from %2 with %3 waves (wavedCA.sqf)", _mrkDestination, _mrkOrigin,	_waves];

_groups = [];
_soldiersTotal = [];
_pilots = [];
_vehiclesX = [];
_forced = [];

_nameDest = [_mrkDestination] call A3A_fnc_localizar;
_nameOrigin = [_mrkOrigin] call A3A_fnc_localizar;

_sideX = sidesX getVariable [_mrkOrigin,sideUnknown];
_sideTsk = [teamPlayer,civilian,Invaders];
_sideTsk1 = [Occupants];
_nameENY = nameOccupants;
//_config = cfgNATOInf;
if (_sideX == Invaders) then
	{
	_nameENY = nameInvaders;
	//_config = cfgCSATInf;
	_sideTsk = [teamPlayer,civilian,Occupants];
	_sideTsk1 = [Invaders];
	};
_isSDK = if (sidesX getVariable [_mrkDestination,sideUnknown] == teamPlayer) then {true} else {false};
_SDKShown = false;
if (_isSDK) then
	{
	_sideTsk = [teamPlayer,civilian,Occupants,Invaders] - [_sideX];
	}
else
	{
	if (not(_mrkDestination in _forced)) then {_forced pushBack _mrkDestination};
	};

//forcedSpawn = forcedSpawn + _forced; publicVariable "forcedSpawn";
forcedSpawn pushBack _mrkDestination; publicVariable "forcedSpawn";
diag_log format ["%1: [Antistasi] | INFO | Side Attacker:%2, Side Defender: %3",servertime,_sideX,_isSDK];
_nameDest = [_mrkDestination] call A3A_fnc_localizar;

[_sideTsk,"rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_sideTsk1,"rebelAttackPVP",[format ["We are attacking %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,false,0,true,"Attack",true] call BIS_fnc_taskCreate;
//_tsk = ["rebelAttack",_sideTsk,[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,"CREATED",10,true,true,"Defend"] call BIS_fnc_setTask;
//missionsX pushbackUnique "rebelAttack"; publicVariable "missionsX";
//_tsk1 = ["rebelAttackPVP",_sideTsk1,[format ["We are attacking %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"CREATED",10,true,true,"Attack"] call BIS_fnc_setTask;

_timeX = time + 3600;

while {(_waves > 0)} do
{
	_soldiers = [];
	_nVeh = if(_sideX == Occupants) then
    {
        3
        + (aggressionOccupants/16)
        + ([-1, 0, 1] select (skillMult - 1))
    }
    else
    {
        3
        + (aggressionInvaders/16)
        + ([-1, 0, 1] select (skillMult - 1))
    };
    _nVeh = (round (_nVeh)) max 1;
    [
        3,
        format ["Wave will contain %1 vehicles", _nVeh],
        _fileName
    ] call A3A_fnc_log;

	_posOriginLand = [];
	_pos = [];
	_dir = 0;
	_spawnPoint = "";
	if !(_mrkDestination in blackListDest) then
	{
		//Attempt land attack if origin is an airport in range
		_airportIndex = airportsX find _mrkOrigin;
		if (_airportIndex >= 0 and (_posOrigin distance _posDestination < distanceForLandAttack)) then
		{
			_spawnPoint = server getVariable (format ["spawn_%1", _mrkOrigin]);
			_pos = getMarkerPos _spawnPoint;
			_posOriginLand = _posOrigin;
			_dir = markerDir _spawnPoint;
		}
		else
		//Find an outpost we can attack from
		{
			_outposts = outposts select {(sidesX getVariable [_x,sideUnknown] == _sideX) and (getMarkerPos _x distance _posDestination < distanceForLandAttack)  and ([_x,false] call A3A_fnc_airportCanAttack)};
			if !(_outposts isEqualTo []) then
			{
				_outpost = selectRandom _outposts;
				_posOriginLand = getMarkerPos _outpost;
				//[_outpost,60] call A3A_fnc_addTimeForIdle;
				_spawnPoint = [_posOriginLand] call A3A_fnc_findNearestGoodRoad;
				_pos = position _spawnPoint;
				_dir = getDir _spawnPoint;
			};
		};
	};
	if !(_pos isEqualTo []) then
	{
		_vehPool = [_sideX, ["Air"]] call A3A_fnc_getVehiclePoolForAttacks;
		_road = [_posDestination] call A3A_fnc_findNearestGoodRoad;
		_countX = 1;
		_landPosBlacklist = [];
		_spawnedSquad = false;
		while {(_countX <= _nVeh) and (count _soldiers <= 80)} do
		{
			_typeVehX = selectRandomWeighted _vehPool;
			_proceed = true;
			if ((_typeVehX in (vehNATOTrucks+vehCSATTrucks)) and _spawnedSquad) then
			{
				_allUnits = {(local _x) and (alive _x)} count allUnits;
				_allUnitsSide = 0;
				_maxUnitsSide = maxUnits;

				if (gameMode <3) then
				{
					_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
					_maxUnitsSide = round (maxUnits * 0.7);
				};
				if ((_allUnits + 4 > maxUnits) or (_allUnitsSide + 4 > _maxUnitsSide)) then {_proceed = false};
			};
			if (_proceed) then
			{
				_timeOut = 0;
				_pos = _pos findEmptyPosition [0,100,_typeVehX];
				while {_timeOut < 60} do
				{
					if (count _pos > 0) exitWith {};
					_timeOut = _timeOut + 1;
					_pos = _pos findEmptyPosition [0,100,_typeVehX];
					sleep 1;
				};
				if (count _pos == 0) then {_pos = getMarkerPos _spawnPoint};
				_vehicle=[_pos, _dir,_typeVehX, _sideX] call bis_fnc_spawnvehicle;

				_veh = _vehicle select 0;
				_vehCrew = _vehicle select 1;
				{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
				[_veh] call A3A_fnc_AIVEHinit;
				_groupVeh = _vehicle select 2;
				_soldiers append _vehCrew;
				_soldiersTotal append _vehCrew;
				_groups pushBack _groupVeh;
				_vehiclesX pushBack _veh;
				_landPos = [_posDestination,_pos,false,_landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
				if (not(_typeVehX in vehTanks)) then
				{
					_landPosBlacklist pushBack _landPos;
					_typeGroup = [_typeVehX,_sideX] call A3A_fnc_cargoSeats;
					_grupo = grpNull;
					if !(_spawnedSquad) then {_grupo = [_posOrigin,_sideX, _typeGroup,true,false] call A3A_fnc_spawnGroup; _spawnedSquad = true} else {_grupo = [_posOrigin,_sideX, _typeGroup] call A3A_fnc_spawnGroup};
					{
                        _x assignAsCargo _veh;
                        _x moveInCargo _veh;
                        if (vehicle _x == _veh) then
                        {
                            _soldiers pushBack _x;
                            _soldiersTotal pushBack _x;
                            [_x] call A3A_fnc_NATOinit;
                            _x setVariable ["originX",_mrkOrigin];
                        }
                        else
                        {
                            deleteVehicle _x;
                        };
					} forEach units _grupo;
					if (not(_typeVehX in vehTrucks)) then
					{
						{_x disableAI "MINEDETECTION"} forEach (units _groupVeh);
						(units _grupo) joinSilent _groupVeh;
						deleteGroup _grupo;
						_groupVeh spawn A3A_fnc_attackDrillAI;
						[_posOriginLand,_landPos,_groupVeh] call A3A_fnc_WPCreate;
						_Vwp0 = (wayPoints _groupVeh) select 0;
						_Vwp0 setWaypointBehaviour "SAFE";
						_Vwp0 = _groupVeh addWaypoint [_landPos, count (wayPoints _groupVeh)];
						_Vwp0 setWaypointType "TR UNLOAD";
						//_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
						_Vwp0 setWayPointCompletionRadius (10*_countX);
						_Vwp1 = _groupVeh addWaypoint [_posDestination, 1];
						_Vwp1 setWaypointType "SAD";
						_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
						_Vwp1 setWaypointBehaviour "COMBAT";
						_veh allowCrewInImmobile true;
						[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
					}
					else
						{
						(units _grupo) joinSilent _groupVeh;
						deleteGroup _grupo;
						_groupVeh selectLeader (units _groupVeh select 1);
						_groupVeh spawn A3A_fnc_attackDrillAI;
						[_posOriginLand,_landPos,_groupVeh] call A3A_fnc_WPCreate;
						_Vwp0 = (wayPoints _groupVeh) select 0;
						_Vwp0 setWaypointBehaviour "SAFE";
						_Vwp0 = _groupVeh addWaypoint [_landPos, count (wayPoints _groupVeh)];
						_Vwp0 setWaypointType "GETOUT";
						//_Vwp0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
						_Vwp1 = _groupVeh addWaypoint [_posDestination, count (wayPoints _groupVeh)];
						_Vwp1 setWaypointType "SAD";
						[_veh,"Inf Truck."] spawn A3A_fnc_inmuneConvoy;
					};
				}
				else
				{
					{_x disableAI "MINEDETECTION"} forEach (units _groupVeh);
					[_posOriginLand,_posDestination,_groupVeh] call A3A_fnc_WPCreate;
					_Vwp0 = (wayPoints _groupVeh) select 0;
					_Vwp0 setWaypointBehaviour "SAFE";
					_Vwp0 = _groupVeh addWaypoint [_posDestination, count (wayPoints _groupVeh)];
					_Vwp0 setWaypointType "MOVE";
					_Vwp0 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
					_Vwp0 = _groupVeh addWaypoint [_posDestination, count (wayPoints _groupVeh)];
					_Vwp0 setWaypointType "SAD";
					[_veh,"Tank"] spawn A3A_fnc_inmuneConvoy;
					_veh allowCrewInImmobile true;
				};
			};
			sleep 15;
			_countX = _countX + 1;
		};
	};

	_isSea = false;
	if !(hasIFA) then
		{
		for "_i" from 0 to 3 do
			{
			_pos = _posDestination getPos [1000,(_i*90)];
			if (surfaceIsWater _pos) exitWith
				{
				if ({sidesX getVariable [_x,sideUnknown] == _sideX} count seaports > 1) then
					{
					_isSea = true;
					};
				};
			};
		};

	if ((_isSea) and (_firstWave)) then
		{
		_pos = getMarkerPos ([seaAttackSpawn,_posDestination] call BIS_fnc_nearestPosition);
		if (count _pos > 0) then
			{
			_vehPool = if (_sideX == Occupants) then {vehNATOBoats} else {vehCSATBoats};
			_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
			_countX = 0;
			_spawnedSquad = false;
			while {(_countX < 3) and (count _soldiers <= 80)} do
				{
				_typeVehX = if (_vehPool isEqualTo []) then {if (_sideX == Occupants) then {vehNATORBoat} else {vehCSATRBoat}} else {selectRandom _vehPool};
				_proceed = true;
				if ((_typeVehX == vehNATOBoat) or (_typeVehX == vehCSATBoat)) then
					{
					_landPos = [_posDestination, 10, 1000, 10, 2, 0.3, 0] call BIS_Fnc_findSafePos;
					}
				else
					{
					_allUnits = {(local _x) and (alive _x)} count allUnits;
					_allUnitsSide = 0;
					_maxUnitsSide = maxUnits;
					if (gameMode <3) then
						{
						_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
						_maxUnitsSide = round (maxUnits * 0.7);
						};
					if (((_allUnits + 4 > maxUnits) or (_allUnitsSide + 4 > _maxUnitsSide)) and _spawnedSquad) then
						{
						_proceed = false
						}
					else
						{
						_typeGroup = [_typeVehX,_sideX] call A3A_fnc_cargoSeats;
						_landPos = [_posDestination, 10, 1000, 10, 2, 0.3, 1] call BIS_Fnc_findSafePos;
						};
					};
				if ((count _landPos > 0) and _proceed) then
					{
					_vehicle=[_pos, random 360,_typeVehX, _sideX] call bis_fnc_spawnvehicle;

					_veh = _vehicle select 0;
					_vehCrew = _vehicle select 1;
					_groupVeh = _vehicle select 2;
					_pilots append _vehCrew;
					_groups pushBack _groupVeh;
					_vehiclesX pushBack _veh;
					{[_x] call A3A_fnc_NATOinit} forEach units _groupVeh;
					[_veh] call A3A_fnc_AIVEHinit;
					if ((_typeVehX == vehNATOBoat) or (_typeVehX == vehCSATBoat)) then
						{
						_wp0 = _groupVeh addWaypoint [_landpos, 0];
						_wp0 setWaypointType "SAD";
						//[_veh,"Boat"] spawn A3A_fnc_inmuneConvoy;
						}
					else
						{
						_grupo = grpNull;
						if !(_spawnedSquad) then {_grupo = [_posOrigin,_sideX, _typeGroup,true,false] call A3A_fnc_spawnGroup;_spawnedSquad = true} else {_grupo = [_posOrigin,_sideX, _typeGroup,false,true] call A3A_fnc_spawnGroup};
						{
						_x assignAsCargo _veh;
						_x moveInCargo _veh;
						if (vehicle _x == _veh) then
							{
							_soldiers pushBack _x;
							_soldiersTotal pushBack _x;
							[_x] call A3A_fnc_NATOinit;
							_x setVariable ["originX",_mrkOrigin];
							}
						else
							{
							deleteVehicle _x;
							};
						} forEach units _grupo;
						if (_typeVehX in vehAPCs) then
							{
							_groups pushBack _grupo;
							_Vwp = _groupVeh addWaypoint [_landPos, 0];
							_Vwp setWaypointBehaviour "SAFE";
							_Vwp setWaypointType "TR UNLOAD";
							_Vwp setWaypointSpeed "FULL";
							_Vwp1 = _groupVeh addWaypoint [_posDestination, 1];
							_Vwp1 setWaypointType "SAD";
							_Vwp1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
							_Vwp1 setWaypointBehaviour "COMBAT";
							_Vwp2 = _grupo addWaypoint [_landPos, 0];
							_Vwp2 setWaypointType "GETOUT";
							_Vwp2 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
							//_grupo setVariable ["mrkAttack",_mrkDestination];
							_Vwp synchronizeWaypoint [_Vwp2];
							_Vwp3 = _grupo addWaypoint [_posDestination, 1];
							_Vwp3 setWaypointType "SAD";
							_veh allowCrewInImmobile true;
							//[_veh,"APC"] spawn A3A_fnc_inmuneConvoy;
							}
						else
							{
							(units _grupo) joinSilent _groupVeh;
							deleteGroup _grupo;
							_groupVeh selectLeader (units _groupVeh select 1);
							_Vwp = _groupVeh addWaypoint [_landPos, 0];
							_Vwp setWaypointBehaviour "SAFE";
							_Vwp setWaypointSpeed "FULL";
							_Vwp setWaypointType "GETOUT";
							_Vwp setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
							_Vwp1 = _groupVeh addWaypoint [_posDestination, 1];
							_Vwp1 setWaypointType "SAD";
							_Vwp1 setWaypointBehaviour "COMBAT";
							//[_veh,"Boat"] spawn A3A_fnc_inmuneConvoy;
							};
						};
					};
				sleep 15;
				_countX = _countX + 1;
				_vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
				};
			};
		};
	if ((_posOrigin distance _posDestination < distanceForLandAttack) and !(_mrkDestination in blackListDest)) then {sleep ((_posOrigin distance _posDestination)/30)};
	_posGround = [_posOrigin select 0,_posOrigin select 1,0];
	_posOrigin set [2,300];
	_groupUAV = grpNull;
	if !(hasIFA) then
	{
		//75% chance to spawn a UAV, to give some variety.
		if (random 1 < 0.25) exitWith {};
		_typeVehX = if (_sideX == Occupants) then {vehNATOUAV} else {vehCSATUAV};

		_uav = createVehicle [_typeVehX, _posOrigin, [], 0, "FLY"];
		_vehiclesX pushBack _uav;
		//[_uav,"UAV"] spawn A3A_fnc_inmuneConvoy;
		[_uav,_mrkDestination,_sideX] spawn A3A_fnc_VANTinfo;
		createVehicleCrew _uav;
		_pilots append (crew _uav);
		_groupUAV = group (crew _uav select 0);
		_groups pushBack _groupUAV;
		{[_x] call A3A_fnc_NATOinit} forEach units _groupUAV;
		[_uav] call A3A_fnc_AIVEHinit;
		_uwp0 = _groupUAV addWayPoint [_posDestination,0];
		_uwp0 setWaypointBehaviour "AWARE";
		_uwp0 setWaypointType "SAD";
		if (not(_mrkDestination in airportsX)) then {_uav removeMagazines "6Rnd_LG_scalpel"};
		sleep 5;
	}
	else
	{
		_groupUAV = createGroup _sideX;
		//_posOrigin set [2,2000];
		_uwp0 = _groupUAV addWayPoint [_posDestination,0];
		_uwp0 setWaypointBehaviour "AWARE";
		_uwp0 setWaypointType "SAD";
	};
    _vehPool = [_sideX, ["LandVehicle"]] call A3A_fnc_getVehiclePoolForAttacks;
    if(count _vehPool == 0) then
    {
        _vehPool = if (_sideX == Occupants) then {vehNATOTransportHelis + vehNATOTransportPlanes} else {vehCSATTransportHelis + vehCSATTransportPlanes};
        _vehPool = _vehPool select {[_x] call A3A_fnc_vehAvailable};
    };
	_countX = 1;
	_pos = _posOrigin;
	_ang = 0;
	_size = [_mrkOrigin] call A3A_fnc_sizeMarker;
	private _runwayTakeoff = [_mrkOrigin] call A3A_fnc_getRunwayTakeoffForAirportMarker;
	if (count _runwayTakeoff > 0) then {
		_pos = _runwayTakeoff select 0;
		_ang = _runwayTakeoff select 1;
	};
	_spawnedSquad = false;

	while {(_countX <= _nVeh) && (count _soldiers <= 80)} do
		{
		_proceed = true;

		_typeVehX = selectRandomWeighted _vehPool;

		if ((_typeVehX in vehTransportAir) and !(_spawnedSquad)) then
			{
			_allUnits = {(local _x) and (alive _x)} count allUnits;
			_allUnitsSide = 0;
			_maxUnitsSide = maxUnits;
			if (gameMode <3) then
				{
				_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
				_maxUnitsSide = round (maxUnits * 0.7);
				};
			if ((_allUnits + 4 > maxUnits) or (_allUnitsSide + 4 > _maxUnitsSide)) then
				{
				_proceed = false
				};
			};
		if (_proceed) then
			{
			_vehicle=[_pos, _ang + 90,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
			_veh = _vehicle select 0;
			if (_veh isKindOf "Plane") then {
				_veh setVelocityModelSpace (velocityModelSpace _veh vectorAdd [0, 150, 50]);
			};
			_vehCrew = _vehicle select 1;
			_groupVeh = _vehicle select 2;
			_pilots append _vehCrew;
			_vehiclesX pushBack _veh;
			{[_x] call A3A_fnc_NATOinit} forEach units _groupVeh;
			[_veh] call A3A_fnc_AIVEHinit;
			if (not (_typeVehX in vehTransportAir)) then
				{
				(units _groupVeh) joinSilent _groupUAV;
				deleteGroup _groupVeh;
				//[_veh,"Air Attack"] spawn A3A_fnc_inmuneConvoy;
				}
			else
				{
				_groups pushBack _groupVeh;
				_typeGroup = [_typeVehX,_sideX] call A3A_fnc_cargoSeats;
				_grupo = grpNull;
				if !(_spawnedSquad) then {_grupo = [_posGround,_sideX, _typeGroup,true,false] call A3A_fnc_spawnGroup;_spawnedSquad = true} else {_grupo = [_posGround,_sideX, _typeGroup] call A3A_fnc_spawnGroup};
				_groups pushBack _grupo;
				{
				_x assignAsCargo _veh;
				_x moveInCargo _veh;
				if (vehicle _x == _veh) then
					{
					_soldiers pushBack _x;
					_soldiersTotal pushBack _x;
					[_x] call A3A_fnc_NATOinit;
					_x setVariable ["originX",_mrkOrigin];
					}
				else
					{
					deleteVehicle _x;
					};
				} forEach units _grupo;
				if (!(_veh isKindOf "Helicopter") or (_mrkDestination in airportsX)) then
					{
					[_veh,_grupo,_mrkDestination,_mrkOrigin] spawn A3A_fnc_airdrop;
					}
				else
					{
					_landPos = _posDestination getPos [300, random 360];
					_landPos = [_landPos, 0, 550, 10, 0, 0.20, 0,[],[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
					if !(_landPos isEqualTo [0,0,0]) then
						{
						_landPos set [2, 0];
						_pad = createVehicle ["Land_HelipadEmpty_F", _landPos, [], 0, "NONE"];
						_vehiclesX pushBack _pad;
						_wp0 = _groupVeh addWaypoint [_landpos, 0];
						_wp0 setWaypointType "TR UNLOAD";
						_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';[vehicle this] call A3A_fnc_smokeCoverAuto"];
						_wp0 setWaypointBehaviour "CARELESS";
						_wp3 = _grupo addWaypoint [_landpos, 0];
						_wp3 setWaypointType "GETOUT";
						_wp3 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
						//_grupo setVariable ["mrkAttack",_mrkDestination];
						//_wp3 setWaypointStatements ["true","nul = [this, (group this getVariable ""mrkAttack""), ""SPAWNED"",""NOVEH2"",""NOFOLLOW"",""NOWP3""] execVM ""scripts\UPSMON.sqf"";"];
						_wp0 synchronizeWaypoint [_wp3];
						_wp4 = _grupo addWaypoint [_posDestination, 1];
						_wp4 setWaypointType "SAD";
						//_wp4 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
						//_wp4 setWaypointStatements ["true","nul = [this, (group this getVariable ""mrkAttack""), ""SPAWNED"",""NOVEH2"",""NOFOLLOW"",""NOWP3""] execVM ""scripts\UPSMON.sqf"";"];
						_wp4 = _grupo addWaypoint [_posDestination, 1];
						//_wp4 setWaypointType "SAD";
						_wp2 = _groupVeh addWaypoint [_posOrigin, 1];
						_wp2 setWaypointType "MOVE";
						_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
						[_groupVeh,1] setWaypointBehaviour "AWARE";
						}
					else
						{
						{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _groupVeh;
						if ((_typeVehX in vehFastRope) and ((count(garrison getVariable [_mrkDestination, []])) < 10)) then
							{
							//_grupo setVariable ["mrkAttack",_mrkDestination];
							[_veh,_grupo,_posDestination,_posOrigin,_groupVeh] spawn A3A_fnc_fastrope;
							}
						else
							{
							[_veh,_grupo,_mrkDestination,_mrkOrigin] spawn A3A_fnc_airdrop;
							}
						};
					};
				};
			};
		sleep 1;
		_pos = [_pos, 80,_ang] call BIS_fnc_relPos;
		_countX = _countX + 1;
		};
	_plane = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};
	if (_sideX == Occupants) then
		{
		if (((not(_mrkDestination in outposts)) and (not(_mrkDestination in seaports)) and (_mrkOrigin != "NATO_carrier")) or hasIFA) then
			{
			[_mrkOrigin,_mrkDestination,_sideX] spawn A3A_fnc_artillery;
			diag_log "Antistasi: Arty Spawned";
			if (([_plane] call A3A_fnc_vehAvailable) and (not(_mrkDestination in citiesX)) and _firstWave) then
				{
				sleep 60;
				_rnd = if (_mrkDestination in airportsX) then {round random 4} else {round random 2};
				private _bombOptions = if (napalmEnabled) then {["HE","CLUSTER","NAPALM"]} else {["HE","CLUSTER"]};
				for "_i" from 0 to _rnd do
					{
					if ([_plane] call A3A_fnc_vehAvailable) then
						{
						diag_log "Antistasi: Airstrike Spawned";
						if (_i == 0 && {_mrkDestination in airportsX}) then
							{
							_nul = [_mrkDestination,_sideX,"HE"] spawn A3A_fnc_airstrike;
							}
						else
							{
							_nul = [_mrkDestination,_sideX,selectRandom _bombOptions] spawn A3A_fnc_airstrike;
							};
						sleep 30;
						};
					};
				};
			};
		}
	else
		{
		if (((not(_mrkDestination in resourcesX)) and (not(_mrkDestination in seaports)) and (_mrkOrigin != "CSAT_carrier")) or hasIFA) then
			{
			if !(_posOriginLand isEqualTo []) then {[_posOriginLand,_mrkDestination,_sideX] spawn A3A_fnc_artillery} else {[_mrkOrigin,_mrkDestination,_sideX] spawn A3A_fnc_artillery};
			diag_log "Antistasi: Arty Spawned";
			if (([_plane] call A3A_fnc_vehAvailable) and (_firstWave)) then
				{
				sleep 60;
				_rnd = if (_mrkDestination in airportsX) then {if ({sidesX getVariable [_x,sideUnknown] == Invaders} count airportsX == 1) then {8} else {round random 4}} else {round random 2};
				private _bombOptions = if (napalmEnabled) then {["HE","CLUSTER","NAPALM"]} else {["HE","CLUSTER"]};
				for "_i" from 0 to _rnd do
					{
					if ([_plane] call A3A_fnc_vehAvailable) then
						{
						diag_log "Antistasi: Airstrike Spawned";
						if (_i == 0 && {_mrkDestination in airportsX}) then
							{
							_nul = [_mrkDestination,_sideX,"HE"] spawn A3A_fnc_airstrike;
							}
						else
							{
							_nul = [_posDestination,_sideX,selectRandom _bombOptions] spawn A3A_fnc_airstrike;
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
		["TaskSucceeded", ["", "Attack Destination Updated"]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
		["rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"CREATED"] call A3A_fnc_taskUpdate;
		};
	_solMax = round ((count _soldiers)*0.6);
	_waves = _waves -1;
	_firstWave = false;
	diag_log format ["%1: [Antistasi] | INFO | Reached end of spawning attack, wave %2. Vehicles: %3. Wave Units: %4. Total units: %5",servertime,_waves, count _vehiclesX, count _soldiers, count _soldiersTotal];
	if (sidesX getVariable [_mrkDestination,sideUnknown] != teamPlayer) then {_soldiers spawn A3A_fnc_remoteBattle};
	if (_sideX == Occupants) then
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= _solMax) or (time > _timeX) or (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants) or (({[_x,_mrkDestination] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_mrkDestination] call A3A_fnc_canConquer)} count allUnits))};
		if  ((({[_x,_mrkDestination] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_mrkDestination] call A3A_fnc_canConquer)} count allUnits)) or (sidesX getVariable [_mrkDestination,sideUnknown] == Occupants)) then
			{
			_waves = 0;
			if ((!(sidesX getVariable [_mrkDestination,sideUnknown] == Occupants)) and !(_mrkDestination in citiesX)) then {[Occupants,_mrkDestination] remoteExec ["A3A_fnc_markerChange",2]};
			["rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,"FAILED"] call A3A_fnc_taskUpdate;
			["rebelAttackPVP",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"SUCEEDED"] call A3A_fnc_taskUpdate;
			if (_mrkDestination in citiesX) then
				{
				[0,-100,_mrkDestination] remoteExec ["A3A_fnc_citySupportChange",2];
				["TaskFailed", ["", format ["%1 joined %2",[_mrkDestination, false] call A3A_fnc_location,nameOccupants]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
				sidesX setVariable [_mrkDestination,Occupants,true];
				[[-10, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
				_mrkD = format ["Dum%1",_mrkDestination];
				_mrkD setMarkerColor colorOccupants;
				garrison setVariable [_mrkDestination,[],true];
				};
			};
		sleep 10;
		if (!(sidesX getVariable [_mrkDestination,sideUnknown] == Occupants)) then
			{
			_timeX = time + 3600;
			if (sidesX getVariable [_mrkOrigin,sideUnknown] == Occupants) then
				{
				_killZones = killZones getVariable [_mrkOrigin,[]];
				_killZones append [_mrkDestination,_mrkDestination,_mrkDestination];
				killZones setVariable [_mrkOrigin,_killZones,true];
				};

			if ((_waves <= 0) or (!(sidesX getVariable [_mrkOrigin,sideUnknown] == Occupants))) then
				{
				{_x doMove _posOrigin} forEach _soldiersTotal;
				if (_waves <= 0) then {[_mrkDestination,_mrkOrigin] call A3A_fnc_minefieldAAF};

				["rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,"SUCCEEDED"] call A3A_fnc_taskUpdate;
				["rebelAttackPVP",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"FAILED"] call A3A_fnc_taskUpdate;
				};
			};
		}
	else
		{
		waitUntil {sleep 5; (({!([_x] call A3A_fnc_canFight)} count _soldiers) >= _solMax) or (time > _timeX) or (sidesX getVariable [_mrkDestination,sideUnknown] == Invaders) or (({[_x,_mrkDestination] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_mrkDestination] call A3A_fnc_canConquer)} count allUnits))};
		//diag_log format ["1:%1,2:%2,3:%3,4:%4",(({!([_x] call A3A_fnc_canFight)} count _soldiers) >= _solMax),(time > _timeX),(sidesX getVariable [_mrkDestination,sideUnknown] == Invaders),(({[_x,_mrkDestination] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_mrkDestination] call A3A_fnc_canConquer)} count allUnits))];
		if  ((({[_x,_mrkDestination] call A3A_fnc_canConquer} count _soldiers) > 3*({(side _x != _sideX) and (side _x != civilian) and ([_x,_mrkDestination] call A3A_fnc_canConquer)} count allUnits)) or (sidesX getVariable [_mrkDestination,sideUnknown] == Invaders))  then
			{
			_waves = 0;
			if (not(sidesX getVariable [_mrkDestination,sideUnknown] == Invaders)) then {[Invaders,_mrkDestination] remoteExec ["A3A_fnc_markerChange",2]};
			["rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,"FAILED"] call A3A_fnc_taskUpdate;
			["rebelAttackPVP",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"SUCCEEDED"] call A3A_fnc_taskUpdate;
			};
		sleep 10;
		if (!(sidesX getVariable [_mrkDestination,sideUnknown] == Invaders)) then
			{
			_timeX = time + 3600;
			diag_log format ["%1: [Antistasi] | INFO | Wave number %2 on wavedCA lost",servertime,_waves];
			if (sidesX getVariable [_mrkOrigin,sideUnknown] == Invaders) then
				{
				_killZones = killZones getVariable [_mrkOrigin,[]];
				_killZones append [_mrkDestination,_mrkDestination,_mrkDestination];
				killZones setVariable [_mrkOrigin,_killZones,true];
				};

			if ((_waves <= 0) or (sidesX getVariable [_mrkOrigin,sideUnknown] != Invaders)) then
				{
				{_x doMove _posOrigin} forEach _soldiersTotal;
				if (_waves <= 0) then {[_mrkDestination,_mrkOrigin] call A3A_fnc_minefieldAAF};
				["rebelAttack",[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],format ["%1 Attack",_nameENY],_mrkOrigin],getMarkerPos _mrkOrigin,"SUCCEEDED"] call A3A_fnc_taskUpdate;
				["rebelAttackPVP",[format ["We are attacking an %2 from the %1. Help the operation if you can",_nameOrigin,_nameDest],format ["%1 Attack",_nameENY],_mrkDestination],getMarkerPos _mrkDestination,"FAILED"] call A3A_fnc_taskUpdate;
				};
			};
		};
	};





//_tsk = ["rebelAttack",_sideTsk,[format ["%2 Is attacking from the %1. Intercept them or we may loose a sector",_nameOrigin,_nameENY],"AAF Attack",_mrkOrigin],getMarkerPos _mrkOrigin,"FAILED",10,true,true,"Defend"] call BIS_fnc_setTask;
if (_isSDK) then
	{
	if (!(sidesX getVariable [_mrkDestination,sideUnknown] == teamPlayer)) then
		{
		[-10,theBoss] call A3A_fnc_playerScoreAdd;
		}
	else
		{
		{if (isPlayer _x) then {[10,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_posDestination,teamPlayer] call A3A_fnc_distanceUnits);
		[5,theBoss] call A3A_fnc_playerScoreAdd;
		};
	};
diag_log "Antistasi: Reached end of winning conditions. Starting despawn";
sleep 30;
_nul = [0,"rebelAttack"] spawn A3A_fnc_deleteTask;
_nul = [0,"rebelAttackPVP"] spawn A3A_fnc_deleteTask;

[_mrkOrigin,60] call A3A_fnc_addTimeForIdle;
bigAttackInProgress = false; publicVariable "bigAttackInProgress";
//forcedSpawn = forcedSpawn - _forced; publicVariable "forcedSpawn";
forcedSpawn = forcedSpawn - [_mrkDestination]; publicVariable "forcedSpawn";
[3600, _sideX] remoteExec ["A3A_fnc_timingCA",2];

{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _pilots = _pilots - [_x]};
} forEach _pilots;
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x};
} forEach _vehiclesX;
{
_veh = _x;
if (!([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)) then {deleteVehicle _x; _soldiersTotal = _soldiersTotal - [_x]};
} forEach _soldiersTotal;

if (count _pilots > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _pilots;
	};

if (count _soldiersTotal > 0) then
	{
	{
	[_x] spawn
		{
		private ["_veh"];
		_veh = _this select 0;
		waitUntil {sleep 1; !([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits) and (({_x distance _veh <= distanceSPWN} count (allPlayers - (entities "HeadlessClient_F"))) == 0)};
		deleteVehicle _veh;
		};
	} forEach _soldiersTotal;
	};


{deleteGroup _x} forEach _groups;
diag_log "Antistasi Waved CA: Despawn completed";
