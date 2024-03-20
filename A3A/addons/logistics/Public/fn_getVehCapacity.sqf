/*
    Author: [Håkon]
    [Description]
        Returns the vehicles cargo loading capacity

    Arguments:
    0. <Object> The vehicle you want to know the cargo capacity of
       <String> The vehicle classname you want to know the cargo capacity of

    Return Value:
    <Int> The cargo capacity count of the vehicle

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [_vehicle] call A3A_Logistics_fnc_getVehCapacity

    License: MIT License
*/
params [["_vehicle", objNull, [objNull, ""]]];
private _config = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;
if (isNull _config) exitWith { 0 };

count (configProperties [(_config/"Nodes"), "true", true]);
