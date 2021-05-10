/*
    A3A_fnc_findPosOnRoute
    Find exact spawn position and direction given a navigation route and a specified distance.
    Re-uses state from previous calls for efficient spawning of convoys.

Parameters:
    <ARRAY> Navigation route of PosAGL vectors, eg from A3A_fnc_findPath.
    <NUMBER> Distance to travel from current state.
    <ARRAY> Current search state. Either [] or return value from previous call.

Returns:
    <ARRAY> Current search state, format:
        <PosAGL> Spawn position along route.
        <NUMBER> Direction for spawn position.
        <NUMBER> Next route index (use this to delete route nodes behind the vehicles).
        <...> Internal data.

Example:
    Spawn two vehicles along a route spaced by 20m, then delete the navpoints behind the vehicles:
    _state = [_route, 0, []] call A3A_fnc_findPosOnRoute;
    _vehicle = createVehicle [_vehType, _state#0];
    _vehicle setDir (_state#1);
    _state = [_route, 20, _state] call A3A_fnc_findPosOnRoute;
    _vehicle2 = createVehicle [_vehType2, _state#0];
    _vehicle2 setDir (_state#1);
    _route = _route select [_state#2, count _route];
*/

params ["_route", "_spacing", ["_state", []]];
if (count _state == 0) then { _state = [[], 0, 0, [], _route select 0, false] };
_state params ["_vecStart", "_dir", "_routeIdx", "_roads", "_vecEnd", "_vecReady"];

// only sanity checks would be _route >= 2 and _spacing >= 0?

while {true} do
{
    if (_vecReady) then {			// Skip for fresh calls and end of route
        private _dist = _vecStart distance _vecEnd;
        if (_dist > _spacing) then {
            // Found new position along the current path, return it.
            private _pos = _vecStart vectorAdd ((_vecEnd vectorDiff _vecStart) vectorMultiply (_spacing / _dist));
            breakWith [_pos, _dir, _routeIdx, _roads, _vecEnd, true];
        };
        _spacing = _spacing - _dist;
    };

    // Generate new roads using A* if necessary
    if (count _roads < 2) then {
        if (_routeIdx+1 == count _route) then {
            // Reached the end of the route. Continue in final direction. 
            private _pos = _vecStart getPos [_spacing, _dir];
            breakWith [_pos, _dir, _routeIdx, [], [], false];
        };
        private _road1 = roadAt (_route select _routeIdx);
        private _road2 = roadAt (_route select _routeIdx+1);
        if !(isNull _road1 or isNull _road2) then {
            _roads = [_road1, _road2] call A3A_fnc_roadAStar;
        };
        _routeIdx = _routeIdx + 1;
        _vecReady = true;
    };

    // Generate new vector and direction, either from roads or route
    _vecStart = _vecEnd;
    if (count _roads >= 2) then {
        _vecEnd = ASLtoATL ([_roads select 0, _roads select 1] call A3A_fnc_roadConnPoint);
        _roads deleteAt 0;
    } else {
        _vecEnd = _route select _routeIdx;
    };
    _dir = _vecStart getDir _vecEnd;
};
