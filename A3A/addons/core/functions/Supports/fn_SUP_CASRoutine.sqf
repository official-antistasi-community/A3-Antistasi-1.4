#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug_1("CASRoutine called with %1", _this);

params ["_suppData", "_resPool", "_airport", "_planeType", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

//Sleep to simulate preparation time
sleep _sleepTime;

private _spawnPos = (markerPos _airport);
private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];
_plane setDir (_spawnPos getDir _suppCenter);
_plane setPosATL (_spawnPos vectorAdd [0, 0, 1000]);
_plane setVelocityModelSpace [0, 150, 0];
_plane flyInHeight 500;
[_plane, _side, _resPool] call A3A_fnc_AIVehInit;
[_plane, "CAS"] call A3A_fnc_setPlaneLoadout;

private _group = [_side, _plane] call A3A_fnc_createVehicleCrew;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach units _group;
_group deleteGroupWhenEmpty true;
_group setBehaviourStrong "CARELESS";

_plane addEventHandler ["Killed", {
    params ["_plane"];
    ["TaskSucceeded", ["", "CAS Plane Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
}];


//Get available ammo count of all allowed propelled weapons
private _ammoHM = createHashMap;
private _loadout = _plane getVariable "loadout";
private _weapons = (_plane getVariable "rocketLauncher") + (_plane getVariable "missileLauncher");
{
    private _weapon = _x;
    private _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    private _ammo = 0;
    {
        if(_x in _magazines) then {
            _ammo = _ammo + getNumber (configFile >> "CfgMagazines" >> _x >> "count");
        };
    } forEach _loadout;
    _ammoHM set [_weapon, _ammo];
} forEach _weapons;
_plane setVariable ["ammoCount", _ammoHM];
Debug("Starting ammo: %1", _ammoHM);

// Function to calculate ammo types/quantities to use against different vehicle types
private _fnc_getFireMatrix =
{
    params ["_targetType", "_allowHeavyWeapon"];
    if (_targetType in FactionGet(all,"vehiclesTanks")) exitWith
    {
        Debug_1("%1 target is tank", _supportName);
        if(_allowHeavyWeapon) exitWith
        {[
            [true, 25, 3, 1],
            [true, 25, 3, 1],
            [true, 35, 3, 1]
        ]};
        [
            [true, 20, 3, 1],
            [true, 20, 3, 1],
            [true, 30, 3, 0]
        ];
    };
    if (_targetType in FactionGet(all,"vehiclesArmor")) exitWith
    {
        Debug_1("%1 target is APC", _supportName);
        if(_allowHeavyWeapon) exitWith
        {[
            [true, 30, 3, 1],
            [true, 30, 3, 1],
            [true, 30, 3, 0]
        ]};
        [
            [true, 25, 3, 1],
            [true, 25, 3, 0],
            [true, 25, 3, 0]
        ];
    };
    if(_allowHeavyWeapon) exitWith
    {[
        [true, 35, 5, 0],
        [true, 35, 5, 0],
        [true, 35, 5, 0]
    ]};
    [
        [true, 25, 3, 0],
        [false, 25, 5, 0],
        [true, 25, 3, 0]
    ];
};


//REPEATING FIRE LOGIC
//Forcing the plane to fire is handled in this EH to avoid loops
_plane addEventHandler ["Fired", {
    params ["_plane", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    //Reduce the available ammo for internal logic
    private _ammoHM = _plane getVariable "ammoCount";
    private _ammoCount = _ammoHM get _weapon;
    if (!isNil "_ammoCount") then { _ammoHM set [_weapon, _ammoCount-1] };

    // Everything else requires an existing target
    private _targetObj = _plane getVariable ["currentTarget", objNull];
    if (isNull _targetObj) exitWith {};

    // TODO: maybe add incidence factor so we can use it for any approach angle?
    private _fnc_ballisticCorrection = {
        params ["_projectile", "_targetObj", "_ammo", "_aimError"];
        private _speed = vectorMagnitude velocity _projectile;
        private _dist = _targetObj distance _projectile;
        private _airFric = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
        if (_airFric > 0) then { _airFric = _airFric * 0.002 } else { _airFric = _airFric * -1 };            // rockets use different scale
        private _travTime = (exp (_airFric*_dist) - 1) / (_airFric*_speed);         // Differential equation solution for a = fv^2
        private _timeExp = 2 - 330*_airFric;                                        // slight fudge because airFric acts on fall rate with long travel
        private _fallDist = 1.5 + 0.9 * (4.9 * _travTime ^ _timeExp);               // 0.9 factor is real (cos^2 incidence)
        private _targetPos = (getPosASL _targetObj) vectorAdd [0, 0, _fallDist] vectorAdd (velocity _targetObj vectorMultiply _travTime);
        _aimError = _aimError + (speed _targetObj / 20) + _dist / 500;
        _targetPos = _targetPos apply {_x + (random 2 - 1) * _aimError};
        private _dir = (getPosASL _projectile) vectorFromTo _targetPos;
        _projectile setVelocity (_dir vectorMultiply _speed);
        _projectile setVectorDir _dir;
    };

    if(_weapon == _plane getVariable ["mainGun", ""]) exitWith
    {
        //Bullet, improve course and accuracy
        // TODO: could trace line per burst instead?
        [_projectile, _targetObj, _ammo, 2] call _fnc_ballisticCorrection;

        //Remove from shot count, check if we need to try firing again
        private _remainingShots = _plane getVariable ["mainGunShots", 0];
        _plane setVariable ["mainGunShots", _remainingShots - 1];
        if(_remainingShots > 1) then
        {
            //Fire next shot (does nothing if we're in the middle of a burst)
            [_plane, _weapon, _mode] spawn
            {
                params ["_plane", "_weapon", "_mode"];
                sleep (_plane getVariable ["mainGunReload", 0.1]);
                (driver _plane) forceWeaponFire [_weapon, _mode];
            };
        };
    };
    if(_weapon in (_plane getVariable ["rocketLauncher", []])) exitWith
    {
        //Unguided rocket, wait until thrust is complete before fixing accuracy
        //Thrust seems to give terrible vertical accuracy for some reason, maybe busted simulation
        [time, _projectile, _targetObj, _ammo, _fnc_ballisticCorrection] spawn {
            params ["_startTime", "_projectile", "_targetObj", "_ammo", "_fnc_ballisticCorrection"];
            private _thrustTime = getNumber (configFile >> "cfgAmmo" >> _ammo >> "thrustTime");
            sleep (_thrustTime + _startTime - time);
            if (isNull _projectile or isNull _targetObj) exitWith {};
            [_projectile, _targetObj, _ammo, 5] call _fnc_ballisticCorrection;
        };

        //Check if next shot needs to be fired
        private _remainingShots = _plane getVariable ["rocketShots", 0];
        _plane setVariable ["rocketShots", _remainingShots - 1];
        if(_remainingShots > 0) then
        {
            //Fire next shot
            [_plane, _weapon, _mode] spawn
            {
                params ["_plane", "_weapon", "_mode"];
                sleep (_plane getVariable ["rocketReload", 0.3]);
                (driver _plane) forceWeaponFire [_weapon, _mode];
            };
        };
    };
    if(_weapon in (_plane getVariable ["missileLauncher", []])) exitWith
    {
        //Guided missile, dont do anything

        //Check if next shot needs to be fired (Unlikely, but possible)
        private _remainingShots = _plane getVariable ["missileShots", 0];
        _plane setVariable ["missileShots", _remainingShots - 1];
        if(_remainingShots > 1) then
        {
            //Fire next shot
            [_plane, _weapon, _mode] spawn
            {
                params ["_plane", "_weapon", "_mode"];
                sleep 0.25;
                _plane fireAtTarget [_targetObj, _weapon];
            };
        };
    };
}];

//distances:
#define DIST_REPOS 3000
#define DIST_APPROACH 2000

while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
private _setupWP = _group addWaypoint [_suppCenter, 0];
_setupWP setWaypointSpeed "NORMAL";

private _loiterWP = _group addWaypoint [_suppCenter, 0];
_loiterWP setWaypointSpeed "NORMAL";
_loiterWP setWaypointType "Loiter";
_loiterWP setWaypointLoiterRadius DIST_REPOS;
_group setCurrentWaypoint _loiterWP;

//states:
#define STATE_PICK_TARGET 1
#define STATE_REPOSITION 2
#define STATE_APPROACH 3
#define STATE_ACQUIRE 4

private _acquisition = 0;
private _targetObj = objNull;
private _timeout = time + 600;
private _state = STATE_PICK_TARGET;
while {true} do
{
    //Plane somehow destroyed or disabled
    if !(canFire _plane && canMove _plane && side _plane == _side) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    if (time > _timeout) exitWith {
        Info_1("%1 has timed out, returning to base", _supportName);
    };

    //Target no longer valid
    if (_state != STATE_PICK_TARGET && !alive _targetObj) then { 
        Debug_1("%1 target lost or destroyed, returning to loiter", _supportName);
        _suppTarget resize 0;
        _group setCurrentWaypoint _loiterWP;
        _state = STATE_PICK_TARGET;
    };

    switch (_state) do
    {
        case STATE_PICK_TARGET: {
            if (_plane distance2d _suppCenter > 2*DIST_REPOS) exitWith { sleep 5 };
            if (_suppTarget isEqualTo []) exitWith { sleep 5 };
            
            _targetObj = _suppTarget select 0;
            if !(alive _targetObj) exitWith {
                _suppTarget resize 0;
                Debug_1("%1 skips target, as it is already dead", _supportName);
            };
            Debug_2("Next target for %2 is %1", _suppTarget, _supportName);

            [_reveal, getPos _targetObj, _side, "CAS", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;
            
            _timeout = (time + 300);
            _loiterWP setWaypointPosition [_suppTarget select 1, 0];
            private _heavy = true;          // TODO: improve this?
            private _fireMatrix = [typeof _targetObj, _heavy] call _fnc_getFireMatrix;
            _plane setVariable ["fireParams", _fireMatrix];

            _acquisition = 0;
            _state = STATE_ACQUIRE;
        };

        case STATE_ACQUIRE: {
            // check LoS to target
            private _targetPos = (getPosASL _targetObj) vectorAdd [0, 0, 1];
            private _planePos = getPosASL _plane;
            if (terrainIntersectASL [_targetPos, _planePos]) exitWith { 
                Debug("Acquisition blocked by terrain");
                sleep 5;
            };
            if (lineIntersects [_targetPos, _planePos, _targetObj, _plane]) exitWith {
                Debug("Acquisition blocked by object");
                sleep 5;
            };
            _acquisition = _acquisition + 0.1;
            if (_acquisition > 0.5) exitWith {
                Debug("Target acquired");
                _state = STATE_APPROACH;
            };
            sleep 5;
        };

        case STATE_APPROACH: {
            // If around 2km, start run if facing target (<25 degrees), else reposition
            private _targetPos = (getPosASL _targetObj) vectorAdd [0, 0, 2];
            private _targVector = _targetPos vectorDiff (getPosASL _plane);
            if (_plane distance2d _targetObj < DIST_APPROACH+200) exitWith {
                private _dotdir = vectorNormalized _targVector vectorDotProduct vectorDir _plane;
                Debug_2("%1 had dotdir %2 at end of approach", _supportName, _dotdir);
                if (_plane distance2d _targetObj < DIST_APPROACH-200 or _dotdir < 0.90) exitWith {
                    Debug_1("%1 approach failed, switching to reposition", _supportName);
                    _state = STATE_REPOSITION;
                };

                // Kick off the attack run and wait until it's done
                _group setCurrentWaypoint _loiterWP;
                private _runHandle = [_plane, _targetObj, _supportName] spawn A3A_fnc_SUP_CASRun;
                waitUntil { sleep 2; scriptDone _runHandle };

                // Run complete
                Debug("Ammo at end of run: %1", _ammoHM);
                if (-1 == (toArray _ammoHM)#1 findIf { _x > 0 }) exitWith {
                    Info_1("%1 out of ammo, returning to base", _supportName);
                    break;
                };
                _timeout = (time + 300);            // Add some time for next run/target
                sleep 2;
            };

            // Move the approach waypoint
            private _enterRunPos = vectorNormalized [_targVector#0, _targVector#1] vectorMultiply -DIST_APPROACH/2;
            _enterRunPos = _enterRunPos vectorAdd [0,0,DIST_APPROACH/10] vectorAdd _targetPos;

            // If something is obstructing the approach, repath
            if (terrainIntersectASL [_targetPos, _enterRunPos]) exitWith {
                Debug_1("%1 approach blocked, switching to reposition", _supportName);
                _state = STATE_REPOSITION;
            };

            _setupWP setWaypointPosition [_enterRunPos, -1];
            _group setCurrentWaypoint _setupWP;
            sleep 1;
        };

        case STATE_REPOSITION: {
            // if we're around 3km away and facing <100 degrees from the target, switch to approach
            private _dist = _plane distance2d _targetObj;
            private _targVector = (getPosASL _targetObj) vectorDiff (getPosASL _plane);
            private _dotdir = vectorNormalized _targVector vectorDotProduct vectorDir _plane;
            if (_dist < DIST_REPOS+300 and _dist > DIST_REPOS-200 and _dotdir > -0.3) exitWith {
                Debug_1("%1 switching to approach", _supportName); 
                _state = STATE_APPROACH;
            };

            // Aim at point on circle that's 45 degrees clockwise from current pos
            // Larger circle 
            private _sideDir = [[_targVector#0, _targVector#1], -45] call BIS_fnc_rotateVector2D;
            private _repathPos = (vectorNormalized _sideDir) vectorMultiply -(2*DIST_REPOS - _dist);
            _repathPos = _repathPos vectorAdd [0,0,600] vectorAdd (getPosASL _targetObj);

            _setupWP setWaypointPosition [_repathPos, -1];
            _group setCurrentWaypoint _setupWP;
            sleep 2;
        };

    };
};

_plane removeAllEventHandlers "Fired";
_suppData set [4, 0];           // Set activesupport radius to zero, enabling cleanup

[_group] spawn A3A_fnc_groupDespawner;
[_plane] spawn A3A_fnc_vehDespawner;

//Have the plane fly back home
if (canMove _plane && {driver _plane call A3A_fnc_canFight}) then
{
    while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
    private _wpBase = _group addWaypoint [_spawnPos, 0];
    _wpBase setWaypointSpeed "NORMAL";
    _wpBase setWaypointBehaviour "CARELESS";
    _group setCurrentWaypoint _wpBase;

    private _timeout = time + (getPos _plane distance2d _spawnPos) / 20;
    waitUntil { sleep 2; (currentWaypoint _group != 0) or (time > _timeout) };
    if (time > _timeout) exitWith {};
    { deleteVehicle _x } forEach (units _group);
    deleteVehicle _plane;
};
