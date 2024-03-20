/*
    Author: [Håkon]
    [Description]
        Finds the node offset and rotation

    Arguments:
    0. <Object> Cargo to retrive the offset and rotation from hardpoint to attach to

    Return Value:
    <Array> [<Array> offset, <Array> rotation]

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies:

    Example: private _offsetAndDir = [_cargo] call A3A_Logistics_fnc_getCargoOffsetAndDir;
*/
params [["_object", objNull, [objNull, ""]]];

private _config = [_object] call A3A_Logistics_fnc_getCargoConfig;
if (isNull _config) exitWith { [[0,0,0], [0,0,0]] };
if (_object isKindOf "CAManBase") exitWith { [[0,0,0], [0,0,0]] };//exception for the mdical system

[getArray (_config/"offset"), getArray (_config/"rotation")];
