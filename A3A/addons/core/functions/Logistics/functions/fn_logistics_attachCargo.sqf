/*
    Author: [Håkon]
    Description:
        test attachment offset and rotation of cargo

    Arguments:
    0. <Object> Vehicle to used for the test
    1. <Object> Cargo to determine the offset and rotation of
    2. <Array>  Cargo offset
    3. <Array>  Cargo rotation
    4. <Int>    Cargo size

    Return Value:
    <Struct> [
        <String>    Model
        <Array>     Offset
        <Array>     Rotation
        <Int>       Cargo size
        <Int>       Recoil (0)
    ]

    Scope: Server,Server/HC,Clients,Any
    Environment: Scheduled/unscheduled/Any
    Public: Yes/No
    Dependencies:

    Example: [TestVeh, cursorObject, [0,0,0], [0,1,0], 1] call A3A_fnc_logistics_attachCargo;

    License: MIT License
*/
params [
["_veh", objNull, [objnull]]
,["_cargo", objNull, [objnull]]
,["_offset", 0, [[]], 3]
,["_rotation", 0, [[]], 3]
,["_nodeCount", 0, [0]]
];

private _nodes = [_veh] call A3A_fnc_logistics_getVehicleNodes;
private _hardPoints = _nodes apply {_x#1};
private _lastNode = _hardPoints#(_nodeCount-1);
private _diff = (_hardPoints#0) vectorDiff _lastNode;
private _nodeOffset = _lastNode vectorAdd [0,(_diff#1)/2,0];
if (isNil "_nodeOffset") exitWith {"Node count out of bounds: "+ str _nodeCount};

private _attachmentOffset = _nodeOffset vectorAdd _offset;
_cargo attachTo [_veh, _attachmentOffset];
if (clientOwner isEqualTo (owner _cargo)) then {
    _cargo setVectorDirAndUp [_rotation,[0,0,1]];
} else {
    [_cargo, [_rotation,[0,0,1]]] remoteExecCall ["setVectorDirAndUp", owner _cargo];
};

[getText(configFile/"CfgVehicles"/typeOf _cargo/"model"), _offset, _rotation, _nodeCount, 0];
