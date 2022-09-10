/*
Maintainer: Wurzel0701
    Performs a paradrop with the given group and vehicle

Arguments:
    <OBJECT> The vehicle from which the drop will be performed
    <GROUP> The group that will jump and perform the drop (NOT THE PILOTS!)
    <MARKER> OR <POSITION> The designated target
    <MARKER> The origin location this vehicle is coming from
    (OPTIONAL) <BOOL> If this drop is there to reinforce (default false)

Return Value:
    <NIL>

Scope: Server/HC
Environment: Scheduled
Public: Yes
Dependencies:
    NONE

Example:
[_myPlane, _ODSTgroup, _targetPos, "CSAT_Carrier"] call A3A_fnc_initSupportCooldowns;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params
[
    ["_vehicle", objNull, [objNull]],
    ["_groupJumper", grpNull, [grpNull]],
    ["_target", "", ["", []]],
    ["_originMarker", "", [""]],
    ["_isReinforcement", false, [false]]
];

private _groupPilot = group driver _vehicle;
{
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x setBehaviour "CARELESS";
} foreach (units _groupPilot);

private _targetPosition = if(_target isEqualType "") then {getMarkerPos _target} else {_target};
private _originPosition = getMarkerPos _originMarker;

_vehicle flyInHeight 1000;
_vehicle setCollisionLight false;
if(_vehicle isKindOf "Helicopter") then
{
    _entryDistance = 150;
    _vehicle flyInHeight 500;
};

// Try to find a position that isn't on water
private _dropPos = _targetPosition;
for "_i" from 1 to 10 do {
    private _testPos = _dropPos getPos [random 150 + 150, random 360];
    if !(surfaceIsWater _testPos) exitWith { _dropPos = _testPos };
};
private _angle = (_originPosition getDir _targetPosition);
private _entryPos = _dropPos getPos [-100, _angle];
private _exitPos = _dropPos getPos [300, _angle];
{ _x set [2, 500] } forEach [_entryPos, _exitPos, _originPosition];

while {count waypoints _groupPilot > 0} do { deleteWaypoint [_groupPilot, 0] };

private _wp = _groupPilot addWaypoint [_entryPos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "NORMAL";          // Blackfish cannot turn at limited?

private _wp1 = _groupPilot addWaypoint [_exitPos, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "NORMAL";

private _wp2 = _groupPilot addWaypoint [_originPosition, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

waitUntil {sleep 1; (currentWaypoint _groupPilot > 0) || (!alive _vehicle) || (!canMove _vehicle)};

if(currentWaypoint _groupPilot > 0) then
{
    ServerDebug_1("Drop pos %1 reached", _dropPos);
    _vehicle setCollisionLight true;
    {
        unAssignVehicle _x;
        //Move them into alternating left/right positions, so their parachutes are less likely to kill each other
        private _pos = if (_forEachIndex % 2 == 0) then {_vehicle modeltoWorld [7, -20, -5]} else {_vehicle modeltoWorld [-7, -20, -5]};
        _x setPosASL AGLtoASL _pos;
        _x spawn
        {
            sleep (getPosATL _this # 2 / 70);      // can't fall faster than that, save some checks
            waitUntil {sleep 0.25; getPosATL _this # 2 < 120};
            private _chute = createVehicle ["Steerable_Parachute_F", getPosATL _this, [], 0, "CAN_COLLIDE"];
            _this moveInDriver _chute;
            private _smokeGrenade = selectRandom allSmokeGrenades;
            private _smoke = _smokeGrenade createVehicle (getPosATL _this);
            waitUntil { sleep 1; isTouchingGround _this};
            deleteVehicle _chute;
        };
        sleep 0.5;
  	} forEach units _groupJumper;
};

while {count waypoints _groupJumper > 0} do { deleteWaypoint [_groupJumper, 0] };

// Waiting here because Arma likes to randomly delete paratrooper waypoints on landing
waitUntil { sleep 1; isTouchingGround leader _groupJumper };

sleep 10;       // wait until everyone else has landed

_wpMove = _groupJumper addWaypoint [_targetPosition, 0];
_wpMove setWaypointType "MOVE";
_wpMove setWaypointBehaviour "AWARE";
_groupJumper setCurrentWaypoint _wpMove;

if !(_isReinforcement) then
{
    _wpClear = _groupJumper addWaypoint [_targetPosition, 0];
    _wpClear setWaypointType "SAD";
    _groupJumper spawn A3A_fnc_attackDrillAI;
};
