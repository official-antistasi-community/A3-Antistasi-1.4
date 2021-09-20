/*
    A3A_fnc_vehicleConvoyTravel
    Make vehicle move down route, ignoring enemies and following other convoy vehicles

Parameters:
    <OBJECT> Vehicle.
    <ARRAY> Array of AGL(?) positions from start to end position.
    <ARRAY> Array of vehicles in convoy, first is lead vehicle. Note: Shared between scripts.
    <NUMBER> Maximum convoy (lead) speed in km/h.
    <BOOLEAN> True if vehicle is critical (shouldn't give up even if timed out)
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_vehicle", "_route", "_convoy", "_maxSpeed", ["_critical", false]];
private _filename = "fn_vehicleConvoyTravel";

// Handle some broken input errors
private _error = call {
    if (count _route == 0) exitWith { "No route specified" };
    if !(alive _vehicle) exitWith { "Dead or missing vehicle input" };
    if !(alive driver _vehicle) exitWith { "Dead or missing driver in vehicle" };
};
if (!isNil "_error") exitWith {
    _convoy deleteAt (_convoy find _vehicle);
    Error(_error);
};

// Split driver from crew and make them ignore enemies
private _driverGroup = group driver _vehicle;
private _crewGroup = grpNull;
if (count units _driverGroup > 1) then {
    _crewGroup = createGroup (side _driverGroup);
    (units _driverGroup - [driver _vehicle]) joinSilent _crewGroup;
};
_driverGroup setBehaviour "CARELESS";
_vehicle setEffectiveCommander (driver _vehicle);

// Navigation setup
private _destination = _route select (count _route - 1);
private _accuracy = 50;
private _currentNode = 0;
private _nextPos = _route select _currentNode;
private _waypoint = _driverGroup addWaypoint [ATLToASL _nextPos, -1, 0];
_driverGroup setCurrentWaypoint _waypoint;
private _timeout = time + (_vehicle distance2d _nextPos);

while {true} do
{
    sleep 0.5;
    private _vehIndex = _convoy find _vehicle;

    // Exit conditions
    if (!canMove _vehicle || !alive driver _vehicle || { lifestate driver _vehicle == "INCAPACITATED" }) exitWith {
        ServerInfo("Vehicle or driver died during travel, abandoning");
    };
    if (_vehIndex == -1) exitWith {};				// external abort
    if (_vehicle distance _destination < 100) exitWith {
        ServerDebug("Vehicle arrived at destination");
    };

    // Transition to next waypoint if close
    while {_vehicle distance _nextPos < _accuracy} do
    {
        _currentNode = _currentNode + 1;
        _nextPos = _route select _currentNode;
        _waypoint setWaypointPosition [ATLToASL _nextPos, -1];
        _driverGroup setCurrentWaypoint _waypoint;
        _timeout = time + (_vehicle distance2d _nextPos);
    };
    if (!_critical && time > _timeout) exitWith {
        ServerInfo("Vehicle stuck during travel, abandoning");
    };

    // Hack to work around Arma bugging out and refusing to path
    // Moves vehicle 1m forwards and tries the same waypoint again
    if (unitReady driver _vehicle) then {
        _vehicle setPosWorld (getPosWorld _vehicle vectorAdd vectorDir _vehicle);
        _driverGroup setCurrentWaypoint _waypoint;
    };

    // Adjust speed by distance to vehicle in front
    if (_vehIndex == 0) then { _vehicle limitSpeed _maxSpeed } else
    {
        private _followVeh = _convoy select (_vehIndex - 1);
        private _dist = _vehicle distance _followVeh;

        // prevent some off-road passing
        if (_dist < 50) then {
            private _followDir = (getPos _vehicle) vectorFromTo (getPos _followVeh);
            private _targDir = (getpos _vehicle) vectorFromTo _nextPos;
            if (_followDir vectorDotProduct _targDir <= 0) then {_dist = 0};
        };

        private _speed = if (_dist < 30) then { linearConversion [15,30,_dist,0.01,_maxSpeed,true] }
            else { linearConversion [30,60,_dist,_maxSpeed,2*_maxSpeed,true] };
        _vehicle limitSpeed _speed;
        if (_dist < 30) then { _timeout = time + (_vehicle distance2d _nextPos) };

        //diag_log format ["Vehicle %1, follow %2, dist %3, speed %4", _vehicle, _followVeh, _dist, _speed];
    };

};

// Remove from convoy array
_convoy deleteAt (_convoy find _vehicle);

// Merge driver/crew back together
if (!isNull _driverGroup && !isNull _crewGroup) then {
    (units _crewGroup) joinSilent _driverGroup;
    _driverGroup setBehaviour "AWARE";
};
