/*
    A3A_fnc_addToNavCells
    Links a nav point to a cell grid for fast lookups

Scope: Server or HC
Environment: Init

Arguments:
    <INTEGER> The index of the nav node

Return Value:
    None
*/

#define OFFSET 300

params ["_index"];
NavGrid#_index#0 params ["_xpos", "_ypos"];

private _left = floor ((_xpos - OFFSET) / 1000);
private _right = floor ((_xpos + OFFSET) / 1000);
private _low = floor ((_ypos - OFFSET) / 1000);
private _high = floor ((_ypos + OFFSET) / 1000);

private _navCells = [format ["%1/%2", _left, _low]];
if (_left != _right) then {
    _navCells pushBack format ["%1/%2", _right, _low];
    if (_low != _high) then {
        _navCells pushBack format ["%1/%2", _left, _high];
        _navCells pushBack format ["%1/%2", _right, _high];
    };
} else {
    if (_low != _high) then {
        _navCells pushBack format ["%1/%2", _left, _high];
    };
};

private _navXYI = [_xpos, _ypos, _index];
{
    private _navPoints = A3A_navCellHM getOrDefault [_x, [], true];
    _navPoints pushBack _navXYI;
} forEach _navCells;
