/*  Prepares cruise missile marker

    Execution on: Server

    Scope: Internal

    Params:
        _side: SIDE : The side for which the support should be called in
        _timerIndex: NUMBER
        _supportName: STRING : The call name of the support

    Returns:
        The name of the marker, covering the whole support area
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_supportName", "_side", "_resPool", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];

private _airports = [];
private _weights = [];
{
    private _pos = markerPos _x;
    private _dist = _pos distance2D _targPos;
    if (_dist > 8000 or _dist < 1500) then {continue};
    if (sidesX getVariable [_x,sideUnknown] != _side) then {continue};
    if (spawner getVariable _x == 0) then {continue};              // don't need spawn places, so this is fine
    if (garrison getVariable [_x + "_samDestroyedCD", 0] != 0) then {continue}; //means that SAM was previously destroyed and needs to be replenished
	
    if (_target isEqualType objNull and {!isNull _target}) then {
        private _targDir = _pos getDir _targPos;
        private _intersectPoint = (ATLtoASL _pos) getPos [250, _targDir] vectorAdd [0,0,300];
        if (terrainIntersectASL [_intersectPoint, getPosASL _target]) then {continue};
    };

    _airports pushBack _x;
    _weights pushBack (1 / _dist^2);
} forEach airportsX;

if (_airports isEqualTo []) exitWith {
    Error_1("No suitable airport found for %1", _supportName); -1;
};

private _airport = _airports selectRandomWeighted _weights;
private _launcherType =["B_Ship_MRLS_01_F", "B_Ship_MRLS_01_F"] select (_side == Invaders);
private _launcher = [_launcherType, markerPos _airport, 50, 5, true] call A3A_fnc_safeVehicleSpawn;

private _group = [_side, _launcher] call A3A_fnc_createVehicleCrew;
[_launcher, _side] call A3A_fnc_AIVEHInit;
_group deleteGroupWhenEmpty true;
{ [_x, nil, false] call A3A_fnc_NATOinit } forEach units _group;

private _aggro = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_delay < 0) then { _delay = (0.5 + random 1) * (600 - 15*tierWar - 1*_aggro) };

private _targArray = [];
if (_target isEqualType objNull and {!isNull _target}) then {
    A3A_supportStrikes pushBack [_side, "TARGET", _target, time + 1200, 1200, 200];
    _targArray = [_target, _targPos];
};

// name, side, suppType, center, radius, [target, targpos]
private _suppData = [_supportName, _side, "CRUISEMISSILE", _targPos, 8000, _targArray];
A3A_activeSupports pushBack _suppData;
[_suppData, _launcher, _group, _delay, _reveal] spawn A3A_fnc_SUP_cruiseMissileRoutine; 

[_reveal, _side, "CRUISEMISSILE", _targPos, _delay] spawn A3A_fnc_showInterceptedSetupCall;
// Vehicle cost + extra support cost for balance
//(A3A_vehicleResourceCosts get _launcherType) + 100;
200;