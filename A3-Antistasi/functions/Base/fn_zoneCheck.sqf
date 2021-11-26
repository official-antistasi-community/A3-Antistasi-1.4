if (!isServer) exitWith {};

/*  Checks if the marker should change its owner after a unit died and flips it if need be
    Execution on: Server
    Scope: Internal
    Params:
        _marker : STRING : Name of the marker the unit died on
        _side : SIDE : Side of the unit which died
    Returns:
        Nothing
*/
params ["_marker", "_side"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

if ((isNil "_marker") or (isNil "_side")) exitWith {};

//Await lock
waitUntil {!zoneCheckInProgress};
zoneCheckInProgress = true;

//If marker is a different side than the unit which died on it, we don't care
if(_side != sidesX getVariable [_marker, sideUnknown]) exitWith
{
    zoneCheckInProgress = false
};

private _enemy1 = sideUnknown;
private _enemy2 = sideUnknown;

switch (_side) do
{
    case (teamPlayer):
    {
        _enemy1 = Invaders;
    	_enemy2 = Occupants;
    };
    case (Occupants):
    {
        _enemy1 = Invaders;
		_enemy2 = teamPlayer;
    };
    case (Invaders):
    {
        _enemy1 = Occupants;
        _enemy2 = teamPlayer;
    };
};

[0,0,0] params ["_defenderUnitCount", "_enemy1UnitCount", "_enemy2UnitCount"];

// Use average marker size to force reasonable behaviour with highly rectangular targets
private _capRadius = ((markerSize _marker select 0) + (markerSize _marker select 1)) / 2;
_capRadius = _capRadius max 50;

private _markerPos = getMarkerPos _marker;
private _units = allUnits inAreaArray [_markerPos, _capRadius, _capRadius];
{
    if !(_x call A3A_fnc_canFight) then { continue };
    if (vehicle _x isKindOf "Air") then { continue };
    private _value = linearConversion [_capRadius/2, _capRadius, _markerPos distance2d _x, 1, 0, true];
    switch (side _x) do				// Not side group because we don't count undercover
    {
        case (_side): {_defenderUnitCount = _defenderUnitCount + _value};
        case (_enemy1): {_enemy1UnitCount = _enemy1UnitCount + _value};
        case (_enemy2): {_enemy2UnitCount = _enemy2UnitCount + _value};
    };
} forEach _units;

Debug_7("ZoneCheck at %1 found %2 friendly %5 units, %3 enemy %6 units and %4 enemy %7 units", _marker, _defenderUnitCount, _enemy1UnitCount, _enemy2UnitCount, _side, _enemy1, _enemy2);

if (_enemy1UnitCount > 3 * _defenderUnitCount || {_enemy2UnitCount > 3 * _defenderUnitCount}) then
{
    private _winner = if (_enemy1UnitCount > _enemy2UnitCount) then {_enemy1} else {_enemy2};
    if (_winner isEqualTo teamPlayer) exitWith {Debug_2("Rebel auto capture of %1 was blocked, %1 remains side %2", _marker, _side)};
    [_winner,_marker] remoteExec ["A3A_fnc_markerChange",2];
};
zoneCheckInProgress = false;
