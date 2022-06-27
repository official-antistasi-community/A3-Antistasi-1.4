/*  
Maintainer: John Jordan
    Select from distance-weighted list of available enemy land bases or return full list
    Checks idle, spawner, distance, garrison, spawn places and pathfinding connection

Scope: Anywhere? Only using on server atm
Environment: Scheduled or unscheduled

Arguments:
    <SIDE> Side of enemy faction
    <POS2D> Target position to use
    <BOOL> Optional, true to return all bases & weights (Default: false)

Return value:
    <STRING> Marker name of landbase, or nil if none. Or <ARRAY, ARRAY> [landbases, weights]
*/

params ["_side", "_targPos", ["_returnAll", false]];

private _freeBases = [];
private _weights = [];
{
    if (sidesX getVariable [_x,sideUnknown] != _side) then {continue};
    if (dateToNumber date < server getVariable [_x, 0]) then {continue};       // addTimeForIdle
    if (spawner getVariable _x != 2) then {continue};                           // spawn places dangerous if spawned
    if (markerPos _x distance2d _targPos > distanceForLandAttack) then {continue};
    if (count (garrison getVariable [_x,[]]) < 16) then {continue};
    if (spawner getVariable (_x + "_spawns") select 0 isEqualTo []) then {continue};        // any vehicle spawn places on base
	if !([_x, _targPos] call A3A_fnc_arePositionsConnected) then {continue};

    _freeBases pushBack _x;
    _weights pushBack (1 / (markerPos _x distance2D _targPos)^2);
} forEach (outposts + airportsX);

if (_returnAll) exitWith { [_freeBases, _weights] };
_freeBases selectRandomWeighted _weights;
