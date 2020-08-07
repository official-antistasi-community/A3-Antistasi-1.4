params ["_vehicle"];
private _return = -1;
private _model = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "model");

{
    if ((_x#0) isEqualTo _model) exitWith {_return = +_x#1};
}forEach logistics_vehicleHardpoints;

_return;