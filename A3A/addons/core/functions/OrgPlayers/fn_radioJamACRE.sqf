/*
Author: Killerswin2,
    trys to carry an object to a place
Arguments:
NONE:
Return Value:
0: the distance percentage <number>

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies: 

Example:
    [] call A3A_radioJamACRE; 

*/


private ["_sidePlayer", "_radius", "_bases","_distPercent"];
_sidePlayer = side player;
_radius = 1000;
_bases = outposts + airportsX + seaports;

private _antennas = [];

{
	private _jammerPos = [_bases, _x] call BIS_fnc_nearestPosition;
	if(sideX getVariable [_jammerPos, sideUnknown] != _sideX) then {_anntennas pushBack _x}
} forEach antennas;

if !(_antennas isEqualTo []) then {
	private _jammer = [_antennas, player] call BIS_fnc_nearestPosition;
	private _dis = player distance _jammer;
	_distPercent = _dis / _radius;
};

// return
_distPercent