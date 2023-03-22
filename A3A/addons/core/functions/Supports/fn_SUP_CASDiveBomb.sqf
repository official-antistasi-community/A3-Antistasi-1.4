/*  CAS routine to acquire targets and set up dive bombing runs

Environment: Server, scheduled, internal

Arguments:
    <ARRAY> Active support data, see initSupports
    <OBJECT> Aircraft object to use
    <GROUP> Group containing aircraft pilot
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug_1("Dive bomb approach called with %1", _this);

params ["_suppData", "_plane", "_group", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];


//distances:
#define DIST_REPOS 3000
#define DIST_APPROACH 2000
private _startAlt = (_plane getVariable "diveParams")#0;

while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
private _setupWP = _group addWaypoint [_suppCenter, 0];
_setupWP setWaypointSpeed "NORMAL";
_plane flyInHeight _startAlt;

private _loiterWP = _group addWaypoint [_suppCenter, 0];
_loiterWP setWaypointSpeed "NORMAL";
_loiterWP setWaypointType "Loiter";
_loiterWP setWaypointLoiterRadius DIST_REPOS;
_loiterWP setWaypointLoiterAltitude _startAlt;
_group setCurrentWaypoint _setupWP;


private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _baseSpotChance = 0.1 * (1 + _aggro / 100);


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
            if (_suppTarget isEqualTo []) exitWith { _group setCurrentWaypoint _loiterWP; sleep 5 };
            
            _targetObj = _suppTarget select 0;
            _lastKnownPos = ATLtoASL (_suppTarget select 1);
            if !(_targetObj call A3A_fnc_canFight) exitWith {
                _suppTarget resize 0;
                Debug_1("%1 skips target, as it is already dead", _supportName);
            };
            Debug_2("Next target for %2 is %1", _suppTarget, _supportName);

            [_reveal, getPosATL _targetObj, _side, "CAS", _targetObj, 60] spawn A3A_fnc_showInterceptedSupportCall;
            
            _timeout = _timeout + 300;
            _loiterWP setWaypointPosition [_suppTarget select 1, 0];

            _acquired = false;
            _state = STATE_APPROACH;
        };

        case STATE_APPROACH: {
            if (_plane distance2d _lastKnownPos < 200) exitWith {
                Debug_1("%1 approach overshot before acquisition", _supportName);
                _state = STATE_REPOSITION;
            };
            if (!_acquired) then {
                private _targetPos = eyePos _targetObj;                 // Seems to work well even for non-turreted vehicles?
                private _planePos = getPosASL _plane;
                if (terrainIntersectASL [_targetPos, _planePos]) exitWith { 
                    Verbose("Acquisition blocked by terrain");
                };
                if (lineIntersects [_targetPos, _planePos, _targetObj, _plane]) exitWith {
                    Verbose("Acquisition blocked by object");
                };

                private _vis = 1 max getNumber (configFile >> "CfgVehicles" >> typeOf _targetObj >> "camouflage");
                private _knownDist = _targetPos distance2d _lastKnownPos;
                private _dist = _targetPos distance2d _planePos;
                private _chance = _baseSpotChance * _vis * exp (_knownDist / -500) * exp (_dist / -3000);
                if (_chance > random 1) then { _acquired = true };

                Verbose_4("Acquisition: vis %1, knowndist %2, dist %3, chance %4", _vis, _knownDist, _dist, _chance);
            };
            if (_acquired and getPosATL _plane#2 > (_startAlt-100)) then {
                Debug_1("%1 starting dive bomb run", _supportName);
                _lastKnownPos = eyePos _targetObj;
                // Attempt to start the dive bomb run
                private _rval = [_plane, _targetObj, _supportName, _setupWP] call A3A_fnc_SUP_CASDiveBombRun;
                _group setCurrentWaypoint _loiterWP;
                if (_rval) then {
                    Info_1("%1 dive bomb run completed", _supportName);
                    break;
                };
                Debug_1("%1 dive bomb run failed", _supportName);
                _state = STATE_REPOSITION;
                continue;           // plane might be dead or target missing at this point
            };

            // Move the approach waypoint
            private _wpPos = [_lastKnownPos#0, _lastKnownPos#1, _startAlt];
            _wpPos vectorAdd (_wpPos vectorDiff getPosASL _plane vectorMultiply 1000);              // aim 1km past target
            _setupWP setWaypointPosition [_wpPos, -1];
            _plane flyInHeight _startAlt;
            _group setCurrentWaypoint _setupWP;
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
            private _sideDir = [[_targVector#0, _targVector#1], -45] call BIS_fnc_rotateVector2D;
            private _repathPos = (vectorNormalized _sideDir) vectorMultiply -(2*DIST_REPOS - _dist);
            _repathPos = _repathPos vectorAdd [0,0,500] vectorAdd _lastKnownPos;

            _setupWP setWaypointPosition [_repathPos, -1];
            _group setCurrentWaypoint _setupWP;
            _plane flyInHeight _startAlt;
            sleep 2;
        };

    };
};
