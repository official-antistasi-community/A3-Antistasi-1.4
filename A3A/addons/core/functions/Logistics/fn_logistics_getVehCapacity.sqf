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
    Dependencies: <Array< <String>model,<scalar>1,<vec3>location,Array<Scalar>locked seats >> A3A_logistics_vehicleHardpoints

    Example: [_vehicle] call A3A_fnc_logistics_getVehCapacity

    License: MIT License
*/
params [["_vehicle", objNull, [objNull, ""]]];
private _type = if (_vehicle isEqualType objNull) then { typeOf _vehicle } else { _vehicle };
private _countNodes = 0;
if (_type isEqualTo "") exitWith { _countNodes };

private _model = getText (configFile >> "CfgVehicles" >> _type >> "model");
{
    if ( (_x#0) isEqualTo _model ) exitWith { _countNodes = count (_x#1) };
}forEach A3A_logistics_vehicleHardpoints;

_countNodes;
