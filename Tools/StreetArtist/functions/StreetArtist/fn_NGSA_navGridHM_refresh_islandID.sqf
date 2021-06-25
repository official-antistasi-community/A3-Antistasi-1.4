/*
Maintainer: Caleb Serafin
    Refreshes all island IDs. Modifies reference

Arguments:
    <navGridHM> is modified.

Return Value:
    <navGridHM> The same reference returned.

Scope: Any
Environment: Unscheduled, does not support parallel changes to _navGridHM;
Public: Yes
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap

Example:
    _navGridHM call A3A_fnc_NGSA_navGridHM_refresh_islandID;
*/
params [
    ["_navGridHM",0,[A3A_NG_const_hashMap]]
];

private _unprocessedPosHM = createHashMapFromArray (keys _navGridHM apply {[_x,true]});
private _islandID = 0;

while {count _unprocessedPosHM != 0} do {
    private _newPos = keys _unprocessedPosHM #0;
    _unprocessedPosHM deleteAt _newPos;
    private _nextPositions = [_newPos];    // Array<pos2D>

    while {count _nextPositions != 0} do {
        private _currentPositions = _nextPositions; // Array<pos2D>
        _nextPositions = [];

        {
            private _struct = _navGridHM get _x;
            _struct set [1,_islandID];

            private _connectedPositions = (_struct#3) apply {_x#0} select {_unprocessedPosHM get _x};
            { _unprocessedPosHM deleteAt _x; } forEach _connectedPositions;
            _nextPositions append _connectedPositions;
        } forEach _currentPositions;
    };
    _islandID = _islandID +1;
};

_navGridHM;
