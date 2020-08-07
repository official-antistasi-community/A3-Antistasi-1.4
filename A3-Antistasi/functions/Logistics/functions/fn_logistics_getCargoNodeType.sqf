params ["_object"];
if (_object isKindOf "CAManBase") exitWith {2};//exception for the mdical system
private _type = -1;

private _model = getText (configFile >> "CfgVehicles" >> typeOf _object >> "model");
{
    if ((_x#0) isEqualTo _model) exitWith {_type = +(_x#3)};
}forEach logistics_attachmentOffset;

_type;