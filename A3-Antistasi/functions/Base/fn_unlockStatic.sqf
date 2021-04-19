params ["_target", "_caller", "_actionId", "_arguments"];

_target setVariable ["lockedForAI", nil, true];

// identify rebel marker that this static is in
private _markers = markersX select { sidesX getVariable [_x, sideUnknown] == teamPlayer };
_markers = _markers inAreaArray [getpos _target, 1000, 1000];
if (count _markers == 0) exitWith {};

private _marker = _markers deleteAt 0;
private _mindist = _marker distance2d _target;
{
    if (_x distance2d _target > _mindist) then { continue };
    _marker = _x; _mindist = _x distance2d _target;
} forEach _markers;

[_marker] remoteExec ["A3A_fnc_updateRebelStatics", 2];
