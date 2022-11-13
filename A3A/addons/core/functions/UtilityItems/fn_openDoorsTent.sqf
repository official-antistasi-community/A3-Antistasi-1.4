/*
Function: A3A_fnc_openDoorsTent
Author: Killerswin2
    open tent doors
Arguments:
    0.<Object> object that will have it's door open.
Return Value:
    <nil>
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [_object] call A3A_fnc_openDoorsTent 
*/
#include "..\..\script_component.hpp"

params[["_object", objNull, [objNull]],["_jipKey", "", [""]]];

if (isNull _object) exitwith {remoteExec ["", _jipKey]};

if ((typeOf _object) isNotEqualTo ("Land_MedicalTent_01_MTP_closed_F")) exitwith {};


_object setVariable ["A3A_canOpenDoor", true, true];

_object addAction [
	"Open Doors",
	{
		_this#3 animateSource ["Door_Hide", 1, true];
	},
	_object,
	1.5,
	true,
	true,
	"",
	"true", 
	10
];