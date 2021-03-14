/*
    Author: [Håkon]
    [Description]
        Finds the node offset and rotation from A3A_logistics_attachmentOffset

    Arguments:
    0. <Object> Cargo to retrive the offset and rotation from hardpoint to attach to

    Return Value:
    <Array> [<Array> offset, <Array> rotation]

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies: A3A_logistics_attachmentOffset

    Example: private _offsetAndDir = [_cargo] call A3A_fnc_logistics_getCargoOffsetAndDir;
*/
params [["_object", objNull, [objNull, ""]]];
private _type = if (_object isEqualType objNull) then { typeOf _object } else { _object };
private _return = [ [0,0,0], [0,0,0] ];
if (_type isEqualTo "") exitWith {_return};
if (_object isKindOf "CAManBase") exitWith {_return};//exception for the mdical system

private _model = getText (configFile >> "CfgVehicles" >> _type >> "model");
{
    if ( (_x#0) isEqualTo _model ) exitWith { _return = [+_x#1,+_x#2] };
}forEach A3A_logistics_attachmentOffset;

_return;
