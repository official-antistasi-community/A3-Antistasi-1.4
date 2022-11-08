/*
    Author: [Håkon]
    [Description]
        Gets the vehicles node array

    Arguments:
    0. <Object> Vehicle that you want to load cargo in

    Return Value:
    <Array> Node array of the object

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies:

    Example: private _nodes = [_vehicle] call A3A_Logistics_fnc_getVehicleNodes;
*/
params [["_vehicle", objNull, [objNull, ""]]];
private _config = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;
if (isNull _config) exitWith { [] };

private _nodes = configProperties [(_config/"Nodes"), "true", true];
_nodes apply { [1, getArray (_x/"offset"), getArray (_x/"seats")] };
