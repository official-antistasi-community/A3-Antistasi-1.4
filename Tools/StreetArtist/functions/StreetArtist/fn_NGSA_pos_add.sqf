/*
Maintainer: Caleb Serafin
    Adds a road reference from navGridHM and posRegionHM.
    posRegionHM will not have any references to pos.
    navGridHM will hold references to pos and walue data.

Arguments:
    <HASHMAP<POSATL,ANY>>   Position as Key.
    <HASHMAP<
        <POS2D>             Region code Key. (Not real pos)
        <ARRAY<POSATL>>     List of actual positions in region
    >
    <POSATL>                Position to add
    <ANY>                   Value to add to _navGridHM.

Return Value:
    <ANY> Undefined

Scope: Any
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_navGridHM,_posRegionHM,_pos,_struct] call A3A_fnc_NGSA_pos_add;
*/
params [
    ["_navGridHM",0,[A3A_NG_const_hashMap]],
    ["_posRegionHM",0,[A3A_NG_const_hashMap]],
    ["_pos",[],[ [] ],[3]],
    "_valueData"
];

private _regionCode = [floor (_pos#0 / 100),floor (_pos#1 / 100)];
if (_regionCode in _posRegionHM) then {
    (_posRegionHM get _regionCode) pushBackUnique (+_pos);
} else {
    _posRegionHM set [_regionCode,[+_pos]];
};
_navGridHM set [_pos,_valueData];
