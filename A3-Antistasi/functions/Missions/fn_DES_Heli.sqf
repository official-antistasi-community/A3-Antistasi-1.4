//Mission: Destroy the helicopter
if (!isServer and hasInterface) exitWith{};

private ["_posCrash","_markerX","_positionX","_mrkFinal","_typeVehX","_effect","_heli","_vehiclesX","_soldiers","_groups","_unit","_roads","_road","_vehicle","_veh","_typeGroup","_tsk","_smokeX","_emitterArray","_countX"];

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

_typeVehX = if (_sideX == Occupants) then {selectRandom (vehNATOTransportHelis + vehNATOAttackHelis)} else {selectRandom (vehCSATAttackHelis + vehCSATTransportHelis)};

_posCrash = _posCrashOrig findEmptyPosition [0,100,_typeVehX];

if (count _posCrash == 0) then
	{
	if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [_posCrashOrig,["tree","bush"],50])} else {{[_x,true] remoteExec ["hideObjectGlobal",2]} foreach (nearestTerrainObjects [_posCrashOrig,["tree","bush"],50])};
	_posCrash = _posCrashOrig;
	};
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Crash Location: %2, Air Vehicle: %3",servertime,_posCrash,_typeVehX];
_nameXbase = [_markerX] call A3A_fnc_localizar;

_vehiclesX = [];
_soldiers = [];
_groups = [];

_effect = createVehicle ["CraterLong", _posCrash, [], 0, "CAN_COLLIDE"];
_heli = createVehicle [_typeVehX, _posCrash, [], 0, "CAN_COLLIDE"];
_heli attachTo [_effect,[0,0,1.5]];
_smokeX = "test_EmptyObjectForSmoke" createVehicle _posCrash; _smokeX attachTo [_heli,[0,1.5,-1]];
_heli setDamage 0.9;
_heli lock 2;
_vehiclesX append [_heli,_effect];

_posCrashMrk = _heli getRelPos [random 500,random 360];
_mrkFinal = createMarker [format ["DES%1", random 100],_posCrashMrk];
_mrkFinal setMarkerShape "ICON";

diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Creating Tasks",servertime];
[[teamPlayer,civilian],"DES",[format ["We have downed air vehicle. There is a good chance to destroy or capture it before it is recovered. Do it before a recovery team from %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
[[Occupants],"DES1",[format ["The rebels managed to shot down a helicopter. A recovery team departing from the %1 is inbound to recover it. Cover them while they perform the whole operation",_nameXbase],"Helicopter Down",_mrkFinal],_posCrash,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
missionsX pushBack ["DES","CREATED"]; publicVariable "missionsX";

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
//[_veh,"Escort"] spawn A3A_fnc_inmuneConvoy;
_vehCrew = _vehicle select 1;
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
_Vwp0 setWaypointType "TR UNLOAD";
_Vwp0 setWaypointBehaviour "SAFE";
_Gwp0 = _groupX addWaypoint [_posCrash, 0];
_Gwp0 setWaypointType "GETOUT";
_Vwp0 synchronizeWaypoint [_Gwp0];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Placed Group: %2 in Lite Vehicle and set waypoint %3",servertime,_typeGroup,_posCrash];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting for 15 seconds",servertime];

sleep 15;
_typeVehX = if (_sideX == Occupants) then {vehNATOCargoTrucks select 1} else {vehCSATTrucks select 0};
_vehicleT = [position _road, 0,_typeVehX, _sideX] call bis_fnc_spawnvehicle;
_vehT = _vehicleT select 0;
[_vehT] call A3A_fnc_AIVEHinit;

//[_vehT,"Recover Truck"] spawn A3A_fnc_inmuneConvoy;
_vehCrewT = _vehicle select 1;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrewT;
_groupVehT = _vehicleT select 2;
_soldiers = _soldiers + _vehCrewT;
_groups pushBack _groupVehT;
_vehiclesX pushBack _vehT;

_Vwp0 = _groupVehT addWaypoint [_posCrash, 0];
_Vwp0 setWaypointType "MOVE";
_Vwp0 setWaypointBehaviour "SAFE";
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Transport Vehicle: %2, Crew: %3, Waypoint: %4",servertime,_typeVehX,_vehCrewT,_posCrash];
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting until %2 is destroyed or has been recovered by %3, or mission expires at: %4",servertime,_heli,_vehT,_dateLimitNum];

waitUntil
{
	sleep 1;
	(not alive _heli) ||
	{(_vehT distance _heli < 50) ||
	{(dateToNumber date > _dateLimitNum)}}
};

if (_vehT distance _heli < 50) then
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Transport truck has reached the Air Asset, waiting 60 seconds...",servertime];
	_vehT doMove position _heli;
	sleep 60;
	if (alive _heli) then
		{
		diag_log format ["%1: [Antistasi] | INFO | DES_Heli | %2 has loaded %3 onto %4 and is head back to %5",servertime,_sideX,_heli,_vehT,_positionX];
		_heli attachTo [_vehT,[0,-3,2]];
		_emitterArray = _smokeX getVariable "effects";
		{deleteVehicle _x} forEach _emitterArray;
		deleteVehicle _smokeX;
		};

	_Vwp0 = _groupVehT addWaypoint [_positionX, 1];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";

	_Vwp0 = _groupVeh addWaypoint [_posCrash, 0];
	_Vwp0 setWaypointType "LOAD";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Gwp0 = _groupX addWaypoint [_posCrash, 0];
	_Gwp0 setWaypointType "GETIN";
	_Vwp0 synchronizeWaypoint [_Gwp0];

	_Vwp0 = _groupVeh addWaypoint [_positionX, 2];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";

	};

	_vehT addEventHandler
	[
		"GetIn",
		{
			params ["_vehicle", "_role", "_unit", "_turret"];
			if((side _unit) == teamPlayer) then
			{
				//Player entered the vehicle, mission won
				diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Truck was captured by player, mission completing",servertime];
				["DES", "SUCCEEDED"] call BIS_fnc_taskSetState
			};
		}
	];

diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Waiting until transport reaches origin, gets destroyed or timer expires",servertime];
waitUntil
{
	sleep 1;
	(not alive _heli) ||
	{(_vehT distance _positionX < 100) ||
	{("DES" call BIS_fnc_taskState == "SUCCEEDED") ||
	{(count (_vehicle getVariable ["SA_Tow_Ropes",[]]) > 0) ||
	{(dateToNumber date > _dateLimitNum)}}}}
};

_bonus = if (_difficultX) then {2} else {1};

if ((not alive _heli) || {((taskState "DES") == "SUCCEEDED") || {(count (_vehicle getVariable ["SA_Tow_Ropes",[]]) > 0)}}) then
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Air Vehicle was destroyed or truck captured, mission completing",servertime];
	["DES",[format ["We have downed air vehicle. It is a good chance to destroy it before it is recovered. Do it before a recovery team from the %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,"SUCCEEDED","Destroy"] call A3A_fnc_taskUpdate;
	[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
	if (typeOf _heli in vehCSATAir) then
    {
        [[0, 0], [15, 90]] remoteExec ["A3A_fnc_prestige",2]
    };
    if (typeOf _heli in vehNATOAir) then
    {
        [[15, 90], [0, 0]] remoteExec ["A3A_fnc_prestige",2]
    };
	[1800*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	{if (_x distance _heli < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	["DES1",[format ["The rebels managed to shot down a helicopter. A recovery team departing from the %1 is inbound to recover it. Cover them while they perform the whole operation",_nameXbase],"Helicopter Down",_mrkFinal],_posCrash,"FAILED","Defend"] call A3A_fnc_taskUpdate;
	}
else
	{
	diag_log format ["%1: [Antistasi] | INFO | DES_Heli | Air Vehicle was successfully recovered, mission completing",servertime];
	["DES",[format ["We have downed air vehicle. It is a good chance to destroy it before it is recovered. Do it before a recovery team from the %1 reaches the place. MOVE QUICKLY",_nameXbase],"Destroy Air",_mrkFinal],_posCrashMrk,"FAILED","Destroy"] call A3A_fnc_taskUpdate;
	["DES1",[format ["The rebels managed to shot down a helicopter. A recovery team departing from the %1 is inbound to recover it. Cover them while they perform the whole operation",_nameXbase],"Helicopter Down",_mrkFinal],_posCrash,"SUCCEEDED","Defend"] call A3A_fnc_taskUpdate;
	[-600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	};

if (!isNull _smokeX) then
	{
	_emitterArray = _smokeX getVariable "effects";
	{deleteVehicle _x} forEach _emitterArray;
	deleteVehicle _smokeX;
	};

_nul = [1200,"DES"] spawn A3A_fnc_deleteTask;
_nul = [0,"DES1"] spawn A3A_fnc_deleteTask;
deleteMarker _mrkFinal;
{
waitUntil {sleep 1;(!([distanceSPWN,1,_x,teamPlayer] call A3A_fnc_distanceUnits))};
deleteVehicle _x} forEach _vehiclesX;
{deleteVehicle _x} forEach _soldiers;
{deleteGroup _x} forEach _groups;
diag_log format ["%1: [Antistasi] | INFO | DES_Heli | HELI MISSION COMPLETE",servertime];
