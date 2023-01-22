/*
    Author: [Håkon]
    [Description]
        Finds the node type(size)

    Arguments:
    0. <Object> Object that is loadable (Cargo)

    Return Value:
    <Int> Cargo node size/type

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: private _objNodeType = [_object] call A3A_Logistics_fnc_getCargoNodeType;
*/
params [["_object", objNull, [objNull, ""]]];

private _config = [_object] call A3A_Logistics_fnc_getCargoConfig;
if (isNull _config) exitWith {-1};

getNumber (_config/"size");
