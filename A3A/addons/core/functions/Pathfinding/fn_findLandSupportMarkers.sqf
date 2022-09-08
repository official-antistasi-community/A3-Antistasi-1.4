/*
Maintainer: John Jordan
    Generates list of outposts and airports within land support distance of nav index. Cached.

Scope: Server or HC
Environment: Any

Arguments:
    <STRING> Marker name of location to support

Return Value:
    <ARRAY<
        <STRING> Marker name of outpost/airport within land support distance
        <SCALAR> Nav distance between markers
    >
*/

params ["_navIndex", "_lowAir"];

if (_navIndex == -1) exitWith { [] };
if (isNil "A3A_landSupportMarkers") then {
    A3A_landSupportMarkers = createHashMap;
    A3A_outpostAirportXYI = [];        // format [x, y, index into markersX]
	{
        private _nIndex = _x call A3A_fnc_getMarkerNavPoint;
        if (_nIndex == -1) then { continue };
		private _npos = NavGrid#_nIndex#0;
		A3A_outpostAirportXYI pushBack [_npos#0, _npos#1, markersX find _x];
	} forEach outposts + airportsX;
};

private _key = (["s", "l"] select _lowAir) + str _navIndex;
private _val = A3A_landSupportMarkers get _key;
if (!isNil "_val") exitWith { _val };

private _maxLandDist = distanceForLandAttack + ([1000, 2000] select _lowAir);        // Allow extra crow-flies distance, because it checks real distance later
private _nearLand = A3A_outpostAirportXYI inAreaArray [NavGrid#_navIndex#0, _maxLandDist, _maxLandDist];

private _supportMrk = [];
{
    private _suppMrk = markersX#(_x#2);
    if (spawner getVariable (_suppMrk + "_spawns") select 0 isEqualTo []) then {continue};        // any vehicle spawn places on base. huh.
    private _suppNavIndex = _suppMrk call A3A_fnc_getMarkerNavPoint;

    private _navDist = [_navIndex, _suppNavIndex, _maxLandDist+500] call A3A_fnc_findNavDistance;
    if (_navDist < 0) then { continue };        // no path found within range
    _supportMrk pushBack [_suppMrk, _navDist];

} forEach _nearLand;

A3A_landSupportMarkers set [_key, _supportMrk];
_supportMrk;
