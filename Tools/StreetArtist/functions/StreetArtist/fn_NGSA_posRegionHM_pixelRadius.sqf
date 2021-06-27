/*
Maintainer: Caleb Serafin
    Gets all positions within & near radius.
    Much slower than fn_NGSA_posRegionHM_allAdjacent with 100m radius.

    Regions returned ≤ 2^(floor(radius/100))
    Regions returned ∝ Time taken to generate

Arguments:
    <HASHMAP> _posRegionHM
    <POSATL> map position.
    <SCALAR> Radius.

Return Value:
    <POS2D> Pos of closest navGridHM element If Found   |  <ARRAY> Empty array if not found.

Scope: Any
Environment: Any.
Public: Yes
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_posRegionHM,_pos,500] call A3A_fnc_NGSA_posRegionHM_pixelRadius.
*/
params [
    ["_posRegionHM",0,[A3A_NG_const_hashMap]],
    "_pos",
    "_radius"
];

if (isNil {A3A_NGSA_posRegionHM_pixelRadius_offsets}) then {
    A3A_NGSA_posRegionHM_pixelRadius_offsets = [];  // Used to cache last region offsets if radius is the same.
    A3A_NGSA_posRegionHM_pixelRadius_radius = -1;   // Used only to detect changes.
};

private _regionRadius = _radius /100;
if (_radius > A3A_NGSA_posRegionHM_pixelRadius_radius) then {  // If last cache was too small, we need to regenerate. Else: it can be re-filtered because there is less to search.
    private _regionRadiusCeil = ceil _regionRadius;
    A3A_NGSA_posRegionHM_pixelRadius_offsets = [];

    for "_j" from -_regionRadiusCeil to _regionRadiusCeil do {
        for "_k" from -_regionRadiusCeil to _regionRadiusCeil do {
            A3A_NGSA_posRegionHM_pixelRadius_offsets pushBack [_j,_k];
        };
    };
};

if (_radius != A3A_NGSA_posRegionHM_pixelRadius_radius) then {      // Filter into a pixel circle.
    private _circleRadiusSqu = (_regionRadius + sqrt 2)^2;
    A3A_NGSA_posRegionHM_pixelRadius_offsets = A3A_NGSA_posRegionHM_pixelRadius_offsets select {(  ((_x#0)^2) + ((_x#1)^2)  ) < _circleRadiusSqu};
    A3A_NGSA_posRegionHM_pixelRadius_radius = _radius;
};

private _centreRegion = [floor (_pos#0/100),floor (_pos#1/100)];
private _positions = [];
{
    private _regionCode = _x vectorAdd _centreRegion select A3A_NG_const_pos2DSelect;
    _positions append (_posRegionHM getOrDefault [_regionCode,[]]);
} forEach A3A_NGSA_posRegionHM_pixelRadius_offsets;
_positions;
