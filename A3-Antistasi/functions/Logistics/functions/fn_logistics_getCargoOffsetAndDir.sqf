params ["_object"];
if (_object isKindOf "CAManBase") exitWith {[[0,0,0],[0,0,0]]};//exception for the mdical system
private _return = [[0,0,0],[0,0,0]];

private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
{
    if ((_x#0) isEqualTo _model) exitWith {_return = +[_x#1,_x#2]};
}forEach logistics_attachmentOffset;

_return;