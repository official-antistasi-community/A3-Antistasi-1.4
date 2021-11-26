/*
Maintainer: Caleb Serafin
    Checks if a new navGrid position can be added at the position.
    It must not be within 2*A3A_NG_const_positionInaccuracy of another point.
    It cannot be within A3A_NG_const_positionInaccuracy of a road without being exactly on it.

Arguments:
    <POSATL> The desired location.
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
    <ARRAY> A3A_NG_const_roadTypeEnum
    <SCALAR> A3A_NG_const_positionInaccuracy

Example:
    [_pos, _navGridHM, _posRegionHM] call A3A_fnc_NGSA_canAddPos;
*/
params [
    ["_pos",[],[ [] ],[3]],
    ["_navGridHM",0,[A3A_NG_const_hashMap]],
    ["_posRegionHM",0,[A3A_NG_const_hashMap]],
    ["_roadRequirement","any",[""]]
];

private _isOffroad = (
    nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, A3A_NG_const_positionInaccuracy, false, false]
    select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}}
) isEqualTo A3A_NG_const_emptyArray;

if (
    switch (toLower _roadRequirement) do {
        case "onroad": { _isOffroad };
        case "offroad": { !_isOffroad };
        default { false };
    }
) exitWith {false};
private _doublePosInaccuracy = 2 * A3A_NG_const_positionInaccuracy;
private _isNearRoad = nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, _doublePosInaccuracy, false, false] isNotEqualTo A3A_NG_const_emptyArray;
if (_isOffroad && _isNearRoad) exitWith {false};

if (_pos in _navGridHM) exitWith {false};   // Quick check before fetching nearby regions

private _nearNodes = [_posRegionHM,_pos] call A3A_fnc_NGSA_posRegionHM_allAdjacent;
private _isNotNearNode = _nearNodes findIf {_pos distance _x <= _doublePosInaccuracy} == -1;
_isNotNearNode;
