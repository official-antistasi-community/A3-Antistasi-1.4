/*
Author: Wurzel0701
    Gets the nearby positions a nav node should be linked to

Arguments:
    <POSITION> The position of the nav node

Return Value:
    <ARRAY<POSITION>> The positions the nav node should be linked to

Scope: Server
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [_navNodePos] call A3A_fnc_getMainPositions;
*/

#define OFFSET 300
params [["_pos", [-1, -1, -1], [[]]]];

private _allPositions = [];
private _x = _pos select 0;
private _y = _pos select 1;
private _xFloored = floor (_x / 1000);
private _yFloored = floor (_y / 1000);

private _position = format ["%1/%2", _xFloored, _yFloored];
_allPositions pushBack _position;

private _xSidePos = floor ((_x + OFFSET)/1000);
private _xSideNeg = floor ((_x - OFFSET)/1000);
private _xDiff = _xFloored;
private _xHasDiff = false;
if(_xSideNeg != _xDiff || _xSidePos != _xDiff) then
{
    _xHasDiff = true;
    if(_xSidePos != _xDiff) then
    {
        _xDiff = _xSidePos;
    }
    else
    {
        _xDiff = _xSideNeg;
    };
    _position = format ["%1/%2", _xDiff, _yFloored];
    _allPositions pushBackUnique _position;
};

private _ySidePos = floor ((_y + OFFSET)/1000);
private _ySideNeg = floor ((_y - OFFSET)/1000);
private _yDiff = _yFloored;
private _yHasDiff = false;
if(_ySideNeg != _yDiff || _ySidePos != _yDiff) then
{
    _yHasDiff = true;
    if (_ySidePos != _yDiff) then
    {
        _yDiff = _ySidePos;
    }
    else
    {
        _yDiff = _ySideNeg;
    };
    _position = format ["%1/%2", _xFloored, _yDiff];
    _allPositions pushBackUnique _position;
};

if(_yHasDiff && _xHasDiff) then
{
    _position = format ["%1/%2", _xDiff, _yDiff];
    _allPositions pushBackUnique _position;
};

_allPositions;
