/*
Maintainer: Caleb Serafin
    Searches for the nearest road to a position, then uses the road's position in the navGrid.
    This is necessary after importing from a string version, as exact positions are checked for.
    The original navGrid is modified.

Arguments:
    <navGridHM> Imported navGrid.

Return Value:
    <navGridHM> same navGrid reference.

Environment: Scheduled
Public: Yes
Dependencies:
    <SCALAR> A3A_NG_const_positionInaccuracy
    <ARRAY> A3A_NG_const_emptyArray
    <ARRAY> A3A_NG_const_roadTypeEnum
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_navGridHM] call A3A_fnc_NGSA_correctPositions;
*/
params [
    ["_navGridHM",0,[A3A_NG_const_hashMap]]
];

private _navPointConversionHM = createHashMap;
{
    private _roads = nearestTerrainObjects [_x, A3A_NG_const_roadTypeEnum, A3A_NG_const_positionInaccuracy, false, false];
    private _struct = _navGridHM get _x;
    if (_roads isNotEqualTo A3A_NG_const_emptyArray) then {
        private _newPos = getPosATL (_roads#0);

        _struct set [0,_newPos];
        _navGridHM deleteAt _x;
        _navGridHM set [_newPos,_struct];
        _navPointConversionHM set [_x,_newPos];
    } else {
        _navPointConversionHM set [_x,_x];
    };
} forEach +(keys _navGridHM);   // Is copied as the keys are deleted and added.

{
    private _connections = (_navGridHM get _x)#3;
    {
        _x set [0,_navPointConversionHM get (_x#0)];
    } forEach _connections;
} forEach (keys _navGridHM);
_navGridHM;
