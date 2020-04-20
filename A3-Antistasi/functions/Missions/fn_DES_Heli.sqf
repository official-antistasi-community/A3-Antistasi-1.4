//Mission: Destroy the helicopter
if (!isServer and hasInterface) exitWith{};

private ["_posCrash","_markerX","_positionX","_mrkFinal","_typeVehX","_crater","_heli","_vehiclesX","_soldiers","_groups","_unit","_roads","_road","_vehicle","_veh","_typeGroup","_tsk","_smokeX","_emitterArray","_countX"];

_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
private _posCrashOrig = [];
_positionX = getMarkerPos _markerX;
_sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
_posHQ = getMarkerPos respawnTeamPlayer;
_timeLimit = 120;
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_ang = random 360;
_countX = 0;
_dist = if (_difficultX) then {2000} else {3000};
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Location: %2, Hardmode: %3, Controlling Side: %4",servertime,_markerX,_difficultX,_sideX];
while {true} do
	{
	_posCrashOrig = _positionX getPos [_dist,_ang];
	if ((!surfaceIsWater _posCrashOrig) and (_posCrashOrig distance _posHQ < 4000)) exitWith {};
	_ang = _ang + 1;
	_countX = _countX + 1;
	if (_countX > 360) then
		{
		_countX = 0;
		_dist = _dist - 500;
		};
	};

_typeVehH = if (_sideX == Occupants) then {selectRandom (vehNATOTransportHelis + vehNATOAttackHelis)} else {selectRandom (vehCSATAttackHelis + vehCSATTransportHelis)};

_posCrash = [_posCrashOrig, 0, 1000, 0, 0, 0.1] call BIS_fnc_findSafePos;
_posCrash = _posCrash findEmptyPosition [0,100,_typeVehH];

if (count _posCrash == 0) then {_posCrash = _posCrashOrig};//if no pos use _posCrashOrig
if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])} else {{[_x,true] remoteExec ["hideObjectGlobal",2]} foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])};//clears area of trees and bushes
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Crash Location: %2, Air Vehicle: %3",servertime,_posCrash,_typeVehH];
_nameXbase = [_markerX] call A3A_fnc_localizar;

_vehiclesX = [];
_soldiers = [];
_groups = [];

_crater = "CraterLong" createVehicle _posCrash;
//_heli = _typeVehH createVehicle [_posCrash select 0, _posCrash select 1, 0.5];
_heli = createVehicle [_typeVehH, [_posCrash select 0, _posCrash select 1, 0.9], [], 0, "CAN_COLLIDE"];
//_heli allowDamage false;
//_heli attachTo [_crater,[0,0,1.5]];
_smokeX = "test_EmptyObjectForSmoke" createVehicle _posCrash; _smokeX attachTo [_heli,[0,1.5,-1]];
_heli setDamage 0.8;
//_heli lock 2;
_vehiclesX append [_heli,_crater];

_posCrashMrk = _heli getRelPos [random 500,random 360];
_mrkFinal = createMarker [format ["DES%1", random 100],_posCrashMrk];
_mrkFinal setMarkerShape "ICON";

diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Creating Tasks",servertime];
[[teamPlayer,civilian],"DES",[format ["We have downed air vehicle. There is a good chance to destroy or capture it before it is recovered. Do it before a recovery team from %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
missionsX pushBack ["DES","CREATED"]; publicVariable "missionsX";

//convoy spawn

_radiusX = 100;

while {true} do
	{
	_roads = _positionX nearRoads _radiusX;
	if (count _roads > 0) exitWith {};
	_radiusX = _radiusX + 50;
	};

_road = _roads select 0;
_typeVehX = if (_sideX == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};
_vehicle = [position _road, 0,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
[_veh] call A3A_fnc_AIVEHinit;
[_veh,"Escort"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = crew _veh;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
_groupVeh = _vehicle select 2;
_soldiers append _vehCrew;
_groups pushBack _groupVeh;
_vehiclesX pushBack _veh;
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Crash Location: %2, Lite Vehicle: %3",servertime,_posCrash,_typeVehX];
sleep 1;
_typeGroup = if (_sideX == Occupants) then {groupsNATOSentry} else {groupsCSATSentry};
_groupX = [_positionX, _sideX, _typeGroup] call A3A_fnc_spawnGroup;

{_x assignAsCargo _veh; _x moveInCargo _veh; _soldiers pushBack _x; [_x] join _groupVeh; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
deleteGroup _groupX;

_Vwp0 = _groupVeh addWaypoint [_posCrash, 0];
_Vwp0 setWaypointType "GETOUT";
_Vwp0 setWaypointBehaviour "SAFE";
_Gwp0 = _groupX addWaypoint [_posCrash, 0];
_Gwp0 setWaypointType "GETOUT";
_Vwp0 synchronizeWaypoint [_Gwp0];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Placed Group: %2 in Lite Vehicle and set waypoint %3",servertime,_typeGroup,_posCrash];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting for 5 seconds",servertime];

sleep 8;
_typeVehX = if (_sideX == Occupants) then {vehNATORepairTruck} else {vehCSATRepairTruck};//vehCSATRepairTruck is only with rhs, not defined in unstable templates
_vehicleT = [position _road, 0,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
_vehT = _vehicleT select 0;
[_vehT] call A3A_fnc_AIVEHinit;
[_vehT,"Repair Truck"] spawn A3A_fnc_inmuneConvoy;
_groupVehT = _vehicleT select 2;
_vehCrewT = units _groupVehT;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrewT;
_soldiers = _soldiers + _vehCrewT;
_groups pushBack _groupVehT;
_vehiclesX pushBack _vehT;

_Vwp0 = _groupVehT addWaypoint [_posCrash, 0];
_Vwp0 setWaypointType "MOVE";
_Vwp0 setWaypointBehaviour "SAFE";
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Transport Vehicle: %2, Crew: %3, Waypoint: %4",servertime,_typeVehX,_vehCrewT,_posCrash];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting until %2 is destroyed or %3 has reached %2, or mission expires at: %4",servertime,_heli,_vehT,_dateLimitNum];

_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _posCrash];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [20,20];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
if (!debug) then {_mrk setMarkerAlphaLocal 0};

private ["_groupVehHT", "_groupHT", "_gp", "_Gwp1", "_Gwp2", "_vehHT"];
if ((_typeVehH in vehNATOTransportHelis)||(_typeVehH in vehCSATTransportHelis)) then {
	if !(_typeVehH == vehNATOPatrolHeli) then {
		_typeGroup = if (_sideX == Occupants) then {NATOSquad} else {CSATSquad};
		_groupHT = [_posCrash, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
		sleep 1;
		{_soldiers pushBack _x; [_x] call A3A_fnc_NATOinit} forEach units _groupHT;
		_gp = createGuardedPoint [_sideX, _posCrash, -1, _heli];
		_Gwp1 = _groupHT addWaypoint [_posCrash, 5];
		_Gwp1 setWaypointType "GUARD";
		_Gwp1 setWaypointBehaviour "SAFE";
	};
} else {
	_typeVeh = if (_sideX == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};
	_posVehHT = _posCrash findEmptyPosition [0, 30 ,_typeVeh];
	_vehicle = [_posVehHT , 0,_typeVeh, _sideX] call bis_fnc_spawnvehicle;
	_vehHT = _vehicle select 0;
	[_vehHT] call A3A_fnc_AIVEHinit;
	_vehCrewHT = _vehicle select 1;
	{[_x] call A3A_fnc_NATOinit} forEach _vehCrewHT;
	_groupVehHT = _vehicle select 2;
	_soldiers append _vehCrewHT;
	_groups pushBack _groupVehHT;
	_vehiclesX pushBack _vehHT;
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Crash Location: %2, Lite Vehicle: %3",servertime,_posVehHT,_typeVeh];
	sleep 1;
	_typeGroup = if (_sideX == Occupants) then {NATOSquad} else {CSATSquad};
	_groupHT = [_posCrash, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
	{_soldiers pushBack _x; [_x] join _groupVehHT; [_x] call A3A_fnc_NATOinit} forEach units _groupHT;
	deleteGroup _groupHT;
	_Gwp1 = _groupVehHT addWaypoint [_posVehHT, 0];
	_Gwp1 setWaypointType "GETOUT";
	_Gwp1 setWaypointBehaviour "SAFE";
	sleep 5;//let leder dismount
	deleteWaypoint [_groupVehHT, 0];
	_gp = createGuardedPoint [_sideX, _posVehHT, -1, _heli];
	_Gwp1 = _groupVehHT addWaypoint [_posVehHT, 5];
	_Gwp1 setWaypointType "GUARD";
	_Gwp1 setWaypointBehaviour "SAFE";
};

_typeGroup = if (_sideX == Occupants) then {[NATOPilot, NATOPilot]} else {[CSATPilot, CSATPilot]};
_pilots = [_posCrash,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
sleep 1;
{[_x,""] call A3A_fnc_NATOinit} forEach units _pilots;
_soldiers append units _pilots;
_groups pushBack _pilots;
_Vwp1 = _pilots addWaypoint [getPos _heli, 0];
_Vwp1 setWaypointType "GUARD";
_Vwp1 setWaypointBehaviour "SAFE";

waitUntil
{
	sleep 1;
	(not alive _heli) ||
	{(_vehT distance _heli < 50) ||
	((_heli distance _posHQ) < 100) ||
	{(dateToNumber date > _dateLimitNum)}}
};

if (_vehT distance _heli < 50) then
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Repair %2 has reached %3, starting repair...",servertime, _vehT, _heli];
	_vehT doMove position _heli;
	sleep 10; //time to repair
	if (alive _heli) then
		{
		_heli setDamage 0.2;
		_emitterArray = _smokeX getVariable "effects";
		{deleteVehicle _x} forEach _emitterArray;
		deleteVehicle _smokeX;
		deleteVehicle _crater;
		};

	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | %2 has repaired %3, %4 is heading back to %5",servertime,_sideX,_heli,_vehT,_positionX];
	_Vwp0 = _groupVehT addWaypoint [_positionX, 1];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";

	_Vwp0 = _groupVeh addWaypoint [_posCrash, 0];
	_Vwp0 setWaypointType "GETIN";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Gwp0 = _groupX addWaypoint [_posCrash, 0];
	_Gwp0 setWaypointType "GETIN";
	_Vwp0 synchronizeWaypoint [_Gwp0];

	_Vwp0 = _groupVeh addWaypoint [_positionX, 2];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";

	sleep 10;
	deleteVehicle _gp;
	deleteWaypoint [_pilots, 1];
	_Vwp1 = _pilots addWaypoint [getPos _heli, 0];
	_Vwp1 setWaypointType "MOVE";
	_Vwp1 setWaypointBehaviour "Aware";
	_Vwp1 = _pilots addWaypoint [getPos _heli, 1];
	_Vwp1 setWaypointType "GETIN NEAREST";
	_Vwp1 setWaypointBehaviour "SAFE";

	if ((_typeVehH in vehNATOTransportHelis)||(_typeVehH in vehCSATTransportHelis)) then {
		if !(_typeVehH == vehNATOPatrolHeli) then {
		_i = (count (waypoints _groupHT));
		for [0, _i, 1] do {
			deleteWaypoint [_groupHT, (_i - 1)];
		};
		_Gwp2 = _groupHT addWaypoint [getPos _heli, 0];
		_Gwp2 setWaypointType "GETIN NEAREST";
		[_pilots, 1] synchronizeWaypoint [[_groupHT, 0]];
		};
	} else {
	_i = (count (waypoints _groupVehHT));
	for [0, _i, 1] do {
		deleteWaypoint [_groupVehHT, (_i - 1)];
	};
	_Gwp1 = _groupHT addWaypoint [getPos _vehHT, 0];
	_Gwp1 setWaypointType "GETIN NEAREST";


	_Gwp1 = _groupVehHT addWaypoint [_positionX, 1];
	_Gwp1 setWaypointType "MOVE";
	_Gwp1 setWaypointBehaviour "SAFE";
	};

	_Vwp1 = _pilots addWaypoint [_positionX, 2];
	_Vwp1 setWaypointType "MOVE";
	_Vwp1 setWaypointBehaviour "SAFE";
};

diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting until %2 reaches origin or rebel base, gets destroyed or timer expires",servertime, _heli];
waitUntil
{
	sleep 1;
	(not alive _heli) ||
	((_heli distance _positionX) < 300) ||
	((_heli distance _posHQ) < 100) ||
	(dateToNumber date > _dateLimitNum)
};

_bonus = if (_difficultX) then {2} else {1};

if ((not alive _heli) || (_heli distance _posHQ < 100) ) then
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | %2 was destroyed or captured",servertime, _heli];
	["DES",[format ["We have downed air vehicle. It is a good chance to destroy it before it is recovered. Do it before a recovery team from the %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	if (typeOf _heli in vehCSATAir) then {[0,3] remoteExec ["A3A_fnc_prestige",2]} else {[3,0] remoteExec ["A3A_fnc_prestige",2]};
	[1800*_bonus] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _heli < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Air Vehicle was successfully recovered, mission completing",servertime];
	["DES",[format ["We have downed air vehicle. It is a good chance to destroy it before it is recovered. Do it before a recovery team from the %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
	[-600*_bonus] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

if (!isNull _smokeX) then
	{
	_emitterArray = _smokeX getVariable "effects";
	{deleteVehicle _x} forEach _emitterArray;
	deleteVehicle _smokeX;
	};

_nul = [1200,"DES"] spawn A3A_fnc_deleteTask;
deleteMarker _mrkFinal;
deleteMarker _mrk;
{
waitUntil {sleep 1;(!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits))};
deleteVehicle _x} forEach _vehiclesX;
{deleteVehicle _x} forEach _soldiers;
{deleteGroup _x} forEach _groups;
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | HELI MISSION COMPLETE",servertime];

/*Notes
Repair truck and escort. [done]
	- repair truck and escort spawn at airbase (passed marker)
	- moves to crash site, wait for repair to complet
	- returns to airbase
heli spawn and repair. [done]
	- heli spawns at given pos somewhere near the airbase
		- damage disabled
		- heli is locked
		- damage is set to 0.9
	- crater and smoke spawns at same position
	- heli is atached to creater, smoke to heli
	- on first repair action from repair truck, heli is "dug out"
		- smoke and crater deleted
		- heli is replaced to get it above ground
		- heli is unlocked
	- on second repair action from repair truck, heli damage is set to 0.3
heli crew and guard. [WIP]
	-Spawn group that consist of crew and passangers [done]
	-waypoints to mount in helicopter and fly back to base to despawn, after repair is done. [TBD]
heli makeshift cover. [WIP]
	-cover to be used by crew and guard, surounding the helicopter crash site. [TBD]
