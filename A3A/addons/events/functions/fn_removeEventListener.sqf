/*
Author: Håkon
Description:
    Removes a event listener

Arguments:
0. <String> Event the listener is subscribed to
1. <String> The event listeners unique identifier

Return Value:
<Nil|Array> Nil if failed, deleted event listener otherwise

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit", "A3A_Events_example"] call A3A_Events_fnc_removeEventListener;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [
      ["_event", "", [""]]
    , ["_id", "", [""]]
]) exitWith { Error_1("Invalid params passed: %1", _this)};

if (isNil QGVAR(EventRegistry)) exitWith { Warning_2("Attempt to remove listener for event: %1 with ID: %2 before event registry is initilized", _event, _id) };

if (
    _event in GVAR(EventRegistry)
    && { !isNil { (GVAR(EventRegistry) get _event) get _id } }
) then {
    (GVAR(EventRegistry) get _event) deleteAt _id;
} else {
    Warning_2("No listener for event %1 with ID %2 exists", _event, _id)
};
