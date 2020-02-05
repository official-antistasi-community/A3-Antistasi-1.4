/*
	Returns the unit's radio - be it vanilla, TFAR or ACRE.

    Inputs:
        1: unit			"Unit to get radio from"

    Outputs
        Class name of radio or "" if not found
*/

//Note: This file has been optimised. Avoid changing unless necessary.

params ["_unit"];
 
private _items = assignedItems _unit; 

private _radioPosition = _items findIf {_x == "ItemRadio" || {_x find "tf_" > -1} || {_x find "acre_" > -1}}; 
 
if (_radioPosition > -1) then {
	_items select _radioPosition;
} else {
	"";
};