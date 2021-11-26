/*
Maintainer: Caleb Serafin
    Replaces a connection by with a middle node.
    This is required by the AI systems to determine whether they need a different path finding technique.

Arguments:
    <ARRAY> _navGridHM Struct. Point 1.
    <ARRAY> _navGridHM Struct. Point 2.
    <navGridHM> _navGridHM
    <HASHMAP> _posRegionHM
>

Return Value:
    <ARRAY> the midpoint struct if is was added. empty if nothing was added.

Scope: Local Arguments, Local Effect
Environment: Scheduled
Public: No
Dependencies:
    <ARRAY<STRING>> A3A_NG_const_roadTypeEnum
    <ARRAY> A3A_NG_const_emptyArray
    <SCALAR> A3A_NG_const_positionInaccuracy
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_leftStruct,_rightStruct,_navGridHM,_posRegionHM] call A3A_fnc_NGSA_insertMiddleNode;
*/

params [
    "_myStruct",
    "_otherStruct",
    ["_navGridHM",0,[A3A_NG_const_hashMap]],
    ["_posRegionHM",0,[A3A_NG_const_hashMap]]
];   //  [_pos2D,[_pos2D,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]]]

private _myPos = _myStruct#0;
private _otherPos = _otherStruct#0;
private _middlePos = [_myPos vectorAdd _otherPos vectorMultiply 0.5] call A3A_fnc_NGSA_getSurfaceATL;

private _islandID = _myStruct#1;
private _myConnections = _myStruct#3;

private _connectionIndex = _myConnections findIf {_x#0 isEqualTo _otherPos};
if (_connectionIndex == -1) exitWith {
    [1,"Roads Not connected but attempted to insert middle node.","fn_NGSA_insertMiddleNode"] call A3A_fnc_log;
    [];
};
private _connectionDetails = _myConnections #_connectionIndex;
private _roadEnum = _connectionDetails#1;
private _halfDistance = (_connectionDetails#2) / 2;
private _myDistance = _halfDistance;
private _otherDistance = _halfDistance;

private _suitablePosFound = true;
if !([_middlePos, _navGridHM, _posRegionHM,"offroad"] call A3A_fnc_NGSA_canAddPos) then { // Try random offsets.
    _suitablePosFound = false;
    private _aziStep = 22.5;  // sixteen directions to search in, 360 / 16
    for "_azimuth" from 0 to 360 - _aziStep step _aziStep do {
        private _searchDistance = 2 * A3A_NG_const_positionInaccuracy + 1;  // The +1 mitigates the issue of it being exactly on another node.
        private _newMiddlePos = _middlePos vectorAdd [_searchDistance * sin _azimuth,_searchDistance * cos _azimuth,0];
        if ([_middlePos, _navGridHM, _posRegionHM,"offroad"] call A3A_fnc_NGSA_canAddPos) exitWith {
            _middlePos = _newMiddlePos;
            _myDistance = _myPos distance _middlePos;
            _otherDistance = _otherPos distance _middlePos;
            _suitablePosFound = true;
        };
    };
};
// Even if there is a problem adding a node, still disconnect it as it is not a good path finding connection, and the user can try other points.
[_myStruct,_otherStruct,_roadEnum] call A3A_fnc_NGSA_toggleConnection;
if (!_suitablePosFound) exitWith {
    [
        "Connection Failed!",
        "A middle node was required to be inserted between the selected nodes.<br/>"+
        "However, there was no free space at the midpoint between the selected nodes.<br/>"+
        "Please manually create a middle node where there is space and connect it with both of the other nodes.",
        true,
        200
    ] call A3A_fnc_customHint;
    [];
};

private _middleStruct = [_middlePos,_islandID,false,[]];
[_navGridHM,_posRegionHM,_middlePos,_middleStruct] call A3A_fnc_NGSA_pos_add;
[_middleStruct] call A3A_fnc_NG_draw_dot;

[_middleStruct,_myStruct,_roadEnum,_myDistance] call A3A_fnc_NGSA_toggleConnection;
[_middleStruct,_otherStruct,_roadEnum,_otherDistance] call A3A_fnc_NGSA_toggleConnection;

_middleStruct;
