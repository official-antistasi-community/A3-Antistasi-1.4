/*
Author: Caleb Serafin
    Deletes multiple indices from an array very efficiently (at least 155x faster than deleteAts) (Excluding sorting the indices).
    NB: May not preserve original order.
    Modifies referenced array.

Arguments:
    <ARRAY> Any array. Modified.
    <ARRAY<SCALAR>> Indices of values to delete. Modified.
    <BOOLEAN> If indices are sorted in Descending order. [DEFAULT=false]

Return Value:
    <ARRAY> Same reference.

Scope: Any.
Environment: Any.
Public: Yes

Example:
    // Indices:    0   1   2   3   4   5   6   7
    private _a = ["a","b","c","d","e","f","g","h"];
    [_a,[1,6,4]] call remIndices;
    // Indices:  0   1   2   3   4
    _a;     // ["a","f","c","d","h"]
*/
params [
    ["_array",[],[ [] ]],
    ["_indices",[],[ [] ]],
    ["_sorted",true,[ true ]]
];

private _lastIndex = count _array -1;
if (!_sorted) then {   // Prepare for some black magic
    _indices sort false;
};
{
    _array set [_x,_array#(_lastIndex-_forEachIndex)]
} forEach _indices;
_array resize (_lastIndex + 1 - count _indices);
_array;


/*
private _indicesMaster = [0];
_indicesMaster resize 1000000;
for "_i" from 999999 to 1 step -1 do {
    _indicesMaster set [_i, floor (random 1000000)];
};
private _lastIndex = 999999;

private _totalTime = 0;
private _startTime = 0;
private _loops = 10;
for "_i" from 1 to _loops do {
    private _indices = +_indicesMaster;
    _startTime = diag_tickTime;

    {
        if (_lastIndex < _x + _forEachIndex) then {
            _indices set [_forEachIndex,_indices#(_lastIndex -_x)]
        };
    } forEach _indices;

    _totalTime = _totalTime + diag_tickTime - _startTime;
};                                                              // 2152.73ms // 217.383ms // 21.4844ms O(n)   <-- Worst Cases without set operations
[str (1000*(_totalTime/_loops)),"ms"] joinString "";            // 2381.64ms  <-- More entropy, don't know why its worse


private _indicesMaster = [];
_indicesMaster resize 1000000;
for "_i" from 0 to 999999 do {
    _indicesMaster set [_i, floor (random 1000000)];
};

private _totalTime = 0;
private _startTime = 0;
private _loops = 10;
for "_i" from 1 to _loops do {
    private _indices = +_indicesMaster;
    _startTime = diag_tickTime;

    _indices sort false;

    _totalTime = _totalTime + diag_tickTime - _startTime;
};                                                              // 1333.2ms // 109.375ms // 8.78906ms
[str (1000*(_totalTime/_loops)),"ms"] joinString "";            // 2355.08ms // 167.188ms // 12.5ms  <-- Using random


private _arrayMaster = [];
_arrayMaster resize 1000000;
for "_i" from 0 to 999999 do {
    _arrayMaster set [_i, str _i];
};
private _indices = [1305,102,243848,643848,233848,335848,835858,805858];
_indices sort false;

private _totalTime = 0;
private _startTime = 0;
private _loops = 1000;
for "_i" from 1 to _loops do {
    private _array = +_arrayMaster;
    _startTime = diag_tickTime;

    private _lastIndex = count _array -1;
    {
        _array set [_x,_array#(_lastIndex-_forEachIndex)]
    } forEach _indices;
    _array resize (_lastIndex + 1 - count _indices);

    _totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*(_totalTime/_loops)),"ms"] joinString "";            // 0.0419922ms



private _arrayMaster = [];
_arrayMaster resize 1000000;
for "_i" from 0 to 999999 do {
    _arrayMaster set [_i, str _i];
};
_indices = [1305,102,243848,643848,233848,335848,835858,805858];
private_indices sort false;

private _totalTime = 0;
private _startTime = 0;
private _loops = 1000;
for "_i" from 1 to _loops do {
    private _array = +_arrayMaster;
    _startTime = diag_tickTime;

    {
        _array deleteAt _x;
    } forEach _indices;

    _totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*(_totalTime/_loops)),"ms"] joinString "";            // 6.54492ms
*/
