params ["_markerX", ["_ignoreFrontier", false]];

if ("carrier" in _markerX) exitWith { 0 };

private _size = [_markerX] call A3A_fnc_sizeMarker;
private _frontierX = if (_ignoreFrontier) then { false } else { [_markerX] call A3A_fnc_isFrontline };

private _groups = 0;
if (_markerX in airportsX) then
{
    _groups = 2 + round (_size/30);
    _groups = _groups min 11;
    if (_frontierX) then {_groups = _groups + 3};
}
else
{
    if (_markerX in outposts) then
    {
        _groups = 1 + round (_size/30);
        _buildings = nearestObjects [getMarkerPos _markerX,(["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Communication_F"]) + listMilBld, _size];
        if (count _buildings > 0) then {_groups = _groups + 2};
        _groups = _groups min 7;
        if (_frontierX) then {_groups = _groups + 2};
    }
    else
    {
        _groups = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {1 + round (_size/45)} else {1 + round (_size/30)};
        _groups = _groups min 5;
        if (_frontierX) then {_groups = _groups + 1};
    };
};

4 * (_groups max 2);
