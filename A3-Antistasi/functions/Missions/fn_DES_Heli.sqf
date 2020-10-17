//Mission: Destroy the helicopter
if (!isServer and hasInterface) exitWith{};

private _missionOrigin = _this select 0;
private _fileName = "fn_DES_Heli";
private _difficult = if (random 10 < tierWar) then {true} else {false};
private _bonus = if (_difficult) then {2} else {1};
private _missionOriginPos = getMarkerPos _missionOrigin;
private _sideX = if (sidesX getVariable [_missionOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
[3, format ["Origin: %1, Hardmode: %2, Controlling Side: %3", _missionOrigin, _difficult, _sideX], _filename] call A3A_fnc_log;

//finding crash position
private _ang = random 360;
private _countX = 0;
private _dist = if (_difficult) then {2000} else {3000};
private _posCrashOrigin = [];
while {true} do {
	_posCrashOrigin = _missionOriginPos getPos [_dist,_ang];
	if ((!surfaceIsWater _posCrashOrigin) and (_posCrashOrigin distance (getMarkerPos respawnTeamPlayer) < 4000) and (_posCrashOrigin distance (getMarkerPos respawnTeamPlayer) > 1000)) exitWith {};
	_ang = _ang + 1;
	_countX = _countX + 1;
	if (_countX > 360) then
		{
		_countX = 0;
		_dist = _dist - 500;
		};
};

// selecting Aircraft
private _heliPool =if (_sideX == Occupants) then {vehNATOTransportHelis + vehNATOAttackHelis} else {vehCSATAttackHelis + vehCSATTransportHelis};
private _typeVehH = selectRandom (_heliPool select {_x isKindOf "Helicopter"});
if (isNil "_typeVehH") exitWith {
	["DES"] remoteExecCall ["A3A_fnc_missionRequest",2];
	[1, format ["No aircrafts in arrays VehNatoTransportHelis, VehNatoAttackHelis or VehCSATTransportHelis, VehCSATAttackHelis. Reselecting DES mission"], _filename] call A3A_fnc_log;
};

//refining crash spawn position, to avoid exploding on spawn or "Armaing" during mission
private _flatPos = [_posCrashOrigin, 0, 1000, 0, 0, 0.1] call BIS_fnc_findSafePos;
private _posCrash = _flatPos findEmptyPosition [0,100,_typeVehH];
if (count _posCrash == 0) then {_posCrash = _posCrashOrigin};//if no pos use _posCrashOrigin
if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])} else {{[_x,true] remoteExec ["hideObjectGlobal",2]} foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])};//clears area of trees and bushes
[3, format ["Crash Location: %1, Aircraft: %2", _posCrash, _typeVehH], _filename] call A3A_fnc_log;

//creating array for cleanup
private _vehicles = [];
private _groups = [];

//createing crashed helicopter
private _crater = "CraterLong" createVehicle _posCrash;
private _heli = createVehicle [_typeVehH, [_posCrash select 0, _posCrash select 1, 0.9], [], 0, "CAN_COLLIDE"];
private _smoke = "test_EmptyObjectForSmoke" createVehicle _posCrash; _smoke attachTo [_heli,[0,1.5,-1]];
_heli setDamage 0.8;
_vehicles append [_heli,_crater];

//creating cover
private _typeVeh = "Land_BagFence_01_long_green_F";
private _counterLimit = round (random[2,3,4]*_bonus);
private _counter = 0;
private _angle = random 360;
while {_counter != _counterLimit} do {
	_counter = _counter + 1;
	_angle = _angle + 45 + round random 90;
	private _pos = _posCrash getPos [10,_angle];
	if !(isOnRoad _pos) then {
	private _cov = _typeVeh createVehicle _pos;
	private _dir = _posCrash getDir _pos;
	_cov setDir _dir;
	_vehicles pushBack _cov;
	} else {_counter = _counter -1};
};

//creating mission marker near crash site
private _posCrashMrk = _heli getRelPos [random 500,random 360];
private _taskMrk = createMarker [format ["DES%1", random 100],_posCrashMrk];
_taskMrk setMarkerShape "ICON";

//finding timelimit for mission
private _timeLimit = 120;
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;

//creating mission
[2, format ["Creating Helicopter Down mission"], _filename] call A3A_fnc_log;
private _location = [_missionOrigin] call A3A_fnc_localizar;
private _text = format ["We have downed a helicopter. There is a good chance to destroy it before it is recovered. Do it before a recovery team from %1 reaches the crash site. MOVE QUICKLY",_location];
[[teamPlayer,civilian],"DES",[_text,"Downed Heli",_taskMrk],_posCrashMrk,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
missionsX pushBack ["DES","CREATED"]; publicVariable "missionsX";

////////////////
//convoy spawn//
////////////////

//finding road
private _radiusX = 100;
private _roads = [];
while {true} do {
	_roads = _missionOriginPos nearRoads _radiusX;
	if (count _roads > 1) exitWith {};
	_radiusX = _radiusX + 50;
};
private _roadE = _roads select 1;
private _roadR = _roads select 0;
sleep 1;

//Spawning escort
 _typeVeh = if (_sideX == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};
private _vehicleDataE = [position _roadE, 0,_typeVeh, _sideX] call bis_fnc_spawnvehicle;
private _vehE = _vehicleDataE select 0;
_vehE limitSpeed 50;
[_vehE,"Escort"] spawn A3A_fnc_inmuneConvoy;
private _vehCrew = crew _vehE;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_vehE, _sideX] call A3A_fnc_AIVEHinit;
private _groupVeh = _vehicleDataE select 2;
_groups pushBack _groupVeh;
_vehicles pushBack _vehE;

[3, format ["Crash Location: %1, Lite Vehicle: %2", _posCrash, _typeVeh], _filename] call A3A_fnc_log;

//spawning escort inf
private _typeGroup = if (_sideX == Occupants) then {groupsNATOSentry} else {groupsCSATSentry};
private _groupX = [_missionOriginPos, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
{_x assignAsCargo _vehE; _x moveInCargo _vehE; [_x] join _groupVeh; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
deleteGroup _groupX;

//moving to crash site
private _escortWP = _groupVeh addWaypoint [_posCrash, 0];
_escortWP setWaypointType "GETOUT";
_escortWP setWaypointBehaviour "SAFE";
[3, format ["Placed Group: %1 in Lite Vehicle and set waypoint %2", _typeGroup, _posCrash], _filename] call A3A_fnc_log;

//creating repair vehicle
_typeVeh = if (_sideX == Occupants) then {vehNATORepairTruck} else {vehCSATRepairTruck};
private _vehicleDataR = [position _roadR, 0,_typeVeh, _sideX] call bis_fnc_spawnvehicle;
private _vehR = _vehicleDataR select 0;
_vehR limitSpeed 50;
[_vehR, _sideX] call A3A_fnc_AIVEHinit;
sleep 1;
[_vehR,"Repair Truck"] spawn A3A_fnc_inmuneConvoy;
private _groupVehR = _vehicleDataR select 2;
private _vehCrewR = units _groupVehR;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrewR;
_groups pushBack _groupVehR;
_vehicles pushBack _vehR;

//moving to crash site
_reapirTruckWP = _groupVehR addWaypoint [_posCrash, 0];
_reapirTruckWP setWaypointType "MOVE";
_reapirTruckWP setWaypointBehaviour "SAFE";
[3, format ["Transport Vehicle: %1, Crew: %2, Waypoint: %3", _typeVeh, _vehCrewR, _posCrash], _filename] call A3A_fnc_log;
[3, format ["Waiting until %1 is destroyed or %2 has reached %1, or mission expires at: %3", _heli, _vehR, _dateLimit], _filename] call A3A_fnc_log;

///////////////////////////
//Helicopter Crew & Guard//
///////////////////////////

//creating local for spawning heli crew/cuard
_mrkCrash = createMarkerLocal [format ["%1patrolarea", floor random 100], _posCrash];
_mrkCrash setMarkerShapeLocal "RECTANGLE";
_mrkCrash setMarkerSizeLocal [20,20];
_mrkCrash setMarkerTypeLocal "hd_warning";
_mrkCrash setMarkerColorLocal "ColorRed";
_mrkCrash setMarkerBrushLocal "DiagGrid";
if (!debug) then {_mrkCrash setMarkerAlphaLocal 0};

//creating guard
private ["_guard", "_guardWP", "_vehGuard"];
_typeGroup = if (_sideX == Occupants) then {NATOSquad} else {CSATSquad};
//if not patrol heli
if !(_typeVehH == vehNATOPatrolHeli) then {
	//spawning guard inf
	_guard = [_posCrash, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
	{[_x] call A3A_fnc_NATOinit} forEach units _guard;
	_groups pushBack _guard;

	//tell guard group to guard heli
	_guardWP = [_guard, _posCrash, 10] call BIS_fnc_taskPatrol;

	[3, format ["Location: %1, Guard Squad spawned", _posCrash], _filename] call A3A_fnc_log;
	if (_typeVehH in (vehNATOAttackHelis + vehCSATAttackHelis)) then {
		//if attack helicopter
		//creating transport vehicle
		_typeVeh = if (_sideX == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		private _posVehHT = _posCrash findEmptyPosition [15, 30 ,_typeVeh];
		if (_posVehHT isEqualTo []) then {_posVehHT = _posCrash findEmptyPosition [15, 100 ,_typeVeh]}; //if it fails to find a pos expand and try again
		_vehGuard = _typeVeh createVehicle _posVehHT;
		[_vehGuard, _sideX] call A3A_fnc_AIVEHinit;
		_vehicles pushBack _vehGuard;
	};
};

//spawning pilots
_typeGroup = if (_sideX == Occupants) then {[NATOPilot, NATOPilot]} else {[CSATPilot, CSATPilot]};
_pilots = [_posCrash,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
{[_x,""] call A3A_fnc_NATOinit} forEach units _pilots;
_groups pushBack _pilots;
[_heli, _sideX] call A3A_fnc_AIVEHinit;

//tell pilots to hide at heli
private _pilotsWP = _pilots addWaypoint [_posCrash, 0];
_pilotsWP setWaypointType "HOLD";
_pilotsWP setWaypointBehaviour "STEALTH";

[3, format ["Waiting until %1 reaches origin or rebel base, gets destroyed, timer expires at %3 or %2 reaches %1", _heli, _vehR, _dateLimit], _filename] call A3A_fnc_log;
waitUntil
{
	sleep 1;
	(not alive _heli) ||
	{(_vehR distance _heli < 50) ||
	((_heli distance (getMarkerPos respawnTeamPlayer)) < 100) &&
	isPlayer (driver _heli) ||
	{(dateToNumber date > _dateLimitNum)}}
};

//////////////////////
//EI Recovering Heli//
//////////////////////
if (_vehR distance _heli < 50) then
	{
	[3, format ["Repair %1 has reached %2, starting repair...", _vehR, _heli], _filename] call A3A_fnc_log;
	_vehR doMove position _heli;
	sleep 300; //time to repair
	if (alive _heli && alive _vehR && _vehR distance2D _heli < 50) then {
		//repair complete remove crater and fix helicopter
		_heli setDamage 0.2;
		_heli setFuel 0.4;
		private _emitterArray = _smoke getVariable "effects"; //get rid of smoke effects spawned by smoke obj & smoke obj
		{deleteVehicle _x} forEach _emitterArray;
		deleteVehicle _smoke;
		deleteVehicle _crater;

		[3, format ["%1 has repaired %2, %3 is heading back to %4", _sideX,_heli,_vehR,_missionOriginPos], _filename] call A3A_fnc_log;

		//Guards & pilots stop patrolling
		for "_i" from (count (waypoints _guard)) to 0 step -1 do {
			deleteWaypoint [_guard, _i];
		};
		for "_i" from (count (waypoints _pilots)) to 0 step -1 do {
			deleteWaypoint [_pilots, _i];
		};

		//Repair truck & escort RTB
		_reapirTruckWP = _groupVehR addWaypoint [_missionOriginPos, 1];
		_reapirTruckWP setWaypointType "MOVE";
		_reapirTruckWP setWaypointBehaviour "SAFE";

		_escortWP = _groupVeh addWaypoint [_posCrash, 0];
		_escortWP setWaypointType "GETIN";
		_escortWP setWaypointBehaviour "SAFE";

		_escortWP = _groupVeh addWaypoint [_missionOriginPos, 2];
		_escortWP setWaypointType "MOVE";
		_escortWP setWaypointBehaviour "SAFE";

		[3, format ["Pilots and Guard are RTB"], _filename] call A3A_fnc_log;

		_pilots addVehicle _heli;
		(units _pilots) orderGetIn true;
		sleep 1;
		private _notAlivePilots = true;
		{if ([_x] call A3A_fnc_canFight) exitWith {_notAlivePilots = false}}forEach units _pilots;


		if ((_typeVehH in vehNATOTransportHelis)||(_typeVehH in vehCSATTransportHelis)) then {
			if !(_typeVehH == vehNATOPatrolHeli) then {
				//guard move in back of heli, pilots wait for them to load
				if (_notAlivePilots) then {_guard addVehicle _heli} else {{_x assignAsCargo _heli}forEach units _guard};
				(units _guard) orderGetIn true;
				sleep 1;
			};
			if (_notAlivePilots && !(_typeVehH == vehNATOPatrolHeli)) then {
				_pilotsWP = _guard addWaypoint [_missionOriginPos, 3];
				_pilotsWP setWaypointType "MOVE";
				_pilotsWP setWaypointBehaviour "AWARE";
				_pilotsWP setWaypointSpeed "FULL";
			} else {
				_pilotsWP = _pilots addWaypoint [_missionOriginPos, 3];
				_pilotsWP setWaypointType "MOVE";
				_pilotsWP setWaypointBehaviour "AWARE";
				_pilotsWP setWaypointSpeed "FULL";
			};
		} else {
			//guard mount in own vehicle and RTB
			_guard addVehicle _vehGuard;
			if (_notAlivePilots) then {_guard addVehicle _heli};
			(units _guard) orderGetIn true;
			sleep 1;
			_guardWP = _guard addWaypoint [_missionOriginPos, 1];
			_guardWP setWaypointType "MOVE";
			_guardWP setWaypointBehaviour "AWARE";
			_guardWP setWaypointSpeed "FULL";
			_guard setCurrentWaypoint [_guard, 1];
			_pilotsWP = _pilots addWaypoint [_missionOriginPos, 3];
			_pilotsWP setWaypointType "MOVE";
			_pilotsWP setWaypointBehaviour "AWARE";
			_pilotsWP setWaypointSpeed "FULL";
		};
	};
};

////////////////
//Mission done//
////////////////
[3, format ["Waiting until %1 reaches origin or rebel base, gets destroyed or timer expires at %2", _heli, _dateLimit], _filename] call A3A_fnc_log;
waitUntil
{
	sleep 1;
	(not alive _heli) ||
	((_heli distance _missionOriginPos) < 300) &&
	!isPlayer (driver _heli) ||
	((_heli distance (getMarkerPos respawnTeamPlayer)) < 100) &&
	isPlayer (driver _heli) ||
	(dateToNumber date > _dateLimitNum)
};

//Reward & completing task
if ((not alive _heli) || (_heli distance (getMarkerPos respawnTeamPlayer) < 100) && isPlayer (driver _heli) ) then {
	if (alive _heli) then {
		[3, format ["%1 was captured", _heli], _filename] call A3A_fnc_log;
	} else {
		[3, format ["%1 was destroyed", _heli], _filename] call A3A_fnc_log;
	};
	["DES",[_text,"Downed Heli",_taskMrk],_posCrashMrk,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	[1800*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _heli < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	if (_typeVehH in (vehNATOAttackHelis + vehCSATAttackHelis)) then {[600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2]};
} else {
	[3, format ["%1 was successfully recovered by %2, mission failed", _heli, _sideX], _filename] call A3A_fnc_log;
	["DES",[_text,"Downed Heli",_taskMrk],_posCrashMrk,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
	[-600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	if (_typeVehH in (vehNATOAttackHelis + vehCSATAttackHelis)) then {[-600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2]};
};
[2, format ["Downed Heli mission completed"], _filename] call A3A_fnc_log;
////////////
//Clean up//
////////////
//get rid of smoke effects spawned by smoke obj & smoke obj, if still there
if (!isNull _smoke) then {
	private _emitterArray = _smoke getVariable "effects";
	{deleteVehicle _x} forEach _emitterArray;
	deleteVehicle _smoke;
};

//delete task and markers
_nul = [1200,"DES"] spawn A3A_fnc_deleteTask;
deleteMarker _taskMrk;
deleteMarker _mrkCrash;

//delete units, vehicles and groups
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
[3, format ["Downed Heli clean up complete"], _filename] call A3A_fnc_log;
