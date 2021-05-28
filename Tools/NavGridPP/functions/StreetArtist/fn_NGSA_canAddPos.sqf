/*
Maintainer: Caleb Serafin
    Checks if a new navGrid position can be added at the position.
    It must not be within 2*A3A_NG_const_positionInaccuracy of another point.
    It cannot be within A3A_NG_const_positionInaccuracy of a road without being exactly on it.

Arguments:
    <POS2D> The desired location.
    <navGridHM> _navGridHM
    <HASHMAP> _posRegionHM
    <STRING> "any" to not care, "onRoad" to require it to be on a road, "offRoad" to require it to be off any roads. [Default = "any"]

Return Value:
    <BOOL> True if road can be added, false if it cannot be added.

Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap
    <ARRAY> A3A_NG_const_emptyArray
    <SCALAR> A3A_NG_const_positionInaccuracy

Example:
    [_pos, _navGridHM, _posRegionHM] call A3A_fnc_NGSA_canAddPos;
*/
params [
    ["_pos",[],[[]],[2]],
    ["_navGridHM",0,[A3A_NG_const_hashMap]],
    ["_posRegionHM",0,[A3A_NG_const_hashMap]],
    ["_roadRequirement","any",[""]]
];

assert (A3A_NG_const_positionInaccuracy < 100); // This is the minimum distance returned by adjacent navRegions.

private _isOffroad = nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, 0, false, false] isEqualTo A3A_NG_const_emptyArray;
if !(
    switch (toLower _roadRequirement) do {
        case "onroad": { !_isOffroad };
        case "offroad": { _isOffroad };
        default { true };
    }
) exitWith {false};
private _isNearRoad = nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, A3A_NG_const_positionInaccuracy, false, false] isNotEqualTo A3A_NG_const_emptyArray;
if (_isOffroad && _isNearRoad) exitWith {false};

if (_pos in _navGridHM) exitWith {false};   // Quick check before fetching nearby regions

private _nearNodes = [_posRegionHM,_pos] call A3A_fnc_NGSA_posRegionHM_allAdjacent;
private _doublePosInaccuracy = 2 * A3A_NG_const_positionInaccuracy;
_nearNodes findIf {_pos distance _x <= _doublePosInaccuracy} == -1;
