/*
Maintainer: Caleb Serafin
    Gets positions within 9 regions centred on pos. The position returned with be in the following order.
    Where Each square is a region of positions, Pos is marked P and is ordered 5th:
    3|6|9
    2|P|8
    1|4|7
    Much faster than fn_NGSA_posRegionHM_pixelRadius with 100m radius.

Arguments:
    <HASHMAP> _posRegionHM
    <POSATL> map position.

Return Value:
    ARRAY<POS2D> Array of nearby nodes.

Scope: Any
Environment: Any.
Public: Yes
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_posRegionHM,_pos] call A3A_fnc_NGSA_posRegionHM_allAdjacent.
*/
params [
    ["_posRegionHM",0,[A3A_NG_const_hashMap]],
    "_pos"
];

private _region_x = floor (_pos#0 / 100) -1;
private _region_y_centre = floor (_pos#1 / 100);

// Unrolled loop since it is small and finite.
private _posList = [];
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre-1],[] ]);    // Does not matter if it goes out of map range, append handles nil.
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre  ],[] ]);
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre+1],[] ]);
_region_x = _region_x +1;
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre-1],[] ]);
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre  ],[] ]);
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre+1],[] ]);
_region_x = _region_x +1;
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre-1],[] ]);
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre  ],[] ]);
_posList append (_posRegionHM getOrDefault [ [_region_x,_region_y_centre+1],[] ]);

_posList;
