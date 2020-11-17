/*
    Author: [Håkon]
    [Description]
        Finds the node type(size) from logistics_attachmentOffset

    Arguments:
    0. <Object> Object that is loadable (Cargo)

    Return Value:
    <Int> Cargo node size/type

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies: logistics_attachmentOffset

    Example: private _objNodeType = [_object] call A3A_fnc_logistics_getCargoNodeType;
*/
params ["_object"];
if (_object isKindOf "CAManBase") exitWith {2};//exception for the medical system
private _type = -1;

private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
{
    if ((_x#0) isEqualTo _model) exitWith {_type = +(_x#3)};
}forEach logistics_attachmentOffset;

_type;
