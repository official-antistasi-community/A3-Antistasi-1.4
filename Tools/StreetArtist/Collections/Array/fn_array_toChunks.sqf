/*
Author: Caleb Serafin
    String or array is cut into chunks with maximum size of on _maxChunkSize.

Arguments:
    <STRING|ARRAY> Input.
    <INTEGER> Max string/array chunk length. [DEFAULT=5]
    <INTEGER> Max chunks, will throw exception if this is exceeded. [DEFAULT=1 000 000]

Return Value:
    <ARRAY<STRING|ARRAY>> Chunks of original string/array.

Scope: Any.
Environment: Any
Public: Yes

Exceptions:
    ["TooManyChunks",_message];

Example:
    private _string = "[""Hello World!"",""Hello Program!""]";
    [_string,7] call Col_fnc_array_toChunks;  // ["[""Hello"," World!",""",""Hell","o Progr","am!""]"]

    private _array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
    [_array,5] call Col_fnc_array_toChunks;  // [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17]]
*/
params [
    ["_array","",["",[]]],
    ["_maxChunkSize",5,[0]],
    ["_maxChunks",1000000,[0]]
];

private _numberOfChunks = ceil (count _array / _maxChunkSize) -1;
if (_numberOfChunks > _maxChunks) then {
    throw ["TooManyChunks",[str _numberOfChunks," > ",str _maxChunks] joinString ""];
    [];
};

private _chunks = [];
for "_i" from 0 to _maxChunkSize*_numberOfChunks step _maxChunkSize do {
    _chunks pushBack (_array select [_i, _maxChunkSize]);
};
_chunks;
