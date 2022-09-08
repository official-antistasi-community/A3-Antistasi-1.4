/*
Maintainer: John Jordan
    Returns the index of the nearest nav node within 300m of a given position

Arguments:
    <POSITION> The start position from which should be searched

Return Value:
    <NUMBER> Index of the nearest nav node (-1 if none found)

Scope: Server or HC
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> navGrid

Example:
    [getPos player] call A3A_fnc_getNearestNavPoint;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_pos"];

private _navCell = format ["%1/%2", floor ((_pos#0)/1000), floor ((_pos#1)/1000)];
private _navPoints =  A3A_navCellHM getOrDefault [_navCell, []];

private _nearPoints = _navPoints inAreaArray [_pos, 75, 75];
if (_nearPoints isEqualTo []) then {
    _nearPoints = _navPoints inAreaArray [_pos, 150, 150];
    if (_nearPoints isEqualTo []) then {
        _nearPoints = _navPoints inAreaArray [_pos, 300, 300];
    };
};

private _nearIndex = -1;
private _nearDist = 1e6;
{
    private _dist = _x distance2d _pos;
    if (_nearDist > _dist) then {
        _nearIndex = _x#2;
        _nearDist = _dist;
    };
} forEach _nearPoints;

_nearIndex;
