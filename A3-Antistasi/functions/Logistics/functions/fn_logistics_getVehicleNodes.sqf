/*
    Author: [Håkon]
    [Description]
        Gets the vehicles node array

    Arguments:
    0. <Object> Vehicle that you want to load cargo in

    Return Value:
    <Array> Node array of the object

    Scope: Server,Server/HC,Clients,Any
    Environment: Scheduled/unscheduled/Any
    Public: [Yes/No]
    Dependencies:

    Example: private _nodes = [_vehicle] call A3A_fnc_logistics_getVehicleNodes;
*/
params ["_vehicle"];
private _return = -1;
private _model = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "model");

{
    if ((_x#0) isEqualTo _model) exitWith {_return = +_x#1};
}forEach logistics_vehicleHardpoints;

_return;
