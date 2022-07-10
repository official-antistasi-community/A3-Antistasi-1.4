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
_plane setPosATL (_spawnPos vectorAdd [0, 0, 500]);
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
        if(_allowHeavyWeapon) exitWith { [[true, 25, 3, 1], [true, 25, 3, 1], [true, 35, 3, 1]] };
        [[true, 20, 3, 1], [true, 20, 3, 1], [true, 30, 3, 0]];
    };
    if (_targetType in FactionGet(all,"vehiclesArmor")) exitWith
    {
        Debug_1("%1 target is APC", _supportName);
        if(_allowHeavyWeapon) exitWith { [[true, 30, 3, 1], [true, 30, 3, 1], [true, 30, 3, 0]] };
        [[true, 25, 3, 1], [true, 25, 3, 0], [true, 25, 3, 0]];
    };
    if(_allowHeavyWeapon) exitWith { [[true, 35, 5, 0], [true, 35, 5, 0], [true, 35, 5, 0]] };
    [[true, 25, 3, 0], [false, 25, 5, 0], [true, 25, 3, 0]];
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
        private _timeExp = 2 - 450*_airFric;                                        // slight fudge because airFric acts on fall rate with long travel
        private _fallDist = 0.986 * (4.9 * _travTime ^ _timeExp);                         // 0.986 is cos^2 incidence factor for 1/6 slope
        private _targetPos = (eyePos _targetObj) vectorAdd [0, 0, _fallDist] vectorAdd (velocity _targetObj vectorMultiply _travTime);
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
                sleep (0.05 + (_plane getVariable "mainGunReload"));
                //Debug_2("Firing followup %1 burst with mode %2", _weapon, _mode); 
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
                sleep (0.1 + (_plane getVariable "rocketReload"));
                //Debug_2("Firing followup %1 burst with mode %2", _weapon, _mode); 
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
#define DIST_REPOS 5000
#define DIST_APPROACH 2000
#define ALT_REPOS 700
#define ALT_APPROACH 400

while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
private _setupWP = _group addWaypoint [_suppCenter, 0];
_setupWP setWaypointSpeed "NORMAL";

private _loiterWP = _group addWaypoint [_suppCenter, 0];
_loiterWP setWaypointSpeed "NORMAL";
_loiterWP setWaypointType "Loiter";
_loiterWP setWaypointLoiterRadius DIST_REPOS;
_loiterWP setWaypointLoiterAltitude ALT_REPOS;
_group setCurrentWaypoint _loiterWP;


private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _baseSpotChance = 0.05 * (1 + _aggro / 100);

//states:
#define STATE_PICK_TARGET 1
#define STATE_REPOSITION 2
#define STATE_APPROACH 3

private _acquired = false;
private _targetObj = objNull;
private _lastKnownPos = [];         // PosASL
private _timeout = time + 900;
private _state = STATE_PICK_TARGET;
while {true} do
{
    //Plane somehow destroyed or disabled
    if !(canFire _plane && canMove _plane && side _plane == _side) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    // Target no longer valid (canFight isn't ideal for vehicles but it works)
    if (_state != STATE_PICK_TARGET && !(_targetObj call A3A_fnc_canFight)) then {
        Debug_1("%1 target lost or destroyed, returning to loiter", _supportName);
        _suppTarget resize 0;
        _group setCurrentWaypoint _loiterWP;
        _state = STATE_PICK_TARGET;
        _timeout = _timeout - 300;
    };

    if (time > _timeout) exitWith {
        Info_1("%1 has timed out, returning to base", _supportName);
    };

    switch (_state) do
    {
        case STATE_PICK_TARGET: {
            if (_plane distance2d _suppCenter > 1.5 * DIST_REPOS) exitWith { sleep 5 };
            if (_suppTarget isEqualTo []) exitWith { sleep 5 };
            
            _targetObj = _suppTarget select 0;
            _lastKnownPos = ATLtoASL (_suppTarget select 1);
            if !(_targetObj call A3A_fnc_canFight) exitWith {
                _suppTarget resize 0;
                Debug_1("%1 skips target, as it is already dead", _supportName);
            };
            Debug_2("Next target for %2 is %1", _suppTarget, _supportName);

            [_reveal, getPos _targetObj, _side, "CAS", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;
            
            _timeout = _timeout + 300;
            _loiterWP setWaypointPosition [_suppTarget select 1, 0];
            private _heavy = true;          // TODO: improve this?
            private _fireMatrix = [typeof _targetObj, _heavy] call _fnc_getFireMatrix;
            _plane setVariable ["fireParams", _fireMatrix];

            _acquired = false;
            _state = STATE_APPROACH;
        };

        case STATE_APPROACH: {
            if (!_acquired) then {
                private _targetPos = eyePos _targetObj;                 // Seems to work well even for non-turreted vehicles?
                private _planePos = getPosASL _plane;
                if (terrainIntersectASL [_targetPos, _planePos]) exitWith { 
                    Debug("Acquisition blocked by terrain");
                };
                if (lineIntersects [_targetPos, _planePos, _targetObj, _plane]) exitWith {
                    Debug("Acquisition blocked by object");
                };

                private _vis = 1 max getNumber (configFile >> "CfgVehicles" >> typeOf _targetObj >> "camouflage");
                private _knownDist = _targetPos distance2d _lastKnownPos;
                private _dist = _targetPos distance2d _planePos;
                private _chance = _baseSpotChance * _vis * exp (_knownDist / -500) * exp (_dist / -3000);
                if (_chance > random 1) then { _acquired = true };

                Debug_4("Acquisition: vis %1, knowndist %2, dist %3, chance %4", _vis, _knownDist, _dist, _chance); 
            };
            if (_acquired) then { _lastKnownPos = eyePos _targetObj };

            private _dist = _plane distance2d _lastKnownPos;
            if (_dist < [300, 800] select _acquired) exitWith {
                // If we're too close then break off and try again
                Debug_2("%1 approach failed with %2 acquisition", _supportName, _acquired);
                _state = STATE_REPOSITION;
            };

            if (_acquired and _dist < 2000) then {
                // Wait until plane is pointing roughly in the right direction
                private _targVector = _lastKnownPos vectorDiff (getPosASL _plane);
                private _dotdir = vectorNormalized _targVector vectorDotProduct vectorDir _plane;
                if (_dotdir < 0.90) exitWith {};

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
                _state = STATE_REPOSITION;
                continue;
            };

            // Move the approach waypoint
            _setupWP setWaypointPosition [_lastKnownPos vectorAdd [0,0,50], -1];           // just aim above the target
            _group setCurrentWaypoint _setupWP;
            _plane flyInHeight (ALT_REPOS min (ALT_APPROACH * _dist / DIST_APPROACH));
            sleep 1;
        };

        case STATE_REPOSITION: {
            // if we're around 3km away and facing <100 degrees from the target, switch to approach
            private _dist = _plane distance2d _lastKnownPos;
            private _targVector = _lastKnownPos vectorDiff (getPosASL _plane);
            private _dotdir = vectorNormalized _targVector vectorDotProduct vectorDir _plane;
            if (_dist < DIST_REPOS*1.1 and _dist > DIST_REPOS*0.9 and _dotdir > -0.3) exitWith {
                Debug_1("%1 switching to approach", _supportName);
                _state = STATE_APPROACH;
                _acquired = false;
            };

            // Aim at point on circle that's 45 degrees clockwise from current pos
            // Larger circle 
            private _sideDir = [[_targVector#0, _targVector#1], -45] call BIS_fnc_rotateVector2D;
            private _repathPos = (vectorNormalized _sideDir) vectorMultiply -(2*DIST_REPOS - _dist);
            _repathPos = _repathPos vectorAdd [0,0,500] vectorAdd _lastKnownPos;

            _setupWP setWaypointPosition [_repathPos, -1];
            _group setCurrentWaypoint _setupWP;
            _plane flyInHeight ALT_REPOS;
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
