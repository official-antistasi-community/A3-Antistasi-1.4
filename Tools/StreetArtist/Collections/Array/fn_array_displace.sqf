/*
Author: Caleb Serafin
    Inserts value at index;
    Value that occupies that index is displaced to the back.
    Order is maintained (except for previous occupier).
    Original array is modified.

Arguments:
    <ARRAY> Any array.
    <ANY> Any value.
    <SCALAR> Index. [DEFAULT=0]

Return Value:
    <ARRAY> Same reference.

Scope: Any.
Environment: Any.
Public: Yes

Example:
    private _a = [1,2,3,4,5];
    [_a,0] call Col_fnc_array_displace;
    _a; // [0,2,3,4,5,1]
*/
params [
    ["_array",[],[ [] ]],
    ["_value",false],
    ["_index",0,[ 0 ]]
];
_array pushBack (_array#_index);
_array set [_index,_value];
_array;
