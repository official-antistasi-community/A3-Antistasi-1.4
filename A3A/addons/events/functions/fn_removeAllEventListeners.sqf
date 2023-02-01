/*
Author: Håkon
Description:
    Removes all event listeners subscribed to a particular event

Arguments:
0. <String> Event to remove listeners from

Return Value: <Nil|Array> Nil if failed, the removed listeners otherwise

Scope: Any
Environment: unscheduled
Public: Yes
Dependencies:

Example: ["AIVehInit"] call A3A_Events_fnc_removeAllEventListeners;

License: MIT License
*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if !(params [ ["_event", "", [""]] ]) exitWith { Error_1("Invalid params passed: %1", _this)};

if (isNil QGVAR(EventRegistry)) exitWith { Warning_1("Attempt to remove listeners for event: %1 before event registry is initilized", _event) };

if (
    _event in GVAR(EventRegistry)
) then {
    GVAR(EventRegistry) set [_event, []];
} else {
        Warning_1("No listeners for event %1 exists", _event)
};
