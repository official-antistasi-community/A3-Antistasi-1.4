/*
Author: Caleb Serafin
    Deletes multiple indices from an array while preserving original order.
    (at least 155x slower than remIndices) (Excluding sorting the indices).
    Modifies referenced array.

Arguments:
    <ARRAY> Any array.
    <ARRAY<SCALAR>> Indices of values to delete.
    <BOOLEAN> If indices are unsorted. They are must be sorted in Descending order to tick false! [DEFAULT=true]

Return Value:
    <ARRAY> Deleted values. (in order of descending indices)

Scope: Any.
Environment: Any.
Public: Yes

Example:
    // Indices:    0   1   2   3   4   5   6   7
    private _a = ["a","b","c","d","e","f","g","h"];
    private _r = [_a,[1,6,4]] call Col_fnc_array_deleteAts;
    // Indices:  0   1   2   3   4
    _a;     // ["a","f","c","d","h"]
    _r;     // ["g","e","b"]
*/
params [
    ["_array",[],[ [] ]],
    ["_indices",[],[ [] ]],
    ["_unsorted",true,[ true ]]
];
if (_unsorted) then {
    _indices sort false;
};
private _removed = [];
{
    _removed pushBack (_array deleteAt _x);
} forEach _indices;
_removed;
