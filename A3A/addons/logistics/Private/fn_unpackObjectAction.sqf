/*
Function: A3A_Logistics_fnc_unpackObjectAction
Author: Killerswin2
    adds addAction to passed object
Arguments:
    0.<Object> object to be packed
Return Value:
    <nil>
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [_object] call A3A_Logistics_fnc_unpackObjectAction; 
*/



params  [
    ["_package", objNull, [objNull]]
];

_package addAction [
	"Unpack object",
	{
		[_this#3] call A3A_Logistics_fnc_unpackObject;
	},
	_package,
	1.5,
	true,
	true,
	"",
	"(isNull attachedTo _originalTarget)", 
	10
];