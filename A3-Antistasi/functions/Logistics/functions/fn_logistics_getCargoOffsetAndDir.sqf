/*
    Author: [Håkon]
    [Description]
        Finds the node offset and rotation from logistics_attachmentOffset

    Arguments:
    0. <Object> Cargo to retrive the offset and rotation from hardpoint to attach to

    Return Value:
    <Array> [<Array> offset, <Array> rotation]

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies: logistics_attachmentOffset

    Example: private _offsetAndDir = [_cargo] call A3A_fnc_logistics_getCargoOffsetAndDir;
*/
params ["_object"];
if (_object isKindOf "CAManBase") exitWith {[[0,0,0],[0,0,0]]};//exception for the mdical system
private _return = [[0,0,0],[0,0,0]];

private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
{
    if ((_x#0) isEqualTo _model) exitWith {_return = +[_x#1,_x#2]};
}forEach logistics_attachmentOffset;

_return;
