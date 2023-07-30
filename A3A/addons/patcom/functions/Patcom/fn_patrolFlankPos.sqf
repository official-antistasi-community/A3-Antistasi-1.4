/*
    Author: [Hazey]
    Description:
        Get a flank position based on best position forumla.

    Arguments:
        <Array> Position to find the flank position around.
        <Number> Radius to search for the flank position.
        <Number> Precision of the search. Higher = Better performance.
        <Number> Max results to return. The maximum possible is the number of random samples, which is n = 2 * radius / precision

    Return Value:
        <Array> Found flank position.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _flankPosition = [_enemyPosition, 250] call A3A_fnc_patrolFlankPos;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    "_position",
    "_radius",
    ["_precision", 100],
    ["_sources", 5]
];

private _flankPosition = [];

 // Get best attack vector for flank.
private _bestPositions = selectBestPlaces [_position, _radius, "((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", _precision, _sources];

// If no position is found, we create a random one.
if (_bestPositions isEqualTo []) then {
    private _dist = (random 100 + 100);
    private _dir = random 360;
    _flankPosition = [(_position select 0) + (sin _dir) * _dist, (_position select 1) + (cos _dir) * _dist, 0];
} else {
    private _randomPosition = selectRandom _bestPositions;
    _flankPosition = _randomPosition select 0;
    _flankPosition set [2, 0];
};

_flankPosition;