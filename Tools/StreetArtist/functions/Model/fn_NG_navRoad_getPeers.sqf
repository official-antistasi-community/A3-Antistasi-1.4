/*
Maintainer: Caleb Serafin
    Connects two navRoads to each other.

Arguments:
    <NavRoad> NavRoad 1
    <NavRoadHM> Parent hashmap, Used for assertions, optional. (Default = nil)

Return:
    <connections<ARRAY>, distances<ARRAY>>

Environment: Any
Public: No

Example:
    [_navRoad, _navRoadHM] call A3A_fnc_NG_navRoad_getPeers;
*/

params [
    "_navRoad",
    ["_navRoadHM", nil]
];

if !([_navRoad,_navRoadHM,"fn_NG_navRoad_getPeers"] call A3A_fnc_NG_navRoad_assert) exitWith {throw "Failed to get peers"; []; };

(_navRoad #1) apply {_navRoadHM get str _x};
