/*
Author: Håkon
Description:
    Gets the radio class the unit is using
    does not include backpack radios

Arguments:
0. <Object> Unit to get the radio class from

Return Value: <String> Classname of radio or "" if not found

Scope: Any
Environment: Any
Public: Yes
Dependencies:
Performance: 0.0109 - 0.0203ms

Example: [_unit] call A3A_fnc_getRadio

License: MIT License
*/
params ["_unit"];

private _items = assignedItems _unit;
private _radioPosition = _items findIf { _x == "ItemRadio" || {"tf_" in _x} || {"TFAR_" in _x} || {"item_radio" in _x} };

if (_radioPosition > -1) then {
	_items # _radioPosition;
} else {
	"";
};
