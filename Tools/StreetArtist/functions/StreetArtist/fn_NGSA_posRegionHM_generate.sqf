/*
Maintainer: Caleb Serafin
    Generates a region lookup table for positions. This allows fast fetching of near positions.
    The lookup table does not create any references to the original table.

Arguments:
    <HASHMAP<POS2D,ANY>> Position as Key. | <ARRAY<POS2D>> Positions.

Return Value:
    <HASHMAP
        POS2D           Region code blocks. ([0,3] is between 0m x and 100m x; 300m y and 400m y)
        Array<POSATL>   All positions within that region.
    >

Scope: Any
Environment: Any
Public: Yes

Example:
    private _posRegionHM = [_posList] call A3A_fnc_NGSA_posRegionHM_generate;
*/
params [
    "_posList"
];

private _posRegionHM = createHashMap;
{
    private _regionCode = [floor (_x#0 / 100),floor (_x#1 / 100)];
    if (_regionCode in _posRegionHM) then {
        (_posRegionHM get _regionCode) pushBackUnique (+_x);
    } else {
        _posRegionHM set [_regionCode,[+_x]];
    };
} forEach _posList;
_posRegionHM
