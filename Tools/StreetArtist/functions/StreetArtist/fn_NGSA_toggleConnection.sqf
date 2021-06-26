/*
Maintainer: Caleb Serafin
    Removes a _roadStruct reference from posRegions.
    Will attempt to update marker colour if the marker exists.

Arguments:
    [_posATL,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]] Road Struct 1
    [_posATL,_islandID,_isJunction,[_conPos2D,_roadEnum,_distance]] Road Struct 2
    <SCALAR> What connection it should be [MAIN ROAD,ROAD,TRACK].
    <SCALAR> Override Distance [Default = -1]


Return Value:
    <BOOLEAN> true if made connected, false if made disconnected.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No
Dependencies:
    <LOCATION> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "posRegionHM")

Example:
    [A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,A3A_NGSA_modeConnect_roadTypeEnum] call A3A_fnc_NGSA_toggleConnection;
*/
params [
    ["_leftStruct",[],[ [] ], [4]],
    ["_rightStruct",[],[ [] ], [4]],
    ["_connectionTypeEnum",0,[ 0 ]],
    ["_distance",-1,[ 0 ]]
];

private _leftPos = _leftStruct#0;
private _rightPos = _rightStruct#0;

private _leftConnections = _leftStruct#3;
private _rightConnections = _rightStruct#3;

private _midPoint = _leftPos vectorAdd _rightPos vectorMultiply 0.5;
private _name = "A3A_NG_Line_"+str _midPoint;

private _isConnected = _rightConnections findIf {(_x#0) isEqualTo _leftPos} != -1;
if (_isConnected) then { // If connected, then disconnect.
    private _rightInLeft = _leftConnections findIf {(_x#0) isEqualTo _rightPos};
    _leftConnections deleteAt _rightInLeft;

    private _leftInRight = _rightConnections findIf {(_x#0) isEqualTo _leftPos};
    _rightConnections deleteAt _leftInRight;

    [_leftStruct,_rightStruct,_connectionTypeEnum,0] call A3A_fnc_NG_draw_connection;
} else {    // If not connected, then connect.
    if (_distance < 0) then {
        _distance = _leftPos distance _rightPos;
    };
    _leftConnections pushBack [_rightPos,_connectionTypeEnum,_distance];
    _rightConnections pushBack [_leftPos,_connectionTypeEnum,_distance];

    [_leftStruct,_rightStruct,_connectionTypeEnum] call A3A_fnc_NG_draw_connection;
};

// Refresh marker junction colour
[_leftStruct] call A3A_fnc_NG_draw_dot;
[_rightStruct] call A3A_fnc_NG_draw_dot;

!_isConnected;