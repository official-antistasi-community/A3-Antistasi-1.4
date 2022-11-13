/*
Function: A3A_fnc_initPackableObjects
Author: Killerswin2
	handles adding an addaction for packing objects into a different object for transporting
Arguments:
	[object] - object that will be converted 
	[string] - jipKey for jip to prevent overwriting 
Return Value:
	[nil]
Scope: 
Environment: Unscheduled
Public: No
Dependencies: 
Example:
	[] call A3A_fnc_initPackableObjects; 
*/
params  [
	["_object", objNull, [objNull]],
	["_jipKey", "", [""]]
];

if (isNull _object) exitwith {remoteExec ["", _jipKey]};

_object addAction [
	"Pack object",
	{
		[_this#3] call A3A_fnc_packObject;
	},
	_object,
	1.5,
	true,
	true,
	"",
	"true", 
	10
];