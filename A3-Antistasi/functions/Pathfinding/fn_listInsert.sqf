/*
Author: Wurzel0701
    Inserts a pathfinding node into a list based on its value.
    Uses a binary search approach to find the insert index to save time.
    The insertion process breaks the reference, so use the return value!
    THIS FUNCTION NEEDS A HIGHLY SPECIFIC INPUT FORMAT!
    !DO NOT USE!

Arguments:
    <ARRAY> The list in which the entry should be sorted in
    <ARRAY> The end position to which the value will be measured

Return Value:
    <ARRAY> The new list

Scope: Any
Environment: Any
Public: DONT USE
Dependencies:
    <NULL>

Example:
    NO BAD DONT
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params
[
    ["_list", [], [[]]],
    ["_entry", [], [[]]]
];

private _entryValue = (_entry select 1) + (_entry select 2);
private _listCount = count _list;

if(isNil "_entryValue" || {!(_entryValue isEqualType 0)}) exitWith
{
    Error_1("Bad input, was %1", _entry);
    _list;
};

if(_listCount == 0) exitWith
{
    _list pushBack _entry;
    _list;
};

private _upperLimit = _listCount - 1;
private _lowerLimit = 0;
private _insertIndex = 0;
private _searchValue = 0;
private _element = 0;
//Iterative binary search
while {_upperLimit >= _lowerLimit} do
{
    _insertIndex = floor ((_lowerLimit + _upperLimit) / 2);
    _element = _list select _insertIndex;
    _searchValue = (_element select 1) + (_element select 2);

    if(_searchValue == _entryValue) exitWith {};
    if(_searchValue > _entryValue) then
    {
        _upperLimit = _insertIndex - 1;
    }
    else
    {
        _lowerLimit = _insertIndex + 1;
    };
};

if(_searchValue <= _entryValue) then
{
    _insertIndex = _insertIndex + 1;
};

_list = (_list select [0, _insertIndex]) + [_entry] + (_list select [_insertIndex, _listCount - _insertIndex]);
_list;
